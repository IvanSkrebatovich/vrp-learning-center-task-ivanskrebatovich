public class DoctorAppointmentsModel {

    // TODO: return LIST not MAP
    public static List<Appointment__c> getAppointments() {
        List<Appointment__c> appointments = new List<Appointment__c>([
            SELECT Appointment_Date__c, Doctor__c, Duration_in_minutes__c FROM Appointment__c
        ]);
        return appointments;
    }

    // TODO: return LIST not MAP
    public static List<Doctor__c> getDoctors() {
        List<Doctor__c> doctors = new List<Doctor__c>([
            SELECT Working_Hours_End__c, Working_Hours_Start__c, ID FROM Doctor__c
        ]);
        return doctors;
    }
}