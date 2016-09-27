package rdmdt

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.grails.plugin.filterpane.FilterPaneUtils
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.docx4j.openpackaging.packages.WordprocessingMLPackage
/**
 * ReferralRecordController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class ReferralRecordController {

    def filterPaneService
    def springSecurityService
    static allowedMethods = [save: "POST", update: ["PUT", "POST"], delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ReferralRecord.list(params).sort {it?.referralStatus?.referralStatusName}, model: [referralRecordInstanceCount: ReferralRecord.count()]
    }

    def exportWord = {
        def referralRecordInstance = ReferralRecord.findById(params.long('referralRecordId'))
        WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.createPackage()
        def mainPart = wordMLPackage.getMainDocumentPart()

        // create some styled heading...
        mainPart.addStyledParagraphOfText("Title", "Clinical Genomic Sequencing Application")
        mainPart.addStyledParagraphOfText("Heading1", "Identification of the Genetic Basis of disease by Genomic Sequencing")
        mainPart.addStyledParagraphOfText("Heading2", Calendar.getInstance().format('MMM YYYY'))

        mainPart.addStyledParagraphOfText("Heading3", "Applicant Information")
        mainPart.addParagraphOfText('Name: ' + referralRecordInstance.clinician.forename.toString() + ' ' + referralRecordInstance.clinician.surname.toString())

        mainPart.addStyledParagraphOfText("Heading3", "Responsible consultant")
        mainPart.addParagraphOfText('Name: ' + referralRecordInstance.correspondingClinician.forename.toString() + ' ' + referralRecordInstance.correspondingClinician.surname.toString())

        mainPart.addStyledParagraphOfText("Heading3", "Co-applicants")
        referralRecordInstance.coApplicants.each { coApp ->
            mainPart.addParagraphOfText('Name: ' + coApp?.coApplicant?.forename?.toString() + ' ' + coApp?.coApplicant?.surname?.toString())
        }

        mainPart.addStyledParagraphOfText("Heading3", "About The Proband")
        mainPart.addParagraphOfText('Gender: ' + referralRecordInstance.patients?.find{p -> p.isProband}?.gender)
        mainPart.addParagraphOfText('Ethnicity: ' + referralRecordInstance.patients?.find{p -> p.isProband}?.ethnicity)
        if (referralRecordInstance.patients?.find{p -> p.isProband}?.otherEthnicity){
            mainPart.addParagraphOfText('Please specify: ' + referralRecordInstance.patients?.find{p -> p.isProband}?.otherEthnicity)
        }
        mainPart.addParagraphOfText('Age (if deceased, age at death): ' + referralRecordInstance.patients?.find{p -> p.isProband}?.age + " " + referralRecordInstance.patients?.find{p -> p.isProband}?.ageUnit)

        mainPart.addStyledParagraphOfText("Heading3", "Clinical details")
        mainPart.addParagraphOfText('Disorder Name: ' + referralRecordInstance?.disorderName)
        mainPart.addParagraphOfText('Age of Symptoms : ' + referralRecordInstance?.ageOfSymptoms + " " + referralRecordInstance?.symptomEgeUnit)
        referralRecordInstance?.clinicalDetails?.each { c ->
            mainPart.addParagraphOfText('Clinical details: ' + c?.clinicalDetailsName?.toString())
        }
        mainPart.addParagraphOfText('Genetic Testing (chromosome analysis, single gene, gene panel, etc.): ' + referralRecordInstance?.geneticTestingOnProband)
        mainPart.addParagraphOfText('Other testing on proband (metabolic, nerve conduction, muscle/skin biopsy, etc.): ' + referralRecordInstance?.otherTestingOnProband)
        if (referralRecordInstance?.arrayCGH){
            mainPart.addParagraphOfText('Has arrayCGH been performed? ' + 'Yes')
            mainPart.addParagraphOfText('Please provide results: ' + referralRecordInstance?.arrayCGHDetails)
        }else {
            mainPart.addParagraphOfText('Has arrayCGH been performed? ' + 'No')
        }

        mainPart.addStyledParagraphOfText("Heading3", "About The Family")
        if (referralRecordInstance?.otherFamilyMembersAffected){
            mainPart.addParagraphOfText('Are any other family members affected with the same or a related condition? ' + 'Yes')
            mainPart.addParagraphOfText('Please provide details: ' + referralRecordInstance?.otherFamilyMembersAffectedDetails)
        }else {
            mainPart.addParagraphOfText('Are any other family members affected with the same or a related condition? ' + 'No')
        }
        if (referralRecordInstance?.consanguinityEvidence?.id == Consanguinity.findByConsanguinityEvidence('Yes')?.id){
            mainPart.addParagraphOfText('Is there evidence of consanguinity? ' + 'Yes')
            mainPart.addParagraphOfText('Please provide details: ' + referralRecordInstance?.consanguinityEvidenceDetails)
        }else{
            mainPart.addParagraphOfText('Is there evidence of consanguinity? ' + referralRecordInstance?.consanguinityEvidence)
        }
        if (referralRecordInstance?.penetrance?.id == Penetrance.findByPenetranceName('Yes')?.id){
            mainPart.addParagraphOfText('Is there evidence of reduced penetrance? ' + 'Yes')
            mainPart.addParagraphOfText('Please provide details: ' + referralRecordInstance?.penetranceDetails)
        }else{
            mainPart.addParagraphOfText('Is there evidence of reduced penetrance? ' + referralRecordInstance?.penetrance)
        }

        mainPart.addStyledParagraphOfText("Heading3", "Family History")
        mainPart.addStyledParagraphOfText("Heading4", "Paternal")
        if (referralRecordInstance?.paternal?.first()?.breastAndOrOvarianCancer){
            mainPart.addParagraphOfText('Breast And Or Ovarian Cancer: ' + 'Yes')
        }else {
            mainPart.addParagraphOfText('Breast And Or Ovarian Cancer: ' + 'No')
        }
        if (referralRecordInstance?.paternal?.first()?.colorectalCancer){
            mainPart.addParagraphOfText('Colorectal Cancer: ' + 'Yes')
        }else {
            mainPart.addParagraphOfText('Colorectal Cancer: ' + 'No')
        }
        if (referralRecordInstance?.paternal?.first()?.ischaemicHeartDiseaseOrStroke){
            mainPart.addParagraphOfText('Ischaemic Heart Disease or Stroke: ' + 'Yes')
        }else {
            mainPart.addParagraphOfText('Ischaemic Heart Disease or Stroke: ' + 'No')
        }
        if (referralRecordInstance?.paternal?.first()?.endocrineTumours){
            mainPart.addParagraphOfText('Endocrine Tumours: ' + 'Yes')
        }else {
            mainPart.addParagraphOfText('Endocrine Tumours: ' + 'No')
        }

        mainPart.addStyledParagraphOfText("Heading4", "Maternal")
        if (referralRecordInstance?.maternal?.first()?.breastAndOrOvarianCancer){
            mainPart.addParagraphOfText('Breast And Or Ovarian Cancer: ' + 'Yes')
        }else {
            mainPart.addParagraphOfText('Breast And Or Ovarian Cancer: ' + 'No')
        }
        if (referralRecordInstance?.maternal?.first()?.colorectalCancer){
            mainPart.addParagraphOfText('Colorectal Cancer: ' + 'Yes')
        }else {
            mainPart.addParagraphOfText('Colorectal Cancer: ' + 'No')
        }
        if (referralRecordInstance?.maternal?.first()?.ischaemicHeartDiseaseOrStroke){
            mainPart.addParagraphOfText('Ischaemic Heart Disease or Stroke: ' + 'Yes')
        }else {
            mainPart.addParagraphOfText('Ischaemic Heart Disease or Stroke: ' + 'No')
        }
        if (referralRecordInstance?.maternal?.first()?.endocrineTumours){
            mainPart.addParagraphOfText('Endocrine Tumours: ' + 'Yes')
        }else {
            mainPart.addParagraphOfText('Endocrine Tumours: ' + 'No')
        }
        mainPart.addParagraphOfText('Please add details and/or note any other significant family history: ' + referralRecordInstance?.furtherDetailsOfHistory)

        mainPart.addStyledParagraphOfText("Heading3", "Ethnicity of immediate family")
        mainPart.addParagraphOfText('Mother: ' + referralRecordInstance?.patients?.find{p -> p?.relatedFrom?.relationshipType == RelationshipType.findByRelationshipTypeName('Mother')}?.ethnicity)
        mainPart.addParagraphOfText('Father: ' + referralRecordInstance?.patients?.find{p -> p?.relatedFrom?.relationshipType == RelationshipType.findByRelationshipTypeName('Father')}?.ethnicity)

        mainPart.addStyledParagraphOfText("Heading3", "Number and identity of family members proposed for sequencing")
        mainPart.addParagraphOfText('Number of Samples: ' + referralRecordInstance?.numberOfSamplesForSeq)
        mainPart.addParagraphOfText('Identity of family members (e.g. proband and both parents): ' + referralRecordInstance?.identityOfFamilyMembersSamplesForSeq)
        if (referralRecordInstance.isAnySampleFromDeceasedIndividuals){
            mainPart.addParagraphOfText('Are any of the samples are taken from deceased individuals? ' + 'Yes')
            mainPart.addParagraphOfText('Please provide details: ' + referralRecordInstance?.isAnySampleFromDeceasedIndividualsDetails)
        }else{
            mainPart.addParagraphOfText('Are any of the samples are taken from deceased individuals? ' + 'No')
        }
        if (referralRecordInstance.anyIndividualsForSeqOutOfArea){
            mainPart.addParagraphOfText('Are any individuals proposed for sequencing out of area? ' + 'Yes')
            mainPart.addParagraphOfText('Please provide details: ' + referralRecordInstance?.anyIndividualsForSeqOutOfAreaDetails)
        }else{
            mainPart.addParagraphOfText('Are any individuals proposed for sequencing out of area? ' + 'No')
        }
        mainPart.addParagraphOfText('Record any further information about sample availability: ' + referralRecordInstance?.samplesForSeqDetails)
        mainPart.addStyledParagraphOfText("Heading4", "The default programme for whole genome sequencing is the national 100,000 Genomes Project, but other local providers may be available. Please add any supporting information or comments regarding this, especially if you have a preference. If this case has been discussed through the Clinical Genetics Consultants Meeting, please also indicate here, including the date of the meeting and the selected recruitment category.")
        mainPart.addParagraphOfText('Program: ' + referralRecordInstance?.program)
        mainPart.addParagraphOfText('Note: ' + referralRecordInstance?.note)
        mainPart.addParagraphOfText('Target 100,000 Genomes Project Rare Disease category: ' + referralRecordInstance?.targetCategory)
        if (referralRecordInstance?.eligibility?.id == EligibilityType.findByEligibilityTypeNameOrEligibilityTypeName('No', 'Unknown')?.id){
            mainPart.addParagraphOfText('Is this patient/family eligible? ' + referralRecordInstance?.eligibility)
            mainPart.addParagraphOfText('Please provide details: ' + referralRecordInstance?.penetranceDetails)
        }else{
            mainPart.addParagraphOfText('Is this patient/family eligible? ' + referralRecordInstance?.eligibility)
        }

        mainPart.addStyledParagraphOfText("Heading3", "100,000 Genomes Project Recruitment")
        mainPart.addStyledParagraphOfText("Heading4", "The Clinical Genetics Department runs dedicated recruitment clinics for the 100,000 Genomes Project.  At your request, this application can stand as a referral for a Genetic Counsellor to consent the patient or family and collect samples through one of these clinics.  Please select from the following options below:")
        mainPart.addParagraphOfText(referralRecordInstance?.consentPatientOrFamily)
        mainPart.addParagraphOfText('Assigned To: ' + referralRecordInstance?.assignedTo)
        mainPart.addParagraphOfText('Add Review: ' + referralRecordInstance?.reviewDetails)
        mainPart.addParagraphOfText('Meeting Date: ' + referralRecordInstance?.meetingDate)
        mainPart.addParagraphOfText('Extra tests requested: ' + referralRecordInstance?.extraTests?.getAt(0)?.testName)
        mainPart.addParagraphOfText('Requested Date: ' + referralRecordInstance?.extraTests?.getAt(0)?.requestedDate)

        if (referralRecordInstance?.referralStatus?.id == ReferralStatus.findByReferralStatusName('Conditionally Approved')?.id){
            mainPart.addParagraphOfText('Application status: ' + 'Conditionally Approved')
            mainPart.addParagraphOfText('Please provide further details: ' + referralRecordInstance?.conditionalApprovalDetails)
            mainPart.addParagraphOfText('Approved Program: ' + referralRecordInstance?.approvedProgram)
            mainPart.addParagraphOfText('Approved Target 100,000 Genomes Project Rare Disease category: ' + referralRecordInstance?.approvedTargetCategory)
        }else if (referralRecordInstance?.referralStatus?.id == ReferralStatus.findByReferralStatusName('Approved')?.id){
            mainPart.addParagraphOfText('Application status: ' + 'Approved')
            mainPart.addParagraphOfText('Please provide further details: ' + referralRecordInstance?.approvalDetails)
            mainPart.addParagraphOfText('Approved Program: ' + referralRecordInstance?.approvedProgram)
            mainPart.addParagraphOfText('Approved Target 100,000 Genomes Project Rare Disease category: ' + referralRecordInstance?.approvedTargetCategory)
        }else if (referralRecordInstance?.referralStatus?.id == ReferralStatus.findByReferralStatusName('Not Approved')?.id){
            mainPart.addParagraphOfText('Application status: ' + 'Not Approved')
            mainPart.addParagraphOfText('Please provide further details: ' + referralRecordInstance?.notApprovedDetails)
        }else {
            mainPart.addParagraphOfText('Application status: ' + referralRecordInstance?.referralStatus)
        }

        // write out our word doc to disk
        File file = File.createTempFile("wordexport-", ".docx")
        wordMLPackage.save file

        // and send it all back to the browser
        response.setHeader("Content-disposition", "attachment; filename=" + referralRecordInstance.patients?.find{p -> p.isProband}?.familyName + "-" + referralRecordInstance.uniqueRef + ".docx");
        response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document")
        response.outputStream << file.readBytes()
        file.delete()
    }

//    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond ReferralRecord.list(params), model: [referralRecordInstanceCount: ReferralRecord.count()]
//    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [referralRecordInstanceList: ReferralRecord.list(params).sort {it?.referralStatus?.referralStatusName}, referralRecordInstanceTotal: ReferralRecord.count()]
    }

    def filter = {
        if(!params.max) params.max = 10
        render( view:'list', model:[ referralRecordInstanceList: filterPaneService.filter( params, ReferralRecord ),
                                     referralRecordInstanceTotal: filterPaneService.count( params, ReferralRecord ),
                                     filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
    }

    def filteredReferralList() {
        def currentUser = springSecurityService.currentUser.username
        def clinician
        if (currentUser?.toString()?.contains('.')) {
            def forename = currentUser?.toString()?.split("\\.")[0]
            def surname = currentUser?.toString()?.split("\\.")[1]
            clinician = Clinician.createCriteria().get {
                and {
                    eq("forename", forename, [ignoreCase: true])
                    eq("surname", surname, [ignoreCase: true])
                }
            }
            def referralRecordInstanceList = ReferralRecord.findAllByClinicianOrCorrespondingClinician(clinician, clinician).sort {it.referralStatus.referralStatusName}
            [referralRecordInstanceList: referralRecordInstanceList]
        }
    }

    def reviewRequestedReferralList() {
        def currentUser = springSecurityService.currentUser.username
        def clinician
        if (currentUser?.toString()?.contains('.')) {
            def forename = currentUser?.toString()?.split("\\.")[0]
            def surname = currentUser?.toString()?.split("\\.")[1]
            clinician = Clinician.createCriteria().get {
                and {
                    eq("forename", forename, [ignoreCase: true])
                    eq("surname", surname, [ignoreCase: true])
                }
            }
            [referralRecordInstanceList: ReferralRecord.findAllByAssignedToAndReferralStatus(clinician, ReferralStatus.findByReferralStatusName('Review Requested'))]
        }
    }

    def filteredReferralListByStatus(){
        def status = ReferralStatus.findById(params.long('status'))
        def referralRecordInstanceList = ReferralRecord.findAllByReferralStatus(status)
        [referralRecordInstanceList:referralRecordInstanceList, status:status?.referralStatusName]
    }

    def pdfRenderingService
    def renderWednesdayMeetingReviewLetter(){
        def ouh_nhs = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/ouh_nhs_logo.jpg"))
        def ox_brc_logos = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/ox_brc_logos.jpg"))
        def oxford_uni = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/oxford_uni.gif"))
        def julian_knight_signature = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/julian_knight_signature.jpg"))
        def formInstance = ReferralRecord.get(params.long('id'))
        def args = [template:"renderWednesdayMeetingReviewLetter", model:[form:formInstance, ouh_nhs:ouh_nhs.bytes, ox_brc_logos:ox_brc_logos.bytes, oxford_uni:oxford_uni.bytes, julian_knight_signature:julian_knight_signature.bytes]]
        pdfRenderingService.render(args+[controller:this],response)
    }

    def renderHICFLetter(){
        def ouh_nhs = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/ouh_nhs_logo.jpg"))
        def ox_brc_logos = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/ox_brc_logos.jpg"))
        def oxford_uni = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/oxford_uni.gif"))
        def julian_knight_signature = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/julian_knight_signature.jpg"))
        def formInstance = ReferralRecord.get(params.long('id'))
        def args = [template:"renderHICFLetter", model:[form:formInstance, ouh_nhs:ouh_nhs.bytes, ox_brc_logos:ox_brc_logos.bytes, oxford_uni:oxford_uni.bytes, julian_knight_signature:julian_knight_signature.bytes]]
        pdfRenderingService.render(args+[controller:this],response)
    }

    def renderOtherTestingConditionalLetter(){
        def ouh_nhs = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/ouh_nhs_logo.jpg"))
        def ox_brc_logos = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/ox_brc_logos.jpg"))
        def oxford_uni = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/oxford_uni.gif"))
        def julian_knight_signature = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/julian_knight_signature.jpg"))
        def formInstance = ReferralRecord.get(params.long('id'))
        def args = [template:"renderOtherTestingConditionalLetter", model:[form:formInstance, ouh_nhs:ouh_nhs.bytes, ox_brc_logos:ox_brc_logos.bytes, oxford_uni:oxford_uni.bytes, julian_knight_signature:julian_knight_signature.bytes]]
        pdfRenderingService.render(args+[controller:this],response)
    }

    def renderNotApprovedLetter(){
        def ouh_nhs = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/ouh_nhs_logo.jpg"))
        def ox_brc_logos = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/ox_brc_logos.jpg"))
        def oxford_uni = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/oxford_uni.gif"))
        def julian_knight_signature = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/julian_knight_signature.jpg"))
        def formInstance = ReferralRecord.get(params.long('id'))
        def args = [template:"renderNotApprovedLetter", model:[form:formInstance, ouh_nhs:ouh_nhs.bytes, ox_brc_logos:ox_brc_logos.bytes, oxford_uni:oxford_uni.bytes, julian_knight_signature:julian_knight_signature.bytes]]
        pdfRenderingService.render(args+[controller:this],response)
    }

    def renderStandardApprovalLetter(){
        def ouh_nhs = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/ouh_nhs_logo.jpg"))
        def ox_brc_logos = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/ox_brc_logos.jpg"))
        def oxford_uni = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/oxford_uni.gif"))
        def julian_knight_signature = new File(ApplicationHolder.application.parentContext.servletContext.getRealPath("/images/julian_knight_signature.jpg"))
        def formInstance = ReferralRecord.get(params.long('id'))
        def args = [template:"renderStandardApprovalLetter", model:[form:formInstance, ouh_nhs:ouh_nhs.bytes, ox_brc_logos:ox_brc_logos.bytes, oxford_uni:oxford_uni.bytes, julian_knight_signature:julian_knight_signature.bytes]]
        pdfRenderingService.render(args+[controller:this],response)
    }


    def submittedApplication(){
        def referralRecordInstanceList = ReferralRecord.findAllByReferralStatus(ReferralStatus.findByReferralStatusName('Submitted'))?.sort {it?.submittedDate}
        [referralRecordInstanceList:referralRecordInstanceList]
    }

    def searchRareDiseaseCondition = {
        def listRareDiseaseCondition = RareDiseaseConditions.createCriteria().listDistinct {
            ilike("diseaseName", "%${params.query}%")
        }
        //Create XML response
        render(contentType: "text/xml") {
            results() {
                listRareDiseaseCondition.each { rareDiseaseCondition ->
                    result(){
                        name(rareDiseaseCondition)
                        //Optional id which will be available in onItemSelect
                        id(rareDiseaseCondition.id)
                    }
                }
            }
        }
    }

    def show(ReferralRecord referralRecordInstance) {
        respond referralRecordInstance
    }

    def create() {
        respond new ReferralRecord(params)
    }

    def download(long id) {
        ReferralRecord referralRecordInstance = ReferralRecord.get(id)
        if ( referralRecordInstance == null) {
            flash.message = "Pedigree file not found"
            redirect (action:'index')
        } else {
            response.setContentType("APPLICATION/OCTET-STREAM")
            response.setHeader("Content-Disposition", "Attachment;Filename=\"${referralRecordInstance.pedigree}\"")

            def file = new File(referralRecordInstance.pedigree)
            def fileInputStream = new FileInputStream(file)
            def outputStream = response.getOutputStream()

            byte[] buffer = new byte[4096];
            int len;
            while ((len = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, len);
            }

            outputStream.flush()
            outputStream.close()
            fileInputStream.close()
        }
    }

    @Transactional
    def save(ReferralRecord referralRecordInstance) {
        if (referralRecordInstance == null) {
            notFound()
            return
        }

        if (referralRecordInstance.hasErrors()) {
            respond referralRecordInstance.errors, view: 'create'
            return
        }

        if (params.nhsNumberProband && Patient.findByNhsNumber(params.nhsNumberProband)){
            flash.message = "A patient with NHS number ${params.nhsNumberProband} already exists"
            respond referralRecordInstance, view: 'create'
            return
        }

        def proband = new Patient(isProband: true, nhsNumber: params.nhsNumberProband, gender: params.genderProband, ethnicity: params.ethnicityProband,
                                  otherEthnicity: params.otherEthnicityProband, age: params.ageProband, ageUnit: params.egeUnitProband, givenName: params.givenName, familyName: params.familyName)
        if (proband){
            referralRecordInstance.addToPatients(proband)
            if (ReferralStatus.findById(params.long('referralStatus'))){
                referralRecordInstance.referralStatus = ReferralStatus.findById(params.long('referralStatus'))
            }else {
                referralRecordInstance.referralStatus = ReferralStatus.findByReferralStatusName('In progress')
            }
            referralRecordInstance.save flush: true

            List<ClinicalDetails> clinicalDetailsList = new ArrayList<ClinicalDetails>();
            if (params.cDetails0){
                clinicalDetailsList.add(new ClinicalDetails(clinicalDetailsName: params.cDetails0))
            }
            if (params.cDetails1){
                clinicalDetailsList.add(new ClinicalDetails(clinicalDetailsName:params.cDetails1))
            }
            if (params.cDetails2){
                clinicalDetailsList.add(new ClinicalDetails(clinicalDetailsName:params.cDetails2))
            }
            if (params.cDetails3){
                clinicalDetailsList.add(new ClinicalDetails(clinicalDetailsName:params.cDetails3))
            }
            if (params.cDetails4){
                clinicalDetailsList.add(new ClinicalDetails(clinicalDetailsName:params.cDetails4))
            }
            if (params.cDetails5){
                clinicalDetailsList.add(new ClinicalDetails(clinicalDetailsName:params.cDetails5))
            }
            if (params.cDetails6){
                clinicalDetailsList.add(new ClinicalDetails(clinicalDetailsName:params.cDetails6))
            }
            if (!clinicalDetailsList.empty){
                for (int i = 0; i <clinicalDetailsList.size(); i++ ){
                    referralRecordInstance.addToClinicalDetails(clinicalDetailsList.get(i)).save flush: true
                }
            }

            List<CoApplicant> coApplicantList = new ArrayList<CoApplicant>();
            if (Clinician.findById(params.long('coapplicant1'))){
                def clinician = Clinician.findById(params.long('coapplicant1'))
                coApplicantList.add(new CoApplicant(coApplicant: clinician))
            }

            if (Clinician.findById(params.long('coapplicant2'))){
                def clinician = Clinician.findById(params.long('coapplicant2'))
                coApplicantList.add(new CoApplicant(coApplicant: clinician))
            }

            if (Clinician.findById(params.long('coapplicant3'))){
                def clinician = Clinician.findById(params.long('coapplicant3'))
                coApplicantList.add(new CoApplicant(coApplicant: clinician))
            }

            if (Clinician.findById(params.long('coapplicant4'))){
                def clinician = Clinician.findById(params.long('coapplicant4'))
                coApplicantList.add(new CoApplicant(coApplicant: clinician))
            }

            if (Clinician.findById(params.long('coapplicant5'))){
                def clinician = Clinician.findById(params.long('coapplicant5'))
                coApplicantList.add(new CoApplicant(coApplicant: clinician))
            }

            if (!coApplicantList.empty){
                for (int i = 0; i <coApplicantList.size(); i++ ){
                    referralRecordInstance.addToCoApplicants(coApplicantList.get(i)).save flush: true
                }
            }

            new Paternal(breastAndOrOvarianCancer: params.breastAndOrOvarianCancerPaternal, colorectalCancer: params.colorectalCancerPaternal,
                    ischaemicHeartDiseaseOrStroke: params.ischaemicHeartDiseaseOrStrokePaternal, endocrineTumours: params.endocrineTumoursPaternal, referralRecord: referralRecordInstance).save flush: true

            new Maternal(breastAndOrOvarianCancer: params.breastAndOrOvarianCancerMaternal, colorectalCancer: params.colorectalCancerMaternal,
                    ischaemicHeartDiseaseOrStroke: params.ischaemicHeartDiseaseOrStrokeMaternal, endocrineTumours: params.endocrineTumoursMaternal, referralRecord: referralRecordInstance).save flush: true

            if (params.ethnicityFather){
                def ethnicity = params.ethnicityFather
                def patient = new Patient(isProband: false, referralRecord: referralRecordInstance, ethnicity: ethnicity, otherEthnicity: params.otherEthnicityFather).save flush: true
                new Relationship(relationshipType: RelationshipType.findByRelationshipTypeName('Father'), patient: proband, relatedPatient: patient).save flush: true
            }

            if (params.ethnicityMother){
                def ethnicity = params.ethnicityMother
                def patient = new Patient(isProband: false, referralRecord: referralRecordInstance, ethnicity: ethnicity, otherEthnicity: params.otherEthnicityMother).save flush: true
                new Relationship(relationshipType: RelationshipType.findByRelationshipTypeName('Mother'), patient: proband, relatedPatient: patient).save flush: true
            }

            if (params.extraTestsRequested){
                def extraTest = new ExtraTests(testName: params.extraTestsRequested, requestedDate: params.requestedDate)
                referralRecordInstance.addToExtraTests(extraTest).save flush: true
            }

            if (Clinician.findById(params.long('correspondingClinician'))){
                def correspondingClinician = Clinician.findById(params.long('correspondingClinician'))
                referralRecordInstance.correspondingClinician = correspondingClinician
                referralRecordInstance.save flush: true
            } else {
                referralRecordInstance.correspondingClinician = referralRecordInstance.clinician
                referralRecordInstance.save flush: true
            }

            def pedigreeFile = request.getFile('pedigreeFile')
            if (pedigreeFile?.originalFilename){
                if (pedigreeFile?.empty) {
                    flash.message = "File cannot be empty"
                    respond referralRecordInstance.errors, view: 'create'
                    return
                }
                referralRecordInstance.pedigree = grailsApplication.config.uploadFolder +'Pedigree/'+
                        referralRecordInstance.id.toString() + '.' + pedigreeFile.originalFilename
                def destinationFile = new File(referralRecordInstance.pedigree)

                try {
                    pedigreeFile.transferTo(destinationFile)
                    referralRecordInstance.save flush: true
                }
                catch (Exception ex) {
                    log.error(ex)
                    referralRecordInstance.pedigree = null
                    referralRecordInstance.save flush: true
                }
            }

            if (params.attachedEvidenceFile && params.attachedEvidenceType){
                def attachedEvidenceFile = request.getFile('attachedEvidenceFile')
                if (!attachedEvidenceFile.originalFilename) {
                    flash.message = "Please choose a file"
                    respond referralRecordInstance, view: 'create'
                }else{
                    def attachedEvidenceInstance = new AttachedEvidence(type: params.attachedEvidenceType, addedOn: new Date(), referralRecord: referralRecordInstance)
                    attachedEvidenceInstance.save flush: true
                    attachedEvidenceInstance.content = grailsApplication.config.uploadFolder +'Attached_Evidence/'+ attachedEvidenceInstance.id.toString() + '.' + attachedEvidenceFile.originalFilename
                    def destinationFile = new File(attachedEvidenceInstance.content)

                    try {
                        attachedEvidenceFile.transferTo(destinationFile)
                        attachedEvidenceInstance.save flush: true
                    }
                    catch (Exception ex) {
                        log.error(ex)
                    }
                }
            }

            if (params.attachedEvidenceFile1 && params.attachedEvidenceType1){
                def attachedEvidenceFile = request.getFile('attachedEvidenceFile1')
                if (!attachedEvidenceFile.originalFilename) {
                    flash.message = "Please choose a file"
                    respond referralRecordInstance, view: 'create'
                }else{
                    def attachedEvidenceInstance = new AttachedEvidence(type: params.attachedEvidenceType1, addedOn: new Date(), referralRecord: referralRecordInstance)
                    attachedEvidenceInstance.save flush: true
                    attachedEvidenceInstance.content = grailsApplication.config.uploadFolder +'Attached_Evidence/'+ attachedEvidenceInstance.id.toString() + '.' + attachedEvidenceFile.originalFilename
                    def destinationFile = new File(attachedEvidenceInstance.content)

                    try {
                        attachedEvidenceFile.transferTo(destinationFile)
                        attachedEvidenceInstance.save flush: true
                    }
                    catch (Exception ex) {
                        log.error(ex)
                    }
                }
            }

            if (params.attachedEvidenceFile2 && params.attachedEvidenceType2){
                def attachedEvidenceFile = request.getFile('attachedEvidenceFile2')
                if (!attachedEvidenceFile.originalFilename) {
                    flash.message = "Please choose a file"
                    respond referralRecordInstance, view: 'create'
                }else{
                    def attachedEvidenceInstance = new AttachedEvidence(type: params.attachedEvidenceType2, addedOn: new Date(), referralRecord: referralRecordInstance)
                    attachedEvidenceInstance.save flush: true
                    attachedEvidenceInstance.content = grailsApplication.config.uploadFolder +'Attached_Evidence/'+ attachedEvidenceInstance.id.toString() + '.' + attachedEvidenceFile.originalFilename
                    def destinationFile = new File(attachedEvidenceInstance.content)

                    try {
                        attachedEvidenceFile.transferTo(destinationFile)
                        attachedEvidenceInstance.save flush: true
                    }
                    catch (Exception ex) {
                        log.error(ex)
                    }
                }
            }

            if (params.attachedEvidenceFile3 && params.attachedEvidenceType3){
                def attachedEvidenceFile = request.getFile('attachedEvidenceFile3')
                if (!attachedEvidenceFile.originalFilename) {
                    flash.message = "Please choose a file"
                    respond referralRecordInstance, view: 'create'
                }else{
                    def attachedEvidenceInstance = new AttachedEvidence(type: params.attachedEvidenceType3, addedOn: new Date(), referralRecord: referralRecordInstance)
                    attachedEvidenceInstance.save flush: true
                    attachedEvidenceInstance.content = grailsApplication.config.uploadFolder +'Attached_Evidence/'+ attachedEvidenceInstance.id.toString() + '.' + attachedEvidenceFile.originalFilename
                    def destinationFile = new File(attachedEvidenceInstance.content)

                    try {
                        attachedEvidenceFile.transferTo(destinationFile)
                        attachedEvidenceInstance.save flush: true
                    }
                    catch (Exception ex) {
                        log.error(ex)
                    }
                }
            }

            if (params.attachedEvidenceFile4 && params.attachedEvidenceType4){
                def attachedEvidenceFile = request.getFile('attachedEvidenceFile4')
                if (!attachedEvidenceFile.originalFilename) {
                    flash.message = "Please choose a file"
                    respond referralRecordInstance, view: 'create'
                }else{
                    def attachedEvidenceInstance = new AttachedEvidence(type: params.attachedEvidenceType4, addedOn: new Date(), referralRecord: referralRecordInstance)
                    attachedEvidenceInstance.save flush: true
                    attachedEvidenceInstance.content = grailsApplication.config.uploadFolder +'Attached_Evidence/'+ attachedEvidenceInstance.id.toString() + '.' + attachedEvidenceFile.originalFilename
                    def destinationFile = new File(attachedEvidenceInstance.content)

                    try {
                        attachedEvidenceFile.transferTo(destinationFile)
                        attachedEvidenceInstance.save flush: true
                    }
                    catch (Exception ex) {
                        log.error(ex)
                    }
                }
            }

            if (params.attachedEvidenceFile5 && params.attachedEvidenceType5){
                def attachedEvidenceFile = request.getFile('attachedEvidenceFile5')
                if (!attachedEvidenceFile.originalFilename) {
                    flash.message = "Please choose a file"
                    respond referralRecordInstance, view: 'create'
                }else{
                    def attachedEvidenceInstance = new AttachedEvidence(type: params.attachedEvidenceType5, addedOn: new Date(), referralRecord: referralRecordInstance)
                    attachedEvidenceInstance.save flush: true
                    attachedEvidenceInstance.content = grailsApplication.config.uploadFolder +'Attached_Evidence/'+ attachedEvidenceInstance.id.toString() + '.' + attachedEvidenceFile.originalFilename
                    def destinationFile = new File(attachedEvidenceInstance.content)

                    try {
                        attachedEvidenceFile.transferTo(destinationFile)
                        attachedEvidenceInstance.save flush: true
                    }
                    catch (Exception ex) {
                        log.error(ex)
                    }
                }
            }

            flash.message = "Application ${referralRecordInstance.uniqueRef} is created"
            redirect referralRecordInstance
        }
    }

    def edit(ReferralRecord referralRecordInstance) {
        respond referralRecordInstance
    }

    @Transactional
    def updateStatus(){
        def referralRecordInstance = ReferralRecord.findById(params.long('referralRecord'))
        referralRecordInstance.referralStatus = ReferralStatus.findById(params.long('referralStatus'))
        if (referralRecordInstance.referralStatus.referralStatusName == 'Submitted'){
            referralRecordInstance.submittedDate = new Date()
        }
        referralRecordInstance.save()
        flash.message = "Application status updated on ${referralRecordInstance?.submittedDate}"
        redirect referralRecordInstance
    }

    @Transactional
    def update(ReferralRecord referralRecordInstance) {
        if (referralRecordInstance == null) {
            notFound()
            return
        }

        if (referralRecordInstance.hasErrors()) {
            respond referralRecordInstance.errors, view: 'edit'
            return
        }

        referralRecordInstance.save flush: true

        def proband = Patient.findByReferralRecordAndIsProband(referralRecordInstance, true)

        proband.nhsNumber = params.nhsNumberProband
        proband.gender = Gender.findById(params.long('genderProband'))
        proband.ethnicity = Ethnicity.findById(params.long('ethnicityProband'))
        proband.otherEthnicity = params.otherEthnicityProband
        proband.age = params.int('ageProband')
        proband.ageUnit = AgeUnit.findById(params.long('egeUnitProband'))
        proband.givenName = params.givenName
        proband.familyName = params.familyName
        proband.save flush: true

        def oldClinicalDetails = ClinicalDetails.findAllByReferralRecord(referralRecordInstance)
        if (!oldClinicalDetails.empty){
            oldClinicalDetails.each {it.delete flush: true}
        }

        List<ClinicalDetails> clinicalDetailsList = new ArrayList<ClinicalDetails>();
        if (params.cDetails0) {
            clinicalDetailsList.add(new ClinicalDetails(clinicalDetailsName: params.cDetails0))
        }
        if (params.cDetails1) {
            clinicalDetailsList.add(new ClinicalDetails(clinicalDetailsName: params.cDetails1))
        }
        if (params.cDetails2) {
            clinicalDetailsList.add(new ClinicalDetails(clinicalDetailsName: params.cDetails2))
        }
        if (params.cDetails3) {
            clinicalDetailsList.add(new ClinicalDetails(clinicalDetailsName: params.cDetails3))
        }
        if (params.cDetails4) {
            clinicalDetailsList.add(new ClinicalDetails(clinicalDetailsName: params.cDetails4))
        }
        if (params.cDetails5) {
            clinicalDetailsList.add(new ClinicalDetails(clinicalDetailsName: params.cDetails5))
        }
        if (params.cDetails6) {
            clinicalDetailsList.add(new ClinicalDetails(clinicalDetailsName: params.cDetails6))
        }
        if (!clinicalDetailsList.empty) {
            for (int i = 0; i < clinicalDetailsList.size(); i++) {
                referralRecordInstance.addToClinicalDetails(clinicalDetailsList.get(i)).save flush: true
            }
            referralRecordInstance.save flush: true
        }

        def oldCoApplicants = CoApplicant.findAllByReferralRecord(referralRecordInstance)
        if (!oldCoApplicants.empty){
            for (int i =0; i < oldCoApplicants.size(); i++){
                referralRecordInstance.removeFromCoApplicants(oldCoApplicants.get(i))
            }
            referralRecordInstance.save flush: true
        }
        List<CoApplicant> coApplicantList = new ArrayList<CoApplicant>();
        if (Clinician.findById(params.long('coapplicant1'))) {
            def clinician = Clinician.findById(params.long('coapplicant1'))
            coApplicantList.add(new CoApplicant(coApplicant: clinician))
        }

        if (Clinician.findById(params.long('coapplicant2'))) {
            def clinician = Clinician.findById(params.long('coapplicant2'))
            coApplicantList.add(new CoApplicant(coApplicant: clinician))
        }

        if (Clinician.findById(params.long('coapplicant3'))) {
            def clinician = Clinician.findById(params.long('coapplicant3'))
            coApplicantList.add(new CoApplicant(coApplicant: clinician))
        }

        if (Clinician.findById(params.long('coapplicant4'))) {
            def clinician = Clinician.findById(params.long('coapplicant4'))
            coApplicantList.add(new CoApplicant(coApplicant: clinician))
        }

        if (Clinician.findById(params.long('coapplicant5'))) {
            def clinician = Clinician.findById(params.long('coapplicant5'))
            coApplicantList.add(new CoApplicant(coApplicant: clinician))
        }

        if (!coApplicantList.empty) {
            for (int i = 0; i < coApplicantList.size(); i++) {
                referralRecordInstance.addToCoApplicants(coApplicantList.get(i)).save flush: true
            }
        }

        def paternal = Paternal.findByReferralRecord(referralRecordInstance)
        paternal.breastAndOrOvarianCancer = params.boolean('breastAndOrOvarianCancerPaternal')
        paternal.colorectalCancer = params.boolean('colorectalCancerPaternal')
        paternal.ischaemicHeartDiseaseOrStroke = params.boolean('ischaemicHeartDiseaseOrStrokePaternal')
        paternal.endocrineTumours = params.boolean('endocrineTumoursPaternal')
        paternal.save flush: true

        def maternal = Maternal.findByReferralRecord(referralRecordInstance)
        maternal.breastAndOrOvarianCancer = params.boolean('breastAndOrOvarianCancerMaternal')
        maternal.colorectalCancer = params.boolean('colorectalCancerMaternal')
        maternal.ischaemicHeartDiseaseOrStroke = params.boolean('ischaemicHeartDiseaseOrStrokeMaternal')
        maternal.endocrineTumours = params.boolean('endocrineTumoursMaternal')
        maternal.save flush: true

        if (params.ethnicityFather) {
            def father = referralRecordInstance?.patients?.find{p -> p?.relatedFrom?.relationshipType == RelationshipType.findByRelationshipTypeName('Father')}
            if (father){
                father.ethnicity = Ethnicity.findById(params.long('ethnicityFather'))
                father.save flush: true
            }else {
                def patient = new Patient(isProband: false, referralRecord: referralRecordInstance, ethnicity: params.ethnicityFather).save flush: true
                new Relationship(relationshipType: RelationshipType.findByRelationshipTypeName('Father'), patient: proband, relatedPatient: patient).save flush: true
            }
        }

        if (params.ethnicityMother) {
            def mother = referralRecordInstance?.patients?.find{p -> p?.relatedFrom?.relationshipType == RelationshipType.findByRelationshipTypeName('Mother')}
            if (mother){
                mother.ethnicity = Ethnicity.findById(params.long('ethnicityMother'))
                mother.save flush: true
            }else {
                def patient = new Patient(isProband: false, referralRecord: referralRecordInstance, ethnicity: params.ethnicityFather).save flush: true
                new Relationship(relationshipType: RelationshipType.findByRelationshipTypeName('Mother'), patient: proband, relatedPatient: patient).save flush: true
            }
        }

        if (params.extraTestsRequested) {
            def extraTest = ExtraTests.findByReferralRecord(referralRecordInstance)
            if (extraTest){
                extraTest.testName = params.extraTestsRequested
                if (params.requestedDate){
                    extraTest.requestedDate = new Date().parse("yyyy-MM-dd", params.requestedDate)
                }else {
                    extraTest.requestedDate = null
                }
                extraTest.save flush: true
            }else {
                extraTest = new ExtraTests(testName: params.extraTestsRequested, requestedDate: params.requestedDate)
                referralRecordInstance.addToExtraTests(extraTest).save flush: true
            }
        }

        if (Clinician.findById(params.long('correspondingClinician'))) {
            def correspondingClinician = Clinician.findById(params.long('correspondingClinician'))
            referralRecordInstance.correspondingClinician = correspondingClinician
            referralRecordInstance.save flush: true
        } else {
            referralRecordInstance.correspondingClinician = referralRecordInstance.clinician
            referralRecordInstance.save flush: true
        }

        def pedigreeFile = request.getFile('pedigreeFile')
        if (pedigreeFile?.originalFilename) {
            if (pedigreeFile?.empty) {
                flash.message = "File cannot be empty"
                respond referralRecordInstance.errors, view: 'create'
                return
            }
            referralRecordInstance.pedigree = grailsApplication.config.uploadFolder + 'Pedigree/' +
                    referralRecordInstance.id.toString() + '.' + pedigreeFile.originalFilename
            def destinationFile = new File(referralRecordInstance.pedigree)

            try {
                pedigreeFile.transferTo(destinationFile)
                referralRecordInstance.save flush: true
            }
            catch (Exception ex) {
                log.error(ex)
                referralRecordInstance.pedigree = null
                referralRecordInstance.save flush: true
            }
        }

        if (params.attachedEvidenceFile1 && params.attachedEvidenceType1){
            def attachedEvidenceFile = request.getFile('attachedEvidenceFile1')
            if (!attachedEvidenceFile.originalFilename) {
                flash.message = "Please choose a file"
                respond referralRecordInstance, view: 'create'
            }else{
                def attachedEvidenceInstance = new AttachedEvidence(type: params.attachedEvidenceType1, addedOn: new Date(), referralRecord: referralRecordInstance)
                attachedEvidenceInstance.save flush: true
                attachedEvidenceInstance.content = grailsApplication.config.uploadFolder +'Attached_Evidence/'+ attachedEvidenceInstance.id.toString() + '.' + attachedEvidenceFile.originalFilename
                def destinationFile = new File(attachedEvidenceInstance.content)

                try {
                    attachedEvidenceFile.transferTo(destinationFile)
                    attachedEvidenceInstance.save flush: true
                }
                catch (Exception ex) {
                    log.error(ex)
                }
            }
        }

        if (params.attachedEvidenceFile2 && params.attachedEvidenceType2){
            def attachedEvidenceFile = request.getFile('attachedEvidenceFile2')
            if (!attachedEvidenceFile.originalFilename) {
                flash.message = "Please choose a file"
                respond referralRecordInstance, view: 'create'
            }else{
                def attachedEvidenceInstance = new AttachedEvidence(type: params.attachedEvidenceType2, addedOn: new Date(), referralRecord: referralRecordInstance)
                attachedEvidenceInstance.save flush: true
                attachedEvidenceInstance.content = grailsApplication.config.uploadFolder +'Attached_Evidence/'+ attachedEvidenceInstance.id.toString() + '.' + attachedEvidenceFile.originalFilename
                def destinationFile = new File(attachedEvidenceInstance.content)

                try {
                    attachedEvidenceFile.transferTo(destinationFile)
                    attachedEvidenceInstance.save flush: true
                }
                catch (Exception ex) {
                    log.error(ex)
                }
            }
        }

        if (params.attachedEvidenceFile3 && params.attachedEvidenceType3){
            def attachedEvidenceFile = request.getFile('attachedEvidenceFile3')
            if (!attachedEvidenceFile.originalFilename) {
                flash.message = "Please choose a file"
                respond referralRecordInstance, view: 'create'
            }else{
                def attachedEvidenceInstance = new AttachedEvidence(type: params.attachedEvidenceType3, addedOn: new Date(), referralRecord: referralRecordInstance)
                attachedEvidenceInstance.save flush: true
                attachedEvidenceInstance.content = grailsApplication.config.uploadFolder +'Attached_Evidence/'+ attachedEvidenceInstance.id.toString() + '.' + attachedEvidenceFile.originalFilename
                def destinationFile = new File(attachedEvidenceInstance.content)

                try {
                    attachedEvidenceFile.transferTo(destinationFile)
                    attachedEvidenceInstance.save flush: true
                }
                catch (Exception ex) {
                    log.error(ex)
                }
            }
        }

        if (params.attachedEvidenceFile4 && params.attachedEvidenceType4){
            def attachedEvidenceFile = request.getFile('attachedEvidenceFile4')
            if (!attachedEvidenceFile.originalFilename) {
                flash.message = "Please choose a file"
                respond referralRecordInstance, view: 'create'
            }else{
                def attachedEvidenceInstance = new AttachedEvidence(type: params.attachedEvidenceType4, addedOn: new Date(), referralRecord: referralRecordInstance)
                attachedEvidenceInstance.save flush: true
                attachedEvidenceInstance.content = grailsApplication.config.uploadFolder +'Attached_Evidence/'+ attachedEvidenceInstance.id.toString() + '.' + attachedEvidenceFile.originalFilename
                def destinationFile = new File(attachedEvidenceInstance.content)

                try {
                    attachedEvidenceFile.transferTo(destinationFile)
                    attachedEvidenceInstance.save flush: true
                }
                catch (Exception ex) {
                    log.error(ex)
                }
            }
        }

        if (params.attachedEvidenceFile5 && params.attachedEvidenceType5){
            def attachedEvidenceFile = request.getFile('attachedEvidenceFile5')
            if (!attachedEvidenceFile.originalFilename) {
                flash.message = "Please choose a file"
                respond referralRecordInstance, view: 'create'
            }else{
                def attachedEvidenceInstance = new AttachedEvidence(type: params.attachedEvidenceType5, addedOn: new Date(), referralRecord: referralRecordInstance)
                attachedEvidenceInstance.save flush: true
                attachedEvidenceInstance.content = grailsApplication.config.uploadFolder +'Attached_Evidence/'+ attachedEvidenceInstance.id.toString() + '.' + attachedEvidenceFile.originalFilename
                def destinationFile = new File(attachedEvidenceInstance.content)

                try {
                    attachedEvidenceFile.transferTo(destinationFile)
                    attachedEvidenceInstance.save flush: true
                }
                catch (Exception ex) {
                    log.error(ex)
                }
            }
        }

        flash.message = "Application updated"
        redirect referralRecordInstance
    }

    @Transactional
    def delete(ReferralRecord referralRecordInstance) {

        if (referralRecordInstance == null) {
            notFound()
            return
        }

        if (referralRecordInstance.pedigree){
            def pedigreeFile = new File(referralRecordInstance.pedigree)
            if (pedigreeFile.exists()){
                boolean fileDeletedSuccessfully = new File(referralRecordInstance.pedigree).delete()
                if (fileDeletedSuccessfully){
                    referralRecordInstance.delete flush: true
                    flash.message = "Application has been deleted"
                    redirect action: "index", method: "GET"
                } else{
                    flash.message = "Could not delete the pedigree file"
                    redirect action: "index", method: "GET"
                }
            }

        }else {
            referralRecordInstance.delete flush: true
            flash.message = "Application has been deleted"
            redirect action: "index", method: "GET"
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'referralRecordInstance.label', default: 'ReferralRecord'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
