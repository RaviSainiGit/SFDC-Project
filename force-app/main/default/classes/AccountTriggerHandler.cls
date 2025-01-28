public class AccountTriggerHandler {
    
    public static void updatePhoneDescription(List<Account> newList, Map<Id,Account> oldMap){
        for(Account acc : newList){
            if(oldMap!=null && acc.Phone != oldMap.get(acc.Id).Phone){
                acc.Description = 'Phone is modified on Account';
            }
        }
    }
    
    public static void updateRelatedOppPhone(List<Account> newList, Map<Id,Account> oldMap){
        Map<Id,Account> accIdToAccountMap = new Map<Id,Account>();
        List<Opportunity> oppToBeUpdated = new List<Opportunity>();
        
        for(Account acc : newList){
            if(oldMap!=null && acc.Phone != oldMap.get(acc.Id).Phone){
                accIdToAccountMap.put(acc.id, acc);
            }
        }
        
        for(Opportunity opp : [SELECT Id, Account_Phone__c, AccountId FROM Opportunity WHERE AccountId IN :accIdToAccountMap.keySet()]){
            
            Opportunity oppor = new Opportunity();
            if(accIdToAccountMap.containsKey(opp.AccountId)){
                oppor.id = opp.id;
                oppor.Account_Phone__c = accIdToAccountMap.get(opp.AccountId).Phone;
                oppToBeUpdated.add(oppor);
            }
        }
        if(!oppToBeUpdated.isEmpty()){
            update oppToBeUpdated;
            
        }
        
    }
    
    public static void duplicateAccounts(List<Account> accList) {
        
        Set<String> accountNames = new Set<String>();
        for (Account acc : accList) {
            if (acc.Name != null) {
                accountNames.add(acc.Name);
            } 
        }
        Set<String> existingAccountNames = new Set<String>();
        if(accountNames.size() >0 ){
            List<Account> existingAccList = [SELECT Name 
                                             FROM Account 
                                             WHERE Name IN : accountNames];
            for (Account acc : existingAccList) {
                existingAccountNames.add(acc.Name);
            } 
        }
        for (Account acc : accList) {
            if (existingAccountNames.contains(acc.Name)) {
                acc.addError('Duplicate account found. Please enter a unique name');
            } 
        }
        
    }
    
}