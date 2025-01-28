public class loginController {
    
    @AuraEnabled(cacheable=true)
    public static Contact loginPage(String userName, String password){
        
        List<Contact> conList = new List<Contact>();
        
        conList = [Select Id, User_Name__c, Password__c From Contact Where User_Name__c = :userName AND Password__c =:password];

        //system.debug('conList ::'+conList);
        if (conList.size() > 0) {
            return conList[0];
        } else {
            throw new AuraHandledException('Invalid username or password. Please try again or register if you haven\'t already.');
        }
        
       	//return conList[0];
        
    }

}