public with sharing class SalesVisitTriggerHandler extends TriggerHandlerBase {
    public override void beforeInsert(List<SObject> newList) {
        VisitPriorityService.prioritize((List<Sales_Visit__c>) newList);
    }
    public override void beforeUpdate(List<SObject> newList, Map<Id, SObject> oldMap) {
        GpsEvidenceService.requireGps((List<Sales_Visit__c>) newList);
        Map<Id, Sales_Visit__c> oldVisits = new Map<Id, Sales_Visit__c>();
        for (Id i : oldMap.keySet()) oldVisits.put(i, (Sales_Visit__c) oldMap.get(i));
        VisitCompletionService.complete((List<Sales_Visit__c>) newList, oldVisits);
    }
}
