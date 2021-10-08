public class DoctorAppointmentHelper {

    public static Time convertStringToTime(String input) {
        // '15:35:00' -> ['15', '35', '00', '00']
        String[] inputSplit = input.split(':');
        Integer hour = Integer.valueOf(inputSplit[0]);
        Integer min = Integer.valueOf(inputSplit[1]);
        Integer sec = Integer.valueOf(inputSplit[2]);
        Integer ms = Integer.valueOf(inputSplit[3]);
        Time result = Time.newInstance(hour, min, sec, ms);
        return result;
    }

    public static List<SelectOption> generateSelectOptions(List<SObject> collection) {
        List<SelectOption> options = new List<SelectOption>();
        SelectOption blankOption = new SelectOption('', '');
        options.add(blankOption);
        for (SObject item : collection) {
            SelectOption option = new SelectOption((String)item.Id, (String)item.get('Name'));
            options.add(option);
        }
        return options;
    }

    public static Boolean hasDoctorsAppointments(Appointment__c inputAppointment, Integer startTime, Integer endTime) {
        List<Appointment__c> appointments = DoctorAppointmentsModel.getAppointments();
        for (Appointment__c record : appointments) {
            if ((inputAppointment.Doctor__c == record.Doctor__c)) {
                if (inputAppointment.Appointment_Date__c == record.Appointment_Date__c) {
                    return true;
                } else if (inputAppointment.Appointment_Date__c.date() == record.Appointment_Date__c.date()) {
                    Integer appointmentDate = record.Appointment_Date__c.hour() * 60 + record.Appointment_Date__c.minute();
                    Integer durationInMins = record.Duration_in_minutes__c.intValue();
                    if ((startTime > appointmentDate) && startTime < (appointmentDate + durationInMins)) {
                        return true;
                    } else if ((startTime < appointmentDate) && ((endTime) > appointmentDate)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public static Boolean hasDoctorAvailable(Appointment__c inputAppointment, Integer startTime, Integer endTime) {
        List<Doctor__c> doctors = DoctorAppointmentsModel.getDoctors();
        for (Doctor__c doctor : doctors) {
            Integer hoursStart = doctor.Working_Hours_Start__c.hour() * 60 + doctor.Working_Hours_Start__c.minute();
            Integer hoursEnd = doctor.Working_Hours_End__c.hour() * 60 + doctor.Working_Hours_End__c.minute();
            if (inputAppointment.Doctor__c == doctor.ID) {
                if ((startTime < hoursStart) || (startTime > hoursEnd)) {
                    return true;
                } else if (endTime > hoursEnd) {
                    return true;
                }
            }
        }
        return false;
    }

    public static void callAnaliticsService(String str) {
        // call to external HTTP service
        // HttpRequest h = new HttpRequest();
        // h.setBody('http://google.com');
        // h. to do some e
    }
}
