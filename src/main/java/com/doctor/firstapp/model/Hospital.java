package com.doctor.firstapp.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Hospital {

	 @Id
	  @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	 private String hospitalname;
	 private String location;
	 private String phnumber;
	 private String email;
	 private String password;
	public Hospital() {
		
	}
	@Override
	public String toString() {
		return "Hospital [id=" + id + ", hospitalname=" + hospitalname + ", location=" + location + ", phnumber="
				+ phnumber + ", email=" + email + "]";
	}
	
	public Hospital(String hospitalname, String location, String phnumber, String email, String password) {
		super();
		this.hospitalname = hospitalname;
		this.location = location;
		this.phnumber = phnumber;
		this.email = email;
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHospitalname() {
		return hospitalname;
	}
	public void setHospitalname(String hospitalname) {
		this.hospitalname = hospitalname;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPhnumber() {
		return phnumber;
	}
	public void setPhnumber(String phnumber) {
		this.phnumber = phnumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	 
}
