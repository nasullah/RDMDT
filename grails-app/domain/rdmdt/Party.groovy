package rdmdt

/**
 * Party
 * A domain class describes the data object and it's mapping to the database
 */
class Party {

    static constraints = {
        name()
        email(nullable: true)
        telephone(nullable: true)
    }

    String name
    String email
    String telephone

    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI
//	public String toString() {
//		return "${name}";
//	}
}
