package rdmdt

/**
 * ExtraTests
 * A domain class describes the data object and it's mapping to the database
 */
class ExtraTests {

    static belongsTo = [referralRecord:ReferralRecord]
    static constraints = {
        requestedDate(nullable: true)
        testName(nullable: true)
    }

    Date requestedDate
    String testName
    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
