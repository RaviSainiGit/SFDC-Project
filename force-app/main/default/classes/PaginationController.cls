public with sharing class PaginationController {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        return [select Id, Name, Type, BillingCountry From Account limit 100];

    }
}