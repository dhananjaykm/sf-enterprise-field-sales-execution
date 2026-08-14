public with sharing class CollectionOverdueScheduler implements Schedulable {
    public void execute(SchedulableContext sc) { CollectionOverdueService.escalate(); }
}
