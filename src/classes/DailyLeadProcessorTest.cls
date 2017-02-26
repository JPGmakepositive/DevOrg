@istest
public class DailyLeadProcessorTest {
    
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    static testmethod void testScheduledJob() {
       
        List<lead>leads =  new list<lead>();
        for(integer i=0;i<200;i++){
            leads.add(new lead(lastname='test'+i,company='test',status='New'));
        }
        insert leads;
        
        test.startTest();
        string jobid = system.schedule('ScheduleToilTest', CRON_EXP, new DailyLeadProcessor());
        system.assertEquals(0,[select count() from lead where leadsource = 'dreamforce']);
        test.stopTest();
        system.assertEquals(200,[select count() from lead where leadsource = 'dreamforce']);
    }
}