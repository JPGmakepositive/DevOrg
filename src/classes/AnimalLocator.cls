public class AnimalLocator {
    
    public static string getAnimalNameById(integer id){
      
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        Map<string, Object> animal = new Map<string, Object>();
        HttpResponse response = http.send(request);
           if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            animal = (Map<string, Object>) results.get('animal');
           }
        	return (string)animal.get('name');
           
           
    }

}