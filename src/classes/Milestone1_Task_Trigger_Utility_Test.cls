/*
Copyright (c) 2011, salesforce.com, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, 
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice, 
    this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, 
    this list of conditions and the following disclaimer in the documentation 
    and/or other materials provided with the distribution.
    * Neither the name of the salesforce.com, Inc. nor the names of its contributors 
    may be used to endorse or promote products derived from this software 
    without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
OF THE POSSIBILITY OF SUCH DAMAGE.

*/
/**
* This Class test Task Trigger functionality  
*/

@isTest
private class Milestone1_Task_Trigger_Utility_Test {

	/**
	* Test exceeded chatter suscription
	*/
    static testMethod void chatterSubscriptionLimitExceeded() {
		
		Milestone1_Settings__c custmilestonesetting = new Milestone1_Settings__c();
		custmilestonesetting.Name = 'testing';
		insert custmilestonesetting;
		// Create a poject
		Milestone1_Project__c proj = Milestone1_Test_Utility.sampleProject('Chatter Blow');
		insert proj;

		// Create a milestone
		Milestone1_Milestone__c mstone = Milestone1_Test_Utility.sampleMilestone(proj);
		insert mstone;

		// Add 600 tasks to the milestone to exceed chatter user subscription limit
		List<Milestone1_Task__c> lTask = new List<Milestone1_Task__c>();

		for(Integer j = 0; j < 2; j++){        	
			for(Integer i = 0; i < 50; i++){
				lTask.add( Milestone1_Test_Utility.sampleTask(mstone.Id) );
			}
			
			try{
				insert lTask;
			}
			catch(Exception e){
				if( e.getMessage().contains( Milestone1_Task_Trigger_Utility.SUBSCRIPTION_LIMIT_EXCEEDED )){
					system.assert(true);
				}
				else{
					system.assert(false, e.getMessage());
				}
			}

			lTask.clear();
		}
		
		boolean permissioncheck = Milestone1_Task_Trigger_Utility.checkOWDPermissions(lTask);
	}
	
	 static testMethod void testtaskcheck() {
	 	Milestone1_Settings__c custmilestonesetting = new Milestone1_Settings__c();
		custmilestonesetting.Name = 'testing1';
		custmilestonesetting.Auto_Follow_Task__c = true;
		custmilestonesetting.Auto_Follow_Complete_Task__c = true;
		custmilestonesetting.Auto_Unfollow_Reassignment__c = true;
		insert custmilestonesetting;
		
		Milestone1_Project__c Project = new Milestone1_Project__c();
        Project.Name = 'Test1';
        Project.Kickoff__c = date.today();
        Project.Start_Day__c = 1;
        Project.Project_Duration__c = 200;
        insert Project;
        
        Milestone1_Milestone__c Milestone = new Milestone1_Milestone__c();
        Milestone.Name = 'Test1';
        Milestone.Start_Day__c = 1;
        Milestone.Milestone_Duration__c = 3;
       	Milestone.Project__c = Project.id;
       	insert Milestone;
       	
       	Milestone1_Task__c Tasks = new Milestone1_Task__c();
       	Tasks.Start_Day__c = null;
       	Tasks.Task_Duration__c = null;
       	Tasks.Start_Date__c = null;
       	Tasks.Project_Milestone__c = Milestone.id; 
       	insert Tasks; 
	 	
	 }	
	 
	 static testMethod void testtaskcheck2() {
	 	
		Milestone1_Project__c Project = new Milestone1_Project__c();
        Project.Name = 'Test1';
        Project.Kickoff__c = date.today();
        Project.Start_Day__c = 1;
        Project.Project_Duration__c = 200;
        insert Project;
        
        Milestone1_Milestone__c Milestone = new Milestone1_Milestone__c();
        Milestone.Name = 'Test1';
        Milestone.Start_Day__c = 1;
        Milestone.Milestone_Duration__c = 3;
       	Milestone.Project__c = Project.id;
       	insert Milestone;
       	
       	Milestone1_Task__c Tasks = new Milestone1_Task__c();
       	Tasks.Start_Day__c = 1;
       	Tasks.Task_Duration__c = 4;
       	Tasks.Project_Milestone__c = Milestone.id; 
       	insert Tasks; 
       	
       	Milestone1_Task__c Tasks2 = new Milestone1_Task__c();
       	Tasks2.Start_Day__c = 1;
       	Tasks2.Task_Duration__c = 4;
       	Tasks2.Predecessor_Task__c = Tasks.id;
       	Tasks2.Project_Milestone__c = Milestone.id;
       	Tasks2.Due_Date__c = date.today().adddays(8); 
       	insert Tasks2;
       	
       	Tasks2.Due_Date__c = date.today().adddays(10); 
       	update Tasks2;
	 	
	 }	
	 
}