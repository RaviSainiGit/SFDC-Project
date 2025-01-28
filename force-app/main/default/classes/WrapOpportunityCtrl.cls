public class WrapOpportunityCtrl {
    
    public Opportunity opp {get;set;}
    public Lead led {get;set;}
    
    public WrapOpportunityCtrl(){
        opp = new Opportunity();
        led = new Lead();
    }
    
    
}