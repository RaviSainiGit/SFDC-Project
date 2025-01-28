public class DemoAccountclass {
    Public Account acc{get;set;}
    Public Contact con{get;set;}
    Public list<Account> acclist{get;set;}
    
    public DemoAccountclass(ApexPages.StandardController controller){
        acc = new Account();
        con = new Contact();
        acclist = [Select Name,Industry,Phone from Account];
    }
    
    public void savenew(){
        System.debug('acc'+con);
        try{
            insert acc;
            con.AccountId = acc.Id;
            insert con;
            
        }catch( Exception e){
            
        }
        
    }
}