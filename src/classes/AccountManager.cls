@RestResource(urlMapping='/Accounts/*/contacts')
Global with sharing class AccountManager {
   
   @HttpGet
    Global static Account getAccount(){
         RestRequest request = RestContext.request;
        // grab the account from the end of the URL
        String accountId = 
          request.requestURI.substringBetween('Accounts/', '/contacts');
        Account result =  [SELECT Id,Name,(Select id,Name from contacts)
                        FROM Account
                        WHERE Id = :accountId];
        return result;
    }

}