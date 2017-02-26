@isTest
public class AccountProcessorTest {
    @isTest public static void AccountProcessorTest(){
    Account a = new account(name='test 1');
    insert a;
    contact con1 = new contact(lastName='ChildContact',AccountId=a.Id);
    insert con1;
    contact con2 = new contact(lastName='ChildContact2',AccountId=a.Id);
    insert con2;
   	List<Id>aIds = new list<id>();
    aIds.add(a.Id);
        
        test.startTest();
        AccountProcessor.countContacts(aIds);
        List<account> acc = [SELECT id,number_of_contacts__c FROM account WHERE id = :a.Id];
       
        system.assertEquals(null,acc[0].number_of_contacts__c);
        test.stopTest();
        list<account>accCheck = [SELECT id,number_of_contacts__c FROM account WHERE id = :a.Id];
        
        system.assertEquals(2,acc[0].number_of_contacts__c);
    }

}