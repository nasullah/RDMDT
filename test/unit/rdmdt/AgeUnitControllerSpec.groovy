package rdmdt


import grails.test.mixin.*
import spock.lang.*

@TestFor(AgeUnitController)
@Mock(AgeUnit)
class AgeUnitControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.ageUnitInstanceList
        model.ageUnitInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.ageUnitInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        def ageUnit = new AgeUnit()
        ageUnit.validate()
        controller.save(ageUnit)

        then: "The create view is rendered again with the correct model"
        model.ageUnitInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        ageUnit = new AgeUnit(params)

        controller.save(ageUnit)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/ageUnit/show/1'
        controller.flash.message != null
        AgeUnit.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def ageUnit = new AgeUnit(params)
        controller.show(ageUnit)

        then: "A model is populated containing the domain instance"
        model.ageUnitInstance == ageUnit
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def ageUnit = new AgeUnit(params)
        controller.edit(ageUnit)

        then: "A model is populated containing the domain instance"
        model.ageUnitInstance == ageUnit
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/ageUnit/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def ageUnit = new AgeUnit()
        ageUnit.validate()
        controller.update(ageUnit)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.ageUnitInstance == ageUnit

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        ageUnit = new AgeUnit(params).save(flush: true)
        controller.update(ageUnit)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/ageUnit/show/$ageUnit.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/ageUnit/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def ageUnit = new AgeUnit(params).save(flush: true)

        then: "It exists"
        AgeUnit.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(ageUnit)

        then: "The instance is deleted"
        AgeUnit.count() == 0
        response.redirectedUrl == '/ageUnit/index'
        flash.message != null
    }
}
