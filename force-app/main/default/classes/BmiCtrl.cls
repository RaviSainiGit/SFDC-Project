public class BmiCtrl {
    
    public Integer weight {get;set;}
    public Integer height {get;set;}
    public Double result {get;set;}
    
    public void bmiCal(){
        result = weight / Math.pow(height, 2);
    }
    
}