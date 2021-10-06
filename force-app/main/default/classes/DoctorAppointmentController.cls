public class DoctorAppointmentController {
    // --------------------------------------------------
    // GETTER:
    public List<Appointment__c> getAppointments() {
        List<Appointment__c> appointments = DoctorAppointmentsModel.getAppointmentsFullInfo();
        return appointments;
    }

    public List<Doctor__c> getDoctors() {
        List<Doctor__c> doctors = DoctorAppointmentsModel.getDoctors();
        return doctors;
    }

    public List<Patient__c> getPatients() {
        List<Patient__c> doctors = DoctorAppointmentsModel.getPatients();
        return doctors;
    }

    // --------------------------------------------------
    // ACTIONS:
    @RemoteAction()
    public static Boolean createAppointment() {
        Boolean isCreated = DoctorAppointmentsModel.createAppointment();
        return isCreated;
    }
}