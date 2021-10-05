trigger DoctorAppointment on Appointment__c(before insert, before update) {
    for (Appointment__c appointment : Trigger.new) {
        String message = 'The Doctor not able to have appoitment';

        Integer startTime = appointment.Appointment_Date__c.hour() * 60 + appointment.Appointment_Date__c.minute();
        Integer duration = appointment.Duration_in_minutes__c.intValue();
        Integer endTime = startTime + duration;

        Boolean isDoctorsAppointments = DoctorAppointmentHelper.hasDoctorsAppointments(appointment, startTime, endTime);
        Boolean isDoctorAvailable = DoctorAppointmentHelper.hasDoctorAvailable(appointment, startTime, endTime);

        if (isDoctorsAppointments || isDoctorAvailable) {
            appointment.addError(message);
        }
    }	
}