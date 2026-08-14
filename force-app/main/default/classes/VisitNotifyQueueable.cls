public with sharing class VisitNotifyQueueable implements Queueable {
    private Set<Id> visitIds;
    public VisitNotifyQueueable(Set<Id> visitIds) { this.visitIds = visitIds; }
    public void execute(QueueableContext ctx) {
        FollowUpTaskService.create(VisitSelector.byIds(visitIds));
    }
}
