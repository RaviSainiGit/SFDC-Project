public class BatchExamle implements Database.batchable<sObject>, Database.Stateful {
    public List<Employee__c> employeeList;
    public BatchExamle(){
        employeeList = new List<Employee__c>();
    }
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator([SELECT Id,Name,Email__c,mobile_no__c,Date_of_Birth__c FROM Employee__c WHERE Email__c != null]);
        
    }
    
    public void execute(Database.BatchableContext bc, List<Employee__c> empList){
        for(Employee__c em:empList){
            if(em.Date_of_Birth__c.day() == System.today().day() && em.Date_of_Birth__c.month() == System.today().month() && em.Email__c != null){
                employeeList.add(em);
            }    
        }  
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('Total Birthday Employee :: '+employeeList.size());
        System.debug('Employee :: '+employeeList);
        
        for(Employee__c e:employeeList){
            Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
            List<String> toAdd = new List<String>();
            toAdd.add(e.Email__c);
            msg.setToAddresses(toAdd);
            msg.setSubject('GIT');
            String body = '';
            msg.setSenderDisplayName('Ravi saini');
            msg.setInReplyTo('ravisaini9900@gmail.com');
        }
    }

}