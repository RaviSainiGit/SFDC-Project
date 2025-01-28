public with sharing class EmployeeController {

    @AuraEnabled (cacheable=true)
    public static List<Employee__c> getEmployeeList(){
        List<Employee__c> employeeList = [Select Id, company_name__c, company_address__c, status__c, Name, mobile_no__c From Employee__c];
        return employeeList;
    }
}