public class AddPrimaryContact implements Queueable  {
    
   	public contact con;
    public string state;
    
    public addPrimaryContact(contact c, string st){
       
        con = c;
        state = st;
        system.debug('valuof' + con.id);
    }
    
    public void execute(QueueableContext Context){
       	
        List<contact>clonedCons = new list<contact>();
        //Contact clonedCon;
        List<Account> acc = [SELECT id,name,(select id,firstname,lastname FROM contacts) FROM account where BillingState =:state LIMIT 200];
        system.debug('number of states:::'+acc.size());
        
            //for(contact cons :[SELECT id from contact where id = :con.Id]){
                for(Account a: acc){
            		contact clonedCon = con.clone(false,true);
            		clonedcon.AccountId = a.id;
            		ClonedCons.add(clonedCon);
            //}
            
            }
        system.debug('listsize::::'+ clonedCons.size());
        if(clonedCons.size()>0){
        	Insert ClonedCons;
        }
        
    }

}