@IsTest
private class InvocableFieldTest {

    @IsTest static void generatePlan() {
        Test.startTest();
        List<Integer> n = GenerateVisitPlanInvocable.generate();
        Test.stopTest();
        System.assertEquals(1, n.size());
    }

}
