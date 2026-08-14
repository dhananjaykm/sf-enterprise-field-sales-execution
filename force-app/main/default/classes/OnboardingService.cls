public with sharing class OnboardingService {
    public static void submit(List<Customer_Onboarding__c> rows) {
        for (Customer_Onboarding__c o : rows) {
            if (o.Status__c == 'Submitted') o.Submitted_On__c = Date.today();
        }
    }
}
