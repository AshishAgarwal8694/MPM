/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class Milestone1_Milestone_Utility_Test {
    
    static testMethod void testBeforeUtility() {
        
	  	Profile p = [SELECT Id,PermissionsModifyAllData FROM Profile WHERE Name='Project Manager' and PermissionsModifyAllData = false];
      	User u = new User(Alias = 'sysadmin', Email='test@test.com',
      	EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
      	LocaleSidKey='en_US', ProfileId = p.Id,
      	TimeZoneSidKey='America/Los_Angeles', UserName='testnew@test.com');
        
        System.runAs(u) {
        	Milestone1_Project__c testProject = Milestone1_Test_Utility.sampleProject('UNIT TEST PROJECT NAME ABC123XYZ UNIQUE' + System.now());
	        insert testProject;
	        
	        Milestone1_Milestone__c testPredecessorMilestone = Milestone1_Test_Utility.testSampleMilestone(testProject.Id,null,'UNIT_TEST_PREDECESSOR_MILESTONE_NAME_ACB123XYZ_UNIQUE' + System.now());
	        insert testPredecessorMilestone;
	        
	        Milestone1_Milestone__c testSuccessorMilestone = Milestone1_Test_Utility.testSampleMilestone(testProject.Id,testPredecessorMilestone.Id,'UNIT_TEST_SUCCESSOR_MILESTONE_1_NAME_ACB123XYZ_UNIQUE' + System.now());
	        insert testSuccessorMilestone;
	        
	        Milestone1_Task__c predecessorTask = Milestone1_Test_Utility.sampleTask(testPredecessorMilestone.Id,null,Date.today(),Date.today().addDays(1));
	        insert predecessorTask;
	        
	        Milestone1_Time__c predecessorTime = Milestone1_Test_Utility.sampleTime(predecessorTask.Id);
	        insert predecessorTime;
	        
	        Milestone1_Task__c successorTask = Milestone1_Test_Utility.sampleTask(testPredecessorMilestone.Id,predecessorTask.Id,Date.today().addDays(2),Date.today().addDays(3));
	        insert successorTask;
	        
	        delete testSuccessorMilestone;
	        
	        set<id> milestoneid = new set<id>();
	        set<id> projectid = new set<id>();
	        milestoneid.add(testSuccessorMilestone.id);
	        projectid.add(testProject.id);
	        Milestone1_Milestone_Trigger_Utility.updateMilestones(milestoneid);
	        Milestone1_Milestone_Trigger_Utility.batchUpdateMilestones(milestoneid);
	        Milestone1_Milestone_Trigger_Utility.batchUpdateProjects(projectid);
	        
	        boolean chckPermission = Milestone1_Milestone_Trigger_Utility.milestonePermissions('Milestone1_Milestone__c');
        }
    }
    
    static testMethod void testBeforeUtility2() {
        
	  	Profile p = [SELECT Id,PermissionsModifyAllData FROM Profile WHERE Name='Project Manager' and PermissionsModifyAllData = false];
      	User u = new User(Alias = 'sysadmin', Email='test@test.com',
      	EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
      	LocaleSidKey='en_US', ProfileId = p.Id,
      	TimeZoneSidKey='America/Los_Angeles', UserName='testnew@test.com');
        
        System.runAs(u) {
        	Milestone1_Project__c testProject = Milestone1_Test_Utility.sampleProject('UNIT TEST PROJECT NAME ABC123XYZ UNIQUE' + System.now());
	        insert testProject;
	        
	        Milestone1_Milestone__c testPredecessorMilestone = Milestone1_Test_Utility.sampleMilestone(testProject);
	        insert testPredecessorMilestone;
	        
	        Milestone1_Task__c predecessorTask = Milestone1_Test_Utility.sampleTask(testPredecessorMilestone.Id,null,Date.today(),Date.today().addDays(1));
	        insert predecessorTask;
	        
	        Milestone1_Time__c predecessorTime = Milestone1_Test_Utility.sampleTime(predecessorTask.Id);
	        insert predecessorTime;
	        
	        Milestone1_Task__c successorTask = Milestone1_Test_Utility.sampleTask(testPredecessorMilestone.Id,predecessorTask.Id,Date.today().addDays(2),Date.today().addDays(3));
	        insert successorTask;
	        
	        delete testPredecessorMilestone;
        }
    }
}