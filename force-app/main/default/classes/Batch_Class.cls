public class Batch_Class implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc ){
        string query='select Id,Name from Accout';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc,list<Account>scope){
        for(Account acc:scope){
            Acc.type='prospect';
            Acc.Industry='Agriculture';
        }
                update scope;
    }
        public void finish(Database.BatchableContext bc)
            
        {
            
        }
}