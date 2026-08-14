public with sharing class AvailabilityTriggerHandler extends TriggerHandlerBase {
    public override void afterInsert(List<SObject> newList) { AvailabilityService.outOfStockFollowup((List<Product_Availability__c>) newList); }
}
