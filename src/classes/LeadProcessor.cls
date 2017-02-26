Global class LeadProcessor implements database.Batchable<sObject>, Database.stateful {
    
    Global integer RecordsProcessed = 0;

    Global Database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator('SELECT id, leadSource FROM lead');
    }   
    Global void Execute(database.BatchableContext bc, List<lead> scope){
            List<lead> lupdate = new list<lead>();
            for (lead l:scope){
                l.leadsource = 'Dreamforce';
                lupdate.add(l);
                recordsProcessed = recordsProcessed + 1;
                              
            }
        update lupdate;
    }
        Global void finish(database.BatchableContext bc){
            system.debug(recordsProcessed + 'Number of records Processed');
            AsyncApexJob job = [SELECT id,status,numberOfErrors,JobItemsProcessed,TotalJobItems,createdby.email FROM AsyncApexJob WHERE id=:bc.getJobId()];
            
        } 
         
      

}