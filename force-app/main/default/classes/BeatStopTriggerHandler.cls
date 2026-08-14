public with sharing class BeatStopTriggerHandler extends TriggerHandlerBase {
    public override void beforeInsert(List<SObject> newList) {
        for (Beat_Stop__c s : (List<Beat_Stop__c>) newList) if (s.Sequence__c == null) s.Sequence__c = 99;
    }
}
