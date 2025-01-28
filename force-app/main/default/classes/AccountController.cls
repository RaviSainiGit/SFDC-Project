public class AccountController {
    
    public Account acc{get;set;}
    
    public AccountController(ApexPages.StandardController stdController){
        this.acc = (Account)stdController.getRecord();
    }
    public pageReference createNewAccount(){
        Contact con = new Contact();
        con.Lastname = acc.Name;
        insert con;
        PageReference conPage = new ApexPages.StandardController(con).view();
        conPage.setRedirect(true);
        return conPage;
    }

}