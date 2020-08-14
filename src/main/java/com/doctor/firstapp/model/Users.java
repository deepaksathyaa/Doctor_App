package com.doctor.firstapp.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Users {
	 @Id
	  @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	 @Column(name = "Email")
	private String email;
	private String Password;
	private int hasRole;
	public Users() {
		
	}
	public Users(String email, String password, int hasRole) {
		super();
		this.email = email;
		Password = password;
		this.hasRole = hasRole;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", email=" + email + ", Password=" + Password + ", hasRole=" + hasRole + "]";
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
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public int getHasRole() {
		return hasRole;
	}
	public void setHasRole(int hasRole) {
		this.hasRole = hasRole;
	} 
}
