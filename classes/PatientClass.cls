public with sharing class PatientClass 
{
	

	private String firstName {get;set;}
	private String lastName {get;set;}
	private Integer age {get;set;}
	private String sex {get;set;}
	private String procedure {get;set;}
	private String maximumDistance {get; set;}


	public PatientClass() 
	{
		
	}

	public String getFirstName()
	{
		return firstName;
	}

	public String getLastName()
	{
		return lastName;
	}

	public Integer getAge()
	{
		return age;
	}

	public String getProcedure()
	{
		return procedure;
	}

	public String getMaximumDistance()
	{
		return maximumDistance;
	}




	public void setFirstName(String loadFirstName)
	{
		firstName = loadFirstName;
	}

	public void setLastName(String loadLastName)
	{
		lastName = loadLastName;
	}

	public void setAge(Integer loadAge)
	{
		age = loadAge;
	}

	public void setProcedure(String loadProcedure)
	{
		procedure = loadProcedure;
	}

	public void setMaximumDistance(String loadMaximumDistance)
	{
		 maximumDistance = loadMaximumDistance;
	}





}