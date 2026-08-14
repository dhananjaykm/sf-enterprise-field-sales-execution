@IsTest
private class RetailAuditServiceTest {

    @IsTest static void lowScoreTask() {
        User u = TestDataFactory.createUser('fs3');
        Account a = TestDataFactory.createAccount('Store3');
        Sales_Beat__c b = TestDataFactory.createBeat(u.Id);
        Sales_Visit__c v = TestDataFactory.createVisit(b.Id, a.Id);
        Test.startTest();
        Retail_Execution__c r = new Retail_Execution__c(Sales_Visit__c = v.Id, Audit_Score__c = 40);
        insert r;
        Test.stopTest();
        System.assertEquals(1, [SELECT COUNT() FROM Task WHERE WhatId = :r.Id]);
    }

}
