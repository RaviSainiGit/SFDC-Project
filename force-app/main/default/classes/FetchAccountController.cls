public class FetchAccountController {
    
    @auraEnabled
     public static List<Account> findAll() {
         List<Account> listOfAccounts = [SELECT id, name FROM Account];
         return listOfAccounts;
     }


}