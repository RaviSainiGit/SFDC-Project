public class CreateCommunityUser {     
    public String currentRecordId {get;set;}
    public Contact con{get;set;}
    
    public CreateCommunityUser(ApexPages.StandardController controller) {
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
        con = [select id ,FirstName, LastName, Email, Phone, AccountId from Contact where id =: currentRecordId ];
    }
    
    public void saveUser(){
        
        Profile profileId = [Select Id from Profile where name = 'Customer Community User'];
        
        User objUser = new User();
        if(con.AccountId == Null){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please Enter Account Name In Contact'));
        }
        else{
            objUser.FirstName = con.FirstName;
            objUser.LastName = con.LastName;
            objUser.Email = con.Email;
            objUser.Phone = con.Phone;
            objUser.Username = 'test@gmail.com' + System.now().millisecond();
            objUser.Alias = 'sfdc';
            objUser.ContactId = con.Id;
            objUser.ProfileId = profileId.Id;
            objUser.EmailEncodingKey='UTF-8';
            objUser.LanguageLocaleKey='en_US';
            objUser.LocaleSidKey='en_US';
            objUser.TimeZoneSidKey='America/Chicago';
            insert objUser;
            ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.CONFIRM,'User Created Successfully, THANK YOU!'));
            
        }
        
    } 
    
}