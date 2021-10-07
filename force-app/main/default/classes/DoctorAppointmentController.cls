public without sharing class DoctorAppointmentController {

    // =================================================================
    // SELECT BOXES:
    // RERENDERING:
    public PageReference rerenderSelectBoxes() {
        return null;
    }
    // DOCTORS:
    public List<SelectOption> getDoctors() {
        List<Doctor__c> doctors = DoctorAppointmentsModel.getDoctors();
        List<SelectOption> options = new List<SelectOption>();
        for (Doctor__c value : doctors) {
            SelectOption option = new SelectOption(value.Id, value.Name);
            options.add(option);
        }
        return options;
    }
    private String selectedDoctor = '';
    public String getSelectedDoctor() {
        return this.selectedDoctor;
    }
    public void setSelectedDoctor(String s) {
        this.selectedDoctor = s;
    }
    public Doctor__c getDoctorDetails() {
        // TODO / TODO / TODO / TODO / TODO / TODO / TODO / TODO / TODO:
        // GET DOCTOR BY ID:
        
        return null;
    }
    // PATIENTS:
    public List<SelectOption> getPatients() {
        List<Patient__c> patients = DoctorAppointmentsModel.getPatients();
        List<SelectOption> options = new List<SelectOption>();
        for (Patient__c value : patients) {
            SelectOption option = new SelectOption(value.Id, value.Name);
            options.add(option);
        }
        return options;
    }
    private String selectedPatient = '';
    public String getSelectedPatient() {
        return this.selectedPatient;
    }
    public void setSelectedPatient(String s) {
        this.selectedPatient = s;
    }


    // =================================================================
    // APPOINTMENTS:
    public List<Appointment__c> getAppointments() {
        List<Appointment__c> appointments = DoctorAppointmentsModel.getAppointmentsFullInfo();
        return appointments;
    }
    @RemoteAction()
    public static Boolean createAppointment() {
        // TODO / TODO / TODO / TODO / TODO / TODO / TODO / TODO / TODO:
        // CREATE APPOINTMENT
       
        return true;
    }
}