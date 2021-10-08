public without sharing class DoctorAppointmentController {
    // RERENDERING:
    public PageReference rerenderPartitions() {
        return null;
    }


    // =================================================================
    // SELECT BOXES:
    // DOCTORS:
    public List<SelectOption> getDoctors() {
        List<Doctor__c> doctors = DoctorAppointmentsModel.getDoctors();
        List<SelectOption> options = DoctorAppointmentHelper.generateSelectOptions(doctors);
        return options;
    }
    private String selectedDoctor = 'a055f000001JpbGAAS';
    public String getSelectedDoctor() {
        return this.selectedDoctor;
    }
    public void setSelectedDoctor(String val) {
        this.selectedDoctor = val;
    }
    public Doctor__c getDoctorDetails() {
        Boolean isSelected = !String.isBlank(this.selectedDoctor);
        return (isSelected) ? DoctorAppointmentsModel.getDoctorById(this.selectedDoctor) : null;
    }
    // PATIENTS:
    public List<SelectOption> getPatients() {
        List<Patient__c> patients = DoctorAppointmentsModel.getPatients();
        List<SelectOption> options = DoctorAppointmentHelper.generateSelectOptions(patients);
        return options;
    }
    private String selectedPatient = 'a095f000000Ru0aAAC';
    public String getSelectedPatient() {
        return this.selectedPatient;
    }
    public void setSelectedPatient(String val) {
        this.selectedPatient = val;
    }


    // =================================================================
    // DATE/TIME:
    private Datetime appointmentDateTime;
    public Datetime getAppointmentDateTime() {
        return this.appointmentDateTime;
    }
    public void setAppointmentDateTime(Datetime val) {
        this.appointmentDateTime = val;
    }
    // -------------------------
    private Date appointmentDate;
    public Date getAppointmentDate() {
        return this.appointmentDate;
    }
    public void setAppointmentDate(Date val) {
        this.appointmentDate = val;
    }
    // -------------------------
    private Time appointmentTime;
    public Time getAppointmentTime() {
        return this.appointmentTime;
    }
    public void setAppointmentTime(Time val) {
        this.appointmentTime = val;
    }
    // -------------------------
    private Integer appointmentDuration = 25;
    public Integer getAppointmentDuration() {
        return this.appointmentDuration;
    }
    public void setAppointmentDuration(Integer val) {
        this.appointmentDuration = val;
    }


    // =================================================================
    // APPOINTMENTS:
    public List<Appointment__c> getAppointments() {
        List<Appointment__c> appointments = DoctorAppointmentsModel.getAppointmentsFullInfo();
        return appointments;
    }
    @RemoteAction()
    public static Boolean createAppointment(String doctor, String patient, String dttmStr, Integer duration) {
        DateTime dttmObj = DateTime.valueOf(dttmStr);
        Boolean condition1 = !String.isBlank(doctor) && !String.isBlank(patient);
        Boolean condition2 = (dttmObj != null) && (duration > 0);
        Boolean condition = condition1 && condition2;
        Boolean isCreated = condition ? DoctorAppointmentsModel.createAppointment(doctor, patient, dttmObj, duration) : false;
        return isCreated;
    }
}