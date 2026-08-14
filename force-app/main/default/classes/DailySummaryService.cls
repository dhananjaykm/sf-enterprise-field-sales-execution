public with sharing class DailySummaryService {
    public static void rollup(Date d) {
        ApplicationLogger.info('DailySummaryService', String.valueOf(d));
    }
}
