public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String postalCode){
        List<Contact> contactsFound = [Select 
                                       Id, 
                                       Name 
                                       from Contact 
                                       Where 
                                       LastName =:lastName and 
                                       MailingPostalCode=:postalCode];
        return contactsFound;
    }

}