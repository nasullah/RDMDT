package rdmdt

import grails.plugins.springsecurity.Secured
import org.apache.commons.lang.BooleanUtils
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
    def wordProcessingService
    static allowedMethods = [save: "POST", update: ["PUT", "POST"], delete: "DELETE"]

    @Secured(['ROLE_ADMIN'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ReferralRecord.list(params).sort {it?.referralStatus?.referralStatusName}, model: [referralRecordInstanceCount: ReferralRecord.count()]
    }

    def exportWord = {
        def referralRecordInstance = ReferralRecord.findById(params.long('referralRecordId'))
        wordProcessingService.processingWordDocument(referralRecordInstance)
    }

    @Secured(['ROLE_ADMIN'])
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
        def currentUser = springSecurityService?.currentUser?.username
        def currentClinician = null
        if (currentUser?.toString()?.contains('.')){
            def forename = currentUser?.toString()?.split("\\.")[0]
            def surname = currentUser?.toString()?.split("\\.")[1]
            currentClinician = Clinician.createCriteria().get {
                and{
                    eq("forename", forename, [ignoreCase: true])
                    eq("surname", surname, [ignoreCase: true])
                }
            }
        }
        respond referralRecordInstance, model: [currentClinician:currentClinician]
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
        def currentUser = springSecurityService?.currentUser?.username
        if (springSecurityService.authentication.authorities.find {it.authority == 'ROLE_ADMIN'}){
            respond referralRecordInstance
        }else {
            def clinician
            if (currentUser?.toString()?.contains('.')){
                def forename = currentUser?.toString()?.split("\\.")[0]
                def surname = currentUser?.toString()?.split("\\.")[1]
                clinician = Clinician.createCriteria().get {
                    and{
                        eq("forename", forename, [ignoreCase: true])
                        eq("surname", surname, [ignoreCase: true])
                    }
                }
            }
            if (clinician){
                if (referralRecordInstance.clinician == clinician || referralRecordInstance.correspondingClinician == clinician){
                    respond referralRecordInstance
                }else {
                    flash.message = "You cannot edit this application"
                    redirect(action: 'show', params: [id: referralRecordInstance.id])
                }
            }
        }
    }

    @Transactional
    def updateStatus(){
        def referralRecordInstance = ReferralRecord.findById(params.long('referralRecord'))
        referralRecordInstance.referralStatus = ReferralStatus.findById(params.long('referralStatus'))
        if (referralRecordInstance.referralStatus.referralStatusName == 'Submitted'){
            referralRecordInstance.submittedDate = new Date()
        }
        if (referralRecordInstance.referralStatus.referralStatusName == 'Approved'){
            referralRecordInstance.approvedDate = new Date()
        }
        referralRecordInstance.save flush: true
        flash.message = "Application status updated on ${referralRecordInstance?.submittedDate}"
        redirect referralRecordInstance
    }

    @Transactional
    def updateReviewDetails(){
        def referralRecordInstance = ReferralRecord.findById(params.long('referralRecord'))
        referralRecordInstance.reviewDetails = params.reviewDetails
        referralRecordInstance.referralStatus = ReferralStatus.findByReferralStatusName('Review Submitted')
        referralRecordInstance.save flush: true
        flash.message = "Thank you for reviewing the application"
        redirect(action: 'show', params: [id: referralRecordInstance.id])
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
            oldCoApplicants.each {it.delete flush: true}
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
        paternal.breastAndOrOvarianCancer = FamilyHistoryType.findById(params.long('breastAndOrOvarianCancerPaternal'))
        paternal.colorectalCancer = FamilyHistoryType.findById(params.long('colorectalCancerPaternal'))
        paternal.ischaemicHeartDiseaseOrStroke = FamilyHistoryType.findById(params.long('ischaemicHeartDiseaseOrStrokePaternal'))
        paternal.endocrineTumours = FamilyHistoryType.findById(params.long('endocrineTumoursPaternal'))
        paternal.save flush: true

        def maternal = Maternal.findByReferralRecord(referralRecordInstance)
        maternal.breastAndOrOvarianCancer = FamilyHistoryType.findById(params.long('breastAndOrOvarianCancerMaternal'))
        maternal.colorectalCancer = FamilyHistoryType.findById(params.long('colorectalCancerMaternal'))
        maternal.ischaemicHeartDiseaseOrStroke = FamilyHistoryType.findById(params.long('ischaemicHeartDiseaseOrStrokeMaternal'))
        maternal.endocrineTumours = FamilyHistoryType.findById(params.long('endocrineTumoursMaternal'))
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

        def currentUser = springSecurityService?.currentUser?.username
        if (springSecurityService.authentication.authorities.find {it.authority == 'ROLE_ADMIN'}){
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
        }else {
            def clinician
            if (currentUser?.toString()?.contains('.')){
                def forename = currentUser?.toString()?.split("\\.")[0]
                def surname = currentUser?.toString()?.split("\\.")[1]
                clinician = Clinician.createCriteria().get {
                    and{
                        eq("forename", forename, [ignoreCase: true])
                        eq("surname", surname, [ignoreCase: true])
                    }
                }
            }
            if (clinician){
                if (referralRecordInstance.clinician == clinician || referralRecordInstance.correspondingClinician == clinician){
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
                }else {
                    flash.message = "You cannot delete this application"
                    redirect(action: 'show', params: [id: referralRecordInstance.id])
                }
            }
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
