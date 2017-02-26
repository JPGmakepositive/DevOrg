public class NewCaseListController {
    public list<case> getnewCases(){
        List<case> results=[SELECT id, casenumber FROM case WHERE status = 'new'];
   return results;
    }
    

}