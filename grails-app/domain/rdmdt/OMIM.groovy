package rdmdt

/**
 * OMIM
 * A domain class describes the data object and it's mapping to the database
 */
class OMIM {

    static auditable = true
    static constraints = {
    }

    String term
    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${term}";
	}
}
