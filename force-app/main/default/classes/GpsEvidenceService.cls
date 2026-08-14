public with sharing class GpsEvidenceService {
    public static void requireGps(List<Sales_Visit__c> visits) {
        Field_Settings__c s = Field_Settings__c.getInstance();
        if (s != null && s.Gps_Required__c == false) return;
        for (Sales_Visit__c v : visits) {
            if (v.Status__c == 'Completed' && (v.Latitude__c == null || v.Longitude__c == null)) {
                v.addError('GPS evidence required to complete visit');
            }
        }
    }
}
