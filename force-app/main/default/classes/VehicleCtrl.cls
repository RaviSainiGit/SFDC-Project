public class VehicleCtrl {
    
    public String bikeName {get;set;}
    public String bikeModel {get;set;}
    public Decimal bikePrice {get;set;}
    public Integer BikeTyre {get;set;}
    public String carName {get;set;}
    public String carModel {get;set;}
    public Decimal carPrice {get;set;}
    public Integer carTyre {get;set;}
    public String truckName {get;set;}
    public String truckModel {get;set;}
    public Decimal truckPrice {get;set;}
    public Integer truckTyre {get;set;}
    public String busName {get;set;}
    public String busModel {get;set;}
    public Decimal busPrice {get;set;}
    public Integer busTyre {get;set;}
    public Boolean isBike {get; set;}
   	public Boolean isCar {get; set;}
    public Boolean isTruck {get; set;}
    public Boolean isBus {get; set;}
    
    public VehicleCtrl(){
           
    }
    public void bikeInfo(){
        bikeName = 'Yamaha';
        bikeModel = 'MT15';
        bikePrice = 170000.00;
        bikeTyre = 2;
        isBike = true;
        isCar = false;
        isTruck = false;
        isBus = false;
        System.debug('Bike Name ::'+bikeName);
        System.debug('Bike Model ::'+bikeModel);
        System.debug('Bike Price ::'+bikePrice);
        System.debug('Bike Tyre ::'+BikeTyre);
        
    }
    
    public void carInfo(){
        carName = 'TATA';
        carModel = 'Harrier';
        carPrice = 2400000.00;
        carTyre = 4;
        isCar = true;
        isBike = false;
        isTruck = false;
        isBus = false;
    }
    
    public void truckInfo(){
        truckName = 'Mahindra TUV';
        truckModel = 'Mahindra';
        truckPrice = 298765.00;
        truckTyre = 8;
        isTruck = true;
        isBike = false;
        isCar = false;
        isBus = false;
    }
    
    public void busInfo(){
        busName = 'Volvo';
        busModel = 'Volvo Bus';
        busPrice = 200000.00;
        busTyre = 4;
        isBus = true;
        isTruck = false;
        isBike = false;
        isCar = false;
    }
    
}