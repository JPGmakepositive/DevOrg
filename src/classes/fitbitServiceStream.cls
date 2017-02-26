@RestResource(urlMapping='/fitbitWebhook/*')

Global class fitbitServiceStream {
    
   @HttpGet

    global static integer doGet() {

        RestRequest req = RestContext.request;

        RestResponse res = RestContext.response;

        String vCode = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        integer ok = 204;
        integer fail = 404;
        
        If(vCode == 'dd3c7df1e8cffad3f88a07630f3dc8e871cbc28ff1c65274207eba2772cf49ec'){
            return ok;
        }else{
            return fail;
            }
        }

}