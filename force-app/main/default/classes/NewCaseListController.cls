public class NewCaseListController {
    
    public List<Case> getNewCases() {
        
        List<Case> results = Database.query(
            
            'SELECT Id, CaseNumber from Case where Status = \'New\'');
        
        return results;
    }

}