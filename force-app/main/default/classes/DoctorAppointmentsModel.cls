public class DoctorAppointmentsModel {

    public static List<Appointment__c> getAppointments() {
        List<Appointment__c> appointments = new List<Appointment__c>([
            SELECT Id, Name, Appointment_Date__c, Doctor__c, Duration_in_minutes__c FROM Appointment__c
        ]);
        return appointments;
    }

    public static Boolean createAppointment() {
        // DML to CREATE APPOINTMENT
        return true;
    }

    public static List<Doctor__c> getDoctors() {
        List<Doctor__c> doctors = new List<Doctor__c>([
            SELECT Id, Name, Working_Hours_End__c, Working_Hours_Start__c FROM Doctor__c
        ]);
        return doctors;
    }

    public static List<Patient__c> getPatients() {
        List<Patient__c> patients = new List<Patient__c>([ SELECT Id, Name FROM Patient__c ]);
        return patients;
    }

    public static List<Appointment__c> getAppointmentsFullInfo() {
        List<Appointment__c> appointments = [
            SELECT Id,
            Doctor__r.Id, Doctor__r.Name,
            Patient__r.Id, Patient__r.Name,
            Appointment_Date__c, Duration_in_minutes__c  
            FROM Appointment__c
        ];
        return appointments;
    }
}