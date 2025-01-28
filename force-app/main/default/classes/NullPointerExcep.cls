public class NullPointerExcep {
    
    public void processAccounts() {
    
        List<Account> accounts;

        Account acc1 = new Account(Name = 'Account One');
        Account acc2 = new Account(Name = 'Account Two');

        accounts.add(acc1);
        accounts.add(acc2);

        for (Account acc : accounts) {
            if (acc != null) {
                System.debug(acc.Name);     
            } 
        }
    }

}