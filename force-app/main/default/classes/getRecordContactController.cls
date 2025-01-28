public with sharing class getRecordContactController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {

        List<Contact> conList=[SELECT Id,FirstName, LastName, Email, Phone FROM Contact limit 10];

        return conList;

    }
}