@isTest
Private class TestMySchedulableToil {  
	
    public static string CRON_EXP = '0 0 12 1 1/1 ? *';
    
    @isTest Static void testJune(){
       	
        SFDC_Employee__c emJune = new SFDC_Employee__c(name='julian test',june_toil__c=6,month_del__c = 6);
        	
        	insert emJune;
        
        Time_off__c TOJune = new Time_off__c(employee__c= emjune.Id, name ='2016', active__c = TRUE);
        
        	insert toJune;
        test.startTest();
       	       	        
        string jobid = system.schedule('ScheduleToilTest', CRON_EXP, new MySchedulableToil());
        
        cronTrigger ct= [SELECT id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobid];
        
        system.assertEquals(CRON_EXP, ct.CronExpression);
        
        system.assertEquals(0,ct.TimesTriggered);
        
        system.assertEquals('2016-08-01 12:00:00',string.valueOf(ct.NextFireTime));
        
        system.assertEquals(0,[SELECT id,status__c,description__c,Number_of_Days__c,time_off__c from TOIL__c WHERE time_off__c =:tojune.Id].size());
        
        MySchedulableToilController.mySchedulableToilController(6);
        
        test.stopTest();
         
        toil__c[] toil = [SELECT id,status__c,description__c,Number_of_Days__c,time_off__c from TOIL__c WHERE time_off__c =:tojune.Id];
        
            
        system.assertEquals(6,toil[0].Number_of_days__c); 
        
        
    	}
   @isTest Static void testJuly(){
        SFDC_Employee__c em = new SFDC_Employee__c(name='julian test',july_toil__c =7,month_del__c = 7);
        	
        	insert em;
        
        Time_off__c TO = new Time_off__c(employee__c= em.Id, name ='2016', active__c = TRUE);
        
        	insert to;
        
       	
        test.startTest();
       
       	
        
        
        string jobid = system.schedule('ScheduleToilTest', CRON_EXP, new MySchedulableToil());
        
        cronTrigger ct= [SELECT id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobid];
        
        system.assertEquals(CRON_EXP, ct.CronExpression);
        
        system.assertEquals(0,ct.TimesTriggered);
        
        system.assertEquals('2016-08-01 12:00:00',string.valueOf(ct.NextFireTime));
        
        system.assertEquals(0,[SELECT id, status__c,description__c,Number_of_Days__c,time_off__c from TOIL__c WHERE time_off__c =:to.Id].size());
        test.stopTest();
        
        toil__c[] toil = [SELECT id, status__c,description__c,Number_of_Days__c,time_off__c from TOIL__c WHERE time_off__c =:to.Id];
        
            
        system.assertEquals(7,toil[0].Number_of_days__c);
       
        MySchedulableToilController.mySchedulableToilController(7); 
        
    	}
    
     @isTest Static void testAugust(){
        SFDC_Employee__c em = new SFDC_Employee__c(name='julian test',july_toil__c =8,month_del__c = 8);
        	
        	insert em;
        
        Time_off__c TOAugust = new Time_off__c(employee__c= em.Id, name ='2016', active__c = TRUE);
        
        	insert toAugust;
        
       	
        test.startTest();
       
       	
        
        
        string jobid = system.schedule('ScheduleToilTest', CRON_EXP, new MySchedulableToil());
        
        cronTrigger ct= [SELECT id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobid];
        
        system.assertEquals(CRON_EXP, ct.CronExpression);
        
        system.assertEquals(0,ct.TimesTriggered);
        
        system.assertEquals('2016-08-01 12:00:00',string.valueOf(ct.NextFireTime));
        
        system.assertEquals(0,[SELECT id, status__c,description__c,Number_of_Days__c,time_off__c from TOIL__c WHERE time_off__c =:toAugust.Id].size());
        test.stopTest();
        
        toil__c[] toil = [SELECT id, status__c,description__c,Number_of_Days__c,time_off__c from TOIL__c WHERE time_off__c =:toAugust.Id];
        
            
        system.assertEquals(8,toil[0].Number_of_days__c);
       
        MySchedulableToilController.mySchedulableToilController(8); 
        
    	}
    
}