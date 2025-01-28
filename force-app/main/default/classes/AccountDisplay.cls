public class AccountDisplay {
    
    public List<Account> accountLists{get; set;}
    
    public AccountDisplay(){
        
        accountLists =[SELECT Id, Name, Type FROM Account limit 15];
        
    }

}