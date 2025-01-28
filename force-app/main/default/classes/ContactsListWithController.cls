public class ContactsListWithController {
    
    public String searchKeys {get; set;}
    
    public list<Contact> contactLists{get; set;}
    
    public void search(){
        
        String searchKeys = '%'+searchKeys+'%';
        
        contactLists = [SELECT Id, FirstName, LastName, Title, Email FROM Contact Where FirstName like:searchKeys];
        
    }
    
}