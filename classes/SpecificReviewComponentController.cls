public with sharing class SpecificReviewComponentController 
{
public String  firstName {get;set;}
    public String  lastName {get;set;}
    public String  roleValidated  {get;set;}
    public String  patientID {get;set;}
    public String  insuranceCompanyID {get;set;}
    public String  hospitalID {get;set;}
    public String  hospitalName {get;set;}
    public Integer numberOfAddresses {get;set;}
    public String patientAge {get;set;}
    public String patientUserName {get; set;}

    public String selectProcedureIdFromPage{get;set;}

    public String userAction {get;set;}

    public String  medicalProcedureID{get;set;}
    public String  rankReviewID{get;set;}
    public String  sortReviewsAscendingDescending{get;set;}
    public String  insuranceCompanyName {get;set;}
    public String  patientDistanceToService{get;set;}
    public String  medicalProcedureAverageStars{get;set;}
    public String  medicalProcedureHospitalAddress{get;set;}
    public String insuranceCompanyLogoFileName{get;set;}


    public String procedureSelected {get; set;}
    public String distanceSelected {get;set;}
    public String patientAddressSelected {get;set;}
    public String insuranceViewChoiceSelected {get;set;}

    public String userProfilePreference{get;set;}

    public List<PatientAddress__c> patientAddressList {get;set;}
    public List<PatientPhoneNumber__c> patientPhoneNumberList {get;set;}

    public Boolean isShowProfileButtonDisabled {get;set;}
    public Boolean isDoNotShowProfileButtonDisabled {get;set;}

    public String resultMessageForVisualForceOther {get;set;}
    public String resultMessageForVisualBadSearch {get;set;}
    public Map<String,String> Parameters {get;set;}
    public Map<String,String> Headers {get;set;}


    public String searchDistance {get;set;}
    public String searchLocation {get;set;}
    public String  searchProcedure {get;set;}






    public SpecificReviewComponentController() 
    {
        
    }



}