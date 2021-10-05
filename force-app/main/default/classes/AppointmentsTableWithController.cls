public class AppointmentsTableWithController {
    public static List<Appointment__c> appointmentAll;
        
    public List<Appointment__c> getAppointments(){
       // if (appointmentAll == null){ 
         //   appointmentAll= [
        return [SELECT Id, Doctor__r.Name, Patient__r.Name, Appointment_Date__c, 
                Duration_in_minutes__c  
                FROM Appointment__c  
                LIMIT 20
            ];
        //}
        //return appointmentAll;
    }
}