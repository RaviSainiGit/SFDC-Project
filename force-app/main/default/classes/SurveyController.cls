public with sharing class SurveyController {
    @AuraEnabled
    public static void createSurveyRecord(String surveyName, String surveyHeader, String surveyQuestion, String thankYouText) {
        // Create a new instance of the Survey__c object
        Survey__c newSurvey = new Survey__c();
        newSurvey.Name = surveyName;
        newSurvey.Survey_Header__c = surveyHeader;
        newSurvey.Survey_Question__c = surveyQuestion;
        newSurvey.Thank_You_Text__c = thankYouText;
        
        try {
            insert newSurvey;
        } catch(Exception e) {
            // If an error occurs during insertion, throw an exception
            throw new AuraHandledException('Error creating survey: ' + e.getMessage());
        }
    }
}