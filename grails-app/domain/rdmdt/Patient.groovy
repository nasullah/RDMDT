package rdmdt

/**
 * Patient
 * A domain class describes the data object and it's mapping to the database
 */
class Patient{

    static belongsTo = [ReferralRecord, Relationship]
    static hasMany = [relationshipTo:Relationship]
    static constraints = {
        givenName(nullable: true)
        familyName(nullable: true)
        nhsNumber(nullable: true)
        mrn(nullable: true)
        dateOfBirth(nullable: true)
        gender(nullable: true)
        ethnicity(nullable: true)
        otherEthnicity(nullable: true)
        availableForOAR()
        isProband()
        ege(nullable: true)
        egeUnit(nullable: true)
        referralRecord()
        relatedFrom(nullable: true)

    }
    String givenName
    String familyName
    String nhsNumber
    String mrn
    Date dateOfBirth
    Gender gender
    Ethnicity ethnicity
    String otherEthnicity
    boolean availableForOAR = Boolean.TRUE
    boolean isProband = Boolean.FALSE
    Integer ege
    EgeUnit egeUnit
    ReferralRecord referralRecord
    Relationship relatedFrom

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "Patient- NHS Number: ${nhsNumber}";
    }
}
