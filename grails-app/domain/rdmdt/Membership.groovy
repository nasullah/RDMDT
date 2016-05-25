package rdmdt

/**
 * Membership
 * A domain class describes the data object and it's mapping to the database
 */
class Membership {

    static belongsTo = [clinician:Clinician]
    static constraints = {
        role()
    }

    RoleType role
    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${role}";
	}
}
