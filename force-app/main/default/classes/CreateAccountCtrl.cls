public class CreateAccountCtrl {
    
    @AuraEnabled
    public static String createAcc(String accName, String accPhone, String accWebsite){
        Account acc = new Account();
        acc.Name = accName;
        acc.Phone = accPhone;	
        acc.Website = accWebsite;
        insert acc;
        //system.debug('jhjgh'+accName);

        return acc.Id;
        
    }

}