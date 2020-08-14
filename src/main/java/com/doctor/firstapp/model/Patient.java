package com.doctor.firstapp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.beans.factory.annotation.Qualifier;

@Entity
@Qualifier("Patient")
public class Patient {

	@Override
	public String toString() {
		return "Patient [id=" + id + ", PatientName=" + patientName + ", Email=" + email + ", DateOfBirth="
				+ dateOfBirth + ", age=" + age + ", Phnumber=" + phnumber + ", Password=" + password + "]";
	}
	@Id
	  @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String patientName;
	 @Column(name = "Email")
	private String email;
	private String dateOfBirth;
	private int age;
	private String phnumber;
	private int active;
	
	public Patient(int id)
	{
		this.id = id;
	}
	public Patient() {}
	
	
	public Patient(String patientName, String email, String dateOfBirth, int age, String phnumber, String password,int active) {
		super();
		this.patientName = patientName;
		this.email = email;
		this.dateOfBirth = dateOfBirth;
		this.age = age;
		this.phnumber = phnumber;
		this.password = password;
		this.active = active;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhnumber() {
		return phnumber;
	}
	public void setPhnumber(String phnumber) {
		this.phnumber = phnumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	private String password;
	
	
}
