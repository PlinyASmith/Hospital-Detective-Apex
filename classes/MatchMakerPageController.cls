public with sharing class MatchMakerPageController 
{


  // PageReference Link variables to pass to pages
    public String  firstName {get;set;}
    public String  lastName {get;set;}
    public String  roleValidated  {get;set;}
    public String  patientID {get;set;}
    public String  insuranceCompanyID {get;set;}
    public String  hospitalID {get;set;}
    public String  insuranceCompanyName {get;set;}
    public String  hospitalName {get;set;}
    public Integer numberOfAddresses {get;set;}
    public String patientAge {get;set;}

    public String userAction {get;set;}
    public String userProfilePreference {get;set;}

    public Map<String,String> Parameters {get;set;}
    public Map<String,String> Headers {get;set;}



    public String  medicalProcedureID{get;set;}
    public String  rankReviewID{get;set;}
    public String  sortReviewsAscendingDescending{get;set;}
    public String  patientDistanceToService{get;set;}
    public String  medicalProcedureAverageStars{get;set;}
    public String  medicalProcedureHospitalAddress{get;set;}
    public String insuranceCompanyLogoFileName{get;set;}


    public String resultMessageForVisualBadSearch {get; set;}
    public String resultMessageForVisualForceOther {get; set;}
    public String maxDistance {get; set;}



    public Boolean isSearchButtonDisabled {get; set;}
    public Boolean isCancelButtonDisabled {get; set;}
    public Boolean isViewProcedureButtonDisabled {get; set;}
    public Boolean isScheduleAppointmentButtonDisabled {get; set;}
    public Boolean isViewReviewsButtonDisabled {get; set;}




    public String patientUserName {get; set;}
    public List<SelectOption> pickListValuesProcedure {get; set;}
    public List<SelectOption> pickListValuesLocation {get;set;}

    public String procedureSelected {get; set;}
    public String distanceSelected {get;set;}
    public String patientAddressSelected {get;set;}



    public List<MatchMakerPageController.SearchResultsContainer> blanks{get;set;}  // the checkbox holders for each answer
    public String selectedValue {get;set;}
    public List<MedicalProcedure__c> medicalProcedureList {get; set;}
    public List<PatientAddress__c> patientAddressList {get;set;}
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
    public String  searchProcedure {get;set;}





//**********************************************************************************************
//      public MatchMakerPageController() 
//**********************************************************************************************
    public MatchMakerPageController() 
    {
        
    }


//**********************************************************************************************





public Component.Apex.pageBlock getDynamicReviewComponent()
    {

                                         
        Component.Apex.pageBlock dynamicReviewComponent = new Component.Apex.pageBlock();



            pageInitialization();


             if (userAction == 'DoNotShowReviews')
             {
                Component.DoNotShowReviews comp;
                comp = new Component.DoNotShowReviews();
                comp.thePatientID = patientID;
                comp.theFirstName = firstName;
                comp.theLastName= lastName;
                comp.theRoleValidated = roleValidated;
                comp.theSearchDistance = searchDistance;
                comp.theSearchLocation = searchLocation;
                comp.theSearchProcedure = searchProcedure;
                comp.theMedicalProcedureID = medicalProcedureID;
                comp.theRankReviewID = rankReviewID;
                comp.theSortReviewsAscendingDescending = sortReviewsAscendingDescending;
                comp.theInsuranceCompanyID = insuranceCompanyID;
                comp.theInsuranceCompanyName = insuranceCompanyName;
                comp.thePatientDistanceToService = patientDistanceToService;
                comp.theMedicalProcedureAverageStars = medicalProcedureAverageStars;
                comp.theMedicalProcedureHospitalAddress = medicalProcedureHospitalAddress;
                comp.theUserAction = userAction;
                comp.theUserProfilePreference = userProfilePreference;
                comp.theInsuranceCompanyLogoFileName = insuranceCompanyLogoFileName;
                comp.thePatientAge = patientAge;
                dynamicReviewComponent.childComponents.add(comp);

             }

                 else if (userAction == 'ListOfPatientReviews')
                 {
                    Component.ListOfPatientReviews comp;
                    comp = new Component.ListOfPatientReviews();
                    comp.thePatientID = patientID;
                    comp.theFirstName = firstName;
                    comp.theLastName= lastName;
                    comp.theRoleValidated = roleValidated;
                    comp.theSearchDistance = searchDistance;
                    comp.theSearchLocation = searchLocation;
                    comp.theSearchProcedure = searchProcedure;
                    comp.theMedicalProcedureID = medicalProcedureID;
                    comp.theRankReviewID = rankReviewID;
                    comp.theSortReviewsAscendingDescending = sortReviewsAscendingDescending;
                    comp.theInsuranceCompanyID = insuranceCompanyID;
                    comp.theInsuranceCompanyName = insuranceCompanyName;
                    comp.thePatientDistanceToService = patientDistanceToService;
                    comp.theMedicalProcedureAverageStars = medicalProcedureAverageStars;
                    comp.theMedicalProcedureHospitalAddress = medicalProcedureHospitalAddress;
                    comp.theUserAction = userAction;
                    comp.theUserProfilePreference = userProfilePreference;
                    comp.theInsuranceCompanyLogoFileName = insuranceCompanyLogoFileName;
                    comp.thePatientAge = patientAge;                    
                    dynamicReviewComponent.childComponents.add(comp);

                 }
           

                     else if (userAction == 'SpecificReview')
                     {
                        Component.SpecificReview comp;
                        comp = new Component.SpecificReview();
                        comp.thePatientID = patientID;
                        comp.theFirstName = firstName;
                        comp.theLastName= lastName;
                        comp.theRoleValidated = roleValidated;
                        comp.theSearchDistance = searchDistance;
                        comp.theSearchLocation = searchLocation;
                        comp.theSearchProcedure = searchProcedure;
                        comp.theMedicalProcedureID = medicalProcedureID;
                        comp.theRankReviewID = rankReviewID;
                        comp.theSortReviewsAscendingDescending = sortReviewsAscendingDescending;
                        comp.theInsuranceCompanyID = insuranceCompanyID;
                        comp.theInsuranceCompanyName = insuranceCompanyName;
                        comp.thePatientDistanceToService = patientDistanceToService;
                        comp.theMedicalProcedureAverageStars = medicalProcedureAverageStars;
                        comp.theMedicalProcedureHospitalAddress = medicalProcedureHospitalAddress;
                        comp.theUserAction = userAction;
                        comp.theInsuranceCompanyLogoFileName = insuranceCompanyLogoFileName;
                        comp.thePatientAge = patientAge;
                        comp.theUserProfilePreference = userProfilePreference;

                        dynamicReviewComponent.childComponents.add(comp);
                    }
    
                         else if (userAction == 'ViewProcedureInformation')
                         {
                            Component.ViewProcedureInformation comp;
                            comp = new Component.ViewProcedureInformation();
                            comp.thePatientID = patientID;
                            comp.theFirstName = firstName;
                            comp.theLastName= lastName;
                            comp.theRoleValidated = roleValidated;
                            comp.theSearchDistance = searchDistance;
                            comp.theSearchLocation = searchLocation;
                            comp.theSearchProcedure = searchProcedure;
                            comp.theMedicalProcedureID = medicalProcedureID;
                            comp.theRankReviewID = rankReviewID;
                            comp.theSortReviewsAscendingDescending = sortReviewsAscendingDescending;
                            comp.theInsuranceCompanyID = insuranceCompanyID;
                            comp.theInsuranceCompanyName = insuranceCompanyName;
                            comp.thePatientDistanceToService = patientDistanceToService;
                            comp.theMedicalProcedureAverageStars = medicalProcedureAverageStars;
                            comp.theMedicalProcedureHospitalAddress = medicalProcedureHospitalAddress;
                            comp.theUserAction = userAction;
                            comp.theUserProfilePreference = userProfilePreference;
                            comp.theInsuranceCompanyLogoFileName = insuranceCompanyLogoFileName;
                            comp.thePatientAge = patientAge;
                            dynamicReviewComponent.childComponents.add(comp);
                        }


        return dynamicReviewComponent;

    }













public Component.Apex.pageBlock getDynamicProfileComponent()
    {

                                         
        Component.Apex.pageBlock getDynamicProfileComponent = new Component.Apex.pageBlock();



            pageInitialization();


             if (userProfilePreference == 'DoNotShowProfile')
             {
                Component.DoNotShowProfile comp;
                comp = new Component.DoNotShowProfile();
                comp.thePatientID = patientID;
                comp.theFirstName = firstName;
                comp.theLastName= lastName;
                comp.theRoleValidated = roleValidated;
                comp.theSearchDistance = searchDistance;
                comp.theSearchLocation = searchLocation;
                comp.theSearchProcedure = searchProcedure;
                comp.theMedicalProcedureID = medicalProcedureID;
                comp.theRankReviewID = rankReviewID;
                comp.theSortReviewsAscendingDescending = sortReviewsAscendingDescending;
                comp.theInsuranceCompanyID = insuranceCompanyID;
                comp.theInsuranceCompanyName = insuranceCompanyName;
                comp.thePatientDistanceToService = patientDistanceToService;
                comp.theMedicalProcedureAverageStars = medicalProcedureAverageStars;
                comp.theMedicalProcedureHospitalAddress = medicalProcedureHospitalAddress;
                comp.theUserAction = userAction;
                comp.theUserProfilePreference = userProfilePreference;
                comp.theInsuranceCompanyLogoFileName = insuranceCompanyLogoFileName;
                comp.thePatientAge = patientAge;
                getDynamicProfileComponent.childComponents.add(comp);
             }

                 else if (userProfilePreference == 'ShowProfile')
                 {
                    Component.ShowProfile comp;
                    comp = new Component.ShowProfile();
                    comp.thePatientID = patientID;
                    comp.theFirstName = firstName;
                    comp.theLastName= lastName;
                    comp.theRoleValidated = roleValidated;
                    comp.theSearchDistance = searchDistance;
                    comp.theSearchLocation = searchLocation;
                    comp.theSearchProcedure = searchProcedure;
                    comp.theMedicalProcedureID = medicalProcedureID;
                    comp.theRankReviewID = rankReviewID;
                    comp.theSortReviewsAscendingDescending = sortReviewsAscendingDescending;
                    comp.theInsuranceCompanyID = insuranceCompanyID;
                    comp.theInsuranceCompanyName = insuranceCompanyName;
                    comp.thePatientDistanceToService = patientDistanceToService;
                    comp.theMedicalProcedureAverageStars = medicalProcedureAverageStars;
                    comp.theMedicalProcedureHospitalAddress = medicalProcedureHospitalAddress;
                    comp.theUserAction = userAction;
                    comp.theUserProfilePreference = userProfilePreference;
                    comp.theInsuranceCompanyLogoFileName = insuranceCompanyLogoFileName;
                    comp.thePatientAge = patientAge;    
                    getDynamicProfileComponent.childComponents.add(comp);

                 }

        return getDynamicProfileComponent;

    
    }







//**********************************************************************************************
//      public PageReference pageInitialization()
//**********************************************************************************************
    public PageReference pageInitialization()
    {
        PageReference returnPage = null;
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

        if (patientID == null || patientID == '') returnPage = makePageReference('WelcomePage');

        getPickListValuesProcedure();
        getDynamicListOfDistances();
        setUptheSearchTable();




        return returnPage;

    }




//**********************************************************************************************



    public void setUptheSearchTable() 
    {

      Decimal myLatitute = 0;
      Decimal myLongitude = 0;
      Decimal hospitalLatitude = 0;
      Decimal hospitalLongitude = 0;
      Double distanceOfHospitalToAddress = 0;

        medicalProcedureList = [SELECT Id, DiscountedPrice__c, DiscountedPriceTEXT__c, Hospital__c, HospitaProcedurePrice__c, 
                            HospitalProcedurePriceTEXT__c, InsuranceCompany__c, InsuranceCompanyDiscount__c, InsuranceCompanyDiscountTEXT__c, 
                            ProcedureName__c, ProcedureRanking__c, Zipcode__c, Available__c, TemporaryDistanceText__c,
                            ProcedureLatitude__c, ProcedureLongitude__c, HospitalAddress__c
                            FROM MedicalProcedure__c
                            WHERE ProcedureName__c =: searchProcedure];

       patientAddressList = [SELECT Id, NameForAddress__c, Latitude__c, Longitude__c, Full_Address__c, Patient__c 
                            FROM PatientAddress__c
                            WHERE Patient__c =: patientID AND NameForAddress__c =: searchLocation];

        if (patientAddressList.size() > 0)
        {
          myLatitute = patientAddressList[0].Latitude__c;
          myLongitude = patientAddressList[0].Longitude__c;
        }
        {
            blanks = new List<MatchMakerPageController.SearchResultsContainer>();
            for (MedicalProcedure__c eachValue  : medicalProcedureList)
            {

                hospitalLatitude = eachValue.ProcedureLatitude__c;
                hospitalLongitude = eachValue.ProcedureLongitude__c;
                distanceOfHospitalToAddress = getHospitalDistance(myLatitute, myLongitude, hospitalLatitude, hospitalLongitude);

                if (distanceOfHospitalToAddress < 1) eachValue.TemporaryDistanceText__c = 'less than 1 mile';
                else if (Integer.valueOf(distanceOfHospitalToAddress) == 1) eachValue.TemporaryDistanceText__c = '1 mile';
                 else  eachValue.TemporaryDistanceText__c = String.valueOf(Integer.valueOf(distanceOfHospitalToAddress)) + ' miles';                //organismContainerList.add(new PickAnOrganismComponentController.organismContainer(false, eachValue));
                if(distanceOfHospitalToAddress  <  Double.valueOf(searchDistance))
                {
                    //eachValue.Id = String.valueOf(eachValue.MedicalProcedure__c);
                    blanks.add( new MatchMakerPageController.SearchResultsContainer(!eachValue.Available__c, eachValue));

                }

            }


        }
    }







//**********************************************************************************************
//      public Double getHospitalDistance (Decimal aPatientLatitude, Decimal aPatientLongitude, Decimal aHospitalLatitude, Decimal aHospitalLongitude)
//**********************************************************************************************
  public Double getHospitalDistance (Decimal aPatientLatitude, Decimal aPatientLongitude, Decimal aHospitalLatitude, Decimal aHospitalLongitude)
    {
        Location hospitalLocation =  Location.newInstance(aHospitalLatitude,  aHospitalLongitude);
        Location patientLocation =  Location.newInstance(aPatientLatitude,  aPatientLongitude);
        return Location.getDistance(hospitalLocation,  patientLocation,  'mi');


     }

//**********************************************************************************************



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


      searchDistance = distanceSelected;
      searchLocation = patientAddressSelected;
      searchProcedure =procedureSelected;
      userAction = 'DoNotShowReviews';
      userProfilePreference = 'DoNotShowProfile';
      return makePageReference('MatchMakerPage');

      
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
//          public PageReference viewProcedure()
//**********************************************************************************************
    public PageReference viewProcedure()
    {
        userAction = 'ViewProcedureInformation';
      return makePageReference('MatchMakerPage');
    }
//**********************************************************************************************



//**********************************************************************************************
//      public PageReference scheduleAppointment()
//**********************************************************************************************

    public PageReference scheduleAppointment()
    {
         userAction = 'scheduleAppointment';

      return makePageReference('MatchMakerPage');
    }
//**********************************************************************************************



//**********************************************************************************************
//      public PageReference viewReviews()
//**********************************************************************************************

    public PageReference viewListOfPatientReviews()
    {
        userAction = 'ListOfPatientReviews';

      return makePageReference('MatchMakerPage');
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
      optionsDistance.add(new SelectOption('1','1 mile'));
      optionsDistance.add(new SelectOption('2','2 miles'));
      optionsDistance.add(new SelectOption('5','5 miles'));
      optionsDistance.add(new SelectOption('10','10 miles'));
      optionsDistance.add(new SelectOption('15','15 miles'));
      optionsDistance.add(new SelectOption('25','25 miles'));
      optionsDistance.add(new SelectOption('50','50 miles'));


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
      

        PageReference pageref;   
        pageref = new PageReference('/apex/'+pageToNavigateTo);
        pageref.setRedirect(true);

        pageref.getParameters().put('firstName',firstName);
        pageref.getParameters().put('lastName',lastName);
        pageref.getParameters().put('roleValidated',roleValidated);
        pageref.getParameters().put('patientID',patientID);
        pageref.getParameters().put('insuranceCompanyID',insuranceCompanyID);
        pageref.getParameters().put('hospitalID',hospitalID);
        pageref.getParameters().put('insuranceCompanyName',insuranceCompanyName);
        pageref.getParameters().put('hospitalName',hospitalName);
        pageref.getParameters().put('patientAge', patientAge);
   

        //specific to this page
        pageref.getParameters().put('resultMessageForVisualForceOther',resultMessageForVisualForceOther);
        pageref.getParameters().put('resultMessageForVisualBadSearch', resultMessageForVisualBadSearch);
        pageref.getParameters().put('searchDistance',searchDistance);
        pageref.getParameters().put('searchLocation',searchLocation);
        pageref.getParameters().put('searchProcedure',searchProcedure);

        pageref.getParameters().put('medicalProcedureID',medicalProcedureID);
        pageref.getParameters().put('rankReviewID',rankReviewID);
        pageref.getParameters().put('sortReviewsAscendingDescending',sortReviewsAscendingDescending);
        pageref.getParameters().put('insuranceCompanyID',insuranceCompanyID);
        pageref.getParameters().put('insuranceCompanyName',insuranceCompanyName);
        pageref.getParameters().put('patientDistanceToService',patientDistanceToService);
        pageref.getParameters().put('medicalProcedureAverageStars',medicalProcedureAverageStars);
        pageref.getParameters().put('InsuranceCompanyLogoFileName', InsuranceCompanyLogoFileName);

        pageref.getParameters().put('userAction',userAction);
        pageref.getParameters().put('userProfilePreference',userProfilePreference);

        if (numberOfAddresses != null) pageref.getParameters().put('numberOfAddresses', String.valueOf(numberOfAddresses));

        System.debug('There are the parms I send: ' + pageref);

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
        patientAge = parameters.get('patientAge');

        hospitalID = parameters.get('hospitalID');
        insuranceCompanyName = parameters.get('insuranceCompanyName');
        hospitalName = parameters.get('hospitalName');
        if (parameters.get('numberOfAddresses') != null) numberOfAddresses = Integer.valueOf(parameters.get('numberOfAddresses'));

        searchDistance = parameters.get('searchDistance');
        searchLocation = parameters.get('searchLocation');
        searchProcedure = parameters.get('searchProcedure');     

        medicalProcedureID = parameters.get('medicalProcedureID');
        rankReviewID = parameters.get('rankReviewID');
        sortReviewsAscendingDescending = parameters.get('sortReviewsAscendingDescending');
        insuranceCompanyID = parameters.get('insuranceCompanyID');
        insuranceCompanyName = parameters.get('insuranceCompanyName');
        patientDistanceToService = parameters.get('patientDistanceToService');
        medicalProcedureAverageStars = parameters.get('medicalProcedureAverageStars');
        InsuranceCompanyLogoFileName = parameters.get ('InsuranceCompanyLogoFileName');

        userAction = parameters.get('userAction');
        userProfilePreference = parameters.get('userProfilePreference');

        if (patientID == null) patientID = '';
        if (firstName == null) firstName = '';
        if (lastName == null) lastName = '';
        if (roleValidated == null) roleValidated = '';
        if (searchDistance == null) searchDistance = '';
        if (searchLocation == null) searchLocation = '';
        if (searchProcedure == null) searchProcedure = '';
        if (medicalProcedureID == null) medicalProcedureID = '';
        if (rankReviewID == null) rankReviewID = '';
        if (sortReviewsAscendingDescending == null) sortReviewsAscendingDescending = '';
        if (insuranceCompanyID == null) insuranceCompanyID = '';
        if (insuranceCompanyName == null) insuranceCompanyName = '';
        if (patientDistanceToService == null) patientDistanceToService = '';
        if (medicalProcedureAverageStars == null) medicalProcedureAverageStars = '';
        if (medicalProcedureHospitalAddress == null) medicalProcedureHospitalAddress = '';
        if (userAction == null) userAction = 'DoNotShowReviews';
        if (userProfilePreference == null) userProfilePreference = 'DoNotShowProfile';
        if (InsuranceCompanyLogoFileName == null) InsuranceCompanyLogoFileName = 'GenericHealthInsuranceLogo_Banner.jpg';

         distanceSelected = searchDistance;
         patientAddressSelected = searchLocation;
         procedureSelected = searchProcedure;



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

                if (MatchMakerPageController.fieldToSort == 'MedicalProcedure__c')
                {
                    SearchResultsContainer compareToTitle = (SearchResultsContainer)compareTo;
                    if ((Decimal)medicalProcedure.get(MatchMakerPageController.fieldToSort) == (Decimal)compareToTitle.medicalProcedure.get(MatchMakerPageController.fieldToSort)) return -1;
                    if ((Decimal)medicalProcedure.get(MatchMakerPageController.fieldToSort) > (Decimal)compareToTitle.medicalProcedure.get(MatchMakerPageController.fieldToSort)) return MatchMakerPageController.ascending ? 1 : -1;
                    return MatchMakerPageController.ascending ? -1 : 1;
                }


                else
                {
                    SearchResultsContainer compareToTitle = (SearchResultsContainer)compareTo;
                    if ((String)medicalProcedure.get(MatchMakerPageController.fieldToSort) == (String)compareToTitle.medicalProcedure.get(MatchMakerPageController.fieldToSort)) return -1;
                    if ((String)medicalProcedure.get(MatchMakerPageController.fieldToSort) > (String)compareToTitle.medicalProcedure.get(MatchMakerPageController.fieldToSort)) return MatchMakerPageController.ascending ? 1 : -1;
                    return MatchMakerPageController.ascending ? -1 : 1;
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