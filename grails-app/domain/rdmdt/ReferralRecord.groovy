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
    static hasMany = [attachedEvidence:AttachedEvidence, patients:Patient, clinicalDetails:ClinicalDetails,
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
        identityOfFamilyMembersSamplesForSeq(nullable: true)
        samplesForSeqDetails(nullable: true)
        consanguinityEvidence(nullable: true)
        consanguinityEvidenceDetails(nullable: true)
        penetrance(nullable: true)
        penetranceDetails(nullable: true)
        referralStatus()
        note(nullable: true)
        program(nullable: true)
        proposedDiagnosis(nullable: true)
        assignedTo(nullable: true)
        reviewDetails(nullable: true)
        meetingDate(nullable: true)
        isAnySampleFromDeceasedIndividuals()
        isAnySampleFromDeceasedIndividualsDetails(nullable: true)
        correspondingClinician(nullable: true)
        coapplicant(nullable: true)
        disorderName(nullable: true)
        ageOfSymptoms(nullable: true)
        symptomEgeUnit(nullable: true)
        targetCategory(nullable: true)
        arrayCGH()
        arrayCGHDetails(nullable: true)
        otherFamilyMembersAffected()
        otherFamilyMembersAffectedDetails(nullable: true)
        anyIndividualsForSeqOutOfArea()
        anyIndividualsForSeqOutOfAreaDetails(nullable: true)
        eligibility(nullable: true)
        eligibilityDetails(nullable: true)
        consentPatientOrFamily(nullable: true)
        conditionalApprovalDetails(nullable: true)
        approvalDetails(nullable: true)
        notApprovedDetails(nullable: true)
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
    String identityOfFamilyMembersSamplesForSeq
    String samplesForSeqDetails
    Consanguinity consanguinityEvidence
    String consanguinityEvidenceDetails
    Penetrance penetrance
    String penetranceDetails
    ReferralStatus referralStatus
    String conditionalApprovalDetails
    String approvalDetails
    String notApprovedDetails
    Person assignedTo
    String reviewDetails
    Date meetingDate
    String note
    boolean isAnySampleFromDeceasedIndividuals = Boolean.FALSE
    String isAnySampleFromDeceasedIndividualsDetails
    Clinician correspondingClinician
    Clinician coapplicant
    String disorderName
    Integer ageOfSymptoms
    EgeUnit symptomEgeUnit
    RareDiseaseConditions targetCategory
    boolean arrayCGH = Boolean.FALSE
    String arrayCGHDetails
    boolean otherFamilyMembersAffected = Boolean.FALSE
    String otherFamilyMembersAffectedDetails
    boolean anyIndividualsForSeqOutOfArea = Boolean.FALSE
    String anyIndividualsForSeqOutOfAreaDetails
    EligibilityType eligibility
    String eligibilityDetails
    String consentPatientOrFamily
    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "ReferralRecord- Unique Ref.: ${uniqueRef}";
    }
}
