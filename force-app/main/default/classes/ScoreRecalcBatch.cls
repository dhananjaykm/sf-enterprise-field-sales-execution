public with sharing class ScoreRecalcBatch implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, Visit_Score__c, Latitude__c, Longitude__c, Status__c FROM Sales_Visit__c WHERE Status__c = 'Completed']);
    }
    public void execute(Database.BatchableContext bc, List<Sales_Visit__c> scope) {
        VisitScoringService.score(scope);
        update scope;
    }
    public void finish(Database.BatchableContext bc) {}
}
