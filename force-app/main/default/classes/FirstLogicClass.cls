public class FirstLogicClass {

    @AuraEnabled(cacheable=true)
    public static Map<String, Integer> mapDemo(){
        Map<String, Integer> testMap = new Map<String, Integer>();
        testMap.put('ravi',1);
        testMap.put('virat',2);
        testMap.put('rohit',3);
        testMap.put('rahul',4);
        return testMap;

    }
    
}