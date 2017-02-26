@isTest
public class AddPrimaryContactTest {
    
@isTest
    Static void TestList(){
        //contact con = new contact();
        //con.LastName = 'PrimaryTest';
        //insert con;
        List<account>accounts =  new list<account>();
        for(integer i=0;i<50;i++){
            Accounts.add(new account(name='test'+i,billingState='NY'));
        }
        for(integer j=0;j<50;j++){
            Accounts.add(new account(name='test'+j,billingState='CA'));
        }
        insert accounts;
    
    
    //Static testmethod void testQueueable(){
        list<account> accNY =[SELECT id,billingstate FROM account WHERE BillingState = 'NY'];
        system.assertEquals(50,accNY.size());
        List<account> accCA =[SELECT id,billingState FROM account WHERE billingState = 'CA'];
        system.assertEquals(50,accCA.size());
        
        contact con = new contact(LastName = 'PrimaryTest');
        string state = 'NY';
        
        AddPrimaryContact apCon = new AddPrimaryContact(con, state);
        
        test.startTest();
        system.enqueueJob(apCon);
        test.stopTest();
        
        System.assertEquals(50, [select count() from Contact where accountID IN (SELECT id FROM Account WHERE BillingState = :State)]); 
        
    }
}