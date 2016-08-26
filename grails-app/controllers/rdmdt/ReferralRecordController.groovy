package rdmdt

import grails.plugins.springsecurity.Secured
import org.grails.plugin.filterpane.FilterPaneUtils
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ReferralRecordController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class ReferralRecordController {

    def filterPaneService
    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ReferralRecord.list(params), model: [referralRecordInstanceCount: ReferralRecord.count()]
    }

//    def list(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
//        respond ReferralRecord.list(params), model: [referralRecordInstanceCount: ReferralRecord.count()]
//    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [referralRecordInstanceList: ReferralRecord.list(params), referralRecordInstanceTotal: ReferralRecord.count()]
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
            [referralRecordInstanceList: ReferralRecord.findAllByClinician(clinician).sort {it?.referralStatus?.id}]
        }
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

        def proband = new Patient(isProband: true, nhsNumber: params.nhsNumberProband, gender: params.genderProband, ethnicity: params.ethnicityProband,
                                  otherEthnicity: params.otherEthnicityProband, ege: params.ageProband, egeUnit: params.egeUnitProband, givenName: params.givenName, familyName: params.familyName)
        if (proband){
            referralRecordInstance.addToPatients(proband)
            if (params.referralStatus){
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

            print(params.coapplicantForename1)
            print(params.coapplicantSurname1)
            print(params.coapplicantEmail1)
            if (params.coapplicantForename1 && params.coapplicantSurname1){
                def clinician = Clinician.findByForenameAndSurname(params.coapplicantForename1, params.coapplicantSurname1)
                if (!clinician){
                    clinician = new Clinician(forename: params.coapplicantForename1, surname: params.coapplicantSurname1, email: params.coapplicantEmail1).save()
                }
                coApplicantList.add(new CoApplicant(coApplicant: clinician))
            }
            if (params.coapplicantForename2 && params.coapplicantSurname2){
                def clinician = Clinician.findByForenameAndSurname(params.coapplicantForename2, params.coapplicantSurname2)
                if (!clinician){
                    clinician = new Clinician(forename: params.coapplicantForename2, surname: params.coapplicantSurname2, email: params.coapplicantEmail2).save()
                }
                coApplicantList.add(new CoApplicant(coApplicant: clinician))
            }
            if (params.coapplicantForename3 && params.coapplicantSurname3){
                def clinician = Clinician.findByForenameAndSurname(params.coapplicantForename3, params.coapplicantSurname3)
                if (!clinician){
                    clinician = new Clinician(forename: params.coapplicantForename3, surname: params.coapplicantSurname3, email: params.coapplicantEmail3).save()
                }
                coApplicantList.add(new CoApplicant(coApplicant: clinician))
            }
            if (params.coapplicantForename4 && params.coapplicantSurname4){
                def clinician = Clinician.findByForenameAndSurname(params.coapplicantForename4, params.coapplicantSurname4)
                if (!clinician){
                    clinician = new Clinician(forename: params.coapplicantForename4, surname: params.coapplicantSurname4, email: params.coapplicantEmail4).save()
                }
                coApplicantList.add(new CoApplicant(coApplicant: clinician))
            }
            if (params.coapplicantForename5 && params.coapplicantSurname5){
                def clinician = Clinician.findByForenameAndSurname(params.coapplicantForename5, params.coapplicantSurname5)
                if (!clinician){
                    clinician = new Clinician(forename: params.coapplicantForename5, surname: params.coapplicantSurname5, email: params.coapplicantEmail5).save()
                }
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
                def patient = new Patient(isProband: false, referralRecord: referralRecordInstance, ethnicity: ethnicity).save flush: true
                new Relationship(relationshipType: RelationshipType.findByRelationshipTypeName('Father'), patient: proband, relatedPatient: patient).save flush: true
            }

            if (params.ethnicityMother){
                def ethnicity = params.ethnicityMother
                def patient = new Patient(isProband: false, referralRecord: referralRecordInstance, ethnicity: ethnicity).save flush: true
                new Relationship(relationshipType: RelationshipType.findByRelationshipTypeName('Mother'), patient: proband, relatedPatient: patient).save flush: true
            }

            if (params.extraTestsRequested){
                def extraTest = new ExtraTests(testName: params.extraTestsRequested, requestedDate: params.requestedDate)
                referralRecordInstance.addToExtraTests(extraTest).save flush: true
            }

            if (params.correspondingClinicianForename && params.correspondingClinicianSurname){
                def correspondingClinician = new Clinician(forename: params.correspondingClinicianForename, surname: params.correspondingClinicianSurname, email: params.correspondingClinicianEmail).save flush: true
                referralRecordInstance.correspondingClinician = correspondingClinician
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
            flash.message = "Referral Record ${referralRecordInstance.id} is created"
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

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ReferralRecord.label', default: 'ReferralRecord'), referralRecordInstance.id])
                redirect referralRecordInstance
            }
            '*' { respond referralRecordInstance, [status: OK] }
        }
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
                    flash.message = "Referral record instance has been deleted"
                    redirect action: "index", method: "GET"
                } else{
                    flash.message = "Could not delete the pedigree file"
                    redirect action: "index", method: "GET"
                }
            }

        }else {
            referralRecordInstance.delete flush: true
            flash.message = "Referral record instance has been deleted"
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
