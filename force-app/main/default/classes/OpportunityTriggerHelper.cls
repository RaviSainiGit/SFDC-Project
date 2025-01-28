public class OpportunityTriggerHelper {
    
    public static void beforeInsertMethod(List<Opportunity> oppList){
        
        for(Opportunity opp:oppList){
            opp.stageName = 'Prospecting' ;
            opp.CloseDate = system.today() + 15;
            opp.Type = 'New Customer';
        } 
    }
    
    public static void beforeDeleteMethod(List<Opportunity> deletedOppList){
        for (Opportunity opp : deletedOppList) {
            if (opp.StageName == 'Closed Won' && opp.Amount > 100000) {
                 opp.addError('You cannot delete a Closed Won Opportunity with an amount greater than 100000.');
            } 
        }
        
    }
    
    public static void beforeUpdateMethod(List<Opportunity> updatedOppList, Map<Id, Opportunity> oldOppMap){
        List<Opportunity> opportunitiesWithErrors = new List<Opportunity>();

        for (Opportunity newOppo : updatedOppList) {
            Opportunity oldOpportunity = oldOppMap.get(newOppo.Id);
            if (newOppo.CloseDate != oldOpportunity.CloseDate) {
                opportunitiesWithErrors.add(newOppo);
            }
            if (newOppo.StageName != oldOpportunity.StageName) {
                newOppo.Description = 'Stage changed from ' 
                    + oldOpportunity.StageName 
                    + ' to ' + newOppo.StageName 
                    + ' by ' + UserInfo.getName();
            }
        }

        if (!opportunitiesWithErrors.isEmpty()) {
            for (Opportunity opport : opportunitiesWithErrors) {
                opport.addError('You cannot change the Close Date field.');
            }
        }
    }

}