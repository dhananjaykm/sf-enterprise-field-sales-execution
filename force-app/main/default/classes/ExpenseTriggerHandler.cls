public with sharing class ExpenseTriggerHandler extends TriggerHandlerBase {
    public override void afterUpdate(List<SObject> newList, Map<Id, SObject> oldMap) {
        List<Expense__c> submitted = new List<Expense__c>();
        for (Expense__c e : (List<Expense__c>) newList) {
            Expense__c oldE = (Expense__c) oldMap.get(e.Id);
            if (oldE.Status__c != 'Submitted' && e.Status__c == 'Submitted') submitted.add(e);
        }
        if (!submitted.isEmpty()) ExpenseService.submit(submitted);
    }
}
