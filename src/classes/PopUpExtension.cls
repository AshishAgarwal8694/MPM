/*------------------------------------------------------------------------------------------------------------------------------------------------------------
Description: Class for PopupWindow for "configure Project" button on project record. 

    ==========================================================================================================================================================
        Version   | Date        | Author               | Comments
    -----------------------------------------------------------------------------------------------------------------------------------------------------------
        1.0       | 31-03-2016  | Kalpesh Wani         | 1. Class for PopupWindow for "configure Project" button on project record.
    -----------------------------------------------------------------------------------------------------------------------------------------------------------
   
   ============================================================================================================================================================
    
*/
public with sharing class PopUpExtension{
    
    public Milestone1_Project__c Project; 
    public List<Milestone1_Project__c> ProjectGetData;
    public List<Milestone1_Milestone__c>  milestones;
    public List<Milestone1_Task__c> milestonesTasks;
    public boolean ErrorFound {get;set;}
 
    public PopUpExtension(ApexPages.StandardController stdController){
        ErrorFound = false;        
        Project = (Milestone1_Project__c)stdCOntroller.getRecord(); 
        ProjectGetData = new List<Milestone1_Project__c>();
        milestones = new List<Milestone1_Milestone__c>();
        milestonesTasks = new  List<Milestone1_Task__c>();
    }
    
    /*
     @ Method Description           : Method to update estimated dates for Project/milestone/tasks.
    */ 
    public void UpdateEstimatedDates() {
        try{
            ErrorFound = false; //boolean to set error message intially false. 
            Date EstimatedStartDate;
            Map<id,Milestone1_Milestone__c> MilestonesMap = new Map<id,Milestone1_Milestone__c>(); //Map to hold milestone id and record.
            
            //Query to retrieve project record.
            ProjectGetData = [select Name,Start_Day__c,Project_Duration__c,Kickoff__c,Deadline__c from Milestone1_Project__c where Start_Day__c != null and Project_Duration__c !=null and id = :Project.id limit 1];
            if(!ProjectGetData.isEmpty()){        
                if(Project.Kickoff__c != null){
                    ProjectGetData[0].Kickoff__c = Project.Kickoff__c;
                }else{
                    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please provide project <b>Estimated Start Date</b> or close the window.');
                    ApexPages.addMessage(myMsg);
                    ErrorFound = true;
                    return;
                }
                EstimatedStartDate = Date.valueOf(Project.Kickoff__c).addDays((integer)ProjectGetData[0].Start_Day__c)-1;
                ProjectGetData[0].Deadline__c = EstimatedStartDate.addDays((integer)ProjectGetData[0].Project_Duration__c)-1;
                
                //Query to retrieve milestone records.
                milestones = [Select Name,m.Start_Day__c, m.Project__c, m.Kickoff__c, m.Estimated_End_Date__c, m.Milestone_Duration__c From Milestone1_Milestone__c m where Start_Day__c !=null and Milestone_Duration__c !=null and m.Project__c = :Project.id];
                for(Milestone1_Milestone__c milestone : milestones){
                    milestone.Kickoff__c = EstimatedStartDate.addDays((integer)milestone.Start_Day__c)-1;
                    milestone.Estimated_End_Date__c = (Date)milestone.Kickoff__c.addDays((integer)milestone.Milestone_Duration__c)-1;
                    
                    if(milestone.Estimated_End_Date__c > ProjectGetData[0].Deadline__c){
                        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Milesone: "<b>'+milestone.Name+'</b>" Estimated End date is greater than Project: "<b>'+ProjectGetData[0].Name+'</b>" Estimated End Date');
                        ApexPages.addMessage(myMsg);
                        ErrorFound = true;
                        return;
                    }
                    MilestonesMap.put(milestone.id,milestone);
                }
                
                //Query to retrieve milestone tasks records.
                milestonesTasks = [Select Name,Task_Duration__c,m.Project_Milestone__c, m.Start_Day__c, m.Start_Date__c, m.Estimated_End_Date__c From Milestone1_Task__c m where Start_Day__c !=null and Task_Duration__c !=null and m.Project_Milestone__c = :MilestonesMap.keyset()];
                for(Milestone1_Task__c task : milestonesTasks){
                    Milestone1_Milestone__c milestone = MilestonesMap.get(task.Project_Milestone__c);
                    task.Start_Date__c = EstimatedStartDate.addDays((integer)task.Start_Day__c)-1;
                    task.Estimated_End_Date__c = (Date)task.Start_Date__c.addDays((integer)task.Task_Duration__c)-1;
                    
                    if(task.Estimated_End_Date__c > milestone.Estimated_End_Date__c){
                        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Task: "<b>'+task.Name+'</b>" Estimated End date is greater than Milestone: "<b>'+milestone.Name+'</b>" Estimated End Date');
                        ApexPages.addMessage(myMsg);
                        ErrorFound = true;
                        return;
                    }
                }   
                
                if(!ProjectGetData.isEmpty()){
                    try{ update ProjectGetData;
                       }catch(DMLexception e){ ErrorFound = true; return;}
                }
                if(!milestones.isEmpty()){
                    try{ update milestones;
                    }catch(DMLexception e){ ErrorFound = true; return; }
                }
                if(!milestonesTasks.isEmpty()){ 
                    try{ update milestonesTasks;
                    }catch(DMLexception e){ ErrorFound = true; return; }
                }
            }
            else {
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please enter data for the required fields on the Project record before proceeding ahead.');
                ApexPages.addMessage(myMsg);
                ErrorFound = true;
                return; 
            }
        }
        catch(exception e) {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Error Occured while updating the Projects/Milestones/Tasks '+e.getMessage());
            ApexPages.addMessage(myMsg);
            ErrorFound = true;
        }
    }
    
}