public class RecordCreate{
    
    
    //Query all opps that meet the criteria in the "where" statement
    List<opportunity> opp = new list <opportunity>();
    List<Payment_schedule__c> psList = new List<Payment_schedule__c>();
    
    
    public void RecordCreate(){
    opp=[SELECT id, closeDate, amount FROM opportunity WHERE isPrivate =TRUE];
     //loop through the opportunities that where queried and create a payment schedule child record for each of them   
        for (opportunity o:opp){
            Payment_schedule__c ps = new Payment_schedule__c();
            ps.Date__c = o.closedate;
            ps.amount__c = o.Amount;
            ps.Opportunity__c = o.Id;
            
            psList.add(ps);
            system.debug(pslist.size());
        }//loop end
        try {
            insert psList;
        }catch (system.DmlException e){
            system.debug(e);
        }
    }//recordcreate end
   
          
}