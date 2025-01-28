public class TriggerOnSrNumber {
    
    public static void createSrNumber(List<Contact> contacts){
        for(Contact con:contacts){
            List<Contact> conList = [ Select id, Name From Contact ];
            Integer count = conList.size();
            con.Serial_Number__c=String.valueOf('SR'+count+1);
        }
    }
    
    public static void deleteSrNumber(List<Contact> contacts){
        
    }

}