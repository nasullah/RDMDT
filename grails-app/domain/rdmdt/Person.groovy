package rdmdt

/**
 * Person
 * A domain class describes the data object and it's mapping to the database
 */
class Person extends Party{

	static constraints = {
		forename()
		surname()
		email(nullable: true)
		telephone(nullable: true)
		departmentName()
		departmentOther(nullable: true)
		centreName()
	}

	String forename
	String surname
	Department departmentName
	String departmentOther
	Centre centreName

	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI
//	public String toString() {
//		return "${name}";
//	}
}
