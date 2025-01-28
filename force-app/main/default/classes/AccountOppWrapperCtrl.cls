public class AccountOppWrapperCtrl {
    
    public List<Account> accList {get;set;}
    
    public AccountOppWrapperCtrl(){
        accList = [SELECT Id,Name, Industry, Type, Rating 
                   FROM Account];
      
    }
    
    public class wrapperClass{
        public Integer isCount {get;set;}
        public Account objAcc {get;set;}
        public Boolean isSelected {get;set;}
        
        public wrapperClass(){
            isCount = 1;
            objAcc = new Account();
            isSelected = false;
        }
        
    }

}