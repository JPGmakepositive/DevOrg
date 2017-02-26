public class AccountHandler {
	
    public static Account insertNewAccount(String name) {
        
        Account acc = new Account();
            acc.name=(name);
        Try{
            insert acc;
            
            
        }catch (DmlException e) {
            return null;
   
        }
        return acc;
    }
    
}