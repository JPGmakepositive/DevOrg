public class MySchedulableToilController {
    
    
    public static void mySchedulableToilController(integer month){
        
        TOIL__c toil = new TOIL__c();
             //list hold the TOIL records to be inserted
        List<TOIL__c> ToilList = new list<TOIL__c>();
        

        //find employees with active time off records
        for (SFDC_Employee__c eToil:[SELECT id,Month_del__c,Name,july_toil__c,june_toil__c,august_toil__c,september_toil__c,(select id from timeoff__r where active__c = TRUE LIMIT 1 ) FROM SFDC_Employee__c]){
            //june toil
            if(month == 6) {
            	toil.Time_Off__c = eToil.timeOff__r[0].id;
            	toil.Description__c ='system Generated';
            	toil.Status__c = 'Approved';
            	toil.Number_of_Days__c = etoil.June_TOIL__c;
            	toilList.add(toil);
            //july toil   
            }else if (month == 7){
                if(etoil.timeOff__r.size()>0){
            	toil.Time_Off__c = etoil.timeOff__r[0].id;
           		toil.Description__c ='system Generated';
            	toil.Status__c = 'Approved';
            	toil.Number_of_Days__c = etoil.July_TOIL__c;
                toilList.add(toil);}
             }else if (month == 8){
                if(etoil.timeOff__r.size()>0){
            	toil.Time_Off__c = etoil.timeOff__r[0].id;
           		toil.Description__c ='system Generated';
            	toil.Status__c = 'Approved';
            	toil.Number_of_Days__c = etoil.August_TOIL__c;
                toilList.add(toil);}
            }else{
                system.debug('Nothing Happened');
           
            }//else end
				insert toilList;
    	}//for loop end
        
    }
        
    
}//class end