public class AccountListController {
    
    // ApexPages.StandardSetController must be instantiated
  	// for standard list controllers
       
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select name,phone from Account ORDER BY Name ASC]));
            }
            return setCon;
        }
        set;
    }

    // Initialize setCon and return a list of records
   
    public List<Account> getAccounts() {
         setCon.setpagesize(5);
         return (List<Account>) setCon.getRecords();
    }

}