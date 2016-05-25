package rdmdt

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * ClinicianController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class ClinicianController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Clinician.list(params), model: [clinicianInstanceCount: Clinician.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Clinician.list(params), model: [clinicianInstanceCount: Clinician.count()]
    }

    def show(Clinician clinicianInstance) {
        respond clinicianInstance
    }

    def create() {
        respond new Clinician(params)
    }

    def findClinician(){
        def listClinician = Clinician.createCriteria().listDistinct{
            ilike("name", "%${params.query}%")
        }
        render(contentType: "text/xml") {
            results() {
                listClinician.each { clinician ->
                    result(){
                        name(clinician)
                        //Optional id which will be available in onItemSelect
                        id(clinician.id)
                    }
                }
            }
        }
    }

    @Transactional
    def save(Clinician clinicianInstance) {
        if (clinicianInstance == null) {
            notFound()
            return
        }

        if (clinicianInstance.hasErrors()) {
            respond clinicianInstance.errors, view: 'create'
            return
        }

        clinicianInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clinicianInstance.label', default: 'Clinician'), clinicianInstance.id])
                redirect clinicianInstance
            }
            '*' { respond clinicianInstance, [status: CREATED] }
        }
    }

    def edit(Clinician clinicianInstance) {
        respond clinicianInstance
    }

    @Transactional
    def update(Clinician clinicianInstance) {
        if (clinicianInstance == null) {
            notFound()
            return
        }

        if (clinicianInstance.hasErrors()) {
            respond clinicianInstance.errors, view: 'edit'
            return
        }

        clinicianInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Clinician.label', default: 'Clinician'), clinicianInstance.id])
                redirect clinicianInstance
            }
            '*' { respond clinicianInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Clinician clinicianInstance) {

        if (clinicianInstance == null) {
            notFound()
            return
        }

        clinicianInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Clinician.label', default: 'Clinician'), clinicianInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clinicianInstance.label', default: 'Clinician'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
