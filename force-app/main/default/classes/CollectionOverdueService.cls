/**
 * MIGRATION: A — scheduled path / scheduled Flow.
 */
public with sharing class CollectionOverdueService {
    public static Integer escalate() {
        List<Collection__c> rows = [SELECT Id, Status__c, Risk_Score__c, Account__c FROM Collection__c WHERE Due_Date__c < :Date.today() AND Status__c != 'Collected' LIMIT 200];
        List<Task> tasks = new List<Task>();
        for (Collection__c c : rows) {
            c.Status__c = 'Overdue';
            c.Risk_Score__c = (c.Risk_Score__c == null ? 0 : c.Risk_Score__c) + 10;
            tasks.add(new Task(Subject = 'Overdue collection', WhatId = c.Id, Status = 'Not Started', Priority = 'High', ActivityDate = Date.today()));
        }
        if (!rows.isEmpty()) update rows;
        if (!tasks.isEmpty()) insert tasks;
        return rows.size();
    }
}
