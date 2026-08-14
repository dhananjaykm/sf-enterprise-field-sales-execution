/**
 * MIGRATION: A — GOLD weekly / overdue order priority.
 */
public with sharing class VisitPriorityService {
    public static void prioritize(List<Sales_Visit__c> visits) {
        Set<Id> accountIds = new Set<Id>();
        for (Sales_Visit__c v : visits) if (v.Account__c != null) accountIds.add(v.Account__c);
        Map<Id, Account> accounts = new Map<Id, Account>([SELECT Id, Outlet_Segment__c FROM Account WHERE Id IN :accountIds]);
        for (Sales_Visit__c v : visits) {
            Account a = accounts.get(v.Account__c);
            if (a != null && a.Outlet_Segment__c == 'GOLD') v.Priority__c = 'High';
        }
    }
}
