@isTest
private class PropertySharingTriggerTest {
	
	private static List<Profile> profiles = [Select Id From Profile Where Name IN ('Property Community User', 'System Administrator') ORDER BY Name ASC LIMIT 2];
	private static List<Account> accounts = new List<Account>();
	private static List<Contact> contacts = new List<Contact>();
	private static List<User> users = new List<User>();
	
	private static List<Property__c> properties = new List<Property__c>();
	
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

		properties = new List<Property__c>();
		properties.add(new Property__c(Name= '61821'));
		properties.add(new Property__c(Name= '90210'));
		
		insert properties;
		
	}

	private static testMethod void testOpptInsert(){
		createTestData();
		Id propertyId;
		
		Test.startTest();
		{
			System.runAs(users[2]){
				
				// Insert new Opportunity
				Opportunity oppt = new Opportunity();
				oppt.Name = 'Test Oppt';
				oppt.AccountId = accounts[0].Id;
				oppt.Amount = 10;
				oppt.StageName = 'Test Stage';
				oppt.CloseDate = Date.today();
				oppt.Property__c = properties[0].Id;
				
				insert oppt;

				propertyId = oppt.Property__c;
			}
		}
		Test.stopTest();
	
		// Retrieve Property share
		List<Property__Share> propShares = [select Id, ParentId, UserOrGroupId, RowCause from Property__Share 
				where ParentId = :propertyId and AccessLevel = 'read' and RowCause = :Schema.Property__Share.RowCause.Community_Property_Access__c];
	
		// Verify Property__Share details
		System.assertEquals(1, propShares.size());		
		System.assertEquals(properties[0].Id, propShares[0].ParentId);
		System.assertEquals(users[0].Id, propShares[0].UserOrGroupId);
		System.assertEquals(Schema.Property__Share.RowCause.Community_Property_Access__c, propShares[0].RowCause);
	}
	
	private static testMethod void testOpptUpdate(){
		createTestData();
		Id propertyId;
		
		Test.startTest();
		{
			System.runAs(users[2]){
				
				// Insert new Opportunity
				Opportunity oppt = new Opportunity();
				oppt.Name = 'Test Oppt';
				oppt.AccountId = accounts[0].Id;
				oppt.Amount = 10;
				oppt.StageName = 'Test Stage';
				oppt.CloseDate = Date.today();
				oppt.Property__c = properties[0].Id;
				
				insert oppt;
				
				// Update Opportunity, change account
				oppt.AccountId = accounts[1].Id;

				update oppt;
				
				
				propertyId = oppt.Property__c;
			}
		}
		Test.stopTest();
	
		// Retrieve Property share
		List<Property__Share> propShares = [select Id, ParentId, UserOrGroupId, RowCause from Property__Share 
				where ParentId = :propertyId and AccessLevel = 'read' and RowCause = :Schema.Property__Share.RowCause.Community_Property_Access__c];
	
		// Verify Property__Share details
		System.assertEquals(1, propShares.size());		
		System.assertEquals(properties[0].Id, propShares[0].ParentId);
		System.assertEquals(users[1].Id, propShares[0].UserOrGroupId);
		System.assertEquals(Schema.Property__Share.RowCause.Community_Property_Access__c, propShares[0].RowCause);
	}
	
	private static testMethod void testOpptDelete(){
		createTestData();
		Id propertyId;
		
		Test.startTest();
		{
			System.runAs(users[2]){
				
				// Insert new Opportunity
				Opportunity oppt = new Opportunity();
				oppt.Name = 'Test Oppt';
				oppt.AccountId = accounts[0].Id;
				oppt.Amount = 10;
				oppt.StageName = 'Test Stage';
				oppt.CloseDate = Date.today();
				oppt.Property__c = properties[0].Id;
				
				insert oppt;
				
				propertyId = oppt.Property__c;
				
				// Delete Opportunity
				delete oppt;
				
			}
		}
		Test.stopTest();
	
		// Retrieve Property share
		List<Property__Share> propShares = [select Id, ParentId, UserOrGroupId, RowCause from Property__Share 
				where ParentId = :propertyId and AccessLevel = 'read' and RowCause = :Schema.Property__Share.RowCause.Community_Property_Access__c];
	
		// Verify Property__Share details
		System.assertEquals(0, propShares.size());
	}

	private static testMethod void testWonOpptInsert(){
		createTestData();
		Id propertyId;
		
		List<OpportunityStage> wonStages = [select Id, MasterLabel from OpportunityStage where IsClosed = true and IsWon = true];
		List<RecordType> recType = [select Id from RecordType where Name = 'Fundraising'];
		Fund__c fund = new Fund__c(Name = 'Test Fund');
		insert fund;
		
		Test.startTest();
		{
			System.runAs(users[2]){
				
				// Insert new Closed/Won Opportunity
				Opportunity oppt1 = new Opportunity();
				oppt1.Name = 'Test Oppt1';
				oppt1.AccountId = accounts[0].Id;
				oppt1.Amount = 10;
				oppt1.RecordTypeId = recType[0].Id;
				oppt1.StageName = wonStages[0].MasterLabel;
				oppt1.CloseDate = Date.today();
				oppt1.Fund__c = fund.Id;
				oppt1.Property__c = properties[0].Id;
				
				insert oppt1;

				propertyId = oppt1.Property__c;
				
				// Insert a new Opportunity
				Opportunity oppt2 = new Opportunity();
				oppt2.Name = 'Test Oppt2';
				oppt2.AccountId = accounts[1].Id;
				oppt2.Amount = 10;
				oppt2.StageName = 'Test Stage';
				oppt2.CloseDate = Date.today();
				oppt2.Property__c = properties[0].Id;
				
				insert oppt2;
			}
		}
		Test.stopTest();
	
		// Retrieve Property share
		List<Property__Share> propShares = [select Id, ParentId, UserOrGroupId, RowCause from Property__Share 
				where ParentId = :propertyId and AccessLevel = 'read' and RowCause = :Schema.Property__Share.RowCause.Community_Property_Access__c];
	
		// Verify Property__Share details
		System.assertEquals(1, propShares.size());		
		System.assertEquals(properties[0].Id, propShares[0].ParentId);
		System.assertEquals(users[0].Id, propShares[0].UserOrGroupId);
		System.assertEquals(Schema.Property__Share.RowCause.Community_Property_Access__c, propShares[0].RowCause);
	}
	
		private static testMethod void testPropertySharingRecalc(){
        createTestData();
    	Id propertyId;
    	String jobId;
        
       //Instantiate the class implementing the Database.Batchable interface.     
        PropertySharingRecalc recalc = new PropertySharingRecalc();
        
		Test.startTest();
		{
			System.runAs(users[2]){
				
				// Insert new Opportunity
				Opportunity oppt = new Opportunity();
				oppt.Name = 'Test Oppt';
				oppt.AccountId = accounts[0].Id;
				oppt.Amount = 10;
				oppt.StageName = 'Test Stage';
				oppt.CloseDate = Date.today();
				oppt.Property__c = properties[0].Id;
				
				insert oppt;

				propertyId = oppt.Property__c;
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
        properties = [select Id,
			            	(select Id, ParentId, UserOrGroupId, AccessLevel, RowCause 
			            	from Shares 
			            	where RowCause = :Schema.Property__Share.RowCause.Community_Property_Access__c)
			            from Property__c
			            where Id = :propertyId];       

        // Validate that Apex managed sharing exists on investments.     
        for(Property__c prop : properties){
            System.assertEquals(1, prop.Shares.size());
            
            for(Property__Share propShr : prop.Shares){
               // Test the sharing record for investor account user.             
                System.assertEquals(users[0].Id, propShr.UserOrGroupId);
                System.assertEquals('Read', propShr.AccessLevel);
            }
        }
	}
}