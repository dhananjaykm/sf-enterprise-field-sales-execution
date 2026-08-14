public with sharing class SyncRetryQueueable implements Queueable {
    public void execute(QueueableContext ctx) { OfflineSyncService.drain(); }
}
