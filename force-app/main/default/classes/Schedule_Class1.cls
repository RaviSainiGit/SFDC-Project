public class Schedule_Class1 implements schedulable {
    public void execute(SchedulableContext sc){
        list<contact> conlist=[select Id,Languages__c from Contact ];
        for(contact con:conlist){
            con.Languages__c='Hindi';
        }
        update conlist;
        	
    }

}