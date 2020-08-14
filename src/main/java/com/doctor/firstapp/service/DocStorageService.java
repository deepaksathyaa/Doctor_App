package com.doctor.firstapp.service;






import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;



//import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
//import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartFile;

import com.doctor.firstapp.AppointmentRepo;
import com.doctor.firstapp.DoctorRepo;
import com.doctor.firstapp.HospitalRepo;
import com.doctor.firstapp.LabRepo;
import com.doctor.firstapp.PatientRepo;
import com.doctor.firstapp.PrescriptionRepo;
import com.doctor.firstapp.TabletRepo;
import com.doctor.firstapp.UserRepo;
import com.doctor.firstapp.labtestRepo;
import com.doctor.firstapp.model.Appointment;
import com.doctor.firstapp.model.Doctor;
import com.doctor.firstapp.model.Hospital;
import com.doctor.firstapp.model.Labtester;
import com.doctor.firstapp.model.Patient;
import com.doctor.firstapp.model.Prescription;
import com.doctor.firstapp.model.Users;
import com.doctor.firstapp.model.labtest;
import com.doctor.firstapp.model.tablet;

@Service
public class DocStorageService {
  @Autowired
  private labtestRepo docRepository;
  @Autowired
  private PasswordEncoder e;
  @Autowired
  private PrescriptionRepo pr;
  @Autowired
  private DoctorRepo repo;
  @Autowired
  private PatientRepo r;
  @Autowired
  private LabRepo lr;
  @Autowired
  private AppointmentRepo app;
  @Autowired
  private UserRepo u;
  @Autowired
  private TabletRepo t;
  @Autowired
  private HospitalRepo ht;
  
  public labtest saveFile(int testerid, int doctorid, int patientid, String description, MultipartFile files) {
	  String docname = files.getOriginalFilename();
	  try {
		  labtest doc = new labtest(testerid,patientid,description,doctorid,docname,files.getContentType(),files.getBytes());
		  return docRepository.save(doc);
	  }
	  catch(Exception e) {
		  e.printStackTrace();
	  }
	  return null;
  }
 
public Optional<labtest> getFile(Integer fileId) {
	return docRepository.findById(fileId);
	
}

public Prescription savePrescription(int doctorid, int patientid, String description, MultipartFile files) {
	String docname = files.getOriginalFilename();
	  try {
		  Prescription doc = new Prescription(doctorid,patientid,description,docname,files.getContentType(),files.getBytes());
		  return pr.save(doc);
	  }
	  catch(Exception e) {
		  e.printStackTrace();
	  }
	  return null;
}

public Optional<Prescription> getPrescription(Integer fileId) {
	return pr.findById(fileId);
	
}

public void doctoruser(String doctorName, String email, String hospitalName, String speciality, String password)
{
	Doctor d = new Doctor(doctorName,email,hospitalName,speciality,e.encode(password),1);
	repo.save(d);
}

public void patientuser(String patientName, String email, String dateOfBirth, int age, String phnumber,
		String password) {
	Patient p = new Patient(patientName,email,dateOfBirth,age,phnumber,password,1);
	r.save(p);
}
public void hospitaluser(String hname, String email, String location, String phnumber,
		String password) {
	Hospital p = new Hospital(hname,location,phnumber,email,password);
	ht.save(p);
}



public void labuser(String testlabName, String email, String phnumber,  String password) {
	Labtester l = new Labtester(testlabName,email,phnumber,password,1);
	lr.save(l);
	
	
}

public void doctoruser(String email,String password) {
	Users l = new Users(email,e.encode(password),0);
	u.save(l);
	
	
}

public void patientuser(String email,String password) {
	Users l = new Users(email,e.encode(password),1);
	u.save(l);
	
	
}

public void labuser(String email,String password) {
	Users l = new Users(email,e.encode(password),2);
	u.save(l);
	
	
}

public void saveapp(java.sql.Date date, int pid, String dname, String time, String type) {
	// TODO Auto-generated method stub
	
	Appointment a = new Appointment(pid,dname,date,time,type);
	app.save(a);
}

//public void saveapp(int patientid, String doctorname, Date date, String time, String type) {
//	String pattern = "yyyy-MM-dd";
//	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
//
//	String date = simpleDateFormat.format(new Date());
//	System.out.println(date);
//	Appointment a = new Appointment(patientid,doctorname,date1,time,type);
//	
//}

public void savepres(int patientid,int doctorid,String morning,String afternoon,String night) {
	// TODO Auto-generated method stub
	
	tablet a = new tablet(patientid,doctorid,morning,afternoon,night);
	t.save(a);
}


}
