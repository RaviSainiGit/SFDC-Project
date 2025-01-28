public with sharing class lwcAccountSortingController {

    @AuraEnabled(Cacheable = true)
    public static List<Account> sortAccountList(String searchKey){
        String strKey = '%' + searchKey + '%';
        List<Account> accListObj= [SELECT Id, Name, Phone, Industry, Rating FROM Account WHERE Name LIKE: strKey limit 20 ];
        return accListObj;
    }


}