public class TimeLogSummary {
    public List<time_log__c> timeLogs{get;set;}
    
    public timeLogSummary(){
        timeLogs = new List<time_log__c>();
        timelogs = [SELECT id,contact__c,Flexitime__c,Hours__c FROM time_log__c WHERE flexitime__c = :ApexPages.currentPage().getParameters().get('Id')];
    }
}