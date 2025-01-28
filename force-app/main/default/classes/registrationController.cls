public class registrationController {
    
    @AuraEnabled()
    public static Contact submitRegistration(String firstName, String lastName, String phone, String email, Date dateOfBirth, String address, String password, String confirmPassword, String userName){
        
        Contact con = new Contact();
        con.FirstName = firstName;
        con.LastName = lastName;
        con.Phone = phone;
        con.Email = email;
        con.Birthdate = dateOfBirth;
        con.User_Name__c = userName;
        con.Address__c = address;
        con.Password__c = password;
        con.Confirm_Password__c = confirmPassword;
        Insert con;
        //system.debug('con ::'+con);
       	return con;
        
    }
    
}