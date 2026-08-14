public with sharing class OnboardingTriggerHandler extends TriggerHandlerBase {
    public override void beforeUpdate(List<SObject> newList, Map<Id, SObject> oldMap) {
        OnboardingService.submit((List<Customer_Onboarding__c>) newList);
    }
}
