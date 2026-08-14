public with sharing class OfflineDrainBatch implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, Status__c FROM Offline_Sync_Queue__c WHERE Status__c = 'Pending']);
    }
    public void execute(Database.BatchableContext bc, List<Offline_Sync_Queue__c> scope) {
        for (Offline_Sync_Queue__c r : scope) r.Status__c = 'Synced';
        update scope;
    }
    public void finish(Database.BatchableContext bc) {}
}
