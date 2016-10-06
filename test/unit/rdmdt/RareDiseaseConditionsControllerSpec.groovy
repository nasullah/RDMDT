package rdmdt


import grails.test.mixin.*
import spock.lang.*

@TestFor(RareDiseaseConditionsController)
@Mock(RareDiseaseConditions)
class RareDiseaseConditionsControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.rareDiseaseConditionsInstanceList
        model.rareDiseaseConditionsInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.rareDiseaseConditionsInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def rareDiseaseConditions = new RareDiseaseConditions()
        rareDiseaseConditions.validate()
        controller.save(rareDiseaseConditions)

        then: "The create view is rendered again with the correct model"
        model.rareDiseaseConditionsInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        rareDiseaseConditions = new RareDiseaseConditions(params)

        controller.save(rareDiseaseConditions)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/rareDiseaseConditions/show/1'
        controller.flash.message != null
        RareDiseaseConditions.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def rareDiseaseConditions = new RareDiseaseConditions(params)
        controller.show(rareDiseaseConditions)

        then: "A model is populated containing the domain instance"
        model.rareDiseaseConditionsInstance == rareDiseaseConditions
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def rareDiseaseConditions = new RareDiseaseConditions(params)
        controller.edit(rareDiseaseConditions)

        then: "A model is populated containing the domain instance"
        model.rareDiseaseConditionsInstance == rareDiseaseConditions
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/rareDiseaseConditions/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def rareDiseaseConditions = new RareDiseaseConditions()
        rareDiseaseConditions.validate()
        controller.update(rareDiseaseConditions)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.rareDiseaseConditionsInstance == rareDiseaseConditions

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        rareDiseaseConditions = new RareDiseaseConditions(params).save(flush: true)
        controller.update(rareDiseaseConditions)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/rareDiseaseConditions/show/$rareDiseaseConditions.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/rareDiseaseConditions/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def rareDiseaseConditions = new RareDiseaseConditions(params).save(flush: true)

        then: "It exists"
        RareDiseaseConditions.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(rareDiseaseConditions)

        then: "The instance is deleted"
        RareDiseaseConditions.count() == 0
        response.redirectedUrl == '/rareDiseaseConditions/index'
        flash.message != null
    }
}
