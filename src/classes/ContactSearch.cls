public class ContactSearch {
    public static list<Contact> searchForContacts (string lastname, string postcode) {
        list<contact>con= [SELECT id,name FROM contact WHERE lastname=:lastname AND MailingPostalCode=:postcode];
            return con;
        
    }

}