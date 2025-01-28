public class accountSearchController {

    @AuraEnabled(cacheable=true)
    public static List<sObject> getContactList(String name){
        String key = '%'+name+'%';
        String Query = 'Select Id,Name,Email,Phone from Contact Where Name LIKE :key';
        return Database.query(query);
    }

    @AuraEnabled(cacheable=true)
    public static List<sObject> getAccountList(String name){
        String key = '%'+name+'%';
        String Query = 'Select Id,Name,Industry from Account Where Name LIKE :key';
        return Database.query(query);
    }

}