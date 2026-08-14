/**
 * MIGRATION: G — offline mobile sync is not a server Flow.
 */
public with sharing class OfflineSyncService {
    public static void enqueue(String payload, Id userId) {
        insert new Offline_Sync_Queue__c(Payload__c = payload, Status__c = 'Pending', Rep__c = userId);
    }
    public static void drain() {
        List<Offline_Sync_Queue__c> rows = [SELECT Id, Status__c FROM Offline_Sync_Queue__c WHERE Status__c = 'Pending' LIMIT 200];
        for (Offline_Sync_Queue__c r : rows) r.Status__c = 'Synced';
        if (!rows.isEmpty()) update rows;
    }
}
