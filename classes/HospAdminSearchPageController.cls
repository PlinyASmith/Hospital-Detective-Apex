public with sharing class HospAdminSearchPageController 
{

	// PageReference Link variables to pass to pages
	public String  firstName {get;set;}
 	public String  lastName {get;set;}
 	public String  roleValidated  {get;set;}
 	public String  patientID {get;set;}
 	public String  procedure {get;set;}
 	public String  insuranceID {get;set;}
 	public String  hospitalID {get;set;}
 	public String  insuranceName {get;set;}
 	public String  hospitalName {get;set;}
 	public Map<String,String> Parameters {get;set;}
 	public Map<String,String> Headers {get;set;}







//**********************************************************************************************
//      public HospAdminSearchPageController() 
//**********************************************************************************************
	public HospAdminSearchPageController() 
	{
		
	}

//**********************************************************************************************




//**********************************************************************************************
//      public PageReference pageInitialization ()
//**********************************************************************************************
	public PageReference pageInitialization()
	{  
		getParms();
      	return null;
	}
//**********************************************************************************************




//**********************************************************************************************
//      public PageReference makePageReference(String pageToNavigateTo)
//**********************************************************************************************
	public PageReference makePageReference(String pageToNavigateTo)
	{
		PageReference pageref ;   
        pageref = new PageReference('/apex/'+pageToNavigateTo);
        pageref.getParameters().put('firstName',firstName);
        pageref.getParameters().put('lastName',lastName);
        pageref.getParameters().put('roleValidated',roleValidated);
        pageref.getParameters().put('patientID',patientID);
        pageref.getParameters().put('procedure',procedure);
       	pageref.getParameters().put('insuranceID',insuranceID);
        pageref.getParameters().put('hospitalID',hospitalID);
        pageref.getParameters().put('insuranceName',insuranceName);
        pageref.getParameters().put('hospitalName',hospitalName);
        return pageref;
	}
//**********************************************************************************************




//**********************************************************************************************
//      public void getParms()
//**********************************************************************************************
  public void getParms()
  {
       PageReference returnedPage = null;        
        parameters = ApexPages.currentPage().getParameters();
        headers = ApexPages.currentPage().getheaders();

        firstName = parameters.get('firstName');
        lastName= parameters.get('lastName');
        roleValidated = parameters.get('roleValidated');
        patientID = parameters.get('patientID');
        procedure = parameters.get('procedure');     
        insuranceID = parameters.get('insuranceID');
        hospitalID = parameters.get('hospitalID');
        insuranceName = parameters.get('insuranceName');
        hospitalName = parameters.get('hospitalName');
  }



}