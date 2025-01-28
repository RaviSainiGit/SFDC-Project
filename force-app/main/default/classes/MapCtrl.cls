public class MapCtrl {
    public String name;
    public String lastName;
    public String city;
    public String phone;
    public void firstMethod(){
        
        Map<Integer,String> battingMap = new Map<Integer,String>();
        
        battingMap.put(1,'Rohit Sharma');
        battingMap.put(2,'Shubman Gill');
        battingMap.put(3,'Virat Kohli');
        battingMap.put(4,'SKY');
        battingMap.put(5,'KL Rahul');
        battingMap.put(6,'Hardik Pandya');
        
        System.debug('Batting Order = ' + battingMap );
        
        Map<Integer,String> bowlingMap = new Map<Integer,String>();
        
        bowlingMap.put(7,'Ravichandra Ashwin');
        bowlingMap.put(8,'Ravindra Jadeja');
        bowlingMap.put(9,'B Kumar');
        bowlingMap.put(10,'M Shami');
        bowlingMap.put(11,'J Bumrah');
        
        System.debug('Bowling Order = ' + bowlingMap );
        
        battingMap.putAll(bowlingMap);
        
        System.debug('Indian Player  = ' + battingMap );
        Map<Integer,String> indianPlayerMap = battingMap.clone();
        Set<Integer> playerBattingOrder = indianPlayerMap.keySet();
        System.debug('Player Batting Order  = ' + playerBattingOrder );
        List<String> playerName = indianPlayerMap.values();
        System.debug('Player Name  = ' + playerName );
    }
    
}