/**
 * MIGRATION: A — after-save Flow on Status = Completed.
 */
public with sharing class VisitCompletionService {
    public static void complete(List<Sales_Visit__c> visits, Map<Id, Sales_Visit__c> oldMap) {
        List<Sales_Visit__c> done = new List<Sales_Visit__c>();
        for (Sales_Visit__c v : visits) {
            Sales_Visit__c oldV = oldMap == null ? null : oldMap.get(v.Id);
            if (v.Status__c == 'Completed' && (oldV == null || oldV.Status__c != 'Completed')) done.add(v);
        }
        if (done.isEmpty()) return;
        VisitChecklistService.validate(done);
        VisitScoringService.score(done);
        CustomerScoreService.rollForward(done);
        FollowUpTaskService.create(done);
        SalesTargetRollupService.apply(done);
        List<Visit_Completed__e> events = new List<Visit_Completed__e>();
        for (Sales_Visit__c v : done) events.add(new Visit_Completed__e(Visit_Id__c = String.valueOf(v.Id), Score__c = v.Visit_Score__c));
        EventBus.publish(events);
    }
}
