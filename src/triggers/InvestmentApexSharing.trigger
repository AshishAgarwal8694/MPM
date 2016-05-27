/**
	* InvestmentApexSharing - Trigger to manage Apex sharing for Investor Community Users
	* @author: Mainstreet Admin (Galvin)
*/

trigger InvestmentApexSharing on Investment__c bulk (after insert, after update) {

	// Future proof the trigger logic
	if(Trigger.isAfter){
			
		if(Trigger.isInsert || Trigger.isUpdate){

			List<Investment__share> investmentShares = new List<Investment__share>();	//Store for Investment shares to insert
			
			// Retrieve Investment Community Users
			CommunityService commService = new CommunityService();
			Map<Id, Set<Id>> acctUsersMap = commService.getCommunityUserMap('Fundraising Community User');
						
			Set<Id> userIdsToDelete = new Set<Id>(); // Store user ids for possible delete

			// Iterate over investments
			for(Id investmentId : Trigger.newMap.keySet()){

				Investment__c newInvestment = Trigger.newMap.get(investmentId);
				Investment__c oldInvestment = Trigger.isUpdate ? Trigger.oldMap.get(investmentId) : null;
			
				// Build share for Advisor account users
				if(newInvestment.Advisor__c != null && acctUsersMap.keySet().contains(newInvestment.Advisor__c)){							
					investmentShares.addAll(commService.createInvestmentShares(investmentId, acctUsersMap.get(newInvestment.Advisor__c)));
				}
		
				// Build share for Investor Account Users
				if(newInvestment.Investor__c != null && acctUsersMap.keySet().contains(newInvestment.Investor__c)){
					investmentShares.addAll(commService.createInvestmentShares(investmentId, acctUsersMap.get(newInvestment.Investor__c)));
				}
				
				// Build share for Sponsor Account Users
				if(newInvestment.Sponsor__c != null && acctUsersMap.keySet().contains(newInvestment.Sponsor__c)){
					investmentShares.addAll(commService.createInvestmentShares(investmentId, acctUsersMap.get(newInvestment.Sponsor__c)));
				}
				
				// Retrieve user Ids to delete old share records from Investor Account Users
				if(oldInvestment != null && oldInvestment.Advisor__c != newInvestment.Advisor__c && acctUsersMap.get(oldInvestment.Advisor__c) != null){
					userIdsToDelete.addAll(acctUsersMap.get(oldInvestment.Advisor__c));
				}
				
				// Retrieve User Ids to delete old share records from Investor Account Users
				if(oldInvestment != null && oldInvestment.Investor__c != newInvestment.Investor__c && acctUsersMap.get(oldInvestment.Investor__c) != null){
					userIdsToDelete.addAll(acctUsersMap.get(oldInvestment.Investor__c));
				}
				
				// Retrieve User Ids to delete old share records from Sponsor Account Users
				if(oldInvestment != null && oldInvestment.Sponsor__c != newInvestment.Sponsor__c && acctUsersMap.get(oldInvestment.Sponsor__c) != null){
					userIdsToDelete.addAll(acctUsersMap.get(oldInvestment.Sponsor__c));
				}

			}
			
			// Delete sharing records from previous version of Investment
			if(Trigger.isUpdate){
				delete [select Id from Investment__share where ParentId in :Trigger.oldMap.keySet() and UserOrGroupId in :userIdsToDelete];	
			}
		
			// Insert of sharing records
			insert investmentShares;
		}

	}

}