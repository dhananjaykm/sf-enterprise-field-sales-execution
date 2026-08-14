/**
 * MIGRATION: A — audit score < 70% creates corrective task.
 */
public with sharing class RetailAuditService {
    public static void onScore(List<Retail_Execution__c> rows) {
        List<Task> tasks = new List<Task>();
        for (Retail_Execution__c r : rows) {
            if (r.Audit_Score__c != null && r.Audit_Score__c < 70) {
                tasks.add(new Task(Subject = 'Corrective retail action', WhatId = r.Id, Status = 'Not Started', ActivityDate = Date.today().addDays(3)));
            }
        }
        if (!tasks.isEmpty()) insert tasks;
    }
}
