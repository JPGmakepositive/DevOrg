Global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext ctx) {
      //CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
               // FROM CronTrigger WHERE Id = :ctx.getTriggerId()];
               // 
    List<lead> leads = [select id from lead where leadsource = null limit 200];
    List<lead>leadsUpdate =  new list<lead>();
        for(lead l: leads){
            l.leadsource = 'Dreamforce';
            leadsupdate.add(l);
        }
        update leadsupdate;
    }
      

}