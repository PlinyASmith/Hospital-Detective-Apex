public with sharing class WelcomePageController 
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


	// VisualForce variables
	public Boolean isLoginButtonDisabled {get; set;}
	public Boolean isCancelButtonDisabled {get; set;}
	public String userNameEntry {get;set;}
	public String passwordEntry {get;set;}
	public String resultMessageForVisualLoginWrong {get; set;}
	public String resultMessageForVisualForceOther {get; set;}
	public String loginRoleType {get;set;}






//**********************************************************************************************
//				public WelcomePageController() 
//**********************************************************************************************
	public WelcomePageController() 
	{
		isLoginButtonDisabled = false;
		isCancelButtonDisabled = false;



	} // end of Constructor (WelcomePageController)
//**********************************************************************************************



//**********************************************************************************************
//			 public List<SelectOption> getDynamicListOfLoginRoles() 
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
//			public PageReference pageInitialization()
//**********************************************************************************************
	public PageReference pageInitialization()
	{
		
		
		getParms(); //load the page parameters


		Blob passwordEntryBlob = Blob.valueOf('password');
		Blob passwordHash = Crypto.generateDigest('SHA-256', passwordEntryBlob);
		String passwordString = EncodingUtil.base64Encode(passWordHash);
		

		//List<Patient__c> myPatients = new List<Patient__c>();
		//Patient__c myPatient = new Patient__c (UserName__c = 'Pliny', Password__c = passwordString);
		//myPatients.add(myPatient);
		//myPatient = new Patient__c (UserName__c = 'John', Password__c = passwordString);
		//myPatients.add(myPatient);
		//myPatient = new Patient__c (UserName__c = 'Anali', Password__c = passwordString);
		//myPatients.add(myPatient);
		//Upsert myPatients;

		//List<HospitalAdministrator__c> myHospitalAdministrators = new List<HospitalAdministrator__c>();
		//HospitalAdministrator__c myHospitalAdministrator = new HospitalAdministrator__c (UserName__c = 'Smith', Password__c = passwordString);
		//myHospitalAdministrators.add(myHospitalAdministrator);
		//myHospitalAdministrator = new HospitalAdministrator__c (UserName__c = 'Crissman', Password__c = passwordString);
		//myHospitalAdministrators.add(myHospitalAdministrator);
		//myHospitalAdministrator = new HospitalAdministrator__c (UserName__c = 'Negrete', Password__c = passwordString);
		//myHospitalAdministrators.add(myHospitalAdministrator);
		//Upsert myHospitalAdministrators;

		//List<InsuranceAdministrator__c> myInsuranceAdministrators = new List<InsuranceAdministrator__c>();
		//InsuranceAdministrator__c myInsuranceAdministrator = new InsuranceAdministrator__c (UserName__c = 'PlinySmith', Password__c = passwordString);
		//myInsuranceAdministrators.add(myInsuranceAdministrator);
		//myInsuranceAdministrator = new InsuranceAdministrator__c (UserName__c = 'JohnCrissman', Password__c = passwordString);
		//myInsuranceAdministrators.add(myInsuranceAdministrator);
		//myInsuranceAdministrator = new InsuranceAdministrator__c (UserName__c = 'AnaliNegrete', Password__c = passwordString);
		//myInsuranceAdministrators.add(myInsuranceAdministrator);
		//Upsert myInsuranceAdministrators;
		//getParms();

		return null;

	} // end of nothing method
//**********************************************************************************************



//**********************************************************************************************
//			public PageReference login()
//**********************************************************************************************
	public PageReference login()
	{
		 switch on loginRoleType
		 {

			 when 'Patient'
			 { 
				Patient__c[] myPatientList = [SELECT ID, Name, UserName__c, Password__c FROM Patient__c WHERE UserName__c =: userNameEntry]	;
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
						PageReference continuePage = makePageReferenceWithParms('PatientSearchPage');
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
				PageReference continuePage = makePageReferenceWithParms('WelcomePage');
				return continuePage;
			}	


			when 'Hospital Administrator'
			{
				HospitalAdministrator__c[] myHospitalAdministratorList = [SELECT ID, Name, UserName__c, Password__c FROM HospitalAdministrator__c WHERE UserName__c =: userNameEntry]	;
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
						PageReference continuePage = makePageReferenceWithParms('HospitalAdministratorSearchPage');
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
				PageReference continuePage = makePageReferenceWithParms('WelcomePage');
				return continuePage;
			}


			when 'Insurance Administrator'
			{
				InsuranceAdministrator__c[] myInsuranceAdministratorList = [SELECT ID, Name, UserName__c, Password__c FROM InsuranceAdministrator__c WHERE UserName__c =: userNameEntry]	;
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
						PageReference continuePage = makePageReferenceWithParms('InsuranceAdministratorSearchPage');
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
				PageReference continuePage = makePageReferenceWithParms('WelcomePage');
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
//			public PageReference cancelAction()
//**********************************************************************************************

	public PageReference cancelAction()
	{

		return null;
	}






  	public PageReference makePageReferenceWithParms (String pageToNavigateTo)
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



        pageref.getParameters().put('resultMessageForVisualForceOther',resultMessageForVisualForceOther);
    	pageref.getParameters().put('resultMessageForVisualLoginWrong', resultMessageForVisualLoginWrong);
    	pageref.getParameters().put('patientUsername', userNameEntry);
        return pageref;
   	}


//**********************************************************************************************







//**********************************************************************************************
//			public void getParms()
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