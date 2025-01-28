@RestResource(urlMapping='/newCustomer/*')
global class RestExample_1 {
    @httpGet
    global static String create(){
        RestRequest request = RestContext.request ;
        RestResponse response = RestContext.response ; 
        String accId =request.params.get('id');
        
        System.JSONGenerator jp =JSON.createGenerator(false) ;
        jp.writeStartObject();                
        Account acc = [SELECT Name FROM Account WHERE ID=:accId];
        jp.writeStringField('Name', acc.Name);          //{"Name":"Ravi Saini"}
        
        jp.writeEndObject() ;  								 // }
        
        
        String result = jp.getAsString() ; 
        return result ; 
        
    }   
}