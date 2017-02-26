trigger LeadTriggers on Lead (after insert,after update) {
	set<id>leadIds = New set<id>();
    
    if(trigger.isUpdate){
        if(trigger.isAfter){
            for(lead l : trigger.new){
                lead OldLead = trigger.oldmap.get(l.id);
            	string oldStatus = oldlead.Status;
            	system.debug('old lead status::::'+ oldStatus);
            		If(oldStatus=='New' && l.Status == 'Marketing Qualified'){
                	System.debug('We are hitting it!');
                	leadids.add(l.Id);
            		}
                }
        	}
        	//we are passing the lead ids to the class that will run the assignment rules
    		leadAssignmentRules.leadAssignmentRules(leadIds);
        
    }else if(trigger.isInsert){
        for(lead l: trigger.new){
            if(l.Status == 'new'){
                
                leadids.add(l.id);
                
            }
         }
        system.debug('number of leads:::'+leadids.size());
        //we are passing the lead ids to the class that will run the assignment rules
    	leadAssignmentRules.leadAssignmentRules(leadIds);
    }
}