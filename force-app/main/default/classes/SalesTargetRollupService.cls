public with sharing class SalesTargetRollupService {
    public static void apply(List<Sales_Visit__c> visits) {
        ApplicationLogger.info('SalesTargetRollupService', 'visits=' + visits.size());
    }
}
