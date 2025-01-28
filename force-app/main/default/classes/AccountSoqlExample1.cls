public class AccountSoqlExample1 {
    
    public List<Account> accList {get;set;}
    public Integer countRec {get;set;}
    
    public AccountSoqlExample1(){
        accList = [SELECT Id,Name, Industry, Type, Rating 
                   FROM Account  
                   WHERE Industry = 'Biotechnology' 
                   AND Type = 'Customer - Channel' 
                   AND Rating = 'Cold'];
        countRec = accList.size(); 
    }
    
}