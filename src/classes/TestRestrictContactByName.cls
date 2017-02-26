@isTest
public class TestRestrictContactByName {
    @isTest public static void test1(){
        contact con1 = new contact();
            	con1.lastname = 'name';
        insert con1;
        con1.lastname ='invalidname';
      Test.startTest();
        Database.saveResult result = Database.update(con1, false);
        Test.stopTest();
        
       System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "'+con1.LastName+'" is not allowed for DML',
                             result.getErrors()[0].getMessage());
        
    }

}