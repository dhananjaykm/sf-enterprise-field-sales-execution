@IsTest
private class VisitCompletionServiceTest {

    @IsTest static void completes() {
        User u = TestDataFactory.createUser('fs2');
        Account a = TestDataFactory.createAccount('Store2');
        Sales_Beat__c b = TestDataFactory.createBeat(u.Id);
        Sales_Visit__c v = TestDataFactory.createVisit(b.Id, a.Id);
        Test.startTest();
        v.Status__c = 'Completed';
        update v;
        Test.stopTest();
        System.assertEquals(1, [SELECT COUNT() FROM Task WHERE WhatId = :v.Id]);
    }

}
