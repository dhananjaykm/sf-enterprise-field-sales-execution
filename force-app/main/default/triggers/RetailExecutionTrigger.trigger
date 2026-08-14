/**
 * One-trigger-per-object dispatcher.
 * MIGRATION: evaluate handler methods independently; do not convert the trigger shell.
 */
trigger RetailExecutionTrigger on Retail_Execution__c (
    before insert, after insert, before update, after update, before delete, after delete, after undelete
) {
    new RetailExecutionTriggerHandler().run(
        Trigger.isBefore,
        Trigger.isAfter,
        Trigger.isInsert,
        Trigger.isUpdate,
        Trigger.isDelete,
        Trigger.isUndelete,
        Trigger.new,
        Trigger.oldMap
    );
}
