package com.doctor.firstapp.mail;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;


import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;


public class mailjob implements Job{
	public void execute(JobExecutionContext context) throws JobExecutionException {
		
		System.out.println("Job1 --->>> Time is " + new Date());
		Calendar calendar = Calendar.getInstance();
	    
	    // get a date to represent "today"
	    Date today = calendar.getTime();
	    System.out.println("today:    " + today);
	 
	    // add one day to the date/calendar
	    calendar.add(Calendar.DAY_OF_YEAR, 1);
	    
	    // now get "tomorrow"
	    Date tomorrow = calendar.getTime();
		 SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
	        String date = DATE_FORMAT.format(tomorrow);
	        System.out.print(date);
	        try {
			        Class.forName("com.mysql.jdbc.Driver").newInstance();
					  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
					  try
					  {
					  String query = "select * from project.appointment where date = " + date;
					  
					  ResultSet rs = con.createStatement().executeQuery(query); 
					  while(rs.next())
					  {
						  String query1 = "select * from project.patient where id = " + rs.getInt("patientid");
						  
						  ResultSet s = con.createStatement().executeQuery(query1); 
						  while(s.next())
						  {
							  String body ="you have a appointment for on tomorrow" + rs.getString("time")+ "for doctor" + rs.getString("doctorname") + rs.getString("type");
				try {
					SendEmail.sendEmailauto(s.getString("email"),"Appointment Remainder",body);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				} 
						  }
					  }catch(Exception e) {
						  
					  }
	}catch(Exception e)
	        {
		
	        }
}
}

