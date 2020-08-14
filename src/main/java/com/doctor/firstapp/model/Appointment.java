package com.doctor.firstapp.model;




import java.sql.Date;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Appointment {

	@Id
	  @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private int patientid;
	private String doctorname;
	private Date date;
	private String time;
	private String type;
	public Appointment() {} 
	public Appointment(int patientid, String doctorname, Date date, String time, String type) {
		super(); 
		this.patientid = patientid;
		this.doctorname = doctorname;
		this.date = date;
		this.time = time;
		this.type = type;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPatientid() {
		return patientid;
	}
	public void setPatientid(int patientid) {
		this.patientid = patientid;
	}
	
	@Override
	public String toString() {
		return "Appointment [id=" + id + ", patientid=" + patientid + ", doctorname=" + doctorname + ", date=" + date
				+ ", time=" + time + ", type=" + type + "]";
	}
	public String getDoctorname() {
		return doctorname;
	}
	public void setDoctorname(String doctorname) {
		this.doctorname = doctorname;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
