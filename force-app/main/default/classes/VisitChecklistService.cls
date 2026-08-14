public with sharing class VisitChecklistService {
    public static void validate(List<Sales_Visit__c> visits) {
        Set<Id> ids = new Map<Id, Sales_Visit__c>(visits).keySet();
        List<Visit_Checklist__c> items = [SELECT Id, Sales_Visit__c, Completed__c, Required__c FROM Visit_Checklist__c WHERE Sales_Visit__c IN :ids];
        Map<Id, Integer> missing = new Map<Id, Integer>();
        for (Visit_Checklist__c i : items) {
            if (i.Required__c && !i.Completed__c) {
                missing.put(i.Sales_Visit__c, (missing.containsKey(i.Sales_Visit__c) ? missing.get(i.Sales_Visit__c) : 0) + 1);
            }
        }
        for (Sales_Visit__c v : visits) {
            if (missing.containsKey(v.Id) && missing.get(v.Id) > 0) {
                v.addError('Required checklist items are incomplete');
            }
        }
    }
}
