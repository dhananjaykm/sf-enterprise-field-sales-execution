/**
 * LWC Apex controller.
 * LWC
 */
public with sharing class BeatPlannerLwcController {
    @AuraEnabled(cacheable=true)
    public static List<Map<String, Object>> loadRows(Id recordId) {
        List<Map<String, Object>> rows = new List<Map<String, Object>>();
        for (SObject rec : Database.query('SELECT Id, Name FROM Sales_Beat__c LIMIT 30')) {
            rows.add(new Map<String, Object>{
                'id' => rec.Id,
                'name' => rec.get('Name'),
                'status' => 'Open',
                'score' => 0
            });
        }
        return rows;
    }

    @AuraEnabled
    public static List<Map<String, Object>> runAction(Id recordId) {
        return loadRows(recordId);
    }
}
