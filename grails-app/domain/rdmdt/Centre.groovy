package rdmdt

/**
 * Centre
 * A domain class describes the data object and it's mapping to the database
 */
class Centre {

    static constraints = {
        centreName()
    }

    String centreName
    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${centreName}";
	}
}
