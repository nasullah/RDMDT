package rdmdt

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * OMIMController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class OMIMController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OMIM.list(params), model: [OMIMInstanceCount: OMIM.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OMIM.list(params), model: [OMIMInstanceCount: OMIM.count()]
    }

    def show(OMIM OMIMInstance) {
        respond OMIMInstance
    }

    def create() {
        respond new OMIM(params)
    }

    @Transactional
    def save(OMIM OMIMInstance) {
        if (OMIMInstance == null) {
            notFound()
            return
        }

        if (OMIMInstance.hasErrors()) {
            respond OMIMInstance.errors, view: 'create'
            return
        }

        OMIMInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'OMIMInstance.label', default: 'OMIM'), OMIMInstance.id])
                redirect OMIMInstance
            }
            '*' { respond OMIMInstance, [status: CREATED] }
        }
    }

    def edit(OMIM OMIMInstance) {
        respond OMIMInstance
    }

    @Transactional
    def update(OMIM OMIMInstance) {
        if (OMIMInstance == null) {
            notFound()
            return
        }

        if (OMIMInstance.hasErrors()) {
            respond OMIMInstance.errors, view: 'edit'
            return
        }

        OMIMInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OMIM.label', default: 'OMIM'), OMIMInstance.id])
                redirect OMIMInstance
            }
            '*' { respond OMIMInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OMIM OMIMInstance) {

        if (OMIMInstance == null) {
            notFound()
            return
        }

        OMIMInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OMIM.label', default: 'OMIM'), OMIMInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'OMIMInstance.label', default: 'OMIM'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
