public class StudentSearchController {
    
    public String searchKeys {get; set;}
    
    public list<Student__c> studentLists{get; set;}
    
    public void search(){
        
        String searchKeys = '%'+searchKeys+'%';
        
        studentLists = [SELECT Id, Name, Phone__c, address__c FROM Student__c Where Name like:searchKeys];
        
    }
    
    public void clear(){
        studentLists.clear();
        
    }
    
      
}