public class FirstClass {
    
    // Class level Variables
    public String myName;
    public String myAddress;
    private Boolean isFlag;
    public Date todayDate;
    DateTime todayDateTime;
    
    //Default Constructor
    public FirstClass(){
        
        myName = 'Ravi';
        myAddress = 'Greater Noida';
        isFlag = true;
        todayDate = System.today();
        todayDateTime = System.now();
        
        System.debug(':: myName :: '+myName);
        System.debug(':: myAddress :: '+myAddress);
        System.debug(':: isFlag :: '+isFlag);
        System.debug(':: todayDate :: '+todayDate);
        System.debug(':: todayDateTime :: '+todayDateTime);
        
    }
    
    public void displayResults(){    //non-static method
        	
        System.debug('Hey, I am in displayResults funtion......');
        
    }
    
    public static void showDetails(){    //static method
        
        System.debug('Hey, I am in static funtion showDetails......');
        
    }
    
    
    //public static void myMethod(){
        
        // List<List<sObject>> l1 = [Find 'Volkswagen'];
        // The above statement will give an error
        // SOSL in Apex needs to have the entities/objects specified
         
       // List<List<sObject>> l1 = [Find 'Volkswagen' Returning Account, Contact];
        
        // Return specified fields
       // List<List<sObject>> l2 = [Find 'John' Returning Account(Name, NumberOfEmployees), Contact(Name, Phone)];
        
        // How to access records in Apex returned by SOSL
        
       // List<Account> accList = l1[0];
        
      //  List<Contact> conList = l2[1];
        
        //for(Account a: accList){
          //  system.debug(a.Name);
            //system.debug(a.NumberOfEmployees);
        //}
        
        //for(Contact c: conList){
          //  system.debug(c.Name);
            //system.debug(c.Phone);
        //}
          
    //}
    
}