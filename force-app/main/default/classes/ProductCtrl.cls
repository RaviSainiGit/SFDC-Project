public class ProductCtrl {
    public String productName {get;set;}
    public Integer productPrice {get;set;}
    public Integer productQuantity {get;set;}
    public String customerName {get;set;}
    public String customerPhone {get;set;}
    public String customerEmail {get;set;}
    public String shippingAddress {get;set;}
    public String paymentMode {get;set;}
    public Integer totalpayment {get;set;}
    public Boolean proNext {get;set;}
    public Boolean custNext {get;set;}
    public Boolean payNext {get;set;}
    public Boolean allInfo {get;set;}
    
    public ProductCtrl(){
        proNext = true;
        custNext = false;
        payNext = false;
        allInfo = false;
        
    }
    public void productMethod(){
        proNext = false;
        custNext = true;
        payNext = false;
        allInfo = false;
        totalpayment = productPrice*productQuantity;
        System.debug('custNext :: '+custNext);
        
    }
    public void customerMethod(){
        proNext = false;
        custNext = false;
        payNext = true;
        allInfo = false;
        System.debug('payNext :: '+payNext);
    }
    public void paymentMethod(){
        payNext = false;
        proNext = false;
        custNext = false;
        allInfo = true;
        System.debug('allInfo :: '+allInfo);
    }
    
}