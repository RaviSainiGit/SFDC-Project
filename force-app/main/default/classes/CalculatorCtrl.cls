public class CalculatorCtrl {
    public integer value1 {get;set;}
    public integer value2 {get;set;}
    public integer result {get;set;}
    
    public void addition(){
        result = value1+value2;
        
    }
    public void subtraction(){
        result = value1-value2;
        
    }
    public void division(){
        result = value1/value2;
        
    }
    public void multiplication(){
        result = value1*value2; 
        
    }
    public void cancel(){
        value1 = null;
        value2 = null;
        result = null;
    }
    
}