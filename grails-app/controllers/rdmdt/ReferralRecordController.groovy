package rdmdt

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ReferralRecordController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class ReferralRecordController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ReferralRecord.list(params), model: [referralRecordInstanceCount: ReferralRecord.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ReferralRecord.list(params), model: [referralRecordInstanceCount: ReferralRecord.count()]
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
                                  otherEthnicity: params.otherEthnicityProband, ege: params.ageProband, egeUnit: params.egeUnitProband)
        if (proband){
            referralRecordInstance.addToPatients(proband)
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

            List<UnrelatedClinicalFeatures> unrelatedClinicalFeaturesList = new ArrayList<UnrelatedClinicalFeatures>();
            if (params.unrelatedFeature0){
                unrelatedClinicalFeaturesList.add(new UnrelatedClinicalFeatures(unrelatedClinicalFeatures: params.unrelatedFeature0))
            }
            if (params.unrelatedFeature1){
                unrelatedClinicalFeaturesList.add(new UnrelatedClinicalFeatures(unrelatedClinicalFeatures:params.unrelatedFeature1))
            }
            if (params.unrelatedFeature2){
                unrelatedClinicalFeaturesList.add(new UnrelatedClinicalFeatures(unrelatedClinicalFeatures:params.unrelatedFeature2))
            }
            if (params.unrelatedFeature3){
                unrelatedClinicalFeaturesList.add(new UnrelatedClinicalFeatures(unrelatedClinicalFeatures:params.unrelatedFeature3))
            }
            if (params.unrelatedFeature4){
                unrelatedClinicalFeaturesList.add(new UnrelatedClinicalFeatures(unrelatedClinicalFeatures:params.unrelatedFeature4))
            }
            if (params.unrelatedFeature5){
                unrelatedClinicalFeaturesList.add(new UnrelatedClinicalFeatures(unrelatedClinicalFeatures:params.unrelatedFeature5))
            }
            if (params.unrelatedFeature6){
                unrelatedClinicalFeaturesList.add(new UnrelatedClinicalFeatures(unrelatedClinicalFeatures:params.unrelatedFeature6))
            }
            if (!unrelatedClinicalFeaturesList.empty){
                for (int i = 0; i <unrelatedClinicalFeaturesList.size(); i++ ){
                    referralRecordInstance.addToUnrelatedClinicalFeatures(unrelatedClinicalFeaturesList.get(i)).save flush: true
                }
            }

            new Paternal(breastAndOrOvarianCancer: params.breastAndOrOvarianCancerPaternal.asBoolean(), colorectalCancer: params.colorectalCancerPaternal.asBoolean(),
                    ischaemicHeartDiseaseOrStroke: params.ischaemicHeartDiseaseOrStrokePaternal.asBoolean(), endocrineTumours: params.endocrineTumoursPaternal.asBoolean(), referralRecord: referralRecordInstance).save flush: true

            new Maternal(breastAndOrOvarianCancer: params.breastAndOrOvarianCancerMaternal.asBoolean(), colorectalCancer: params.colorectalCancerMaternal.asBoolean(),
                    ischaemicHeartDiseaseOrStroke: params.ischaemicHeartDiseaseOrStrokeMaternal.asBoolean(), endocrineTumours: params.endocrineTumoursMaternal.asBoolean(), referralRecord: referralRecordInstance).save flush: true

            if (params.relationshipToProband1){
                def ethnicity = params.ethnicity1
                if(ethnicity == 'null'){
                    ethnicity = proband.ethnicity
                }
                def patient = new Patient(isProband: false, availableForOAR: params.availableForOAR1.asBoolean(), referralRecord: referralRecordInstance, ethnicity: ethnicity).save flush: true
                new Relationship(relationshipType: params.relationshipToProband1, patient: proband, relatedPatient: patient).save flush: true
            }

            if (params.relationshipToProband2){
                def ethnicity = params.ethnicity2
                if(ethnicity == 'null'){
                    ethnicity = proband.ethnicity
                }
                def patient = new Patient(isProband: false, availableForOAR: params.availableForOAR2.asBoolean(), referralRecord: referralRecordInstance, ethnicity: ethnicity).save flush: true
                new Relationship(relationshipType: params.relationshipToProband2, patient: proband, relatedPatient: patient).save flush: true
            }

            if (params.extraTestsRequested){
                def extraTest = new ExtraTests(testName: params.extraTestsRequested, requestedDate: params.requestedDate)
                referralRecordInstance.addToExtraTests(extraTest).save flush: true
            }

            def file = request.getFile('pedigreeFile')
            if (file?.originalFilename){
                if (file?.empty) {
                    flash.message = "File cannot be empty"
                    respond referralRecordInstance.errors, view: 'create'
                    return
                }
                referralRecordInstance.pedigree = grailsApplication.config.uploadFolder +'Pedigree/'+
                        referralRecordInstance.id.toString() + '.' + file.originalFilename
                def destinationFile = new File(referralRecordInstance.pedigree)

                try {
                    file.transferTo(destinationFile)
                    referralRecordInstance.save flush: true
                    flash.message = "Referral Record ${referralRecordInstance.id} is created"
                    redirect referralRecordInstance
                }
                catch (Exception ex) {
                    log.error(ex)
                    referralRecordInstance.pedigree = null
                    referralRecordInstance.save flush: true
                    flash.message = "Referral Record ${referralRecordInstance.id} is created. Pedigree file could not be uploaded."
                    redirect referralRecordInstance
                }

            } else {
                flash.message = "Referral Record ${referralRecordInstance.id} is created"
                redirect referralRecordInstance
            }
        }
    }

    def edit(ReferralRecord referralRecordInstance) {
        respond referralRecordInstance
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
