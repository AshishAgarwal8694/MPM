@isTest(SeeAllData=false)
private class InvestmentSharingTriggerTest {
	
	private static List<Profile> profiles = [Select Id From Profile Where Name IN ('Fundraising Community User', 'System Administrator') ORDER BY Name ASC LIMIT 2];
	private static List<Account> accounts = new List<Account>();
	private static List<Contact> contacts = new List<Contact>();
	private static List<User> users = new List<User>();
	
	private static void createTestData(){
		
        accounts = new List<Account>();
        accounts.add(New Account (Name = 'Test Account 1'));
        accounts.add(New Account (Name = 'Test Account 2'));
         
        insert accounts;
   
        contacts = new List<Contact>();
        contacts.add(new Contact(FirstName = 'Community', LastName = 'Test 1', AccountId = accounts[0].Id, Email = 'test@test.com'));    
        contacts.add(new Contact(FirstName = 'Community', LastName = 'Test 2', AccountId = accounts[1].Id, Email = 'test@test.com'));
        
        insert contacts;
        
        users = new List<User>();
        users.add(new User(FirstName = 'Community', 
                           LastName = 'User 1',
                           Alias = 'CU',
                           Email = 'commTest@test.com',
                           Username = Math.random() + '@test.com', 
                           CommunityNickname = 'cust',
                           ContactId = contacts[0].Id,
                           EmailEncodingKey = 'UTF-8',
                           TimeZoneSidKey = 'America/Los_Angeles',
                           LocaleSidKey = 'en_US',
                           LanguageLocaleKey = 'en_US',
                           ProfileId = profiles[0].Id
                        ));
        users.add(new User(FirstName = 'Community', 
                           LastName = 'User 2',
                           Alias = 'CU1',
                           Email = 'commTest2@test.com',
                           Username = Math.random() + '@testing.com', 
                           CommunityNickname = 'cust1',
                           ContactId = contacts[1].Id,
                           EmailEncodingKey = 'UTF-8',
                           TimeZoneSidKey = 'America/Los_Angeles',
                           LocaleSidKey = 'en_US',
                           LanguageLocaleKey = 'en_US',
                           ProfileId = profiles[0].Id
                        ));        
        users.add(new User(FirstName = 'CRM',
                           LastName = 'User',
                           Email = 'test@test.com',
                           ProfileId = profiles[1].Id,
                           Username = Math.random() + '@test.com',
                           Alias='CRMU',
                           CommunityNickname = 'CRMUCN',
                           EmailEncodingKey='UTF-8',
                           TimeZoneSidKey= 'America/Los_Angeles',
                           LocaleSidKey ='en_US',
                           LanguageLocaleKey= 'en_US'
                          )
                      );
        
        System.runAs(new User(Id = UserInfo.getUserId())) {
            insert users;
            System.assert(users.size() > 0);
        }

	}

	private static testMethod void testInsertWithAdvisor(){
		createTestData();
		Id investmentId;
		
		Test.startTest();
		{
			System.runAs(users[2]){
				
				// Insert new Investment
				Investment__c investment = new Investment__c();
				investment.Name = 'Test Invest';
				investment.Advisor__c = accounts[0].Id;
				
				insert investment;
				
				investmentId = investment.Id;
				
			}
		}
		Test.stopTest();
	
		// Retrieve Investment share
		List<Investment__Share> invShares = [select Id, ParentId, UserOrGroupId, RowCause from Investment__Share 
				where ParentId = :investmentId and AccessLevel = 'read' and RowCause = :Schema.Investment__Share.RowCause.Community_Investor_Access__c];
	
		// Verify Investment__Share details
		System.assertEquals(1, invShares.size());		
		System.assertEquals(investmentId, invShares[0].ParentId);
		System.assertEquals(users[0].Id, invShares[0].UserOrGroupId);
		System.assertEquals(Schema.Investment__Share.RowCause.Community_Investor_Access__c, invShares[0].RowCause);
	}
	
	private static testMethod void testInsertWithInvestor(){
		createTestData();
		Id investmentId;
		
		Test.startTest();
		{
			System.runAs(users[2]){
				
				// Insert new Investment
				Investment__c investment = new Investment__c();
				investment.Name = 'Test Invest';
				investment.Investor__c = accounts[0].Id;
				
				insert investment;
				
				investmentId = investment.Id;
				
			}
		}
		Test.stopTest();
	
		// Retrieve Investment share
		List<Investment__Share> invShares = [select Id, ParentId, UserOrGroupId, RowCause from Investment__Share 
				where ParentId = :investmentId and AccessLevel = 'read' and RowCause = :Schema.Investment__Share.RowCause.Community_Investor_Access__c];
	
		// Verify Investment__Share details
		System.assertEquals(1, invShares.size());
		System.assertEquals(investmentId, invShares[0].ParentId);
		System.assertEquals(users[0].Id, invShares[0].UserOrGroupId);
		System.assertEquals(Schema.Investment__Share.RowCause.Community_Investor_Access__c, invShares[0].RowCause);
	}
	
