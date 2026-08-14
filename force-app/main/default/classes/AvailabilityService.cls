public with sharing class AvailabilityService {
    public static void outOfStockFollowup(List<Product_Availability__c> rows) {
        List<Task> tasks = new List<Task>();
        for (Product_Availability__c p : rows) {
            if (!p.In_Stock__c) {
                tasks.add(new Task(Subject = 'OOS follow-up', WhatId = p.Id, ActivityDate = Date.today().addDays(2), Status = 'Not Started'));
            }
        }
        if (!tasks.isEmpty()) insert tasks;
    }
}
