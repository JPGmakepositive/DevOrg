public class GroupingExampleController2 {
	
    
void loadData() {
   AggregateResult[] groupedResults = [SELECT employee__c,flexitime__c, SUM(Hours__c)totalhours
                                    FROM Time_log__c
                                    GROUP BY flexitime__c,Employee__c
                                    ];

 
}
}