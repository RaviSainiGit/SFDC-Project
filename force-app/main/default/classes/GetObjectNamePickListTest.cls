@isTest
private class GetObjectNamePickListTest {
    @isTest
    static void testGetObjectFields() {
        // Prepare test data
        String objectApiName = 'Account';

        // Call the getObjectFields method
        Test.startTest();
        List<GetObjectNamePickList.ObjectField> fieldsList = GetObjectNamePickList.getObjectFields(objectApiName);
        Test.stopTest();

        // Assert that the returned list is not null
        Assert.areNotEqual(null, fieldsList, 'Returned list should not be null');

        // Assert that the returned list contains data
        Assert.areNotEqual(0, fieldsList.size(), 'Returned list should contain data');

        // Additional assertions can be added to verify specific data in the list
        for (GetObjectNamePickList.ObjectField field : fieldsList) {
        	Assert.areNotEqual(null, field.label, 'Field label should not be null');
        }
    }
}