	private static testMethod void testInsertWithSponsor(){
		createTestData();
		Id investmentId;
		
		Test.startTest();
		{
			System.runAs(users[2]){
				
				// Insert new Investment
				Investment__c investment = new Investment__c();
				investment.Name = 'Test Invest';
				investment.Sponsor__c = accounts[0].Id;
				
				insert investment;
				
				investmentId = investment.Id;
				
			}
		}
		Test.stopTest();
	
		// Retrieve Investment share
		List<Investment__Share> invShares = [select Id, ParentId, UserOrGroupId, RowCause from Investment__Share 
				where ParentId = :investmentId and AccessLevel = 'read' and RowCause = :Schema.Investment__Share.RowCause.Community_Investor_Access__c];
	
		// Verify Investment__Share details
		System.assertEquals(1, invShares.size());
		System.assertEquals(investmentId, invShares[0].ParentId);
		System.assertEquals(users[0].Id, invShares[0].UserOrGroupId);
		System.assertEquals(Schema.Investment__Share.RowCause.Community_Investor_Access__c, invShares[0].RowCause);
	}
	
	private static testMethod void testUpdateWithAdvisorRemoved(){
		createTestData();
		Id investmentId;
		
		Test.startTest();
		{
			System.runAs(users[2]){
				
				// Insert new Investment
				Investment__c investment = new Investment__c();
				investment.Name = 'Test Invest';
				investment.Advisor__c = accounts[0].Id;
				
				insert investment;
				
				// Update Investment, remove Advisor
				investment.Advisor__c = null;
				update investment;
				
				investmentId = investment.Id;
				
			}
		}
		Test.stopTest();
	
		// Retrieve Investment share
		List<Investment__Share> invShares = [select Id, ParentId, UserOrGroupId, RowCause from Investment__Share 
				where ParentId = :investmentId and AccessLevel = 'read' and RowCause = :Schema.Investment__Share.RowCause.Community_Investor_Access__c];
	
		// Verify Investment__Share details
		System.assertEquals(0, invShares.size());
	}
	
	private static testMethod void testUpdateWithInvestorRemoved(){
		createTestData();
		Id investmentId;
		
		Test.startTest();
		{
			System.runAs(users[2]){
				
				// Insert new Investment
				Investment__c investment = new Investment__c();
				investment.Name = 'Test Invest';
				investment.Investor__c = accounts[0].Id;
				
				insert investment;
				
				// Update Investment, remove Investor
				investment.Investor__c = null;
				update investment;
				
				investmentId = investment.Id;
				
			}
		}
		Test.stopTest();
	
		// Retrieve Investment share
		List<Investment__Share> invShares = [select Id, ParentId, UserOrGroupId, RowCause from Investment__Share 
				where ParentId = :investmentId and AccessLevel = 'read' and RowCause = :Schema.Investment__Share.RowCause.Community_Investor_Access__c];
	
		// Verify Investment__Share details
		System.assertEquals(0, invShares.size());
	}
	
	private static testMethod void testUpdateWithSponsorRemoved(){
		createTestData();
		Id investmentId;
		
		Test.startTest();
		{
			System.runAs(users[2]){
				
				// Insert new Investment
				Investment__c investment = new Investment__c();
				investment.Name = 'Test Invest';
				investment.Sponsor__c = accounts[0].Id;
				
				insert investment;
				
				// Update Investment, remove Sponsor
				investment.Sponsor__c = null;
				update investment;
				
				investmentId = investment.Id;
				
			}
		}
		Test.stopTest();
	
		// Retrieve Investment share
		List<Investment__Share> invShares = [select Id, ParentId, UserOrGroupId, RowCause from Investment__Share 
				where ParentId = :investmentId and AccessLevel = 'read' and RowCause = :Schema.Investment__Share.RowCause.Community_Investor_Access__c];
	
		// Verify Investment__Share details
		System.assertEquals(0, invShares.size());
	}
	
