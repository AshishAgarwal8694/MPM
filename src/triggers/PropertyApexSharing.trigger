/*
	PropertyApexSharing - Trigger to manage Apex sharing for Property Community Users
	@author: Mainstreet Admin (Galvin)
*/

trigger PropertyApexSharing on Opportunity bulk (after insert, after update, before delete){
	
	List<Property__Share> sharedProperties = new List<Property__Share>(); //Store for Property shares to insert
	
	Set<Id> propertyIds = new Set<Id>();		// Store for incoming Property Ids
	Set<Id> wonProperties = new Set<Id>();		// Store for Properties to recalculate sharing for
	Set<Id> sharesToDelete = new Set<Id>();		// Store for Property shares to delete
	Set<Id> userIdsToDelete = new Set<Id>();	// Store for user Ids to remove sharing from
	
	// Retrieve Property Community Users
    CommunityService commService = new CommunityService();
    Map<Id, Set<Id>> acctUsersMap = commService.getCommunityUserMap('Property Community User');
	
	// Future proof the trigger logic
	if(Trigger.isBefore){
	
		//Delete share records if Opportunity is deleted
		if(Trigger.isDelete){
			for(Opportunity oppt: Trigger.oldMap.values()){
				if(oppt.Property__c != null){
					
					// If Closed/Won, recalculate Property sharing for this set
					// Otherwise remove individual Property shares
					if(oppt.IsClosed && oppt.IsWon){
						wonProperties.add(oppt.Property__c);
					}else if(acctUsersMap.containsKey(oppt.AccountId)){	
						sharesToDelete.add(oppt.Property__c);
						userIdsToDelete.addAll(acctUsersMap.get(oppt.AccountId));
					}
	
				}
			}			
		}
		
	}
	
	// Future proof the trigger logic
    if(Trigger.isAfter){
		
		// Verify Opportunity has a Property and a Community enabled Account
		for(Opportunity oppt: Trigger.newMap.values()){	
			if(oppt.Property__c != null){			
				propertyIds.add(oppt.Property__c);
			}
		}
		
		// Retrieve all Closed/Won Opportunities with this set of Property Ids
		List<Opportunity> propOppts = [select Id, AccountId, IsClosed, IsWon, Property__c from Opportunity 
			where Property__c in :propertyIds and IsClosed = true and IsWon = true ];
		
		// Determine claimed Properties
		for(Opportunity oppt: propOppts){		
			wonProperties.add(oppt.Property__c);
		}
		
		if(Trigger.isInsert){
            for(Opportunity oppt: Trigger.newMap.values()){
				if(oppt.Property__c != null){
					if(oppt.IsClosed && oppt.IsWon){
						wonProperties.add(oppt.Property__c);
					}
					else if(acctUsersMap.containsKey(oppt.AccountId) && !wonProperties.contains(oppt.Property__c)){
						sharedProperties.addAll(commService.createPropertyShares(oppt.Property__c, acctUsersMap.get(oppt.AccountId)));
					}
				}
			}				
		}
		
		if(Trigger.isUpdate){		
			for(Opportunity oldOppt: Trigger.oldMap.values()){
				Opportunity newOppt = Trigger.newMap.get(oldOppt.Id);
		
				// If Closed/Won, store Property for future recalculation
				// Otherwise create new and delete old for Account/Property changes
				if(!(oldOppt.IsClosed && oldOppt.IsWon) && (newOppt.IsClosed && newOppt.IsWon)){
				
					//Add both in case Property also changed
					wonProperties.add(oldOppt.Property__c);
					wonProperties.add(newOppt.Property__c);
					
				}else if((oldOppt.AccountId != newOppt.AccountId) || (oldOppt.Property__c != newOppt.Property__c)){
					if(newOppt.Property__c != null && newOppt.AccountId != null && acctUsersMap.containsKey(newOppt.AccountId)){
						sharedProperties.addAll(commService.createPropertyShares(newOppt.Property__c, acctUsersMap.get(newOppt.AccountId)));
					}
					
					if((oldOppt.Property__c != null || oldOppt.AccountId != null) && acctUsersMap.containsKey(oldOppt.AccountId)){
						sharesToDelete.add(oldOppt.Property__c);
						userIdsToDelete.addAll(acctUsersMap.get(oldOppt.AccountId));
					}
				}	
			}	
		}

	}
		
	// Delete all shares for previous Opportunity Properties
	if(!sharesToDelete.isEmpty()){
		delete [select Id from Property__Share where ParentId in :sharesToDelete and UserOrGroupId in :userIdsToDelete and RowCause = :Schema.Property__Share.RowCause.Community_Property_Access__c];
	}
	
	// Bulk insert of sharing records
	if(!sharedProperties.isEmpty()){
		insert sharedProperties;
	}

	// Handle recalculation of Closed/Won Properties
	if(!wonProperties.isEmpty()){
		CommunityService.handleClosedWonProperties(wonProperties);
	}
	
}