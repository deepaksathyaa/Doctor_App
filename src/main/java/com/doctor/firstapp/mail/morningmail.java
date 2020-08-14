package com.doctor.firstapp.mail;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;


import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class morningmail implements Job{
	public void execute(JobExecutionContext context) throws JobExecutionException {
		
		
		
		try {
	        Class.forName("com.mysql.jdbc.Driver").newInstance();
			  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
			  try
			  {
			  String query = "select * from project.tablet";
			  
			  ResultSet rs = con.createStatement().executeQuery(query); 
			  while(rs.next())
			  {
				  String query1 = "select * from project.patient where id = " + rs.getInt("patientid");
				  
				  ResultSet s = con.createStatement().executeQuery(query1); 
				  while(s.next())
				  {
					  if(!rs.getString("morning").equals(""))
					  {
						  String body ="you have to take a few tablets on Morning " + rs.getString("morning");
							try {
								SendEmail.sendEmailpres(s.getString("email"),"Prescription Remainder",body);
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
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