	private static testMethod void testAdvisorSharingRecalc(){
        createTestData();
    	Id investmentId;
    	String jobId;
        
       //Instantiate the class implementing the Database.Batchable interface.     
        InvestmentSharingRecalc recalc = new InvestmentSharingRecalc();
        
		Test.startTest();
		{
			System.runAs(users[2]){
				
				// Insert new Investment
				Investment__c investment = new Investment__c();
				investment.Name = 'Test Invest';
				investment.Advisor__c = accounts[0].Id;
				
				insert investment;
				
				investmentId = investment.Id;
				
			}

	        // Invoke the Batch class.
	        jobId = Database.executeBatch(recalc);
        }
        Test.stopTest();
        
        // Get the Apex job and verify there are no errors.
        AsyncApexJob apexJob = [Select NumberOfErrors 
                            from AsyncApexJob where Id = :jobId];
        System.assertEquals(0, apexJob.NumberOfErrors);
      
        // Retrieve sharing records    
        List<Investment__c> investments = [select Id, Advisor__c,
								            	(select Id, ParentId, UserOrGroupId, AccessLevel, RowCause 
								            	from Shares 
								            	where (RowCause = :Schema.Investment__Share.RowCause.Community_Investor_Access__c))
								            from Investment__c];       
        
        // Validate that Apex managed sharing exists on investments.     
        for(Investment__c inv : investments){
            System.assertEquals(1, inv.Shares.size());
            
            for(Investment__Share invShr : inv.Shares){
               // Test the sharing record for investor account user.             
                System.assertEquals(users[0].Id, invShr.UserOrGroupId);
                System.assertEquals('Read', invShr.AccessLevel);
            }
        }
	}
	
	private static testMethod void testInvestorSharingRecalc(){
        createTestData();
    	Id investmentId;
    	String jobId;
        
       //Instantiate the class implementing the Database.Batchable interface.     
        InvestmentSharingRecalc recalc = new InvestmentSharingRecalc();
        
		Test.startTest();
		{
			System.runAs(users[2]){
				
				// Insert new Investment
				Investment__c investment = new Investment__c();
				investment.Name = 'Test Invest';
				investment.Investor__c = accounts[0].Id;
				
				insert investment;
				
				investmentId = investment.Id;
				
			}

	        // Invoke the Batch class.
	        jobId = Database.executeBatch(recalc);
        }
        Test.stopTest();
        
        // Get the Apex job and verify there are no errors.
        AsyncApexJob apexJob = [Select NumberOfErrors 
                            from AsyncApexJob where Id = :jobId];
        System.assertEquals(0, apexJob.NumberOfErrors);
      
        // Retrieve sharing records    
        List<Investment__c> investments = [select Id, Investor__c,
								            	(select Id, ParentId, UserOrGroupId, AccessLevel, RowCause 
								            	from Shares 
								            	where (RowCause = :Schema.Investment__Share.RowCause.Community_Investor_Access__c))
								            from Investment__c];       
        
        // Validate that Apex managed sharing exists on investments.     
        for(Investment__c inv : investments){
            System.assertEquals(1, inv.Shares.size());
            
            for(Investment__Share invShr : inv.Shares){
               // Test the sharing record for investor account user.             
                System.assertEquals(users[0].Id, invShr.UserOrGroupId);
                System.assertEquals('Read', invShr.AccessLevel);
            }
        }
	}
	
	private static testMethod void testSponsorSharingRecalc(){
        createTestData();
    	Id investmentId;
    	String jobId;
        
       //Instantiate the class implementing the Database.Batchable interface.     
        InvestmentSharingRecalc recalc = new InvestmentSharingRecalc();
        
		Test.startTest();
		{
			System.runAs(users[2]){
				
				// Insert new Investment
				Investment__c investment = new Investment__c();
				investment.Name = 'Test Invest';
				investment.Sponsor__c = accounts[0].Id;
				
				insert investment;
				
				investmentId = investment.Id;
				
			}

	        // Invoke the Batch class.
	        jobId = Database.executeBatch(recalc);
        }
        Test.stopTest();
        
        // Get the Apex job and verify there are no errors.
        AsyncApexJob apexJob = [Select NumberOfErrors 
                            from AsyncApexJob where Id = :jobId];
        System.assertEquals(0, apexJob.NumberOfErrors);
      
        // Retrieve sharing records    
        List<Investment__c> investments = [select Id, Sponsor__c,
								            	(select Id, ParentId, UserOrGroupId, AccessLevel, RowCause 
								            	from Shares 
								            	where (RowCause = :Schema.Investment__Share.RowCause.Community_Investor_Access__c))
								            from Investment__c];       
        
        // Validate that Apex managed sharing exists on investments.     
        for(Investment__c inv : investments){
            System.assertEquals(1, inv.Shares.size());
            
            for(Investment__Share invShr : inv.Shares){
               // Test the sharing record for investor account user.             
                System.assertEquals(users[0].Id, invShr.UserOrGroupId);
                System.assertEquals('Read', invShr.AccessLevel);
            }
        }
	}
}