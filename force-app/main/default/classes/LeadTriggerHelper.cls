public class LeadTriggerHelper {
    
    public static void beforeInsertMethod(List<Lead> leadList){  
        for(Lead ld:leadList){
            if(ld.Industry == 'Banking'){
                ld.Rating = 'Hot' ;
                ld.LeadSource = 'Web';
            }else{
                ld.Rating = 'Warm' ;
                ld.LeadSource = 'Email';
            }  
        }    
    }
    
    public static void beforeDeleteMethod(List<Lead> deletedLeadList){
        
        List<Lead> leadsToSendEmail = new List<Lead>();

        for (Lead lead : deletedLeadList) {
            leadsToSendEmail.add(lead);
        }

        if (!leadsToSendEmail.isEmpty()) {
            List<Messaging.SingleEmailMessage> emailMessages = new List<Messaging.SingleEmailMessage>();

            for (Lead lead : leadsToSendEmail) {
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new List<String>{ lead.Email });
                email.setSubject('Lead Deleted');
                emailMessages.add(email);
            }

            Messaging.sendEmail(emailMessages);
        }
        
    }
    
    public static void duplicateLeads(List<Lead> leadList) {
        Set<String> leadNames = new Set<String>();

        for (Lead lead : leadList) {
            if (leadNames.contains(lead.LastName)) {
                lead.LastName.addError('Duplicate lead found Please enter a unique name');
            } else {
                leadNames.add(lead.LastName);
            }
        }
    }

}