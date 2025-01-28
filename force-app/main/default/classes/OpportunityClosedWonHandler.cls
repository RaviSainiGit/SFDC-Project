public class OpportunityClosedWonHandler {

    // Future method to handle Closed Won Opportunity
    @future(callout=true)
    public static void handleClosedWonOpportunityAsync(Id opportunityId) {
        
        Opportunity opp = [SELECT Id, Name, Account.Name, Amount,(SELECT PricebookEntry.Product2.Name, Quantity, UnitPrice 
                            FROM OpportunityLineItems)
                           FROM Opportunity 
                           WHERE Id = :opportunityId];
        
        if (opp.StageName == 'Closed Won') {
            OpportunityPayloadWrapper payload = createPayload(opp);
            sendOpportunityData(payload);
        }
        
    }

    // Method to create a payload from the Opportunity
    private static OpportunityPayloadWrapper createPayload(Opportunity opp) {
        
        OpportunityPayloadWrapper payload = new OpportunityPayloadWrapper();
        payload.opportunityName = opp.Name;
        payload.accountName = opp.Account.Name;
        payload.opportunityAmount = opp.Amount;

        if (opp.OpportunityLineItems != null && opp.OpportunityLineItems.size() > 0) {
            for (OpportunityLineItem oli : opp.OpportunityLineItems) {
                ProductPayloadWrapper productPayload = new ProductPayloadWrapper();
                productPayload.productName = oli.PricebookEntry.Product2.Name;
                productPayload.quantity = oli.Quantity;
                productPayload.price = oli.UnitPrice;
                payload.products.add(productPayload);
            }
        }

        return payload;
    }

    // Method to send Opportunity data to the external system
    private static void sendOpportunityData(OpportunityPayloadWrapper payload) {
        // Define the endpoint for the external system
        String endpoint = 'https://your_external_system/api/opportunity';
        
        // Create an HTTP request
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(JSON.serialize(payload));

        // Send the HTTP request and get the response
        HttpResponse res = new Http().send(req);
        System.debug('Response: ' + res.getBody());
    }
    
    public class OpportunityPayloadWrapper {
        public String opportunityName;
        public String accountName;       
        public Decimal opportunityAmount; 
        public List<ProductPayloadWrapper> products; 

        public OpportunityPayloadWrapper() {
            products = new List<ProductPayloadWrapper>();
        }
    }

    public class ProductPayloadWrapper {
        public String productName;
        public Decimal quantity;     
        public Decimal price;       
    }
}