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
private class TestPopUpExtension {

    static testMethod void functionalTest() {
        
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
       	
       	PageReference pageRef = Page.popupwindow;
		Test.setCurrentPageReference(pageRef);
		
       	ApexPages.StandardController sc = new ApexPages.standardController(Project);
       	PopUpExtension popext = new PopUpExtension(sc);
       	popext.UpdateEstimatedDates();
        	
    }
    
    static testMethod void ErrorTest1() {
        
        Milestone1_Project__c Project = new Milestone1_Project__c();
        Project.Name = 'Test1';
        Project.Kickoff__c = date.today();
        Project.Start_Day__c = 1;
        Project.Project_Duration__c = 200;
        insert Project;
        
       	PageReference pageRef = Page.popupwindow;
		Test.setCurrentPageReference(pageRef);
       	
       	ApexPages.StandardController sc = new ApexPages.standardController(Project);
       	PopUpExtension popext = new PopUpExtension(sc);
       	popext.Project = null;
       	popext.UpdateEstimatedDates();
        	
    }
    
    static testMethod void ErrorTest2() {
        
        Milestone1_Project__c Project = new Milestone1_Project__c();
        Project.Name = 'Test1';
        Project.Kickoff__c = date.today();
        Project.Start_Day__c = 1;
        Project.Project_Duration__c = 200;
        insert Project;
        
       	PageReference pageRef = Page.popupwindow;
		Test.setCurrentPageReference(pageRef);
       	
       	ApexPages.StandardController sc = new ApexPages.standardController(Project);
       	PopUpExtension popext = new PopUpExtension(sc);
       	popext.Project.Kickoff__c = null;
       	popext.UpdateEstimatedDates();
        	
    }
    
    static testMethod void ErrorTest4() {
        
        Milestone1_Project__c Project = new Milestone1_Project__c();
        Project.Name = 'Test1';
        Project.Kickoff__c = date.today();
        Project.Start_Day__c = 1;
        Project.Project_Duration__c = 2;
        insert Project;
        
        Milestone1_Milestone__c Milestone = new Milestone1_Milestone__c();
        Milestone.Name = 'Test1';
        Milestone.Start_Day__c = 1;
        Milestone.Milestone_Duration__c = 30;
       	Milestone.Project__c = Project.id;
       	insert Milestone;
       	
       	Milestone1_Task__c Tasks = new Milestone1_Task__c();
       	Tasks.Start_Day__c = 1;
       	Tasks.Task_Duration__c = 43;
       	Tasks.Project_Milestone__c = Milestone.id; 
       	insert Tasks; 
       	
       	PageReference pageRef = Page.popupwindow;
		Test.setCurrentPageReference(pageRef);
		
       	ApexPages.StandardController sc = new ApexPages.standardController(Project);
       	PopUpExtension popext = new PopUpExtension(sc);
       	popext.UpdateEstimatedDates();
        	
    }
    
    static testMethod void ErrorTest5() {
        
        Milestone1_Project__c Project = new Milestone1_Project__c();
        Project.Name = 'Test1';
        Project.Kickoff__c = date.today();
        Project.Start_Day__c = null;
        Project.Project_Duration__c = null;
        insert Project;
       	
       	PageReference pageRef = Page.popupwindow;
		Test.setCurrentPageReference(pageRef);
		
       	ApexPages.StandardController sc = new ApexPages.standardController(Project);
       	PopUpExtension popext = new PopUpExtension(sc);
       	popext.UpdateEstimatedDates();
        	
    }
    
}