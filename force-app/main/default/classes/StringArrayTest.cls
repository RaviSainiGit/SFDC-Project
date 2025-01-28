public class StringArrayTest {
    
    public static List<String> generateStringArray(integer index){
        
        List<String> listStr = new List<String>();
        
        for(Integer i =0; i<index; i++){
            listStr.add('Test '+i);
        }
        
        System.debug('listStr ::: '+listStr);
        
        return listStr;
    }

}