public with sharing class CommunityService{

	public CommunityService(){
	
	}
	
	/*
		Determine if User is a Community User
	*/
	public Boolean isCommunityUser(Id userId){
		User[] user = [select Id, ContactId from User where Id = :userId];
		
		return user[0].ContactId != null;
	}
	
	/*
		Retrieve map of Community Users and their Account
			Profile name to identify Community Users
	*/
	public Map<Id, Set<Id>> getCommunityUserMap(String profileName){
		Map<Id, Set<Id>> acctUsersMap = new Map<Id, Set<Id>>();	
		
		// Retrieve appropriate profile
		Profile[] communityProfile = [select Id from Profile where Name = :profileName];
		
		if(communityProfile.size() == 1){
			User[] communityUsers = [select Id, Name, Contact.AccountId from User where ContactId != null and ProfileId = :communityProfile[0].Id];
			
			if(communityUsers.size() > 0){
				Set<Id> acctIds = new Set<Id>(); // Store for Community-enabled Accounts
				Set<Id> userIds = new Set<Id>(); // Store for Community-enabled Users
				
				// Build Account => Users map
				for(User commUser : communityUsers){
				
					acctIds.add(commUser.Contact.AccountId);
					
					// If Account already listed, add User
					// Otherwise, create new Account key and add user
					if(acctUsersMap.get(commUser.Contact.AccountId) != null){
						acctUsersMap.get(commUser.Contact.AccountId).add(commUser.Id);
					}
					else{
						Set<Id> newMapItem =  new Set<Id>();
						newMapItem.add(commUser.Id);
						acctUsersMap.put(commUser.Contact.AccountId, newMapItem);
					}					
				}				
			}
		}
		
		// Return map of Community Users and their Account
		return acctUsersMap;
	}
	
	/***** Investment methods *****/
	
	/*
		Create Investment share records
			Property Id for the ParentId
			Set of User Ids to give access to
	*/
	public List<Investment__Share> createInvestmentShares(Id parentId, Set<Id> userIds){
		List<Investment__Share> investmentShares = new List<Investment__Share>(); //Store for Investment shares to return
	
		// Create Investment share for each user
		for(Id userId: userIds){
			investmentShares.add(new Investment__share(ParentId = parentId, UserOrGroupId = userId, AccessLevel = 'read', RowCause = Schema.Investment__Share.RowCause.Community_Investor_Access__c));
		}
		
		// Return list of Investment shares
		return investmentShares;
	}

	
	/***** Property methods *****/
	
	/*
		Recalculate Property share records due to Closed/Won stage change
			Set of Property Ids to recalculate shares for
	*/
	@future // For after trigger logic is complete
	public static void handleClosedWonProperties(Set<Id> propertyIds){
		List<Property__Share> propertyShares = new List<Property__Share>(); //Store for Property shares to insert
		Map<Id, Id> wonPropertyAcctMap = new Map<Id, Id>();					//Store for won Properties and their Account
		
		// Retrieve map of community users and their Account
		CommunityService commService = new CommunityService();
        Map<Id, Set<Id>> acctUsersMap = commService.getCommunityUserMap('Property Community User');
		
		// Retrieve old Property shares via Apex Sharing Reason 
        List<Property__Share> oldPropertyShares = [select Id from Property__Share where 
			ParentId in :propertyIds and RowCause = :Schema.Property__Share.RowCause.Community_Property_Access__c];
		
		//TODO: Who wins when there are 2 Closed/Wons?
		// Retrieve all Closed/Won Opportunities with this set of Property Ids
		List<Opportunity> propOppts = [select Id, AccountId, Property__c from Opportunity 
			where Property__c in :propertyIds and IsClosed = true and IsWon = true];

		// Retrieve Accounts from won Opportunities
		for(Opportunity oppt: propOppts){
			if(wonPropertyAcctMap.get(oppt.Property__c) == null){
				wonPropertyAcctMap.put(oppt.Property__c, oppt.AccountId);	
			}
		}
		
		// For each won property create Property shares
		for(Id propId : wonPropertyAcctMap.keySet()){
			if(acctUsersMap.containsKey(wonPropertyAcctMap.get(propId))){
				propertyShares.addAll(commService.createPropertyShares(propId, acctUsersMap.get(wonPropertyAcctMap.get(propId))));
			}
		}

		// Remove old Property shares for a blank slate
		delete oldPropertyShares;

		// Insert new Property shares
		insert propertyShares;
	}
	
	/*
		Create Property share records
			Property Id for the ParentId
			Set of User Ids to give access to
	*/
	public List<Property__Share> createPropertyShares(Id parentId, Set<Id> userIds){
		List<Property__Share> propertyShares = new List<Property__Share>(); //Store for Property shares to return
		
		// Create Property share for each user
		for(Id userId: userIds){
			propertyShares.add(new Property__share(ParentId = parentId, UserOrGroupId = userId, AccessLevel = 'read', RowCause = Schema.Property__Share.RowCause.Community_Property_Access__c));
		}
		
		// Return list of Property shares
		return propertyShares;
	}
	
}