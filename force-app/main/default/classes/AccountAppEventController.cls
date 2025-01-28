//LastModefiedDate : 28/01/2025   05:28PM
public class AccountAppEventController {
    
    @AuraEnabled
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Type, Rating, Industry FROM Account];
    }
    
    @AuraEnabled
    public static List<Contact> getContacts (String recordId){
        return [SELECT Id, Name, Phone FROM Contact WHERE AccountId=:recordId];
    }

}