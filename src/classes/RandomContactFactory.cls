public class RandomContactFactory {
        
       public static list<contact> generateRandomContacts(integer numberContact, string cLastName){
           list<contact> con = new List<contact>();
           
           for(integer i=0;i<numberContact;i++){
               contact c = new contact(FirstName = 'Test'+ i, LastName = cLastName);
               con.add(c);
           }
           
            return con;
        }
        
    

}