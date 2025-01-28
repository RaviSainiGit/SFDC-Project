public with sharing class AccountWireHelper {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [select Id, Name, Type, Rating, Phone from account limit 5];

    }
}