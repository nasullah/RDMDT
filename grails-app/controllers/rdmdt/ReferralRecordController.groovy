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

            request.withFormat {
                form {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'referralRecordInstance.label', default: 'ReferralRecord'), referralRecordInstance.id])
                    redirect referralRecordInstance
                }
                '*' { respond referralRecordInstance, [status: CREATED] }
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

        referralRecordInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ReferralRecord.label', default: 'ReferralRecord'), referralRecordInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
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
