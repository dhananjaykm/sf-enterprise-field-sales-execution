public with sharing class DailyBeatScheduler implements Schedulable {
    public void execute(SchedulableContext sc) { DailyBeatService.generateToday(); }
}
