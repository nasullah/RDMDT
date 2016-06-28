package rdmdt

/**
 * ActingClinician
 * A domain class describes the data object and it's mapping to the database
 */
class ActingClinician extends Person{
    static constraints = {
        name()
        email()
        telephone()
        departmentName()
        speciality()
        centre()
    }

    /*
     * Methods of the Domain Class
     */
    @Override	// Override toString for a nicer / more descriptive UI
    public String toString() {
        return "${name}, ${departmentName}";
    }
}
