public class WrapperOppLead{
        public WrapOpportunityCtrl oppLead {get;set;}
        public List<WrapOpportunityCtrl> oppLeadList {get;set;}
        
        public WrapperOppLead(){
            oppLead = new WrapOpportunityCtrl();
            oppLeadList = new List<WrapOpportunityCtrl>();
        }
        
        public void addMethod(){
            oppLeadList.add(oppLead);
            oppLead = new WrapOpportunityCtrl();
        }
        
        public void clearMethod(){
            oppLeadList.clear();
        }
        
    }