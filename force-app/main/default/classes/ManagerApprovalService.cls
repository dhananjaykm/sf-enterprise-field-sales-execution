/**
 * Discount > 20% OR credit exceeded OR special promo.
 * MIGRATION: A — Flow + Approval Process.
 */
public with sharing class ManagerApprovalService {
    public static void request(Decimal discount, Decimal orderAmount, Decimal creditLimit, Boolean specialPromo, Id visitId) {
        Field_Settings__c s = Field_Settings__c.getInstance();
        Decimal threshold = s != null && s.Discount_Threshold__c != null ? s.Discount_Threshold__c : 20;
        Boolean needs = (discount != null && discount > threshold) || (creditLimit != null && orderAmount != null && orderAmount > creditLimit) || specialPromo;
        if (needs) {
            insert new Manager_Approval__c(Related_Visit__c = visitId, Discount_Percent__c = discount, Status__c = 'Requested', Reason__c = 'Threshold exceeded');
        }
    }
}
