public class UpdatePhone {
    public static void insertname(list<Account> acclist){
        Set<Id> accountId = new Set<Id>();
        for(Account acc:acclist){
            accountId.add(acc.Id);
        }
        List<Contact> conlist = [SELECT id,phone,AccountId from Contact WHERE AccountId IN:accountId];
        for(Account acc:acclist){
            for(Contact con:conlist){
                con.Phone = acc.Phone;
            }
        }
        if(conlist.size()>0){
            update conlist;
        }
    }
    
}