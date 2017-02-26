public class StringArrayTest {
     
    public static list<string> generateStringArray(Integer n){
        list<String> trailist = new list<String>();
        for (Integer i=0;i<n;i++) {
            	trailist.add('Test '+i);
                System.debug(trailist[i]);
            }
       
        return trailist;
    }
}