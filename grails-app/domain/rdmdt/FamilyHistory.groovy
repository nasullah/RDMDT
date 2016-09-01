package rdmdt

/**
 * FamilyHistory
 * A domain class describes the data object and it's mapping to the database
 */
class FamilyHistory {

    static auditable = true
    static constraints = {
        breastAndOrOvarianCancer()
        colorectalCancer()
        ischaemicHeartDiseaseOrStroke()
        endocrineTumours()
    }

    boolean breastAndOrOvarianCancer = Boolean.FALSE
    boolean colorectalCancer = Boolean.FALSE
    boolean ischaemicHeartDiseaseOrStroke = Boolean.FALSE
    boolean endocrineTumours = Boolean.FALSE
    /*
     * Methods of the Domain Class
     */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
