package rdmdt

import grails.plugins.springsecurity.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * AttachedEvidenceController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Secured(['ROLE_USER', 'ROLE_ADMIN'])
@Transactional(readOnly = true)
class AttachedEvidenceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AttachedEvidence.list(params), model: [attachedEvidenceInstanceCount: AttachedEvidence.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AttachedEvidence.list(params), model: [attachedEvidenceInstanceCount: AttachedEvidence.count()]
    }

    def show(AttachedEvidence attachedEvidenceInstance) {
        respond attachedEvidenceInstance
    }

    def create() {
        respond new AttachedEvidence(params)
    }

    @Transactional
    def save(AttachedEvidence attachedEvidenceInstance) {
        if (attachedEvidenceInstance == null) {
            notFound()
            return
        }

        if (attachedEvidenceInstance.hasErrors()) {
            respond attachedEvidenceInstance.errors, view: 'create'
            return
        }

        attachedEvidenceInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'attachedEvidenceInstance.label', default: 'AttachedEvidence'), attachedEvidenceInstance.id])
                redirect attachedEvidenceInstance
            }
            '*' { respond attachedEvidenceInstance, [status: CREATED] }
        }
    }

    def edit(AttachedEvidence attachedEvidenceInstance) {
        respond attachedEvidenceInstance
    }

    @Transactional
    def update(AttachedEvidence attachedEvidenceInstance) {
        if (attachedEvidenceInstance == null) {
            notFound()
            return
        }

        if (attachedEvidenceInstance.hasErrors()) {
            respond attachedEvidenceInstance.errors, view: 'edit'
            return
        }

        attachedEvidenceInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AttachedEvidence.label', default: 'AttachedEvidence'), attachedEvidenceInstance.id])
                redirect attachedEvidenceInstance
            }
            '*' { respond attachedEvidenceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AttachedEvidence attachedEvidenceInstance) {

        if (attachedEvidenceInstance == null) {
            notFound()
            return
        }

        attachedEvidenceInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AttachedEvidence.label', default: 'AttachedEvidence'), attachedEvidenceInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'attachedEvidenceInstance.label', default: 'AttachedEvidence'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
