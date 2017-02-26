public class AccountProcessor {

@future
public static void countContacts(list<Id>accountIds){
     	List<Account> accounts = [SELECT id, (select id from contacts) FROM account WHERE id in:accountIds];
        	for( account a: accounts){
            	a.number_of_contacts__c = a.contacts.size();
            	update a;
        }
    }

}