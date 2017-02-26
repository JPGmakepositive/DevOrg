public class ContactAndLeadSearch {
    public static list<List< SObject>> searchContactsAndLeads (string lastname){
        List<List<sObject>> searchList = [FIND :lastname IN NAME FIELDS 
                   RETURNING Lead (firstname,Lastname),Contact(firstname,LastName)];
Lead[] searchLeads = (Lead[])searchList[0];
Contact[] searchContacts = (Contact[])searchList[1];

return searchlist;
       
}

    
}