public with sharing class PatientSearchPageController 

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




  public String resultMessageForVisualBadSearch {get; set;}
  public String resultMessageForVisualForceOther {get; set;}
  public String location {get; set;}
  public String maxDistance {get; set;}
  public Boolean isSearchButtonDisabled {get; set;}
  public Boolean isCancelButtonDisabled {get; set;}
  public String patientUserName {get; set;}
  public List<SelectOption> pickListValuesProcedure {get; set;}
  public List<SelectOption> pickListValuesLocation {get;set;}

  public String procedureSelected {get; set;}
  public String distanceSelected {get;set;}





//**********************************************************************************************
//      public PatientSearchPageController() 
//**********************************************************************************************
	public PatientSearchPageController() 
	{
		
	}


//**********************************************************************************************



//**********************************************************************************************
//      public PageReference pageInitialization()
//**********************************************************************************************
	public PageReference pageInitialization()
	{
	
        getParms();

        if (parameters.get('resultMessageForVisualForceOther') != null) 
        {
            resultMessageForVisualForceOther = parameters.get('resultMessageForVisualForceOther');
            resultMessageForVisualBadSearch = parameters.get('resultMessageForVisualBadSearch');
            patientUsername = parameters.get('patientUsername');
        }
        else
        {
          resultMessageForVisualForceOther = '';
          resultMessageForVisualBadSearch = '';
        }

		getPickListValuesProcedure();
    getDynamicListOfDistances();
		return null;

	}




//**********************************************************************************************



//**********************************************************************************************
//      public PageReference search ()
//**********************************************************************************************
	public PageReference search ()
	{
		return null;
	}


//**********************************************************************************************



//**********************************************************************************************
//      public PageReference cancelAction ()
//**********************************************************************************************
	public PageReference cancelAction ()
	{
		return null;
	}




//**********************************************************************************************



//**********************************************************************************************
//      public List<SelectOption> getPickListValuesProcedure() 
//**********************************************************************************************
    public List<SelectOption> getPickListValuesProcedure() 
    {
        pickListValuesProcedure = new List<SelectOption>();
        
        Schema.DescribeFieldResult fieldResult = MedicalProcedure__c.ProcedureName__c.getDescribe();

        List<Schema.PickListEntry> ple = fieldResult.getPicklistValues();

        for (Schema.PicklistEntry f : ple)
        {
        	pickListValuesProcedure.add(new SelectOption(f.getLabel(), f.getValue()));

        }

        System.debug (pickListValuesProcedure);
        return pickListValuesProcedure;
    }
//**********************************************************************************************



//**********************************************************************************************
//      public List<SelectOption> getPickListValuesProcedure() 
//**********************************************************************************************
    public List<SelectOption> getPickListValuesLocation() 
    {
        pickListValuesLocation = new List<SelectOption>();
        
        Schema.DescribeFieldResult fieldResult = MedicalProcedure__c.ProcedureName__c.getDescribe();

        List<Schema.PickListEntry> ple = fieldResult.getPicklistValues();

        for (Schema.PicklistEntry f : ple)
        {
          pickListValuesLocation.add(new SelectOption(f.getLabel(), f.getValue()));

        }

        System.debug (pickListValuesLocation);
        return pickListValuesLocation;
    }
//**********************************************************************************************



//**********************************************************************************************
//       public List<SelectOption> getDynamicListOfDistances() 
//**********************************************************************************************
 public List<SelectOption> getDynamicListOfDistances() 
    {
      List<SelectOption> optionsDistance = new List<SelectOption>();
      optionsDistance.add(new SelectOption('1 mile','1 mile'));
      optionsDistance.add(new SelectOption('2 miles','2 miles'));
      optionsDistance.add(new SelectOption('5 miles','5 miles'));
      optionsDistance.add(new SelectOption('10 miles','10 miles'));
      optionsDistance.add(new SelectOption('15 miles','15 miles'));
      optionsDistance.add(new SelectOption('25 miles','25 miles'));
      optionsDistance.add(new SelectOption('50 miles','50 miles'));


      return optionsDistance;
    } // end of DynamicListOfLoginRoles
//**********************************************************************************************




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

        //specific to this page
        pageref.getParameters().put('resultMessageForVisualForceOther',resultMessageForVisualForceOther);
        pageref.getParameters().put('resultMessageForVisualBadSearch', resultMessageForVisualBadSearch);

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