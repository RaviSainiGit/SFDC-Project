public with sharing class SortLastNameContactClass {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        return [SELECT Id, FirstName, LastName, Phone, Email FROM Contact LIMIT 10];
    }
    
}