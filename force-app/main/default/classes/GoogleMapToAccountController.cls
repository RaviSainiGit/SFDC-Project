public with sharing class GoogleMapToAccountController {
    
    @AuraEnabled (cacheable=true)
    public static List<Account> fetchAccounts(){
        return [SELECT Id, Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry 
                FROM Account LIMIT 10];       
    }
    
}