global class SendEmailToContactBatch implements Database.Batchable<SObject>, Database.AllowsCallouts{
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Your query to retrieve records for processing
        return Database.getQueryLocator('SELECT Id, Name, Email FROM Contact');
    }

    global void execute(Database.BatchableContext BC, List<Contact> scope) {
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();

        for (Contact con : scope) {
            // Create an email message for each contact
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] { con.Email });
            email.setSubject('Subject of the Email');
            email.setPlainTextBody('Body of the Email');
            
            // Add the email to the list
            emailList.add(email);
        }

        // Send the emails
        Messaging.sendEmail(emailList);
    }

    global void finish(Database.BatchableContext BC) {
        
    }

}