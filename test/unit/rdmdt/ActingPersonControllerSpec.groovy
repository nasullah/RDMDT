package rdmdt


import grails.test.mixin.*
import spock.lang.*

@TestFor(ActingPersonController)
@Mock(ActingPerson)
class ActingPersonControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.actingPersonInstanceList
        model.actingPersonInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.actingPersonInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def actingPerson = new ActingPerson()
        actingPerson.validate()
        controller.save(actingPerson)

        then: "The create view is rendered again with the correct model"
        model.actingPersonInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        actingPerson = new ActingPerson(params)

        controller.save(actingPerson)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/actingPerson/show/1'
        controller.flash.message != null
        ActingPerson.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def actingPerson = new ActingPerson(params)
        controller.show(actingPerson)

        then: "A model is populated containing the domain instance"
        model.actingPersonInstance == actingPerson
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def actingPerson = new ActingPerson(params)
        controller.edit(actingPerson)

        then: "A model is populated containing the domain instance"
        model.actingPersonInstance == actingPerson
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/actingPerson/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def actingPerson = new ActingPerson()
        actingPerson.validate()
        controller.update(actingPerson)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.actingPersonInstance == actingPerson

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        actingPerson = new ActingPerson(params).save(flush: true)
        controller.update(actingPerson)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/actingPerson/show/$actingPerson.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/actingPerson/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def actingPerson = new ActingPerson(params).save(flush: true)

        then: "It exists"
        ActingPerson.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(actingPerson)

        then: "The instance is deleted"
        ActingPerson.count() == 0
        response.redirectedUrl == '/actingPerson/index'
        flash.message != null
    }
}
