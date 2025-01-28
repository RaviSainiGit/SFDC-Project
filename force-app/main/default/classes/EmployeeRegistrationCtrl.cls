public class EmployeeRegistrationCtrl {
    
    public String firstName {get;set;}
    public String lastName {get;set;}
    public String city {get;set;}
    public String address {get;set;}
    public String pancard {get;set;}
    public String phone {get;set;}
    public List<String> skills {get;set;}
    public List<String> multiTechnology {get;set;}
    public String gender {get;set;}
    public String permanentAddress {get;set;}
    public Boolean isDisplay {get;set;}
    
    public EmployeeRegistrationCtrl(){
        multiTechnology = new List<String>();
        skills = new List<String>();
        isDisplay = false;
        
    }
    
    public void saveMethod(){
        System.debug('first Name '+firstName);
        System.debug('last Name '+lastName);
        System.debug('city '+city);
        System.debug('address '+address);
        System.debug('pancard '+pancard);
        System.debug('phone '+phone);
        System.debug('skills '+skills);
        System.debug('multi Technology '+multiTechnology);
        System.debug('gender '+gender);
        System.debug('permanent Address '+permanentAddress);
        isDisplay = true;
        
    }
    
    public void cancelMethod(){
        firstName = null;
    }

}