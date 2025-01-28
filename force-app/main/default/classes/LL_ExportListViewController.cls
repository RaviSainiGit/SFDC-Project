/**
* @author Globant - Leaselock
* @description LL_ExportListViewController is to export list 
* @date 10-14-2022
* @group  
* Version
* ---------------------------------------------------------------------------------------------------
* No.    Date          Author            Description
* ---    -----         -------           ---------------------------------------------------------
* 1.0    10-14-2022    Ravi Saini    Class creation
*/
@SuppressWarnings('PMD.ApexSuggestUsingNamedCred')
public without sharing class LL_ExportListViewController {
    /**
    * @description Method to getDataFromQuery
    * @param  urlString String 
    * @return List<sObject>
    */
    @AuraEnabled
    public static List<sObject> getDataFromQuery(String urlString ){
        List<String> listofparam = urlString.split('/');
      
        String objectName = listofparam[5]; 
        List<String> paramFilter = listofparam[6].split('=');	
        String filterId = paramFilter[1].subString(0,18);
        String query;
        HttpRequest req = new HttpRequest();
	    //String salesforceHost = System.Url.getSalesforceBaseURL().toExternalForm();
	   
        String endPoinURL = System.label.BaseUrl +'/services/data/v50.0/sobjects/'+ objectName +'/listviews/'+ filterId +'/describe';
        req.setEndpoint(endPoinURL);
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        Http http = new Http();
        HttpResponse response = http.send(req);
        if( response.getStatusCode() == 200 ) {
            Map<String, Object> tokenResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            query = (String) tokenResponse.get('query');
        }
        if(query != null){
            query = query +' ';
        }
        query = query + 'LIMIT 50000';
        
        return database.query(query);
        
    }

   

}