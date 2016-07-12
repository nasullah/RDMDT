package rdmdt

/**
 * ReferralRecord
 * A domain class describes the data object and it's mapping to the database
 */
class ReferralRecord {

    static mapping = {
        note type: "text"
    }
	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    static belongsTo = [clinician:Clinician]
    static hasOne = [correspondingClinician:Clinician]
    static hasMany = [attachedEvidence:AttachedEvidence, patients:Patient, clinicalDetails:ClinicalDetails, unrelatedClinicalFeatures:UnrelatedClinicalFeatures,
                      paternal:Paternal, maternal:Maternal, extraTests:ExtraTests]
    static constraints = {
        clinician()
        uniqueRef()
        causativeVariantAffect(nullable: true)
        knownGeneVariant(nullable: true)
        geneticTestingOnProband(nullable: true)
        otherTestingOnProband(nullable: true)
        pedigree(nullable: true)
        furtherDetailsOfHistory(nullable: true)
        numberOfSamplesForSeq(nullable: true)
        samplesForSeqDetails(nullable: true)
        consanguinityEvidence(nullable: true)
        penetrance(nullable: true)
        referralStatus()
        note(nullable: true)
        program(nullable: true)
        proposedDiagnosis(nullable: true)
        assignedTo(nullable: true)
        assignedOn(nullable: true)
        meetingDate(nullable: true)
        numberOfSampleOtherRel(nullable: true)
        isAnySampleFromDeceasedIndividuals()
        correspondingClinician(nullable: true)
    }

    String uniqueRef
    Program program
    OMIM proposedDiagnosis
    String causativeVariantAffect
    String knownGeneVariant
    String geneticTestingOnProband
    String otherTestingOnProband
    String pedigree
    String furtherDetailsOfHistory
    Integer numberOfSamplesForSeq
    String samplesForSeqDetails
    Consanguinity consanguinityEvidence
    Penetrance penetrance
    ReferralStatus referralStatus
    Person assignedTo
    Date assignedOn
    Date meetingDate
    Integer numberOfSampleOtherRel
    String note
    boolean isAnySampleFromDeceasedIndividuals = Boolean.FALSE

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "ReferralRecord- Unique Ref.: ${uniqueRef}";
    }
}
