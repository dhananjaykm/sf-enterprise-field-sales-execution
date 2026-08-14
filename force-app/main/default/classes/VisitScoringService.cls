/**
 * Simple average — Flow formula candidate.
 * MIGRATION: A
 */
public with sharing class VisitScoringService {
    public static void score(List<Sales_Visit__c> visits) {
        for (Sales_Visit__c v : visits) {
            Decimal gps = (v.Latitude__c != null && v.Longitude__c != null) ? 40 : 10;
            v.Visit_Score__c = gps + 40;
        }
    }
}
