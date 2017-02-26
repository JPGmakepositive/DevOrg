@isTest
private class FitbitTest {
    static testMethod void callout(){
        Test.setMock(HttpCalloutMock.class, new FitbitMockGenerator());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
         Fitbit.today();
    }
    
    static testMethod void con() {

        FitbitController.dummy();

        }
}