trigger DeleteInvestmentAttachments on Investment__c (before delete) {

    if(Trigger.isBefore){
        if(Trigger.isDelete){
            delete [select Id from Custom_Attachment__c where Investment__c in :Trigger.oldMap.values()];
        }
    }
    
}