package rdmdt

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * EgeUnitController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_ADMIN'])
@Transactional(readOnly = true)
class EgeUnitController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EgeUnit.list(params), model: [egeUnitInstanceCount: EgeUnit.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EgeUnit.list(params), model: [egeUnitInstanceCount: EgeUnit.count()]
    }

    def show(EgeUnit egeUnitInstance) {
        respond egeUnitInstance
    }

    def create() {
        respond new EgeUnit(params)
    }

    @Transactional
    def save(EgeUnit egeUnitInstance) {
        if (egeUnitInstance == null) {
            notFound()
            return
        }

        if (egeUnitInstance.hasErrors()) {
            respond egeUnitInstance.errors, view: 'create'
            return
        }

        egeUnitInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'egeUnitInstance.label', default: 'EgeUnit'), egeUnitInstance.id])
                redirect egeUnitInstance
            }
            '*' { respond egeUnitInstance, [status: CREATED] }
        }
    }

    def edit(EgeUnit egeUnitInstance) {
        respond egeUnitInstance
    }

    @Transactional
    def update(EgeUnit egeUnitInstance) {
        if (egeUnitInstance == null) {
            notFound()
            return
        }

        if (egeUnitInstance.hasErrors()) {
            respond egeUnitInstance.errors, view: 'edit'
            return
        }

        egeUnitInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EgeUnit.label', default: 'EgeUnit'), egeUnitInstance.id])
                redirect egeUnitInstance
            }
            '*' { respond egeUnitInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EgeUnit egeUnitInstance) {

        if (egeUnitInstance == null) {
            notFound()
            return
        }

        egeUnitInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EgeUnit.label', default: 'EgeUnit'), egeUnitInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'egeUnitInstance.label', default: 'EgeUnit'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
