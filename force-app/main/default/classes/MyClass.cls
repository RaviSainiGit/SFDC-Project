public class MyClass {
    
    public static Integer getAdditionNumber(Integer num, Integer nums){
        Integer add = num+nums;
        System.debug('add ::: '+add);
        return add;
    }
    
    public static Integer getSubtractionNumber(Integer num1, Integer num2){
        Integer sub = num1-num2;
        System.debug('sub ::: '+sub);
        return sub;
        
    }
    
    public static Integer getMultiplyNumber(Integer num1, Integer num2){
         Integer multiply = num1*num2;
        System.debug('multiply ::: '+multiply);
        return multiply;
        
    }
    
    public static Integer getDivideNumber(Integer num1, Integer num2){
         Integer div = num1/num2;
        System.debug('div ::: '+div);
        return div;
        
    }
   
   
}