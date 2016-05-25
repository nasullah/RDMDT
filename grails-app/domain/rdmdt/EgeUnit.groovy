package rdmdt

/**
 * EgeUnit
 * A domain class describes the data object and it's mapping to the database
 */
class EgeUnit {

    static constraints = {
        egeUnitName()
    }

    String egeUnitName

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${egeUnitName}";
	}
}
