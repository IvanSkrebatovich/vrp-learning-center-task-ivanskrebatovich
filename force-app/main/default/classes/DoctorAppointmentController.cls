public without sharing class DoctorAppointmentController {
    // =================================================================
    // UTILS:
    public PageReference rerenderPartitions() {
        return null;
    }



    // =================================================================
    // DOCTORS:
    public List<SelectOption> getDoctors() {
        List<Doctor__c> doctors = DoctorAppointmentsModel.getDoctors();
        List<SelectOption> options = DoctorAppointmentHelper.generateSelectOptions(doctors);
        return options;
    }
    // -------------------------------
    public Doctor__c getDoctorDetails() {
        Boolean isSelected = !String.isBlank(this.selectedDoctor);
        return (isSelected) ? DoctorAppointmentsModel.getDoctorById(this.selectedDoctor) : null;
    }
    // -------------------------------
    private String selectedDoctor = '';
    public String getSelectedDoctor() {
        return this.selectedDoctor;
    }
    public void setSelectedDoctor(String val) {
        this.selectedDoctor = val;
    }
    // -------------------------------
    private String createdDoctorsName = '';
    public String getCreatedDoctorsName() {
        return this.createdDoctorsName;
    }
    public void setCreatedDoctorsName(String val) {
        this.createdDoctorsName = val;
    }
    // -------------------------------
    private Time createdDoctorsStartTime;
    public Time getCreatedDoctorsStartTime() {
        return this.createdDoctorsStartTime;
    }
    public void setCreatedDoctorsStartTime(Time val) {
        this.createdDoctorsStartTime = val;
    }
    // -------------------------------
    private Time createdDoctorsEndTime;
    public Time getCreatedDoctorsEndTime() {
        return this.createdDoctorsEndTime;
    }
    public void setCreatedDoctorsEndTime(Time val) {
        this.createdDoctorsStartTime = val;
    }
    // -------------------------------
    @RemoteAction()
    public static Boolean createDoctor(String name, String whStartStr, String whEndStr) {
        System.debug('CREATE Doctor__c ' + name);
        System.debug('CREATE Doctor__c ' + whStartStr);
        System.debug('CREATE Doctor__c ' + whEndStr);
        if (!String.isBlank(name) && !String.isBlank(whStartStr) && !String.isBlank(whEndStr)) {
            Time whStartObj = DoctorAppointmentHelper.convertStringToTime(whStartStr);
            Time whEndObj = DoctorAppointmentHelper.convertStringToTime(whEndStr);
            return DoctorAppointmentsModel.createDoctor(name, whStartObj, whEndObj);
        }
        return false;
    }



    // =================================================================
    // PATIENTS:
    public List<SelectOption> getPatients() {
        List<Patient__c> patients = DoctorAppointmentsModel.getPatients();
        List<SelectOption> options = DoctorAppointmentHelper.generateSelectOptions(patients);
        return options;
    }
    // -------------------------
    private String selectedPatient = '';
    public String getSelectedPatient() {
        return this.selectedPatient;
    }
    public void setSelectedPatient(String val) {
        this.selectedPatient = val;
    }
    // -------------------------
    private String createdPatientName = '';
    public String getCreatedPatientName() {
        return this.createdPatientName;
    }
    public void setCreatedPatientName(String val) {
        this.createdPatientName = val;
    }
    // -------------------------
    @RemoteAction()
    public static Boolean createPatient(String name) {
        System.debug('CREATE Patient__c ' + name);
        Boolean condition = !String.isBlank(name);
        return condition ? DoctorAppointmentsModel.createPatient(name) : false;
    }


    // =================================================================
    // APPOINTMENTS:
    public List<Appointment__c> getAppointments() {
        List<Appointment__c> appointments = DoctorAppointmentsModel.getAppointmentsFullInfo();
        return appointments;
    }
    // -------------------------
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
    // -------------------------
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