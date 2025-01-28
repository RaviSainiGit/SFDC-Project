public class NewCustomLoginFormController {
    
    @AuraEnabled
    public static String login(String usrName, String password,String startUrl) {
        try{
            ApexPages.PageReference lgn = site.login(usrName,password,startUrl);
            aura.redirect(lgn);
            return 'success';    
        }catch(Exception e){
            System.debug(e.getMessage());
            return e.getMessage();
        }
    }
    
}