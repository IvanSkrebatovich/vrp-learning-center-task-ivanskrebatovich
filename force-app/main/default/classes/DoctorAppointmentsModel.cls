public class DoctorAppointmentsModel {

    // TODO: return LIST not MAP
    public static Map<ID, Appointment__c> getAppointments() {
        Map<ID, Appointment__c> appointments = new Map<ID, Appointment__c>([
            SELECT Appointment_Date__c, Doctor__c, Duration_in_minutes__c FROM Appointment__c
        ]);
        return appointments;
    }

    // TODO: return LIST not MAP
    public static Map<ID, Doctor__c> getDoctors() {
        Map<ID, Doctor__c> doctors = new Map<ID, Doctor__c>([
            SELECT Working_Hours_End__c, Working_Hours_Start__c, ID FROM Doctor__c
        ]);
        return doctors;
    }
}