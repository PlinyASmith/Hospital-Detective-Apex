public with sharing class ShowProfileComponentController 
{
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

    public String  medicalProcedureID{get;set;}
    public String  rankReviewID{get;set;}
    public String  sortReviewsAscendingDescending{get;set;}

    public String  patientDistanceToService{get;set;}
    public String  medicalProcedureAverageStars{get;set;}
    public String  medicalProcedureHospitalAddress{get;set;}
    public String insuranceCompanyLogoFileName{get;set;}

    public String searchDistance {get;set;}
    public String searchLocation {get;set;}
    public String  searchProcedure {get;set;}

    public String userProfilePreference{get;set;}

    public List<PatientAddress__c> patientAddressList {get;set;}
    public List<PatientPhoneNumber__c> patientPhoneNumberList {get;set;}


    public Boolean isDoNotShowProfileButtonDisabled {get;set;}

    public String resultMessageForVisualForceOther {get;set;}
    public String resultMessageForVisualBadSearch {get;set;}
    public Map<String,String> Parameters {get;set;}
    public Map<String,String> Headers {get;set;}







    public ShowProfileComponentController() 
    {
             getParms();
             getPatientAddressList();
             getPatientPhoneNumberList();
    }





    public PageReference doNotShowProfile ()
    {
        getParms();
        userProfilePreference = 'DoNotShowProfile';
        PageReference pageToNavigateTo = makePageReference('MatchMakerPage');
        return pageToNavigateTo;

    }



    public void getPatientAddressList() 
    {



       patientAddressList = [SELECT Id, NameForAddress__c, Latitude__c, Longitude__c, Full_Address__c, Patient__c 
                            FROM PatientAddress__c
                            WHERE Patient__c =: patientID];


                //               ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'patientID: ' + patientID));

        //if (numberOfAddresses > 0) ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Address 1: ' + patientAddressList[0].Full_Address__c));



    }



    public void getPatientPhoneNumberList() 
    {



       patientPhoneNumberList = [SELECT Id, Phone_number__c, PhoneType__c, Patient__c 
                            FROM PatientPhoneNumber__c
                            WHERE Patient__c =: patientID];

    }









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

        pageref.getParameters().put('patientDistanceToService',patientDistanceToService);
        pageref.getParameters().put('medicalProcedureAverageStars',medicalProcedureAverageStars);
        pageref.getParameters().put('insuranceCompanyLogoFileName', insuranceCompanyLogoFileName);

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
        insurancecompanyID = parameters.get('insuranceCompanyID');
        hospitalID = parameters.get('hospitalID');
        insuranceCompanyName = parameters.get('insuranceCompanyName');
        hospitalName = parameters.get('hospitalName');
        if (parameters.get('numberOfAddresses') != null) numberOfAddresses = Integer.valueOf(parameters.get('numberOfAddresses'));
        patientAge = parameters.get('patientAge');

        searchDistance = parameters.get('searchDistance');
        searchLocation = parameters.get('searchLocation');
        searchProcedure = parameters.get('searchProcedure');     

        medicalProcedureID = parameters.get('medicalProcedureID');
        rankReviewID = parameters.get('rankReviewID');
        sortReviewsAscendingDescending = parameters.get('sortReviewsAscendingDescending');

        patientDistanceToService = parameters.get('patientDistanceToService');
        medicalProcedureAverageStars = parameters.get('medicalProcedureAverageStars');
        insuranceCompanyLogoFileName = parameters.get('insuranceCompanyLogoFileName');

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




  }







}