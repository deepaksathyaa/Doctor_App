package com.doctor.firstapp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.DynamicUpdate;


@DynamicUpdate
@Entity
public class Labtester {

	@Id
	 @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String testlabname;
	 @Column(name = "email")
	private String email;
	 private String phnumber;
	 private String password;
	 private int active;
	 public Labtester(int id)
		{
			this.id = id;
		}
		public Labtester() {}
		
		
	 public Labtester(String testlabname, String email, String phnumber, String password,int active) {
		super();
		this.testlabname = testlabname;
		this.email = email;
		this.phnumber = phnumber;
		this.password = password;
		this.setActive(active);
	}
	@Override
	public String toString() {
		return "Labtester [id=" + id + ", Testlabname=" + testlabname + ", Email=" + email + ", Phnumber=" + phnumber
				+ ", password=" + password + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTestlabname() {
		return testlabname;
	}
	public void setTestlabname(String testlabname) {
		this.testlabname = testlabname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
}
