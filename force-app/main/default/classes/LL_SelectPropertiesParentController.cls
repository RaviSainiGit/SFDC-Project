public with sharing class LL_SelectPropertiesParentController {
    
    @AuraEnabled
    public static List<SObject> getParentsByCriteria(String strOption, String searchCriteria,Integer pageSize, Integer pageNumber) {
        String strQuery = '';
        List<SObject> lstResult = new List <SObject>();

        if(! String.IsBlank( searchCriteria ) )
        {
           strQuery = getQuery(strOption, searchCriteria, pageSize, pageNumber);
           lstResult = Database.query(strQuery);
        }
        return lstResult;
    }
   
    @AuraEnabled
    public static String getQuery(String strOption, String searchCriteria,Integer pageSize, Integer pageNumber)
    {
        String strQuery = '';
        String strObjectType = '';
        String strQueryCondition = '';

        if (strOption=='byFlight') 
        {
            strObjectType = 'Flight__c';
        }
        if (strOption=='byProperty' )
        {
            strObjectType = 'Account';
            strQueryCondition = ' AND RecordType.DeveloperName = \'LL_Property\'';
        }
        if (strOption=='byPropertyManagementCompany') 
        {
            strObjectType = 'Account';
            strQueryCondition = ' AND RecordType.DeveloperName = \'LL_PropertyManagementCompany\'';
        }
        Integer offset = (pageNumber - 1) * pageSize;

        strQuery +='SELECT Id, Name';
        strQuery +=' FROM ' + strObjectType;
        strQuery +=' WHERE Name LIKE \'%'+searchCriteria+'%\'';
        strQuery +=strQueryCondition;
        strQuery +=' LIMIT '+ pageSize + ' OFFSET ' + offset;                    
        return strQuery;
    }

    /**
     * @description Method to count the number of records found given the search criteria
     * @param  strOption        Option selected by the user (byFlight|byOwnershipGroup|byPropertyManagementCompany)
     * @param  searchCriteria   Name of Flight or Account to be searched. 
     * @return Integer          Number of records found given the search criteria
     */
    @AuraEnabled
    public static Integer getRecordsCount(String strOption, String searchCriteria)
    {
        String strQuery = '';
        String strObjectType = '';
        String strQueryCondition = '';
        Integer intCountRecords = 0;
        if(! String.IsBlank( searchCriteria ) )
        {

            if (strOption=='byFlight') 
            {
                strObjectType = 'Flight__c';
            }
            if (strOption=='byProperty' ) 
            {
                strObjectType = 'Account';
                strQueryCondition = ' AND RecordType.DeveloperName = \'LL_Property\'';
            }
            if (strOption=='byPropertyManagementCompany' ) 
            {
                strObjectType = 'Account';
                strQueryCondition = ' AND RecordType.DeveloperName = \'LL_PropertyManagementCompany\'';
            }
    
            strQuery +='SELECT COUNT()';    
            strQuery +=' FROM ' + strObjectType;
            strQuery +=' WHERE Name LIKE \'%'+searchCriteria+'%\'';
            strQuery +=strQueryCondition;            

            intCountRecords= Database.countQuery(strQuery);
        }        
        return intCountRecords;
    }    
}