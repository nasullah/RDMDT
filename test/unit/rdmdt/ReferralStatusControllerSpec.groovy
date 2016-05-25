package rdmdt


import grails.test.mixin.*
import spock.lang.*

@TestFor(ReferralStatusController)
@Mock(ReferralStatus)
class ReferralStatusControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.referralStatusInstanceList
        model.referralStatusInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.referralStatusInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def referralStatus = new ReferralStatus()
        referralStatus.validate()
        controller.save(referralStatus)

        then: "The create view is rendered again with the correct model"
        model.referralStatusInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        referralStatus = new ReferralStatus(params)

        controller.save(referralStatus)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/referralStatus/show/1'
        controller.flash.message != null
        ReferralStatus.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def referralStatus = new ReferralStatus(params)
        controller.show(referralStatus)

        then: "A model is populated containing the domain instance"
        model.referralStatusInstance == referralStatus
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def referralStatus = new ReferralStatus(params)
        controller.edit(referralStatus)

        then: "A model is populated containing the domain instance"
        model.referralStatusInstance == referralStatus
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/referralStatus/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def referralStatus = new ReferralStatus()
        referralStatus.validate()
        controller.update(referralStatus)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.referralStatusInstance == referralStatus

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        referralStatus = new ReferralStatus(params).save(flush: true)
        controller.update(referralStatus)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/referralStatus/show/$referralStatus.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/referralStatus/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def referralStatus = new ReferralStatus(params).save(flush: true)

        then: "It exists"
        ReferralStatus.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(referralStatus)

        then: "The instance is deleted"
        ReferralStatus.count() == 0
        response.redirectedUrl == '/referralStatus/index'
        flash.message != null
    }
}
