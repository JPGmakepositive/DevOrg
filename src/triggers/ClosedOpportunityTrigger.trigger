trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    list<task>inserttask= new list<task>();
    for(opportunity opp :[SELECT id FROM opportunity WHERE id IN :trigger.new AND stagename = 'Closed won']){
        inserttask.add(new task(subject = 'Follow Up Test Task',whatid=opp.Id));
    }
    if(inserttask.size()>0){
        insert inserttask;
    }
    

}