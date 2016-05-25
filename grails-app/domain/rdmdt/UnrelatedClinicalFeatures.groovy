package rdmdt

/**
 * UnrelatedClinicalFeatures
 * A domain class describes the data object and it's mapping to the database
 */
class UnrelatedClinicalFeatures {

    static belongsTo = [referralRecord:ReferralRecord]
    static constraints = {
        referralRecord()
        unrelatedClinicalFeatures()
    }

    String unrelatedClinicalFeatures

    /*
     * Methods of the Domain Class
     */
	@Override	// Override toString for a nicer / more descriptive UI
	public String toString() {
		return "${unrelatedClinicalFeatures}";
	}
}
