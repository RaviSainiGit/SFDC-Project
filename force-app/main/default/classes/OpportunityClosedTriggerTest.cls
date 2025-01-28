@isTest
private class OpportunityClosedTriggerTest {
    
    @testSetup
    static void dataSetup(){
        
        Account acc = new Account(Name='testName');
        insert acc;
        
        opportunity opp = new opportunity(Name='testName', AccountId=acc.Id, StageName='Prospecting', CloseDate=System.today());
        insert opp;
        
        Profile standUserProfile = [Select Id From Profile Where Name = 'Standard User'];
        
        User standardUser = new User(Alias = 'standt', Email='test@gmail.com', 
                                     EmailEncodingKey='UTF-8', LastName='testLastName', LanguageLocaleKey='en_US', 
                                     LocaleSidKey='en_US', ProfileId = standUserProfile.Id, 
                                     TimeZoneSidKey='America/Los_Angeles', UserName='testUser@gmail.com' + System.now().millisecond());
        System.runAs(standardUser){
            opportunity opp1 = new opportunity(Name='testName1', AccountId=acc.Id, StageName='Prospecting', CloseDate=System.today());
        insert opp1;
        }
        
    }
    
}