public class MyOpportunityListController {
    
    //Get the list of opportunities based on search value
    @AuraEnabled
    public static List<Opportunity> fetchOpportunity(){
        List<Opportunity> returnList = new List<Opportunity>();
        
        //If search value is null then return all opps. Else search accordingly
        //String searchKey = String.isBlank(searchKeyword) ? '%%' : searchKeyword + '%';
        
        returnList = [SELECT Id, 
                      Name, 
                      AccountId, 
                      CloseDate, 
                      Amount FROM Opportunity LIMIT 15];
        
        return returnList;
        
    }

}