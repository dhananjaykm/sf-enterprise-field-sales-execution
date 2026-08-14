public with sharing class FollowUpTaskService {
    public static void create(List<Sales_Visit__c> visits) {
        List<Task> tasks = new List<Task>();
        for (Sales_Visit__c v : visits) {
            tasks.add(new Task(Subject = 'Post-visit follow-up', WhatId = v.Id, ActivityDate = Date.today().addDays(2), Status = 'Not Started'));
        }
        insert tasks;
    }
}
