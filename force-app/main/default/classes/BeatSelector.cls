public with sharing class BeatSelector {
    public static List<Sales_Beat__c> activeForDay(String dow) {
        return [SELECT Id, Rep__c, Day_of_Week__c, (SELECT Id, Account__c, Sequence__c FROM Stops__r)
                FROM Sales_Beat__c WHERE Is_Active__c = true AND Day_of_Week__c = :dow];
    }
}
