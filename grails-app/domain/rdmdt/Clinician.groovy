package rdmdt

/**
 * Clinician
 * A domain class describes the data object and it's mapping to the database
 */
class Clinician{

    static auditable = true
    static hasMany = [referralRecords:ReferralRecord]
    static constraints = {
        forename()
        surname()
        email(nullable: true)
        telephone(nullable: true)
        departmentName()
        departmentOther(nullable: true)
        centreName()
        roleType()
        roleTypeOther(nullable: true)
        address(nullable: true)
        postcode(nullable: true)
    }
    String forename
    String surname
    Department departmentName
    String departmentOther
    Centre centreName
    String email
    String telephone
    RoleType roleType
    String roleTypeOther
    String address
    String postcode
    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${forename} ${surname}";
    }
}
