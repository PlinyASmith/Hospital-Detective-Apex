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
  public Integer numberOfAddresses {get;set;}

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
  public String patientAddressSelected {get;set;}



    public List<PatientSearchPageController.SearchResultsContainer> blanks{get;set;}  // the checkbox holders for each answer
    public String selectedValue {get;set;}
    public List<MedicalProcedure__c> medicalProcedureList {get; set;}
    public MedicalProcedure__c medicalProcecdure {get; set;}


 //Visualforce Sorting properties
    public String selectionSort {get; set;}
    public String nameSort {get; set;}
    public String practiceAreaSort {get; set;}
    public String problemCategorySort {get; set;}
    public String problemCodeSort {get; set;}
    public String titleSort {get; set;}

    public static Integer newProcedureAddedCounter {get{if (newProcedureAddedCounter == null) return 0; else return newProcedureAddedCounter;} set;}



    public String procedureNameSort {get; set;}
    public String distanceSort {get; set;}
    public String zipCodeSort {get; set;}
    public String discountPriceSort {get; set;}
    public String rankingSort {get; set;}

    public static Boolean ascending = true;
    public static String fieldToSort;

    public String searchDistance {get;set;}
    public String searchLocation {get;set;}




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
	public void pageInitialization()
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
    setUptheSearchTable();




		//return null;

	}




//**********************************************************************************************



    public void setUptheSearchTable() 
    {

      Decimal myLatitute = 0;
      Decimal myLongitude = 0;
      Decimal hospitalLatitude = 0;
      Decimal hospitalLongitude = 0;

        medicalProcedureList = [SELECT Id, DiscountedPrice__c, DiscountedPriceTEXT__c, Hospital__c, HospitaProcedurePrice__c, 
                            HospitalProcedurePriceTEXT__c, InsuranceCompany__c, InsuranceCompanyDiscount__c, InsuranceCompanyDiscountTEXT__c, 
                            ProcedureName__c, ProcedureRanking__c, Zipcode__c, Available__c, TemporaryDistanceText__c,
                            ProcedureLatitude__c, ProcedureLongitude__c, HospitalAddress__c
                            FROM MedicalProcedure__c];
                            //WHERE ProcedureName__c =: procedure];


        {
            blanks = new List<PatientSearchPageController.SearchResultsContainer>();
            for (MedicalProcedure__c eachValue  : medicalProcedureList)
            {

                hospitalLatitude = eachValue.ProcedureLatitude__c;
                hospitalLongitude = eachValue.ProcedureLongitude__c;

                eachValue.TemporaryDistanceText__c = '22';                //organismContainerList.add(new PickAnOrganismComponentController.organismContainer(false, eachValue));
                if(eachValue.Available__c == true)
                {
                    //eachValue.Id = String.valueOf(eachValue.MedicalProcedure__c);
                    blanks.add( new PatientSearchPageController.SearchResultsContainer(!eachValue.Available__c, eachValue));

                }

            }


        }
    }







 public String getDistancesBetweenPatientAndProcedure() 
 {



  return '';
 }





//**********************************************************************************************
//      public PageReference selectProcedure ()
//**********************************************************************************************
  public PageReference selectProcedure ()
  {
    




      return null;
  }


//**********************************************************************************************






//**********************************************************************************************
//      public PageReference search ()
//**********************************************************************************************
	public PageReference search ()
	{
		

      return makePageReference('PatientSearchPage');
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
//       public List<SelectOption> getDynamicListofPatientLocations() 
//**********************************************************************************************

  public List<SelectOption> getDynamicListofPatientLocations()
  {
      
      List<SelectOption> optionsPatientLocation= new List<SelectOption>();
      List<PatientAddress__c> addressesIGot = [SELECT Id, Patient__c, NameForAddress__c FROM PatientAddress__c WHERE  Patient__c =: patientID];

      numberOfAddresses = addressesIGot.size();

      if (numberOfAddresses > 0)
      {
        for (Integer loopx = 0; loopx < numberOfAddresses; loopx++)
        {
          PatientAddress__c myPatientAddress = addressesIGot[loopx];
          optionsPatientLocation.add(new SelectOption(myPatientAddress.NameForAddress__c,myPatientAddress.NameForAddress__c));
        }
      }
      else
            optionsPatientLocation.add(new SelectOption('Not on file','Not on file'));

      return optionsPatientLocation;
   } // end of getDynamicListofPatientLocations





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
        if (numberOfAddresses != null) pageref.getParameters().put('numberOfAddresses', String.valueOf(numberOfAddresses));


        //specific to this page
        pageref.getParameters().put('resultMessageForVisualForceOther',resultMessageForVisualForceOther);
        pageref.getParameters().put('resultMessageForVisualBadSearch', resultMessageForVisualBadSearch);
        pageref.getParameters().put('searchDistance',searchDistance);
        pageref.getParameters().put('searchLocation',searchLocation);

        System.debug(pageref);

        return pageref;
  }
