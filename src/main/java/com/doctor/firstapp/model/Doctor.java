package com.doctor.firstapp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.beans.factory.annotation.Qualifier;

@Entity
@Qualifier("Doctor")
public class Doctor {

	 @Id
	  @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String doctorName;
	 @Column(name = "Email")
	private String email;
	private String hospitalName;
	private String speciality;
	private String password;
	private int active;
public Doctor( ) {}

	public Doctor(int id)
	{
		this.id = id;
	}
	public Doctor(String DoctorName, String Email,String HospitalName, String Speciality, String Password,int active) {
		super();
		
		this.doctorName = DoctorName;
		this.email = Email;
		this.hospitalName = HospitalName;
		this.speciality = Speciality;
		this.password = Password;
		this.active = active;
		}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	
	@Override
	public String toString() {
		return "Doctor[id" + id + "DoctorName=" + doctorName + ", Speciality=" + speciality + ", Username=" + email +  ", Paasword"+ password + ", Hospital Name=" + hospitalName +"]";
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}
}
