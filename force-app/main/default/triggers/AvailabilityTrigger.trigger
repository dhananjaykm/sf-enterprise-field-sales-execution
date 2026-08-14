/**
 * One-trigger-per-object dispatcher.
 * MIGRATION: evaluate handler methods independently; do not convert the trigger shell.
 */
trigger AvailabilityTrigger on Product_Availability__c (
    before insert, after insert, before update, after update, before delete, after delete, after undelete
) {
    new AvailabilityTriggerHandler().run(
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
