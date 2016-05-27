public with sharing class AttachmentUploadController {

	public Map<String, String> pageParams {get;set;}
	public Custom_Attachment__c customAttachment {get;set;}
	public Attachment attachment {get;set;}
	Id possibleId {get;set;}
	
	public AttachmentUploadController(ApexPages.StandardController standardCtrl){ 
		pageParams = ApexPages.currentPage().getParameters();
        initialize();        
	}
    
    public void initialize(){		
        customAttachment = new Custom_Attachment__c();
		attachment = new Attachment();
		
		for(String key: pageParams.keySet()){
			if(key.contains('_lkid')){		
				
				// Try to cast to an Id
				// Silently fail
				try{
					possibleId = (Id) pageParams.get(key);	
					if(possibleId.getSobjectType() == Investment__c.getSObjectType()){
						customAttachment.Investment__c = possibleId;
						break;
					}
					else if(possibleId.getSobjectType() == Property__c.getSObjectType()){
						customAttachment.Property__c =  possibleId;
						break;
					}
				}catch(System.StringException s){
				
				}

			}
		}
    }
	
	public PageReference save(){
		//Save Custom_Attachment__c
		insert customAttachment;

		//Save Attachment
		attachment.ParentId = customAttachment.Id;
		insert attachment;

		//Update Custom_Attachment__c lookup
		customAttachment.Name = attachment.Name;
		customAttachment.File__c = attachment.Id;
		update customAttachment;
		
		if(possibleId != null){
			return new PageReference('/' + possibleId);
		}
		
		return new PageReference('/');
	}

}