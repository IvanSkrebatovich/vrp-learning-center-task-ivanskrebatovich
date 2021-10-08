public without sharing class DoctorAppointmentsModel {
    public static List<Appointment__c> getAppointments() {
        List<Appointment__c> appointments = new List<Appointment__c>([SELECT Id, Name, Appointment_Date__c, Doctor__c, Duration_in_minutes__c FROM Appointment__c]);
        return appointments;
    }

    public static Boolean createAppointment(String d, String p, Datetime dt, Integer dr) {
        List<Appointment__c> appointments = new List<Appointment__c>();
        Appointment__c a = new Appointment__c(Doctor__c=d, Patient__c=p, Appointment_Date__c=dt, Duration_in_minutes__c=dr);
        appointments.add(a);
        List<Database.SaveResult> result = Database.insert(appointments, false);
        for (Database.SaveResult item : result) {
            return item.isSuccess();
        }
        return false;
    }

    public static Boolean createDoctor(String name, Time whStart, Time whEnd) {
        List<Doctor__c> doctors = new List<Doctor__c>();
        Doctor__c a = new Doctor__c(Name=name, Working_Hours_Start__c=whStart, Working_Hours_End__c=whEnd);
        doctors.add(a);
        List<Database.SaveResult> result = Database.insert(doctors, false);
        for (Database.SaveResult item : result) {
            return item.isSuccess();
        }
        return true;
    }

    public static Boolean createPatient(String name) {
        List<Patient__c> patients = new List<Patient__c>();
        Patient__c a = new Patient__c(Name=name);
        patients.add(a);
        List<Database.SaveResult> result = Database.insert(patients, false);
        for (Database.SaveResult item : result) {
            return item.isSuccess();
        }
        return true;
    }

    public static List<SObject> getDoctors() {
        List<SObject> doctors = new List<Doctor__c>([SELECT Id, Name, Working_Hours_End__c, Working_Hours_Start__c FROM Doctor__c]);
        return doctors;
    }

    public static Doctor__c getDoctorById(Id doctorsId) {
        List<Doctor__c> doctors = new List<Doctor__c>([SELECT Id, Name, Working_Hours_End__c, Working_Hours_Start__c FROM Doctor__c WHERE Id = :doctorsId]);
        return doctors.isEmpty() ? null : doctors[0];
    }

    public static List<Patient__c> getPatients() {
        List<Patient__c> patients = new List<Patient__c>([SELECT Id, Name FROM Patient__c]);
        return patients;
    }

    public static List<Appointment__c> getAppointmentsFullInfo() {
        List<Appointment__c> appointments = [SELECT Id, Doctor__r.Id, Doctor__r.Name, Patient__r.Id, Patient__r.Name, Appointment_Date__c, Duration_in_minutes__c FROM Appointment__c];
        return appointments;
    }
}
