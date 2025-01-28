public class TotalOpportunitiesHandler {
    
    public static void countOpportunities (List<Opportunity> newList, List<Opportunity> oldList){
        
        Set<id> accountIds = new Set<id>();
        
        if(newList!=null){
            for(Opportunity opp:newList){
                if(opp.accountId!=null){
                    accountIds.add(opp.accountId);
                }
            }  
        }
        
        if(oldList!=null){
            for(Opportunity opp:oldList){
                if(opp.accountId!=null){
                    accountIds.add(opp.accountId);
                }
            }  
        }
        
        List<Account> accounts = [SELECT Id,Total_Opportunities__c,(SELECT Id, Active__c from Opportunities where Active__c = true) from Account where Id in :accountIds];
        if(!accounts.isEmpty())
        {
            for(Account acc:accounts){
                acc.Total_Opportunities__c = acc.Opportunities.size();
            }
        }
        update accounts;
    }
    
}