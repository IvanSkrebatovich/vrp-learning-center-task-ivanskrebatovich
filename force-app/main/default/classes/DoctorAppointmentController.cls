public class DoctorAppointmentController {

    // GETTER:
    public List<Appointment__c> getAppointments(){
        return [
            SELECT Id,
            Doctor__r.Id, Doctor__r.Name,
            Patient__r.Id, Patient__r.Name,
            Appointment_Date__c, Duration_in_minutes__c  
            FROM Appointment__c
        ];
    }
}