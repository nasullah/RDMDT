package rdmdt

/**
 * Clinician
 * A domain class describes the data object and it's mapping to the database
 */
class Clinician extends Person{

    static hasMany = [referralRecords:ReferralRecord]
    static constraints = {
        forename()
        surname()
        email(nullable: true)
        telephone(nullable: true)
        departmentName(nullable: true)
        departmentOther(nullable: true)
        centreName(nullable: true)
        roleType(nullable: true)
        roleTypeOther(nullable: true)
    }

    RoleType roleType
    String roleTypeOther
    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${forename} ${surname}";
    }
}
