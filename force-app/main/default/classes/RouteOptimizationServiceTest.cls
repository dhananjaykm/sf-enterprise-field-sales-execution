@IsTest
private class RouteOptimizationServiceTest {

    @IsTest static void optimize() {
        List<Integer> order = RouteOptimizationService.optimize(new List<Decimal>{1,2,3}, new List<Decimal>{1,2,3});
        System.assertEquals(3, order.size());
    }

}
