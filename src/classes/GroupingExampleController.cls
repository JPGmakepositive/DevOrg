public class GroupingExampleController 
{
 private List<Flexitime__c> allTimes {get; set;}
 public List<GroupWrapper> groups {get; set;}
 public String groupFieldName {get; set;}
 public List<SelectOption> groupOptions {get; set;}
  
 public GroupingExampleController()
 {
  allTimes=[select id, Name,week__c,(select id, employee__c,hours__c FROM Time_logs__r) from flexitime__c limit 10];
  groupFieldName='week__c';
   
  setupGrouping();
  groupOptions=new List<SelectOption>();
  groupOptions.add(new SelectOption('Name', 'Name'));
  groupOptions.add(new SelectOption('Week__c', 'Week'));
 }
  
 public PageReference regroup()
 {
  setupGrouping();
  return null;
 }
  
  
 private void setupGrouping()
 {
  Map<String, List<flexitime__c>> groupedMap=new Map<String, List<flexitime__c>>();
  for (Flexitime__c ft : allTimes)
  {
   String key=String.valueof(ft.get(groupFieldName));
   if ( (null==key) || (0==key.length()) )
   {
    key='Undefined';
   }
   List<Flexitime__c> groupedAccs=groupedMap.get(key);
   if (null==groupedAccs)
   {
    groupedAccs=new List<Flexitime__c>();
    groupedMap.put(key, groupedAccs);
   }
    
   groupedAccs.add(ft);
  }
   
  groups=new List<GroupWrapper>();
  for (String key : groupedMap.keySet())
  {
   GroupWrapper gr=new GroupWrapper();
   groups.add(gr);
   gr.fts=groupedMap.get(key);
   gr.groupedVal=key;
  }
 }
  
 public class GroupWrapper
 {
  public List<Flexitime__c> fts {get; set;}
  public String groupedVal {get; set;}
  public Integer count {get {return fts.size(); } set;}
 }
}