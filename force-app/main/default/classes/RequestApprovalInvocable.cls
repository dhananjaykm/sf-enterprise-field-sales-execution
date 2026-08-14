public with sharing class RequestApprovalInvocable {
    public class Request { @InvocableVariable public Id visitId; @InvocableVariable public Decimal discount; @InvocableVariable public Decimal amount; @InvocableVariable public Decimal credit; @InvocableVariable public Boolean promo; }
    @InvocableMethod(label='Request Manager Approval')
    public static void request(List<Request> reqs) {
        for (Request r : reqs) ManagerApprovalService.request(r.discount, r.amount, r.credit, r.promo, r.visitId);
    }
}
