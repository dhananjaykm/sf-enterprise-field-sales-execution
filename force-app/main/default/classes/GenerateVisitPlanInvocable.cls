public with sharing class GenerateVisitPlanInvocable {
    @InvocableMethod(label='Generate Visit Plan')
    public static List<Integer> generate() {
        return new List<Integer>{ DailyBeatService.generateToday() };
    }
}
