package com.doctor.firstapp.model;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

//import com.mysql.cj.jdbc.Blob;

@Entity
public class labtest {

	 @Id
	  @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private int testerid;
	private int patientid;
	private String description; 
	private int doctorid;
	private String docname;
	private String docType;
	
	public String getDocname() {
		return docname;
	}


	public void setDocname(String docname) {
		this.docname = docname;
	}


	public String getDocType() {
		return docType;
	}


	public void setDocType(String docType) {
		this.docType = docType;
	}


	@Lob
	private byte[] data;
	
	public labtest() {}
	
	
	public int getDoctorid() {
		return doctorid;
	}


	public void setDoctorid(int doctorid) {
		this.doctorid = doctorid;
	}


	



	public byte[] getData() {
		return data;
	}


	public void setData(byte[] data) {
		this.data = data;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTesterid() {
		return testerid;
	}
	public void setTesterid(int testerid) {
		this.testerid = testerid;
	}
	public int getPatientid() {
		return patientid;
	}
	public void setPatientid(int patientid) {
		this.patientid = patientid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}


	public labtest(int testerid, int patientid, String description, int doctorid, String docname, String docType,
			byte[] data) {
		super();
		this.testerid = testerid;
		this.patientid = patientid;
		this.description = description;
		this.doctorid = doctorid;
		this.docname = docname;
		this.docType = docType;
		this.data = data;
	}


	@Override
	public String toString() {
		return "labtest [id=" + id + ", testerid=" + testerid + ", patientid=" + patientid + ", description="
				+ description + ", doctorid=" + doctorid + ", docname=" + docname + ", docType=" + docType + ", data="
				+ Arrays.toString(data) + "]";
	}


	

	


		

	
}
