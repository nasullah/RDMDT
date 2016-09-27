package rdmdt

/**
 * ReferralRecord
 * A domain class describes the data object and it's mapping to the database
 */
class ReferralRecord {

    static auditable = true
    static mapping = {
        note type: "text"
    }
	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
    static belongsTo = [clinician:Clinician]
    static hasMany = [attachedEvidence:AttachedEvidence, patients:Patient, clinicalDetails:ClinicalDetails,
                      paternal:Paternal, maternal:Maternal, extraTests:ExtraTests, coApplicants:CoApplicant]
    static constraints = {
        clinician()
        uniqueRef(unique: true)
        causativeVariantAffect(nullable: true)
        knownGeneVariant(nullable: true)
        geneticTestingOnProband(nullable: true)
        otherTestingOnProband(nullable: true)
        pedigree(nullable: true)
        furtherDetailsOfHistory(nullable: true)
        numberOfSamplesForSeq(nullable: true)
        identityOfFamilyMembersSamplesForSeq(nullable: true)
        approvedIdentityOfFamilyMembersSamplesForSeq(nullable: true)
        samplesForSeqDetails(nullable: true)
        consanguinityEvidence(nullable: true)
        consanguinityEvidenceDetails(nullable: true)
        penetrance(nullable: true)
        penetranceDetails(nullable: true)
        referralStatus(nullable: true)
        note(nullable: true)
        program(nullable: true)
        approvedProgram(nullable: true)
        proposedDiagnosis(nullable: true)
        assignedTo(nullable: true)
        reviewDetails(nullable: true)
        meetingDate(nullable: true)
        isAnySampleFromDeceasedIndividuals()
        isAnySampleFromDeceasedIndividualsDetails(nullable: true)
        correspondingClinician(nullable: true)
        disorderName(nullable: true)
        ageOfSymptoms(nullable: true)
        symptomEgeUnit(nullable: true)
        targetCategory(nullable: true)
        approvedTargetCategory(nullable: true)
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
        submittedDate(nullable: true)
        adminNote(nullable: true)
    }

    String uniqueRef
    Program program
    Program approvedProgram
    OMIM proposedDiagnosis
    String causativeVariantAffect
    String knownGeneVariant
    String geneticTestingOnProband
    String otherTestingOnProband
    String pedigree
    String furtherDetailsOfHistory
    Integer numberOfSamplesForSeq
    String identityOfFamilyMembersSamplesForSeq
    String approvedIdentityOfFamilyMembersSamplesForSeq
    String samplesForSeqDetails
    Consanguinity consanguinityEvidence
    String consanguinityEvidenceDetails
    Penetrance penetrance
    String penetranceDetails
    ReferralStatus referralStatus
    String conditionalApprovalDetails
    String approvalDetails
    String notApprovedDetails
    Clinician assignedTo
    String reviewDetails
    Date meetingDate
    String note
    boolean isAnySampleFromDeceasedIndividuals = Boolean.FALSE
    String isAnySampleFromDeceasedIndividualsDetails
    Clinician correspondingClinician
    String disorderName
    Integer ageOfSymptoms
    AgeUnit symptomEgeUnit
    RareDiseaseConditions targetCategory
    RareDiseaseConditions approvedTargetCategory
    boolean arrayCGH = Boolean.FALSE
    String arrayCGHDetails
    boolean otherFamilyMembersAffected = Boolean.FALSE
    String otherFamilyMembersAffectedDetails
    boolean anyIndividualsForSeqOutOfArea = Boolean.FALSE
    String anyIndividualsForSeqOutOfAreaDetails
    EligibilityType eligibility
    String eligibilityDetails
    String consentPatientOrFamily
    Date submittedDate
    String adminNote
    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "Application- Unique Ref.: ${uniqueRef}";
    }
}
