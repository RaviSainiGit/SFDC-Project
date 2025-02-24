public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads (String searchText){
        List<List<sObject>> searchList = [FIND :searchText IN ALL FIELDS 
                                          RETURNING 
                                          Contact(FirstName,LastName),
                                          Lead(FirstName,LastName)];
        
        Contact[] searchContacts = (Contact[])searchList[0];
        Lead[] searchLeads = (Lead[])searchList[1];
        
        System.debug('Found the following Contacts.');
        for (Contact c : searchContacts) {
            System.debug(c.LastName + ', ' + c.FirstName);
        }
        System.debug('Found the following Leads.');
        for (Lead l : searchLeads) {
            System.debug(l.LastName + ', ' + l.FirstName);
        }
        return searchList;
    }
    
}