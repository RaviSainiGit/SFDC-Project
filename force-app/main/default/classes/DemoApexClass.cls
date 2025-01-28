public class DemoApexClass {
    
    public String productName {get;set;}
    public Integer productPrice {get;set;}
    public Decimal productTax {get;set;}
    public String manufacturedDate {get;set;}
    
    public DemoApexClass(){
        productName = 'Nike';
        productPrice = 8000;
        productTax = 18.0;
        manufacturedDate = '21/02/2023';
        
        System.debug('Product Name ::'+productName);
        System.debug('Product Price ::'+productPrice);
        System.debug('Product Tax ::'+productTax);
        System.debug('Product Manufactured Date ::'+manufacturedDate);
        
    }
    
}