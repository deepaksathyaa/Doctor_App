package com.doctor.firstapp;






import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.doctor.firstapp.mail.MailScheduler;

@SpringBootApplication

public class DoctorAppointmentApplication {

	public static void main(String[] args) {
		SpringApplication.run(DoctorAppointmentApplication.class, args);
		MailScheduler m = new MailScheduler();
		m.mail();
	}
	



	
	

}