//**********************************************************************************************



//**********************************************************************************************
//      public void getParms()
//**********************************************************************************************
  public void getParms()
  {
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
        if (parameters.get('numberOfAddresses') != null) numberOfAddresses = Integer.valueOf(parameters.get('numberOfAddresses'));

        searchDistance = parameters.get('searchDistance');
        searchLocation = parameters.get('searchLocation');

        //System.debug (patientID);


  }

























    private pageReference sortByValue(String field, String sortBy) 
    {
        ascending = sortBy == 'Asc';
        fieldToSort = field;
        blanks.sort();
        return null;
    }




    public pageReference sortByProcedureName() 
    {
        procedureNameSort = (procedureNameSort == null ? 'Desc' : procedureNameSort);
        procedureNameSort = (procedureNameSort == 'Desc' ? 'Asc' : 'Desc');
        PageReference returnedPage = sortByValue('ProcedureName__c', procedureNameSort);
        return returnedPage;
    }

    public pageReference sortByDistance() 
    {
        distanceSort = (distanceSort == null ? 'Desc' : distanceSort);
        distanceSort = (distanceSort == 'Desc' ? 'Asc' : 'Desc');
        PageReference returnedPage = sortByValue('TemporaryDistanceText__c', distanceSort);
        return returnedPage;
    }

    public pageReference sortByZipCode() 
    {

        zipCodeSort = (zipCodeSort == null ? 'Desc' : zipCodeSort);
        zipCodeSort = (zipCodeSort == 'Desc' ? 'Asc' : 'Desc');
        PageReference returnedPage = sortByValue('ZipCode__c', zipCodeSort);
        return returnedPage;
    }

    public pageReference sortByDiscountPrice()
  {
        discountPriceSort = (discountPriceSort == null ? 'Desc' : discountPriceSort);
        discountPriceSort = (discountPriceSort == 'Desc' ? 'Asc' : 'Desc');
        PageReference returnedPage = sortByValue('DiscountedPriceTEXT__c', discountPriceSort);
        return returnedPage;
    }
    public pageReference sortByRanking() 
    {
        rankingSort = (rankingSort == null ? 'Desc' : rankingSort);
        rankingSort = (rankingSort == 'Desc' ? 'Asc' : 'Desc');
        PageReference returnedPage = sortByValue('ProcedureRanking__c', rankingSort);
        return returnedPage;
    }


    














//  This is the wrapper/container class.  It connects the select box to the Eligible Problem Codes


    public class SearchResultsContainer implements Comparable 
    {

        public MedicalProcedure__c medicalProcedure {get; set;}
        public Boolean selected {get; set;}
        public String procedureTextId {get; set;}
        public String salesForceID {get; set;}
        public Integer radioThing {get; set;}


        // Implement the compareTo() method
        public Integer compareTo(Object compareTo) 
        {

                if (PatientSearchPageController.fieldToSort == 'MedicalProcedure__c')
                {
                    SearchResultsContainer compareToTitle = (SearchResultsContainer)compareTo;
                    if ((Decimal)medicalProcedure.get(PatientSearchPageController.fieldToSort) == (Decimal)compareToTitle.medicalProcedure.get(PatientSearchPageController.fieldToSort)) return -1;
                    if ((Decimal)medicalProcedure.get(PatientSearchPageController.fieldToSort) > (Decimal)compareToTitle.medicalProcedure.get(PatientSearchPageController.fieldToSort)) return PatientSearchPageController.ascending ? 1 : -1;
                    return PatientSearchPageController.ascending ? -1 : 1;
                }

                else
                {
                    SearchResultsContainer compareToTitle = (SearchResultsContainer)compareTo;
                    if ((String)medicalProcedure.get(PatientSearchPageController.fieldToSort) == (String)compareToTitle.medicalProcedure.get(PatientSearchPageController.fieldToSort)) return -1;
                    if ((String)medicalProcedure.get(PatientSearchPageController.fieldToSort) > (String)compareToTitle.medicalProcedure.get(PatientSearchPageController.fieldToSort)) return PatientSearchPageController.ascending ? 1 : -1;
                    return PatientSearchPageController.ascending ? -1 : 1;
                }

        }


        public SearchResultsContainer (Boolean transferSelected, MedicalProcedure__c transferMedicalProcedure) 
        {

            medicalProcedure = transferMedicalProcedure;
            procedureTextId = medicalProcedure.Id;
            salesForceID = String.valueOf(medicalProcedure.Id);
            radioThing = 22;

            selected = transferSelected;

        }
    }
  }

