package com.doctor.firstapp.model;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class Prescription {
	
	@Id
	 @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private int doctorid;
	private int patientid;
	private String description;
	private String docname;
	private String docType;
	@Lob
	private byte[] data;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDoctorid() {
		return doctorid;
	}
	public void setDoctorid(int doctorid) {
		this.doctorid = doctorid;
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
	public byte[] getData() {
		return data;
	}
	public void setData(byte[] data) {
		this.data = data;
	}
	public Prescription() {}
	public Prescription(int doctorid, int patientid, String description, String docname, String docType, byte[] data) {
		super();
		this.doctorid = doctorid;
		this.patientid = patientid;
		this.description = description;
		this.docname = docname;
		this.docType = docType;
		this.data = data;
	}
	@Override
	public String toString() {
		return "Prescription [id=" + id + ", doctorid=" + doctorid + ", patientid=" + patientid + ", description="
				+ description + ", docname=" + docname + ", docType=" + docType + ", data=" + Arrays.toString(data)
				+ "]";
	}
	
}
