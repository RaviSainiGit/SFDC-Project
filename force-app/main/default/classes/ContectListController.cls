public class ContectListController {
    
    @AuraEnabled
    public static List<Contact> fetchContact() {
        
        List<Contact> contacts = new List<Contact>();
        contacts =[SELECT Id, name, title,Department FROM Contact limit 10];
     
        return contacts;
    }

}