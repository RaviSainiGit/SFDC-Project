public class StudentRecordDisplay {
    
    public List<Student__c>listStudent{get; set;}
        
    public List<Student__c> studentLists(){
        
        List<Student__c> listStudent = [SELECT Id, Name, Phone__c, Email__c, address__c FROM Student__c];
        
        return listStudent;
        
    }

}