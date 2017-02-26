@RestResource(urlMapping='/webhook/*')

Global class StripeCharge { 
    
    @HttpPost
    Global Static String doPost(){
		     
        String bodystring = RestContext.request.requestBody.toString();

        bodystring = bodystring.replaceAll('"object":', '"stripeObject":');
		bodystring = bodystring.replaceAll('"date":', '"stripeDate":');
		bodystring = bodystring.replaceAll('"end":', '"endDate":');
		bodystring = bodystring.replaceAll('"data":', '"stripeData":');
		bodystring = bodystring.replaceAll('"currency":', '"stripeCurrency":');
		bodystring = bodystring.replaceAll('"type":', '"stripeType":');
        
        //Map<String, object> results = (Map<String, object>)JSON.deserializeUntyped(bodystring);
        //string decode  = String.valueOf(results.get('stripeData')).escapeHtml4();
        //stripeObject deserializeResults = (stripeObject) JSON.deserialize(decode, stripeObject.class);
       	Map<String, object> results = (Map<String, object>)JSON.deserializeUntyped(bodystring);
       	//list<object> jobjects = (list <object>)results.get('stripeData');
        //jobject = results.values();
        Map<String, object> dataResults = (Map<String, object>)JSON.deserializeUntyped(string.valueof(results.get('stripeData')));
        
        return string.valueof(dataResults);
    }
    
    
	Global Integer created;	//1326853478
	Global boolean livemode;
	Global String id;	//evt_00000000000000
	Global String type;	//charge.succeeded
	Global String stripeObject;	//event
	Global Integer pending_webhooks;	//1
	Global String api_version;	//2016-03-07
	Global cls_data data;
	
	Global class cls_data {
	}
	Global class stripeObject {
		Global String id;	//ch_00000000000000
		Global String stripeObject;	//charge
		Global Integer amount;	//100
		Global Integer amount_refunded;	//0
		Global String balance_transaction;	//txn_00000000000000
		Global boolean captured;
		Global Integer created;	//1464626238
		Global String stripecurrency;	//gbp
		Global String description;	//My First Test Charge (created for API docs)
		Global boolean livemode;
		Global boolean paid;
		Global boolean refunded;
		Global String status;	//succeeded
        
        public stripeObject(){
            
        }
	}
    
	Global static stripeCharge parse(String bodystring){
		return (stripeCharge) System.JSON.deserialize(bodystring, stripeCharge.class);
    }
    
}