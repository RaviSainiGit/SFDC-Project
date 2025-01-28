public class SampleBatchClass implements Database.Batchable<sObject>{
    
    //start method
    public Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'Select Id, Name from Account';
        return Database.getQueryLocator(query);
    }
    
    //execute method
    public void execute(Database.BatchableContext BC,list<sObject>scope){
        
    }
    
    //finish method
    public void finish(Database.BatchableContext BC){
        
    }

}