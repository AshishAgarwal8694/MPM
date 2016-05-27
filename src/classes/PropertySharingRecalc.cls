global class PropertySharingRecalc implements Database.Batchable<sObject> {
   
	static String emailAddress = UserInfo.getUserEmail();				// Email to notify running user of recalculation status
	public Map<Id, Id> claimedPropertyToAcctMap = new Map<Id, Id>();	// Map store for accounts associated with claimed property
	public Set<Id> sharedClaimedProperty = new Set<Id>(); 				// Store for claimed properties that have had their sharing populated


	// QueryLocator for retrieving Property records 
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([select Id 
                                         from Property__c]);  
    }
     
    global void execute(Database.BatchableContext BC, List<sObject> scope){
 		List<Property__Share> newPropertyShares = new List<Property__Share>();					// Store for new Property shares to be inserted
        Map<Id, Property__c> propertyMap = new Map<Id, Property__c>((List<Property__c>)scope);  // Map store for Properties within this batch's scope

        // Retrieve old Property shares via Apex Sharing Reason 
        List<Property__Share> oldPropertyShares = [select Id from Property__Share where 
			Id in :propertyMap.keySet() and RowCause = :Schema.Property__Share.RowCause.Community_Property_Access__c]; 
        
		// Retrieve appropriate profile for Property Community User stores
		CommunityService commService = new CommunityService();
		Map<Id, Set<Id>> acctUsersMap = commService.getCommunityUserMap('Property Community User');
		
		// Retrieve Opportunities with these properties and community accounts
		List<Opportunity> propOppts = [select Id, AccountId, Property__c, IsClosed, IsWon from Opportunity where 
			Property__c in :propertyMap.keySet() and AccountId in :acctUsersMap.keySet()];
		
		//TODO: Who wins when there are 2 Closed/Wons?
		// Determine Closed/Won properties
		for(Opportunity oppt: propOppts){
			if(oppt.IsClosed && oppt.IsWon){
				if(!claimedPropertyToAcctMap.containsKey(oppt.Property__c)){
					claimedPropertyToAcctMap.put(oppt.Property__c, oppt.AccountId);
				}
			}
		}
		
        // Construct new Property sharing records		
		for(Property__c prop : propertyMap.values()){    
			for(Opportunity oppt: propOppts){				
				if(oppt.Property__c == prop.Id && !sharedClaimedProperty.contains(oppt.Property__c)){
					
					// Build share for claimed property, then shut it down
					if(claimedPropertyToAcctMap.containsKey(oppt.Property__c) && acctUsersMap.keySet().contains(oppt.AccountId)){
						for(Id userId: acctUsersMap.get(claimedPropertyToAcctMap.get(oppt.Property__c))){	
							newPropertyShares.add(new Property__share(ParentId = oppt.Property__c, UserOrGroupId = userId, AccessLevel = 'read', RowCause = Schema.Property__Share.RowCause.Community_Property_Access__c));
						}
						
						sharedClaimedProperty.add(oppt.Property__c);
						break;
					}
					
					// Build share for unclaimed property
					if(oppt.Property__c == prop.Id && acctUsersMap.keySet().contains(oppt.AccountId)){									
						for(Id userId : acctUsersMap.get(oppt.AccountId)){
							newPropertyShares.add(new Property__share(ParentId = oppt.Property__c, UserOrGroupId = userId, AccessLevel = 'read', RowCause = Schema.Property__Share.RowCause.Community_Property_Access__c));
						}
					}
				}
			}
		}
        
        try {
            // Delete the existing Property shares
            Delete oldPropertyShares;
            system.debug(newPropertyShares);
            // Bulk insert of the new Property shares
            Database.SaveResult[] results = Database.insert(newPropertyShares, false);
           
        }catch(DmlException e) {
           // Send an email to the Apex job's submitter on failure.
           if(!Test.isRunningTest()){
		   		String[] toAddresses = new String[] {emailAddress}; 
            
				Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();         
            	mail.setToAddresses(toAddresses); 
            	mail.setSubject('Apex Sharing Recalculation Exception');
            	mail.setPlainTextBody('The Apex sharing recalculation threw the following exception: ' + e.getMessage());
            
				Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
           }
        }
    }
    
    global void finish(Database.BatchableContext BC){  
        // Send email to Apex job's submitter
        if(!Test.isRunningTest()){
			String[] toAddresses = new String[] {emailAddress}; 
			
	        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
	        mail.setToAddresses(toAddresses); 
	        mail.setSubject('Apex Sharing Recalculation Completed.');
	        mail.setPlainTextBody('The Apex sharing recalculation finished processing');
	        
			Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
    
}