package rdmdt

/**
 * IndexController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class IndexController {
    def springSecurityService
    def index() {
        def currentUser = springSecurityService?.currentUser?.username
        currentUser = currentUser?.toString()?.replace('.', ' ')
        def clinician = Clinician.createCriteria().get {
            eq("name", currentUser, [ignoreCase: true])
        }
        [clinician:clinician]
    }
}
