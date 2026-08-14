trigger PromotionExecutionTrigger on Promotion_Execution__c (before insert) {
    for (Promotion_Execution__c p : Trigger.new) {
        if (p.Compliant__c == null) p.Compliant__c = false;
    }
}
