package rdmdt

/**
 * Person
 * A domain class describes the data object and it's mapping to the database
 */
class Person extends Party{

	static constraints = {
		name()
		email(nullable: true)
		telephone(nullable: true)
		departmentName()
		speciality()
		centre()
	}

	String departmentName
	String speciality
	Centre centre

	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI
//	public String toString() {
//		return "${name}";
//	}
}
