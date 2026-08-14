public with sharing class CustomerScoreService {
    public static void rollForward(List<Sales_Visit__c> visits) {
        List<Account> accounts = new List<Account>();
        for (Sales_Visit__c v : visits) {
            if (v.Account__c == null) continue;
            accounts.add(new Account(Id = v.Account__c, Visit_Score__c = v.Visit_Score__c));
        }
        if (!accounts.isEmpty()) update accounts;
    }
}
