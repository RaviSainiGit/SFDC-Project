public class OppAccupdateController {
    
    public Account Acc {get;set;}
    public Opportunity Opp;
    public string errormessage {get;set;}
    public OppAccupdateController(Apexpages.StandardController controller)
    {
        opp = (Opportunity)controller.getRecord();
        ID accid = [select AccountID from Opportunity where ID=:opp.Id].AccountID;
        if(accid!=null)
        {
            acc = [select id,Name, Phone, Rating from account where ID=:accid]; // specify the list of fields after type seperated by comma from account that you have used in VF page 
        }
    }
    
    public void Accsave()
    {
        try{
            update acc;
        }catch(Exception e)
        {
            system.debug('exception'+' '+ e.getMessage());
            errormessage = e.getMessage();
        }
    }
    
}