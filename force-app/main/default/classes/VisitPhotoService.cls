public with sharing class VisitPhotoService {
    public static void attach(Id visitId, String url) {
        insert new Visit_Evidence__c(Sales_Visit__c = visitId, Evidence_Type__c = 'Photo', Url__c = url);
    }
}
