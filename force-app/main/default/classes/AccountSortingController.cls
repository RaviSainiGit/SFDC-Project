public class AccountSortingController {
    
    @AuraEnabled(Cacheable = true)
     public static list<Account> getAccountList(){
        List<Account> accList= [Select Id, Name, Phone, Industry, Rating From Account];
        if(accList != null && accList.size()>0){
            return accList;
        }
        else{return null;}
    }
    
}