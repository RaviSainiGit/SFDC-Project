public class Display_Record {
    
    public List<Account> acclist{get; set;}
    
    public Display_Record(){
        
        acclist =[SELECT Id, Billing_Country__c, Billing_State__c from Account where Billing_Country__c = 'USA'AND Billing_State__c = 'Null'];
        
    }

}