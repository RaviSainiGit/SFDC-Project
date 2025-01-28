public class PaObjectController {
    
    @AuraEnabled
    public static List <PA_Object__c> getPaObjects(String connectionId, String facilityId, String borrowerId){
        List <PA_Object__c> listofPaObject = [SELECT Id, Additional_Notes__c, 
                                              Agreed_Selling_Price_Amount__c, 
                                              Amicable_Sale_of_Property__c, 
                                              Amicable_Sale_of_Property_Date__c, 
                                              Borrower_DOB_Year__c, 
                                              Borrower_ID__c, Connection_ID__c, 
                                              Facility_ID__c, Name FROM PA_Object__c where Connection_ID__c=:connectionId or 
                                              Borrower_ID__c=:borrowerId or Facility_ID__c=:facilityId];
        return listofPaObject;
    }
    
    @AuraEnabled
    public static PA_Object__c savePaObjects(PA_Object__c objPA){
        insert objPA;
        return objPA;
    }
    
}