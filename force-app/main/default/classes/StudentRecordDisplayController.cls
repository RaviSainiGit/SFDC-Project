public class StudentRecordDisplayController {
    
    public List<Student__c> studentLists{get; set;}
    
    public StudentRecordDisplayController(){
        
        studentLists =[SELECT Id, Name, Phone__c, address__c FROM Student__c];
        
    }

}