@isTest
public class LeadProcessorTest {
    
@TestSetup
    Static Void setup(){
        list<lead> leads = new list <lead>();
        
        for(integer i=0;i<200;i++){
            leads.add(new lead(lastName='test'+i,Company='Company Test',status ='Open - Not Contacted'));
        }
        insert leads;
    }
    static testmethod void test(){
        test.startTest();
        leadProcessor lp = new leadProcessor();
        id batchid = database.executeBatch(lp);
        test.stopTest();
        
        system.assertEquals(200,[SELECT count() FROM lead WHERE LeadSource ='Dreamforce']);
    }
}