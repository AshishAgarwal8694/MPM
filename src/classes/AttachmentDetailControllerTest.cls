@isTest
private class AttachmentDetailControllerTest {
	
	private static List<Profile> profiles = [Select Id From Profile Where Name IN ('Fundraising Community User', 'System Administrator') ORDER BY Name ASC LIMIT 2];
	private static List<Account> accounts = new List<Account>();
	private static List<Contact> contacts = new List<Contact>();
	private static List<User> users = new List<User>();
	
	private static Investment__c investment {get;set;}
	private static Property__c property {get;set;}
	private static Attachment[] attachments {get;set;}
	private static Custom_Attachment__c[] customAttachments {get;set;}
	
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
        
        
       	investment = new Investment__c(Name= 'Test Investment');
       	insert investment;
       	
       	Investment__Share invShare = new Investment__share(ParentId = investment.Id, UserOrGroupId = users[0].Id, AccessLevel = 'read', RowCause = Schema.Investment__Share.RowCause.Community_Investor_Access__c);
       	insert invShare;
       	
       	property = new Property__c(Name = 'Test Property');
       	insert property;
       	
       	Property__Share propShare = new Property__share(ParentId = property.Id, UserOrGroupId = users[0].Id, AccessLevel = 'read', RowCause = Schema.Property__Share.RowCause.Community_Property_Access__c);
       	insert propShare;
  
       	System.runAs(users[0]) {
       		AttachmentUploadController uploadCtrl;

       		//Investment Attachment
        	//PageReference attachmentUploadPage = new PageReference(Page.AttachmentUpload + '/_lkid=' + investment.Id);
			//Test.setCurrentPage(attachmentUploadPage);
			uploadCtrl = new AttachmentUploadController(new ApexPages.StandardController(new Custom_Attachment__c()));
			uploadCtrl.pageParams.put('_lkid', investment.Id);
			
	   		uploadCtrl.customAttachment = new Custom_Attachment__c(Name = 'Inv Attachment', Investment__c = investment.Id);
	   		uploadCtrl.attachment = new Attachment(Name = 'Test Attachment1', Body = Blob.valueOf('Test1'));
	   		uploadCtrl.save();
	   		
	   		//Property Attachment
	   		uploadCtrl = new AttachmentUploadController(new ApexPages.StandardController(new Custom_Attachment__c()));
			uploadCtrl.pageParams.put('_lkid', property.Id);
	   		
	   		uploadCtrl.customAttachment = new Custom_Attachment__c(Name = 'Prop Attachment', Property__c = property.Id);
	   		uploadCtrl.attachment = new Attachment(Name = 'Test Attachment2', Body = Blob.valueOf('Test2'));
	   		uploadCtrl.save();
       	}
	   		
	   		customAttachments = [select Id from Custom_Attachment__c order by CreatedDate desc limit 2];
	   		attachments = [select Id from Attachment order by CreatedDate desc limit 2];
	       	
	       	/*attachments = new Attachment[]{};
	       	attachments.add(new Attachment(Name = 'Test Attachment1', ParentId = customAttachments[0].Id, Body = Blob.valueOf('Test1')));
	       	attachments.add(new Attachment(Name = 'Test Attachment2', ParentId = customAttachments[1].Id, Body = Blob.valueOf('Test2')));
	       	insert attachments;
	       	
	       	customAttachments[0].File__c = (String)attachments[0].Id;
	       	customAttachments[1].File__c = (String)attachments[1].Id;
	       	update customAttachments;
       	}*/

	}
	
    private static testMethod void testAttachmentDetail(){
    	createTestData();
    	
    	AttachmentDetailController detailCtrl;
    	
    	PageReference attachmentDetailPage = new PageReference(Page.AttachmentDetail + '/' + customAttachments[0].Id);
		Test.setCurrentPage(attachmentDetailPage);	
		Test.startTest();
		{
			System.runAs(users[0]) {
				
				//Test Investment Attachments
				ApexPages.StandardController sc = new ApexPages.StandardController(customAttachments[0]);
				detailCtrl = new AttachmentDetailController(sc);
				
				//system.assertEquals('Test Investment', detailCtrl.customAttachment.Investment__r.Name);
				system.assertEquals((String)attachments[0].Id, detailCtrl.customAttachment.File__c);
				
				detailCtrl.editCustomAttachment();
				system.assertEquals(true, detailCtrl.editMode);
				
				detailCtrl.saveCustomAttachment();
				system.assertEquals('Test Investment', detailCtrl.customAttachment.Investment__r.Name);
				system.assertEquals((String)attachments[0].Id, detailCtrl.customAttachment.File__c);
				
				detailCtrl.isCommunityUser = true;
				detailCtrl.handleAttachmentView();
				Community_View__c[] views = [select Id, Community_User__c, Custom_Attachment__c from Community_View__c order by CreatedDate desc limit 1];
				system.assertEquals(1, views.size()); 
				system.assertEquals(users[0].Id, views[0].Community_User__c);
				system.assertEquals(customAttachments[0].Id, views[0].Custom_Attachment__c);
				
				
				//Test Property Attachments
				attachmentDetailPage = new PageReference(Page.AttachmentDetail + '/' + customAttachments[1].Id);
				Test.setCurrentPage(attachmentDetailPage);
				
				sc = new ApexPages.StandardController(customAttachments[1]);
				detailCtrl = new AttachmentDetailController(sc);
				
				system.assertEquals('Test Property', detailCtrl.customAttachment.Property__r.Name);
				system.assertEquals((String)attachments[1].Id, detailCtrl.customAttachment.File__c);
				
				detailCtrl.editCustomAttachment();
				system.assertEquals(true, detailCtrl.editMode);
				detailCtrl.cancelEdit();
				
				detailCtrl.saveCustomAttachment();
				system.assertEquals('Test Property', detailCtrl.customAttachment.Property__r.Name);
				system.assertEquals((String)attachments[1].Id, detailCtrl.customAttachment.File__c);
				
				detailCtrl.isCommunityUser = true;
				detailCtrl.handleAttachmentView();
				views = [select Id, Community_User__c, Custom_Attachment__c from Community_View__c limit 1];
				system.assertEquals(1, views.size()); 
				system.assertEquals(users[0].Id, views[0].Community_User__c);
				system.assertEquals(customAttachments[0].Id, views[0].Custom_Attachment__c);
				
				detailCtrl.deleteCustomAttachment();
				
			}
			
			System.runAs(users[2]) {
				delete property;
				delete investment;
				Community_View__c[] views = [select Id, Community_User__c, Custom_Attachment__c from Community_View__c];
				system.assertEquals(0, views.size());
			}
		}
    }
    
}