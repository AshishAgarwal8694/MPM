global class InvestmentSharingRecalc implements Database.Batchable<sObject> {
   
	static String emailAddress = UserInfo.getUserEmail();
	
	
	// QueryLocator for retrieving Investment records 
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([select Id, Advisor__c, Investor__c, Sponsor__c 
                                         from Investment__c]);  
    }
     
    global void execute(Database.BatchableContext BC, List<sObject> scope){
       
		// Map store for Investments within this batch's scope
        Map<Id, Investment__c> investmentMap = new Map<ID, Investment__c>((List<Investment__c>)scope);  
        
        // Store for new Investment shares to be inserted
        List<Investment__Share> newInvestmentShares = new List<Investment__Share>();
               
        // Retrieve old Investment shares via Apex Sharing Reason 
        List<Investment__Share> oldInvestmentShares = [select Id from Investment__Share where Id in 
            :investmentMap.keySet() and RowCause = :Schema.Investment__Share.RowCause.Community_Investor_Access__c]; 
        
		// Retrieve appropriate profile for Investment Community User stores
		CommunityService commService = new CommunityService();
		Map<Id, Set<Id>> acctUsersMap = commService.getCommunityUserMap('Fundraising Community User');
		
		
        // Construct new Investment sharing records
        for(Investment__c inv : investmentMap.values()){
            Investment__Share investmentShare = new Investment__Share();
            
			// Build share for Advisor account users
			if(inv.Advisor__c != null && acctUsersMap.keySet().contains(inv.Advisor__c)){						
				for(Id userId : acctUsersMap.get(inv.Advisor__c)){
					newInvestmentShares.add(new Investment__share(ParentId = inv.Id, UserOrGroupId = userId, AccessLevel = 'read', RowCause = Schema.Investment__Share.RowCause.Community_Investor_Access__c));
				}
			}
			
			// Build share for Investor account users
			if(inv.Investor__c != null && acctUsersMap.keySet().contains(inv.Investor__c)){
				for(Id userId : acctUsersMap.get(inv.Investor__c)){
					newInvestmentShares.add(new Investment__share(ParentId = inv.Id, UserOrGroupId = userId, AccessLevel = 'read', RowCause = Schema.Investment__Share.RowCause.Community_Investor_Access__c));
				}
			}
			
			// Build share for Sponsor account users
			if(inv.Sponsor__c != null && acctUsersMap.keySet().contains(inv.Sponsor__c)){
				for(Id userId : acctUsersMap.get(inv.Sponsor__c)){
					newInvestmentShares.add(new Investment__share(ParentId = inv.Id, UserOrGroupId = userId, AccessLevel = 'read', RowCause = Schema.Investment__Share.RowCause.Community_Investor_Access__c));
				}
			}
		}
        
        try {
            // Delete the existing Investment shares
            Delete oldInvestmentShares;
            
            // Bulk insert of the new Investment shares
            Database.SaveResult[] results = Database.insert(newInvestmentShares, false);
           
        } catch(DmlException e) {
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