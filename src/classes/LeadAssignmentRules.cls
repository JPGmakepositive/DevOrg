public class LeadAssignmentRules {
    
    public static void leadAssignmentRules(set<id>leadIds){
        list<lead>leadsupdt = [select Id,Status FROM lead WHERE Id IN:leadIds];
        for (lead l:leadsupdt){
            Database.DMLOptions dmo = new Database.DMLOptions();
        	dmo.assignmentRuleHeader.useDefaultRule = true; // use leadAssignment rules when updating
        	l.setOptions(dmo);
        }
        try{update(leadsupdt);}
        catch(DmlException e){}
    }
    
    

}