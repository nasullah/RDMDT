package rdmdt

/**
 * Party
 * A domain class describes the data object and it's mapping to the database
 */
class Party {

    static auditable = true
    static constraints = {
        email(nullable: true)
        telephone(nullable: true)
    }

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
