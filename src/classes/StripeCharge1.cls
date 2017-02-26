@RestResource(urlMapping='/webhook1/*')
 
Global class StripeCharge1 { 
   
    @HttpPost
    Global Static String doPost(){
		Contact theContact = new Contact();
        String bodystring = RestContext.request.requestBody.toString();
       	JSONParser parser = JSON.createParser(bodystring);
      	StripeJson soj = new StripeJson(parser);

 		
        Integer amount = soj.data.Object_z.amount;
		String theEmail = soj.data.Object_z.receipt_email;
        //return string.valueof(soj.data);
        try{
            theContact = [SELECT Id, Email FROM Contact WHERE email = :theEmail AND email != null LIMIT 1].get(0);
        }catch(exception e){
            System.debug('Query issue: '+ e.getMessage());
        }
        
        return String.valueOf(theContact.Id);
 
    }
    

}