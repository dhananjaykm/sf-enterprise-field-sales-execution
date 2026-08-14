/**
 * Morning visit generation.
 * MIGRATION: A — Scheduled-triggered Flow vs this Schedulable.
 */
public with sharing class DailyBeatService {
    public static Integer generateToday() {
        String dow = Datetime.now().format('EEEE');
        List<Sales_Beat__c> beats = BeatSelector.activeForDay(dow);
        List<Sales_Visit__c> visits = new List<Sales_Visit__c>();
        for (Sales_Beat__c b : beats) {
            for (Beat_Stop__c stop : b.Stops__r) {
                visits.add(new Sales_Visit__c(
                    Sales_Beat__c = b.Id,
                    Beat_Stop__c = stop.Id,
                    Account__c = stop.Account__c,
                    Visit_Date__c = Date.today(),
                    Status__c = 'Planned',
                    Priority__c = 'Medium'
                ));
            }
        }
        if (!visits.isEmpty()) insert visits;
        notifyReps(beats);
        return visits.size();
    }
    private static void notifyReps(List<Sales_Beat__c> beats) {
        List<Task> tasks = new List<Task>();
        for (Sales_Beat__c b : beats) {
            if (b.Rep__c == null) continue;
            tasks.add(new Task(Subject = 'Today beat is ready', OwnerId = b.Rep__c, Status = 'Not Started', ActivityDate = Date.today()));
        }
        if (!tasks.isEmpty()) insert tasks;
    }
}
