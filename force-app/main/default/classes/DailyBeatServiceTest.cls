@IsTest
private class DailyBeatServiceTest {

    @IsTest static void generatesVisits() {
        User u = TestDataFactory.createUser('fs1');
        Account a = TestDataFactory.createAccount('Store');
        Sales_Beat__c b = TestDataFactory.createBeat(u.Id);
        insert new Beat_Stop__c(Sales_Beat__c = b.Id, Account__c = a.Id, Sequence__c = 1);
        Test.startTest();
        Integer n = DailyBeatService.generateToday();
        Test.stopTest();
        System.assert(n >= 1);
    }

}
