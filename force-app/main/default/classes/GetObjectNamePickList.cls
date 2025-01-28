public with sharing class GetObjectNamePickList {
    
    @AuraEnabled(cacheable=true)
    public static List<ObjectField> getObjectFields(String objectApiName) {
        try {
            List<ObjectField> fieldsList = new List<ObjectField>();

            // Query to fetch object label and field information
            String query = 'SELECT EntityDefinition.Label, DeveloperName, DataType, Description, RelationshipName FROM FieldDefinition WHERE EntityDefinition.QualifiedApiName = :objectApiName';
            List<FieldDefinition> fieldDefinitions = Database.query(query);

            // Populate the fieldsList with the queried data
            for (FieldDefinition fieldDef : fieldDefinitions) {
                fieldsList.add(new ObjectField(
                    fieldDef.EntityDefinition.Label,
                    fieldDef.DeveloperName,
                    fieldDef.DataType,
                    fieldDef.Description,
                    fieldDef.RelationshipName
                ));
            }

            return fieldsList;
        } catch (Exception e) {
            throw new AuraHandledException('Error retrieving object fields: ' + e.getMessage());
        }
    }

    public class ObjectField {
        @AuraEnabled public String objectLabel;
        @AuraEnabled public String label;
        @AuraEnabled public String dataType;
        @AuraEnabled public String description;
        @AuraEnabled public String relationshipName;

        public ObjectField(String objectLabel, String label, String dataType, String description, String relationshipName) {
            this.objectLabel = objectLabel;
            this.label = label;
            this.dataType = dataType;
            this.description = description;
            this.relationshipName = relationshipName;
        }
    }

}