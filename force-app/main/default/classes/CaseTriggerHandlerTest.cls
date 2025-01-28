@isTest
public class CaseTriggerHandlerTest {
    @isTest
    private static void testPopulateLatestCaseNum(){
        
        List<Account> accList = new List<Account>();	
        
        List<Case> caseList = new List<Case>();
        
        For(Integer i=1; i<5; i++){
            Account acc = new Account();
            acc.Name = 'Test' + i;
            accList.add(acc);
        }
        insert accList;
        
        for(Account acc : accList){
            Case cs = new Case();
            cs.Status = 'New';
            cs.Origin = 'Phone';
            cs.AccountId = acc.Id;
            caseList.add(cs);
        }
        
        test.startTest();
        insert caseList;
        test.stopTest();
        
        List<Account> updatedAcc = [Select Id, Latest_Case_Number__c FROM Account WHERE Id =: accList[0].Id];
        
        List<Case> newCaseList = [Select Id, CaseNumber FROM Case WHERE Id =: caseList[0].Id];
        
        System.assertEquals(newCaseList[0].CaseNumber, updatedAcc[0].Latest_Case_Number__c);
        
    }

}