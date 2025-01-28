public class AccountContactController {
    
     @AuraEnabled
    public static List<Account> fetchAcc (){
        List<Account> accList = [SELECT Id, Name, Type, Industry, Phone FROM Account LIMIT 10];
        return accList;
    }    
    @AuraEnabled
    public static List<Contact> fetchCon (String recordId){
        List<Contact> conList = [SELECT Id, Name, Phone FROM Contact WHERE AccountId=:recordId];
        return conList;
    }

     @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name FROM Account];
    }
    @AuraEnabled
    public static List<Contact> getContacts(String accountId){
        return [Select Id,FirstName,LastName,Email,Phone from Contact where accountId=:accountId];
         
    }  

}