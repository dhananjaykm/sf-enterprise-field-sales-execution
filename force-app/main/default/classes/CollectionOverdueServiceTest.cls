@IsTest
private class CollectionOverdueServiceTest {

    @IsTest static void overdue() {
        Account a = TestDataFactory.createAccount('AR');
        insert new Collection__c(Account__c = a.Id, Amount_Due__c = 100, Due_Date__c = Date.today().addDays(-1), Status__c = 'Open');
        Test.startTest();
        Integer n = CollectionOverdueService.escalate();
        Test.stopTest();
        System.assert(n >= 1);
    }

}
