public with sharing class AttachmentDetailController {

	public Map<String, String> pageParams {get;set;}
	public Attachment[] attachments {get;set;}
	public Attachment attachment {get;set;}
	public Custom_Attachment__c[] customAttachments {get;set;}
	public Custom_Attachment__c customAttachment {get;set;}
	public Boolean editMode {get;set;}
	public Id customAttachmentId;
	public String customAttachmentParent {get;set;}
	public Id customAttachmentParentId {get;set;}
	public UserRecordAccess recordAccess {get;set;}
	public Boolean error {get;set;}
	
	public CommunityService commService = new CommunityService();
	public Boolean isCommunityUser {get;set;}
	
	public AttachmentDetailController(ApexPages.StandardController standardCtrl){
		customAttachmentId = (Id)standardCtrl.getId();
		isCommunityUser = commService.isCommunityUser(UserInfo.getUserId());
		error = false;
		initialize();
	}
	
	public void initialize(){
		pageParams = ApexPages.currentPage().getParameters();
		
		if(pageParams.keySet().contains('retUrl')){
			editMode = true;
		}else{
			editMode = false;
		}
		
		customAttachments = [select Id, Name, File__c, Property__r.Name, Investment__r.Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById from Custom_Attachment__c where Id = :customAttachmentId];

		if(customAttachments.size() == 1){
			customAttachment = customAttachments[0];
			customAttachmentParent = customAttachment.Investment__c != null ? customAttachment.Investment__r.Name : customAttachment.Property__r.Name;			
			customAttachmentParentId = customAttachment.Investment__c != null ? customAttachment.Investment__c : customAttachment.Property__c;
			
			UserRecordAccess[] accesses = [select RecordId, HasDeleteAccess, HasEditAccess from UserRecordAccess where RecordId = :customAttachment.Id and UserId = :UserInfo.getUserId()];
			if(accesses.size() == 1){
				recordAccess = accesses[0];
			}
			
			String attachmentId = customAttachment.File__c;
			attachments = [select Id, Name, Description, Body, BodyLength from Attachment where Id = :attachmentId];

			if(attachments.size() == 1){
				attachment = attachments[0];
			}
		}else{
			error = true;
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'There is no Attachment to display'));
		}
	}
	
	public void handleAttachmentView(){
		if(isCommunityUser){
			Community_View__c view = new Community_View__c(Community_User__c = UserInfo.getUserId(), Custom_Attachment__c = customAttachment.Id);
			
			insert view;
		}
	}
	
	public void editCustomAttachment(){
		editMode = true;
	}
	
	public PageReference deleteCustomAttachment(){
		delete customAttachment;
		
		return new PageReference('/'+ customAttachmentParentId);
	}
	
	public void saveCustomAttachment(){
		update attachment;
		
		customAttachment.Name = attachment.Name;
		customAttachment.File__c = attachment.Id;
		update customAttachment;
		
		initialize();
	}
	
	public pageReference cancelEdit(){
		return new PageReference('/' + customAttachmentId);
	}
	
}