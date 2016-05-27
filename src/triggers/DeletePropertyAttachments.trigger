trigger DeletePropertyAttachments on Property__c (before delete) {

    if(Trigger.isBefore){
        if(Trigger.isDelete){
            delete [select Id from Custom_Attachment__c where Property__c in :Trigger.oldMap.values()];
        }
    }
    
}