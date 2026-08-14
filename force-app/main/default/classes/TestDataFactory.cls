/**
 * Shared test data factory. Tests must not use SeeAllData=true.
 */
@IsTest
public class TestDataFactory {
    public static User createUser(String alias) {
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
        String unique = alias + String.valueOf(Crypto.getRandomInteger());
        User u = new User(
            Alias = alias.left(8),
            Email = unique + '@example.invalid',
            EmailEncodingKey = 'UTF-8',
            LastName = alias,
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            TimeZoneSidKey = 'America/Los_Angeles',
            ProfileId = p.Id,
            UserName = unique + '@example.invalid'
        );
        insert u;
        return u;
    }

    public static Account createAccount(String name) {
        Account a = new Account(Name = name);
        insert a;
        return a;
    }


    public static Sales_Beat__c createBeat(Id userId) {
        Sales_Beat__c b = new Sales_Beat__c(Rep__c = userId, Day_of_Week__c = Datetime.now().format('EEEE'), Is_Active__c = true);
        insert b; return b;
    }
    public static Sales_Visit__c createVisit(Id beatId, Id accountId) {
        Sales_Visit__c v = new Sales_Visit__c(Sales_Beat__c = beatId, Account__c = accountId, Visit_Date__c = Date.today(), Status__c = 'Planned', Latitude__c = 13.08, Longitude__c = 80.27);
        insert v; return v;
    }

}
