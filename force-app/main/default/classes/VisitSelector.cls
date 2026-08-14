public with sharing class VisitSelector {
    public static List<Sales_Visit__c> byIds(Set<Id> ids) {
        return [SELECT Id, Status__c, Account__c, Visit_Date__c, Visit_Score__c, Priority__c FROM Sales_Visit__c WHERE Id IN :ids];
    }
}
