trigger CommunityUserRecalc on User (after insert){

    // Future proof the trigger logic
    if(Trigger.isAfter){
        if(Trigger.isInsert){

            CommunityService communityService = new CommunityService();
            
            // Iterate over Users
            for(Id userId : Trigger.newMap.keySet()){

                User newUser = Trigger.newMap.get(userId);
                
                // Check for Community User
                // If Community User, schedule recalc jobs
                if(communityService.isCommunityUser(userId)){
                    InvestmentSharingRecalc invBatchJob = new InvestmentSharingRecalc();
                    PropertySharingRecalc propBatchJob = new PropertySharingRecalc();
                    
                    Database.executeBatch(invBatchJob);
                    Database.executeBatch(propBatchJob);
                    
                    break;
                }
                
            }
            
        }
    }

}