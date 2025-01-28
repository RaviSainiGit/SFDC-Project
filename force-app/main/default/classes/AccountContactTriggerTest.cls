@isTest
private class AccountContactTriggerTest {
    @testSetup
    static void testData(){
        
        Profile standardProfile = [Select Id, Name From Profile Where Name='Standard User'];
        
        User standardUser = new User(Alias = 'standt', Email='test@gmail.com', EmailEncodingKey='UTF-8', LastName='testLastName',
                                     LanguageLocaleKey='en_US', LocaleSidKey='en_US', ProfileId = standardProfile.Id,
                                     TimeZoneSidKey='America/Los_Angeles', UserName='testUser@gmail.com' + System.now().millisecond());
        
        System.runAs(standardUser){
            Account acc = new Account(Name='TestAccount');
            insert acc;
            
            Contact con = new Contact(LastName='TestContact', AccountId=acc.Id);
            insert con;
        }
    }
    
    @isTest
    static void accountContactTriggerTest_positive(){
        
        Account acc = [Select Id, OwnerId From Account Where Name = 'TestAccount' limit 1];
        Contact con = [Select Id, OwnerId From Contact Where Name = 'TestContact' limit 1];
        
        System.assertNotEquals(System.UserInfo.getUserId(), acc.OwnerId, 'Same');
        System.assertNotEquals(System.UserInfo.getUserId(), con.OwnerId, 'Same');
        
        Test.startTest();
        acc.OwnerId = System.UserInfo.getUserId();
        update acc;
        Test.stopTest();
    }
    
    
}