//**********************************************************************************************
//              Hospital Detective
//
//  Class: WelcomePageController
//
//  Handles login requests, directs logins to correct search page
//
//**********************************************************************************************

public with sharing class WelcomePageController 
{

    // PageReference Link variables to pass to pages
    public String  firstName {get;set;}
    public String  lastName {get;set;}
    public String  roleValidated  {get;set;}
    public String  patientID {get;set;}
    public String  insuranceID {get;set;}
    public String  hospitalID {get;set;}
    public String  insuranceCompanyName {get;set;}
    public String  hospitalName {get;set;}
    public Integer numberOfAddresses {get;set;}
    public String insuranceCompanyLogoFileName  {get;set;}
    public String insuranceCompanyID {get;set;}
    public String patientAge {get;set;}


    public Map<String,String> Parameters {get;set;}
    public Map<String,String> Headers {get;set;}


    // VisualForce variables
    public Boolean isLoginButtonDisabled {get; set;}
    public Boolean isLoginNEWButtonDisabled {get; set;}

    public Boolean isCancelButtonDisabled {get; set;}
    public String userNameEntry {get;set;}
    public String passwordEntry {get;set;}
    public String resultMessageForVisualLoginWrong {get; set;}
    public String resultMessageForVisualForceOther {get; set;}
    public String loginRoleType {get;set;}

    public String  procedureSelected {get;set;}



    public String loginNewOrOld {get;set;}


//**********************************************************************************************
//              public WelcomePageController() 
//**********************************************************************************************
    public WelcomePageController() 
    {
        isLoginButtonDisabled = false;
        isCancelButtonDisabled = false;



    } // end of Constructor (WelcomePageController)
//**********************************************************************************************



//**********************************************************************************************
//           public List<SelectOption> getDynamicListOfLoginRoles() 
//**********************************************************************************************
 public List<SelectOption> getDynamicListOfLoginRoles() 
    {
        List<SelectOption> optionsLoginRole = new List<SelectOption>();
        optionsLoginRole.add(new SelectOption('Patient','Patient'));
        optionsLoginRole.add(new SelectOption('Insurance Administrator','Insurance Administrator'));
        optionsLoginRole.add(new SelectOption('Hospital Administrator','Hospital Administrator'));
        return optionsLoginRole;
    } // end of DynamicListOfLoginRoles
//**********************************************************************************************



//**********************************************************************************************
//          public PageReference pageInitialization()
//**********************************************************************************************
    public PageReference pageInitialization()
    {
        
        
        getParms(); //load the page parameters


        Blob passwordEntryBlob = Blob.valueOf('password');
        Blob passwordHash = Crypto.generateDigest('SHA-256', passwordEntryBlob);
        String passwordString = EncodingUtil.base64Encode(passWordHash);
        


        //The following commented-out code initializes the tables in the database with preliminary data.  
        //Only use if the database is empty.  You will need to change the relational link IDs for Hospital and Insurance Company
        //for Hospital Administrators and for Insurance Administrators to the new ones


        //List<Patient__c> myPatients = new List<Patient__c>();
        //Patient__c myPatient = new Patient__c (UserName__c = 'Pliny', Password__c = passwordString);
        //myPatients.add(myPatient);
        //myPatient = new Patient__c (UserName__c = 'John', Password__c = passwordString);
        //myPatients.add(myPatient);
        //myPatient = new Patient__c (UserName__c = 'Anali', Password__c = passwordString);
        //myPatients.add(myPatient);
        //Upsert myPatients;

        //List<Hospital__c> myHospitals = new List<Hospital__c>();
        //Hospital__c myHospital = new Hospital__c (Hospital_Name__c = 'Weiss Memorial Hospital', Hospital_Latitude__c = 41.881832, Hospital_Longitude__c = -87.623177, Hospital_Street_Number__c = '4646', Hospital_Street_Direction__c = 'North', Hospital_Street_Name__c = 'Marine Dr', Hospital_City__c ='Chicago', Hospital_State__c = 'IL', Hospital_Zipcode__c = '60640', Hospital_Phone_Number__c = '(773) 878-8700');
        //myHospitals.add(myHospital);
        //myHospital = new Hospital__c (Hospital_Name__c = 'Norwegian American Hospital', Hospital_Latitude__c = 41.900688, Hospital_Longitude__c = -87.699303, Hospital_Street_Number__c = '1044', Hospital_Street_Direction__c = 'North', Hospital_Street_Name__c = 'Francisco Ave', Hospital_City__c ='Chicago', Hospital_State__c = 'IL', Hospital_Zipcode__c = '60622', Hospital_Phone_Number__c = '(773) 292-8200'); 
        //myHospitals.add(myHospital);
        //myHospital = new Hospital__c (Hospital_Name__c = 'South Shore Hospital', Hospital_Latitude__c = 41.749401, Hospital_Longitude__c = -87.569016, Hospital_Street_Number__c = '8012', Hospital_Street_Direction__c = 'South', Hospital_Street_Name__c = 'Crandon Ave', Hospital_City__c ='Chicago', Hospital_State__c = 'IL', Hospital_Zipcode__c = '60617', Hospital_Phone_Number__c = '(773) 356-5000');
        //myHospitals.add(myHospital);
        //myHospital = new Hospital__c (Hospital_Name__c = 'Methodist Hospital of Chicago', Hospital_Latitude__c = 41.973270, Hospital_Longitude__c =  -87.671000, Hospital_Street_Number__c = '5025', Hospital_Street_Direction__c = 'North', Hospital_Street_Name__c = 'Paulina St', Hospital_City__c ='Chicago', Hospital_State__c = 'IL', Hospital_Zipcode__c = '60640', Hospital_Phone_Number__c = '(773) 271-9040');
        //myHospitals.add(myHospital);
        //myHospital = new Hospital__c (Hospital_Name__c = 'University of Illinois Medical Center', Hospital_Latitude__c = 41.869430, Hospital_Longitude__c = -87.670520, Hospital_Street_Number__c = '1801', Hospital_Street_Direction__c = 'West', Hospital_Street_Name__c = 'Taylor St', Hospital_City__c ='Chicago', Hospital_State__c = 'IL', Hospital_Zipcode__c = '60612', Hospital_Phone_Number__c = '(312) 996-7430');
        //myHospitals.add(myHospital);
        //myHospital = new Hospital__c (Hospital_Name__c = 'Advocate Trinity Hospital', Hospital_Latitude__c = 41.726421, Hospital_Longitude__c = -87.567253, Hospital_Street_Number__c = '2320', Hospital_Street_Direction__c = 'East', Hospital_Street_Name__c = '93rd St', Hospital_City__c ='Chicago', Hospital_State__c = 'IL', Hospital_Zipcode__c = '60617', Hospital_Phone_Number__c = '(773) 967-2000');
        //myHospitals.add(myHospital);
        //myHospital = new Hospital__c (Hospital_Name__c = 'Swedish Covenant Hospital', Hospital_Latitude__c = 41.975010, Hospital_Longitude__c = -87.700510, Hospital_Street_Number__c = '5140', Hospital_Street_Direction__c = 'North', Hospital_Street_Name__c = 'California Ave', Hospital_City__c ='Chicago', Hospital_State__c = 'IL', Hospital_Zipcode__c = '60625', Hospital_Phone_Number__c = '(773) 878-8200');
        //myHospitals.add(myHospital);
        //myHospital = new Hospital__c (Hospital_Name__c = 'John H. Stroger, Jr. Hospital of Cook County', Hospital_Latitude__c = 41.866741, Hospital_Longitude__c = -87.683922, Hospital_Street_Number__c = '1969', Hospital_Street_Direction__c = 'West', Hospital_Street_Name__c = 'Ogden Ave', Hospital_City__C ='Chicago', Hospital_Zipcode__c = '60612', Hospital_Phone_Number__c = '(312) 864-6000');
        //myHospitals.add(myHospital);
        //myHospital = new Hospital__c (Hospital_Name__c = 'Rush University Medical Center', Hospital_Latitude__c = 41.875179, Hospital_Longitude__c = -87.666847, Hospital_Street_Number__c = '1653', Hospital_Street_Direction__c = 'West', Hospital_Street_Name__c = 'Congress Pkwy', Hospital_City__c ='Chicago', Hospital_Zipcode__c = '60612', Hospital_Phone_Number__c = '(312) 942-5000');
        //myHospitals.add(myHospital);
        //myHospital = new Hospital__c (Hospital_Name__c = 'UChicago Medicine', Hospital_Latitude__c = 41.776780, Hospital_Longitude__c = -87.604630, Hospital_Street_Number__c = '5841', Hospital_Street_Direction__c = 'South', Hospital_Street_Name__c = 'Maryland Ave', Hospital_City__C ='Chicago', Hospital_Zipcode__c = '60637', Hospital_Phone_Number__c = '(773) 702-1000');
        //myHospitals.add(myHospital);

        //Upsert myHospitals;


        //List<HospitalAdministrator__c> myHospitalAdministrators = new List<HospitalAdministrator__c>();
        //HospitalAdministrator__c myHospitalAdministrator = new HospitalAdministrator__c (UserName__c = 'Smith', Password__c = passwordString, FirstName__c = 'Pliny', LastName__c = 'Smith', Hospital__c = 'a061U000001mBJH');
        //myHospitalAdministrators.add(myHospitalAdministrator);
        //myHospitalAdministrator = new HospitalAdministrator__c (UserName__c = 'Crissman', Password__c = passwordString, FirstName__c = 'John', LastName__c = 'Crissman', Hospital__c = 'a061U000001mBJE');
        //myHospitalAdministrators.add(myHospitalAdministrator);
        //myHospitalAdministrator = new HospitalAdministrator__c (UserName__c = 'Negrete', Password__c = passwordString, FirstName__c = 'Anali', LastName__c = ' Negrete', Hospital__c = 'a061U000001mBJ8');
        //myHospitalAdministrators.add(myHospitalAdministrator);
        //Upsert myHospitalAdministrators;


        //List<InsuranceCompany__c> myInsuranceCompanies = new List<InsuranceCompany__c>();
        //InsuranceCompany__c myInsuranceCompany = new InsuranceCompany__c (Insurance_Company_Name__c = 'Blue Cross and Blue Shield of Illinois', Insurance_Company_Street_Number__c = '300', Insurance_Company_Street_Direction__c = 'East', Insurance_Company_Street_Name__c = 'Randolph St', Insurance_Company_City__C ='Chicago', Insurance_Company_State__c = 'IL', Insurance_Company_Zipcode__c = '60601-5099', Insurance_Company_Phone_Number__c = '(866) 514-8044');
        //myInsuranceCompanies.add(myInsuranceCompany);
        //myInsuranceCompany = new InsuranceCompany__c (Insurance_Company_Name__c = 'Aetna', Insurance_Company_Street_Number__c = '333', Insurance_Company_Street_Direction__c = 'West', Insurance_Company_Street_Name__c = 'Wacker Dr', Insurance_Company_City__C ='Chicago', Insurance_Company_Zipcode__c = '60606', Insurance_Company_State__c = 'IL', Insurance_Company_Phone_Number__c = '(866) 600-2139');
        //myInsuranceCompanies.add(myInsuranceCompany);
        //myInsuranceCompany = new InsuranceCompany__c (Insurance_Company_Name__c = 'UnitedHealthcare', Insurance_Company_Street_Number__c = '1300', Insurance_Company_Street_Direction__c = 'West', Insurance_Company_Street_Name__c = 'River Dr', Insurance_Company_City__C ='Moline', Insurance_Company_Zipcode__c = '61265', Insurance_Company_State__c = 'IL', Insurance_Company_Phone_Number__c = '(800) 747-1446');
        //myInsuranceCompanies.add(myInsuranceCompany);
        //Upsert myInsuranceCompanies;

        //List<InsuranceAdministrator__c> myInsuranceAdministrators = new List<InsuranceAdministrator__c>();
        //InsuranceAdministrator__c myInsuranceAdministrator = new InsuranceAdministrator__c (UserName__c = 'PlinySmith', Password__c = passwordString, FirstName__c = 'PLiny', LastName__c = 'Smith', InsuranceCompany__c = 'a071U000008aQ9N');
        //myInsuranceAdministrators.add(myInsuranceAdministrator);
        //myInsuranceAdministrator = new InsuranceAdministrator__c (UserName__c = 'JohnCrissman', Password__c = passwordString, FirstName__c = 'John', LastName__c = 'Crissman', InsuranceCompany__c = 'a071U000008aQ9M');
        //myInsuranceAdministrators.add(myInsuranceAdministrator);
        //myInsuranceAdministrator = new InsuranceAdministrator__c (UserName__c = 'AnaliNegrete', Password__c = passwordString, FirstName__c = 'Anali', LastName__c = 'Negrete', InsuranceCompany__c = 'a071U000008aQ9L');
        //myInsuranceAdministrators.add(myInsuranceAdministrator);
        //Upsert myInsuranceAdministrators;


        getParms();

        return null;

    } // end of nothing method
//**********************************************************************************************






    public PageReference loginNEW()
    {
        loginNewOrOld = 'New';
        PageReference continuePage = login();
        return continuePage;
    }








//**********************************************************************************************
//          public PageReference login()
//**********************************************************************************************
    public PageReference login()
    {
         PageReference continuePage;

         switch on loginRoleType
         {

             when 'Patient'
             { 
                Patient__c[] myPatientList = [SELECT ID, Name, UserName__c, Password__c, FirstName__c, LastName__c, NumberOfAddresses__c, PatientAge__c, InsuranceCompanyName__c, InsuranceCompany__c, InsuranceCompanyLogoFileName__c FROM Patient__c WHERE UserName__c =: userNameEntry]   ;
                if (myPatientList.size() > 0) 
                {
                    Patient__c myPatient = myPatientList[0];

                    Blob passwordEntryBlob = Blob.valueOf(passwordEntry);
                    Blob passwordHash = Crypto.generateDigest('SHA-256', passwordEntryBlob);
                    String passwordEntryString = EncodingUtil.base64Encode(passwordHash);
                    String storedPassword = myPatient.Password__c;
                    if (passwordEntryString == storedPassword)
                    {
                        System.debug('logged in');
                        roleValidated = 'Patient';
                        firstName = myPatient.FirstName__c;
                        lastName = myPatient.LastName__c;
                        patientID = myPatient.Id;
                        patientAge = String.valueOf(myPatient.PatientAge__c);                       
                        insuranceCompanyLogoFileName = myPatient.InsuranceCompanyLogoFileName__c;
                        insuranceCompanyId = myPatient.InsuranceCompany__c;
                        insuranceCompanyName = myPatient.InsuranceCompanyName__c;
                        numberOfAddresses = Integer.valueOf(myPatient.NumberOfAddresses__c);

                        if (loginNewOrOld != 'New')
                                 continuePage = makePageReferenceWithParms('PatientSearchPage');
                        else
                                 continuePage = makePageReferenceWithParms('MatchMakerPage');

                        return continuePage;
                    }
                    else
                    {
                        System.debug('not logged in');
                        System.debug ('enteredPassword: '+ passwordEntryString);
                        System.debug ('storedPassword: ' + storedPassword);
                    }
                }
                resultMessageForVisualLoginWrong = 'User / Password combination not found';
                continuePage = makePageReferenceWithParms('WelcomePage');
                return continuePage;
            }   


            when 'Hospital Administrator'
            {
                HospitalAdministrator__c[] myHospitalAdministratorList = [SELECT ID, Name, UserName__c, Password__c FROM HospitalAdministrator__c WHERE UserName__c =: userNameEntry]   ;
                if (myHospitalAdministratorList.size() > 0) 
                {
                    HospitalAdministrator__c myHospitalAdministrator = myHospitalAdministratorList[0];

                    Blob passwordEntryBlob = Blob.valueOf(passwordEntry);
                    Blob passwordHash = Crypto.generateDigest('SHA-256', passwordEntryBlob);
                    String passwordEntryString = EncodingUtil.base64Encode(passwordHash);
                    String storedPassword = myHospitalAdministrator.Password__c;
                    if (passwordEntryString == storedPassword)
                    {
                        System.debug('logged in');
                        roleValidated = 'HospitalAdministrator';
                        continuePage = makePageReferenceWithParms('HospitalAdministratorSearchPage');
                        return continuePage;
                    }
                    else
                    {
                        System.debug('not logged in');
                        System.debug ('enteredPassword: '+ passwordEntryString);
                        System.debug ('storedPassword: ' + storedPassword);
                    }
                }
                resultMessageForVisualLoginWrong = 'User / Password combination not found';
                continuePage = makePageReferenceWithParms('WelcomePage');
                return continuePage;
            }


            when 'Insurance Administrator'
            {
                InsuranceAdministrator__c[] myInsuranceAdministratorList = [SELECT ID, Name, UserName__c, Password__c FROM InsuranceAdministrator__c WHERE UserName__c =: userNameEntry]    ;
                if (myInsuranceAdministratorList.size() > 0) 
                {
                    InsuranceAdministrator__c myInsuranceAdministrator = myInsuranceAdministratorList[0];

                    Blob passwordEntryBlob = Blob.valueOf(passwordEntry);
                    Blob passwordHash = Crypto.generateDigest('SHA-256', passwordEntryBlob);
                    String passwordEntryString = EncodingUtil.base64Encode(passwordHash);
                    String storedPassword = myInsuranceAdministrator.Password__c;
                    if (passwordEntryString == storedPassword)
                    {
                        System.debug('logged in');
                        roleValidated = 'InsuranceAdministrator';
                        continuePage = makePageReferenceWithParms('InsuranceAdministratorSearchPage');
                        return continuePage;
                    }
                    else
                    {
                        System.debug('not logged in');
                        System.debug ('enteredPassword: '+ passwordEntryString);
                        System.debug ('storedPassword: ' + storedPassword);
                    }       
                }
                resultMessageForVisualLoginWrong = 'User / Password combination not found';
                continuePage = makePageReferenceWithParms('WelcomePage');
                return continuePage;
            }



            when null
            {
                    return null;  // don't do anything if no choice is selected somehow
            }

            when else
            {
                    return null;  // if something isn't in our list, ignore it
            }
        }

    }  // end of the login method

//**********************************************************************************************







//**********************************************************************************************
//          public PageReference cancelAction()
//**********************************************************************************************

    public PageReference cancelAction()
    {

        return null;
    }






    public PageReference makePageReferenceWithParms (String pageToNavigateTo)
    {
        PageReference pageref ;   

        pageref = new PageReference('/apex/'+pageToNavigateTo);
        pageref.setRedirect(true);
        pageref.getParameters().put('firstName',firstName);
        pageref.getParameters().put('lastName',lastName);
        pageref.getParameters().put('roleValidated',roleValidated);
        pageref.getParameters().put('patientID',patientID);
        pageref.getParameters().put('procedureSelected',procedureSelected);
        pageref.getParameters().put('insuranceCompanyID',insuranceCompanyID);
        pageref.getParameters().put('hospitalID',hospitalID);
        pageref.getParameters().put('insuranceCompanyName',insuranceCompanyName);
        pageref.getParameters().put('hospitalName',hospitalName);

        if (insuranceCompanyLogoFileName == null) insuranceCompanyLogoFileName = 'GenericHealthInsuranceLogo_Banner.jpg';
        pageref.getParameters().put('insuranceCompanyLogoFileName', insuranceCompanyLogoFileName);
        
        if (patientAge == null) patientAge = '';
        pageref.getParameters().put('patientAge',patientAge);
        

        pageref.getParameters().put('resultMessageForVisualForceOther',resultMessageForVisualForceOther);
        pageref.getParameters().put('resultMessageForVisualLoginWrong', resultMessageForVisualLoginWrong);
        pageref.getParameters().put('patientUsername', userNameEntry);

        if (numberOfAddresses != null) pageref.getParameters().put('numberOfAddresses', String.valueOf(numberOfAddresses));


        System.debug('The welcome parms I send: '+pageref);
        return pageref;
    }


//**********************************************************************************************







//**********************************************************************************************
//          public void getParms()
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
            procedureSelected = parameters.get('procedureSelected');     
            insuranceID = parameters.get('insuranceID');
            hospitalID = parameters.get('hospitalID');
            insuranceCompanyName = parameters.get('insuranceCompanyName');
            hospitalName = parameters.get('hospitalName');


            patientAge = parameters.get('patientAge');
            insuranceCompanyId = parameters.get('insuranceCompanyId');
            insuranceCompanyLogoFileName = parameters.get('InsuranceCompanyLogoFileName');



            if (parameters.get('numberOfAddresses') != null) numberOfAddresses = Integer.valueOf(parameters.get('numberOfAddresses'));

            //patientAddressesJSON = parameters.get('patientAddressesJSON');

        if (parameters.get('resultMessageForVisualForceOther') != null) 
        {
            resultMessageForVisualForceOther = parameters.get('resultMessageForVisualForceOther');
            resultMessageForVisualLoginWrong = parameters.get('resultMessageForVisualLoginWrong');
            userNameEntry = parameters.get('patientUsername');
        }
       else
        {
            resultMessageForVisualForceOther = '';
            resultMessageForVisualLoginWrong = '';
            userNameEntry = '';
        }
    }

















}