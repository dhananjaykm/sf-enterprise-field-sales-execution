public with sharing class RetailExecutionTriggerHandler extends TriggerHandlerBase {
    public override void afterInsert(List<SObject> newList) { RetailAuditService.onScore((List<Retail_Execution__c>) newList); }
    public override void afterUpdate(List<SObject> newList, Map<Id, SObject> oldMap) { RetailAuditService.onScore((List<Retail_Execution__c>) newList); }
}
