package com.doctor.firstapp.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class tablet {
	 @Id
	  @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private int patientid;
	private int doctorid;
	
	private String morning;
	private String afternoon;
	private String night;
	
	public tablet() {
		
	}
	public tablet(int patientid, int doctorid, String morning, String afternoon, String night) {
		super();
		this.patientid = patientid;
		this.doctorid = doctorid;
		this.morning = morning;
		this.afternoon = afternoon;
		this.night = night;
	}

	public int getDoctorid() {
		return doctorid;
	}

	public void setDoctorid(int doctorid) {
		this.doctorid = doctorid;
	}
	@Override
	public String toString() {
		return "tablet [id=" + id + ", patientid=" + patientid + ", doctorid=" + doctorid + ", morning=" + morning
				+ ", afternoon=" + afternoon + ", night=" + night + "]";
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
	public String getMorning() {
		return morning;
	}
	public void setMorning(String morning) {
		this.morning = morning;
	}
	public String getAfternoon() {
		return afternoon;
	}
	public void setAfternoon(String afternoon) {
		this.afternoon = afternoon;
	}
	public String getNight() {
		return night;
	}
	public void setNight(String night) {
		this.night = night;
	}
}
