public class LL_CreateVfPageExtension {
    
    /**
    * @description headerdata getter setter
    */  
    public  String  headerdata{get;set;}
   /**
    * @description urlvalue getter setter
    */ 
    public string urlvalue{get;set;}

	/**
    * @description Method to Vf page
    * @param  stdController
    */ 
	public LL_CreateVfPageExtension(ApexPages.StandardSetController stdController) {
        urlvalue=Apexpages.currentPage().getUrl();
        headerdata=  ApexPages.currentPage().getParameters().get('vfRetURLInSFX');
    }

}