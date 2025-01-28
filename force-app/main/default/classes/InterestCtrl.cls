public class InterestCtrl {
    public Integer amount {get;set;}
    public Double rate {get;set;}
    public Integer year {get;set;}
    public Double interest {get;set;}
    
    public void caInterest(){
        
        interest = (amount*rate*year)/100;
        System.debug('int'+interest);
    }

}