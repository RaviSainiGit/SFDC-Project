public with sharing class EmployeePaginationClass {

    @AuraEnabled(cacheable=true)
    public static List<Employee__c> getEmployeeList(string empStrName){
        string searchName = '%' + empStrName + '%';
        return [select Id, Name, Email__c, mobile_no__c, status__c from Employee__c where Name LIKE:searchName];
    }
    
    }