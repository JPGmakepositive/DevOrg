public class Fitbit {

    @Future(callout=true)
    public static void today() {
        String url = '/1/user/-/activities/date/' + Fitbit.getToday() + '.json';        
        HttpResponse res = Fitbit.getRequest(url);
        JSON2ApexToday result = JSON2ApexToday.parse(res.getBody());
        FitbitData__c d = new FitbitData__c();
        d.steps__c = result.getSteps();
        d.calories__c = result.getCalories(); 
        d.distance__c = result.getDistance();
        d.Date__c = fitbitDate;
        insert d;
    }
    
    public static void userProfile() {
        String url = '/1/user/-/profile.json';        
        HttpResponse res = Fitbit.getRequest(url);
        JSON2ApexFitbitUser result = JSON2ApexFitbitUser.parse(res.getBody());
        contact d = new Contact();
        d.firstname = result.user.DisplayName;
        d.lastName = result.User.FullName;
        d.pic_URL__c= result.user.avatar150;
        insert d;
    }
  
    private static HttpResponse getRequest(String url) {
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        req.setMethod('GET');    
        req.setEndpoint('callout:Fitbit' + url);
        HttpResponse res = http.send(req);
        return res;
    }
    
    // String body = 'fname=firstname&lname=lastname&age=34';
    private static HttpResponse postRequest(String url, String body) {
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        req.setMethod('POST');    
        req.setEndpoint('callout:Fitbit' + url);
        if(body != null && body != '') {
            req.setbody(body);
        }
        HttpResponse res = http.send(req);
        return res;
    }    
    //String comment SCM test
    public static date fitbitDate{get;set;}
   
    public static String getToday() {
        //Date dateToday = Date.today();
        String sMonth = String.valueof(fitbitDate.month());
        String sDay = String.valueof(fitbitDate.day());
        if(sMonth.length()==1){
            sMonth = '0' + sMonth;
        }
        if(sDay.length()==1){
            sDay = '0' + sDay;
        }
        return String.valueof(fitbitDate.year()) + '-' + sMonth + '-' + sDay;    
    }
    
}