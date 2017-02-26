public class aggregateClass {
      public AggregateResult[] results {
        get {
            return [select contact__c e,SUM(Hours__c)h from time_log__c group by contact__c];
        }
    }
}