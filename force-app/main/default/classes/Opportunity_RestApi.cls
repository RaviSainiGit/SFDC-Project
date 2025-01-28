@RestResource(urlMapping='/newOpportunity/*')
global class Opportunity_RestApi {
    
    @httpGet
    global static Opportunity getOpportunity(){
                      
        Opportunity oppList = [SELECT Name, LeadSource,StageName FROM Opportunity LIMIT 1];								  
        return oppList ; 
        
    }
    
    @httpPost
    global static String createOpportunity(String name, String StageName,String CloseDate , String DiscountPercent){
                      
        Opportunity opp = new Opportunity();
        opp.name= name;
        opp.StageName =StageName ;
        opp.CloseDate = Date.valueOf(CloseDate) ;
        opp.Discount_Percent__c =  Decimal.valueOf(DiscountPercent);
        insert opp;
        
        return 'opportunity record has been created successfully'+ opp.id;
        
    } 

}