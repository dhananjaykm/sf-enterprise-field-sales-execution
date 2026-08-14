public with sharing class BeatConflictService {
    public static Boolean overlaps(Id repId, Date d) {
        return [SELECT COUNT() FROM Sales_Visit__c WHERE Visit_Date__c = :d AND Sales_Beat__r.Rep__c = :repId] > 40;
    }
}
