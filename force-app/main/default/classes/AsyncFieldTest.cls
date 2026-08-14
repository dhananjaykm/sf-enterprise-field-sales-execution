@IsTest
private class AsyncFieldTest {

    @IsTest static void schedulers() {
        Test.startTest();
        System.schedule('daily-beat', '0 0 6 * * ?', new DailyBeatScheduler());
        System.schedule('col-od', '0 0 7 * * ?', new CollectionOverdueScheduler());
        Database.executeBatch(new OfflineDrainBatch(), 50);
        Test.stopTest();
        System.assertEquals(2, [SELECT COUNT() FROM CronTrigger WHERE CronJobDetail.Name IN ('daily-beat','col-od')]);
    }

}
