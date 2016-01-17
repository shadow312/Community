/**
 * An apex page controller that exposes the site login functionality
 */
public class SiteLoginController {
    public String username {get; set;}
    public String password {get; set;}
       	
   	public void Processlogin(){
   		system.debug('**username**'+username);
   		system.debug('**password**'+password);
   		List<LoginCredentials__c> servicecred = new List<LoginCredentials__c>{};
   		servicecred = [select Password_del__c, Username_del__c from LoginCredentials__c];
        system.debug('**Logincredentials**'+servicecred);
   		//system.debug('**uname**'+lg.Username_del__c);            
       
        //String uname = LoginCredentials__c.Username_del__c;
		String uname = servicecred[0].Username_del__c;
        String pwd = servicecred[0].Password_del__c;
   		system.debug('**uname**'+uname);
        system.debug('**pwd**'+pwd);
        
        if(username == uname && password == pwd){
            HomepageRedircet();
        }
   		
   	}
    
    public PageReference HomepageRedircet(){
        system.debug('im here');
        PageReference ref = new PageReference('/apex/CommunityHome');
        return ref;
    }
}