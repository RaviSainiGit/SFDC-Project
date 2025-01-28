public class CreateAccountController {
    
    Account acc = new Account();
    Contact con = new Contact();
    Opportunity opp = new Opportunity();
    
    public Account getacc(){
        return acc;
    }
    public Contact getcon(){
        return con;
    }
    public Opportunity getopp(){
        return opp;
    }
    
    public PageReference accPage(){
        return Page.CreateAccount;
    }
    
    public PageReference conPage(){
        return Page.CreateContact;
    }
    
     public PageReference oppPage(){
        return Page.CreateOpportunity;
    }
    
     public PageReference revPage(){
        return Page.ReviewAll;
    }
    
    public PageReference saveAll(){
        insert acc;
        con.AccountID = acc.ID;
        insert con;
        opp.AccountID = acc.ID;
        insert opp;
        return null;
    }

}