public with sharing class CalculateVisitScoreInvocable {
    public class Request { @InvocableVariable public Id visitId; }
    public class Response { @InvocableVariable public Decimal score; }
    @InvocableMethod(label='Calculate Visit Score')
    public static List<Response> calculate(List<Request> reqs) {
        Set<Id> ids = new Set<Id>();
        for (Request r : reqs) ids.add(r.visitId);
        List<Sales_Visit__c> visits = VisitSelector.byIds(ids);
        VisitScoringService.score(visits);
        update visits;
        List<Response> out = new List<Response>();
        for (Sales_Visit__c v : visits) { Response x = new Response(); x.score = v.Visit_Score__c; out.add(x); }
        return out;
    }
}
