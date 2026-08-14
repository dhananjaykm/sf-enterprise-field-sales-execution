public with sharing class ExpenseService {
    public static void submit(List<Expense__c> rows) {
        for (Expense__c e : rows) {
            if (e.Amount__c != null && e.Amount__c > 5000) {
                insert new Manager_Approval__c(Expense__c = e.Id, Status__c = 'Requested', Reason__c = 'High expense');
            }
        }
    }
}
