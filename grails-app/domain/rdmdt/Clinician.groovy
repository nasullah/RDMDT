package rdmdt

/**
 * Clinician
 * A domain class describes the data object and it's mapping to the database
 */
class Clinician extends Person{

    static hasMany = [referralRecords:ReferralRecord, membership:Membership]
    static constraints = {
        name()
        email(nullable: true)
        telephone(nullable: true)
        departmentName(nullable: true)
        speciality()
        actingClinician(nullable: true)
        centre()
    }

    ActingClinician actingClinician

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${name}, ${departmentName}";
    }
}
