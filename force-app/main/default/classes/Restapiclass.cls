@RestResource(urlMapping='/v1/Welcome/*')
global class Restapiclass {
    
    global final static string Welcome_Message = 'Welcome';
    
    @HttpGet
    global static list<Account> returnString(){
        
        List<Account> acclist = [SELECT ID,Name from Account limit 10];
        return acclist;
    }

}