package com.doctor.firstapp;

import org.springframework.core.io.ByteArrayResource;

import java.sql.Date;
//import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;


import com.doctor.firstapp.model.Doctor;
import com.doctor.firstapp.Repository.AppointmentRepo;
import com.doctor.firstapp.Repository.DoctorRepo;
import com.doctor.firstapp.Repository.HospitalRepo;
import com.doctor.firstapp.Repository.LabRepo;
import com.doctor.firstapp.Repository.PatientRepo;
import com.doctor.firstapp.Repository.PrescriptionRepo;
import com.doctor.firstapp.Repository.TabletRepo;
import com.doctor.firstapp.Repository.UserRepo;
import com.doctor.firstapp.Repository.labtestRepo;
import com.doctor.firstapp.mail.SendEmail;
import com.doctor.firstapp.model.Appointment;
import com.doctor.firstapp.model.Labtester;
import com.doctor.firstapp.model.Patient;
import com.doctor.firstapp.model.Prescription;
import com.doctor.firstapp.model.Users;
import com.doctor.firstapp.model.labtest;
import com.doctor.firstapp.model.tablet;
import com.doctor.firstapp.service.DocStorageService;

@Controller
public class HomeController 
{

	 @Autowired
	  private PasswordEncoder encoder;
	@Autowired
	PatientRepo re;
	@Autowired
	DoctorRepo repo;
	
	@Autowired
	LabRepo l;
	@Autowired
	AppointmentRepo a;
	@Autowired
	labtestRepo lt;
	@Autowired
	DocStorageService docStorageService;
	@Autowired
	PrescriptionRepo pr;
	@Autowired
	UserRepo u;
	@Autowired
	TabletRepo t;
	@Autowired
	HospitalRepo ht;

	
	@GetMapping("addappointment")
	public String addapp() {
		return "addApp.jsp";
	}
	
	@PostMapping("appsdashboard")
	public String app(Model model,@RequestParam("patientid") int pid,@RequestParam("doctorname") String dname,@RequestParam("date") Date date,@RequestParam("time") String  time,@RequestParam("type") String type)
	{
		List<Appointment> h = a.findByDoctorname(dname);
		System.out.println(pid + " " + dname + " " + time);
		Iterator<Appointment> it = h.iterator();
		while(it.hasNext() != false)
		{
			Appointment temp1 = (Appointment)it.next();
			
			if(temp1.getDate().compareTo(date) == 0)
			{
				 if(temp1.getTime().compareTo(time)==0)
				 {
					 model.addAttribute("error","Appointment already taken" );
					
					return "redirect:appappointment";
				 }
			}
			
		}
		docStorageService.saveapp(date,pid,dname,time,type);
		return "appointmentdashboard.jsp";
	}
	
	@GetMapping("addpatient")
	public String addpatient() {
		return "addpatient.jsp";
	}
	
	@PostMapping("patientsdashboard")
	public String addPatient(Model model,@RequestParam("patientName") String pname,@RequestParam("email") String email,@RequestParam("Password") String password,@RequestParam("Phnumber") String  phnumber,@RequestParam("DateOfBirth") String D,@RequestParam("age") int age) {
		if(re.findByEmail(email) != null)
		{
			model.addAttribute("error","Email Id is already Exist" );
			return"redirect:addpatient";
		}
		docStorageService.patientuser(pname, email, D, age, phnumber, password);
		return "patientDashboard.jsp";
	}
	
	@PostMapping("hospitaldashboard")
	public String addhospital(Model model,@RequestParam("hname") String hname,@RequestParam("email") String email,@RequestParam("password") String password,@RequestParam("phnumber") String  phnumber,@RequestParam("location") String location) {
		if(ht.findByEmail(email) != null)
		{
			model.addAttribute("error","Email Id is already Exist" );
			return"addhospital.jsp";
		}
		docStorageService.hospitaluser(hname,email,location,phnumber,password);
		return "hospitalDasboard.jsp";
	}
	
	@GetMapping("adddoctor")
	public String adddoctor() {
		return "adddoctor.jsp";
	}
	
	@GetMapping("/hospitaldashboard")
	public String hospitakdash() {
		return "hospitalDasboard.jsp";
	}
	
	
	@GetMapping("labdashboard")
	public String labdash() {
		return "laboratory.jsp";
	}
	
	@GetMapping("addlab")
	public String addlabs() {
		return "addlab.jsp";
	}
	@GetMapping("addhospital")
	public String addhospital() {
		return "addhospital.jsp";
	}
	
	@PostMapping("labdashboard")
	public String addlab(Model model,@RequestParam("lname") String lname,@RequestParam("email") String email,@RequestParam("password") String password,@RequestParam("phnumber") String phnumber) {
		if(l.findByEmail(email)!= null)
		{
			model.addAttribute("error","Email Id is already Exist" );
			return"addlab.jsp";
		}
		docStorageService.labuser(lname, email, phnumber, password);
		return "laboratory.jsp";
	}
	
	@PostMapping("doctorsdashboard")
	public String adddoctordash(Model model,@RequestParam("dname") String dname,@RequestParam("email") String email,@RequestParam("password") String password,@RequestParam("hname") String hname,@RequestParam("speciality") String speciality)
	{
		if(repo.findByEmail(email) != null)
		{
			model.addAttribute("error","Email Id is already Exist" );
			return"addpatient.jsp";
		}
		docStorageService.doctoruser(dname, email, hname, speciality, password);
		return "doctordashboard.jsp";
	}
	
	@ModelAttribute
	public void modelData(Model m) 
	{
	m.addAttribute("name","Doctor");
	}
	
	@ModelAttribute
	public void modellabtest(Model lt) 
	{
	lt.addAttribute("name","labtest");
	}
	
	@ModelAttribute
	public void modelApp(Model a) 
	{
	a.addAttribute("name","Appointment");
	}
	
	
	@ModelAttribute
	public void modelData4(Model k) 
	{
	k.addAttribute("name","lab");
	}
	
	@ModelAttribute
	public void modelData2(Model p) 
	{
	p.addAttribute("name","Patient");
	}
	
	@GetMapping("Patientsignup")
	public String Patientsignup() {
		return "signupPatient.jsp";
	}

	
	
	
	
	@PostMapping("error")
		public String error() {
			return "redirect:/";
		}

	

	@RequestMapping("/")
	public String home()
	{
		return "index.jsp";
	}
	
	
	
	@RequestMapping("/appointment")
	public String Appointment()
	{
		return "Appointment.jsp";
	}
	
	
	@GetMapping("/Doctorsignup")
	public String d() {
		return "signupDoctor.jsp";
	}
	@RequestMapping("/mainlogin")
	public String Mainlogin()
	{
		return "mainlogin.html";
	}
	

	
	@GetMapping("labsignup")
	public String labsignup() {
		return "signuplab.jsp";
	}
	
	
	
	
	@PostMapping("success")
	public String appointmentSucess(Model model,@RequestParam("patientid") int pid,@RequestParam("doctorname") String dname,@RequestParam("date") Date date,@RequestParam("time") String  time,@RequestParam("type") String type) {
		List<Appointment> h = a.findByDoctorname(dname);
		System.out.println(pid + " " + dname + " " + time);
		Iterator<Appointment> it = h.iterator();
		while(it.hasNext() != false)
		{
			Appointment temp1 = (Appointment)it.next();
			
			if(temp1.getDate().compareTo(date) == 0)
			{
				 if(temp1.getTime().compareTo(time)==0)
				 {
					 model.addAttribute("error","Appointment already taken" );
					
					return "Appointment.jsp";
				 }
			}
			
		}
		docStorageService.saveapp(date,pid,dname,time,type);
		model.addAttribute("ids", pid);
		return "patientSuccess.jsp";
		
	}

	
	
	@PostMapping("fileupload")
	public String uploadMultipleFiles(HttpServletRequest request,@RequestParam("testerid") int testerid,@RequestParam("doctorid") int doctorid,@RequestParam("patientid") int patientid,@RequestParam("description") String description, @RequestParam("file") MultipartFile files) {

			docStorageService.saveFile(testerid,doctorid,patientid,description,files);
			Doctor d = repo.getOne(doctorid);
			Labtester k =l.getOne(testerid);
			SendEmail e = new SendEmail();
			String sub = "Lab Result";
			String body = "Here is your lab result for" + description + "from" + k.getTestlabname() + " ";
			Patient p = re.getOne(patientid);
			e.mailsent(d.getEmail(),files,p.getEmail(),sub,body);
			request.setAttribute("ids",testerid);
		return "labSuccess.jsp";
	}
	
	@PostMapping("labsuccess")
	public String lablogin(HttpServletRequest request,Model model,@RequestParam("lname") String TestlabName,@RequestParam("email") String Email,@RequestParam("phnumber") String phnumber,@RequestParam("password") String Password) {
		if(u.findByEmail(Email) != null)
		{
			model.addAttribute("error","Email Id is already Exist" );
			return"signuplab.jsp";
		}
		docStorageService.labuser(Email, Password);
		docStorageService.labuser(TestlabName,Email,phnumber,Password);
		Labtester p = l.findByEmail(Email);
		request.setAttribute("ids", p.getId());
		p.setActive(1);
		model.addAttribute("ids", p.getId());
		return "labSuccess.jsp";
	}
	
	@PostMapping("patientsuccess")
	public String patientlogin(HttpServletRequest request,Model model,@RequestParam("pname") String PatientName,@RequestParam("email") String email,@RequestParam("dob") String DateOfBirth,@RequestParam("age") int age, @RequestParam("phnumber") String phnumber,@RequestParam("password") String password) {
		if(re.findByEmail(email) != null)
		{
			model.addAttribute("error","Email Id is already Exist" );
			return"signupPatient.jsp";
		}
		docStorageService.patientuser(email, password);
		docStorageService.patientuser(PatientName,email,DateOfBirth,age,phnumber,password);
		Patient p = re.findByEmail(email);
		request.setAttribute("ids", p.getId());
		p.setActive(1);
		model.addAttribute("ids", p.getId());
		return "patientSuccess.jsp";
	}
	
	
	@PostMapping("doctorsuccess")
	public String Doctorsignup(HttpServletRequest request,Model model,@RequestParam("dname") String dname,@RequestParam("email") String email,@RequestParam("hname") String hname,@RequestParam("speciality") String Speciality,@RequestParam("password") String Password)
	{
		if(repo.findByEmail(email) != null)
		{
			model.addAttribute("error","Email Id is already Exist" );
			return"signupDoctor.jsp";
		}
		docStorageService.doctoruser(email, Password);
		docStorageService.doctoruser(dname, email, hname, Speciality, Password);
		Doctor p = repo.findByEmail(email);
		request.setAttribute("ids", p.getId());
		request.setAttribute("dname", p.getDoctorName());
		p.setActive(1);
		model.addAttribute("ids", p.getId());
		return"DoctorSuccess.jsp";
	}
	
	@PostMapping("/downloadFile/{fileId}")
	public ResponseEntity<ByteArrayResource> downloadFile(@PathVariable Integer fileId){
		labtest doc = docStorageService.getFile(fileId).get();
		return ResponseEntity.ok()
				.contentType(MediaType.parseMediaType(doc.getDocType()))
				.header(HttpHeaders.CONTENT_DISPOSITION,"attachment:filename=\""+doc.getDocname()+"\"")
				.body(new ByteArrayResource(doc.getData()));
	
}
	@PostMapping("/downloadPrescription/{fileId}")
	public ResponseEntity<ByteArrayResource> downloadPrescription(@PathVariable Integer fileId){
		Prescription doc = docStorageService.getPrescription(fileId).get();
		return ResponseEntity.ok()
				.contentType(MediaType.parseMediaType(doc.getDocType()))
				.header(HttpHeaders.CONTENT_DISPOSITION,"attachment:filename=\""+doc.getDocname()+"\"")
				.body(new ByteArrayResource(doc.getData()));
	
}
	@PostMapping("prescriptionupload")
	public String uploadPrescription(HttpServletRequest request,@RequestParam("doctorid") int doctorid,@RequestParam("patientid") int patientid,@RequestParam("description") String description, @RequestParam("file") MultipartFile files) {

		docStorageService.savePrescription(doctorid,patientid,description,files);
		Doctor d = repo.getOne(doctorid);
		SendEmail e = new SendEmail();
		String sub = "Prescription Updation";
		String body = "Here is your prescription for " + description + " from " + d.getDoctorName() + " ";
		Patient p = re.getOne(patientid);
		e.mailsentprescription(files,p.getEmail(),sub,body);
		request.setAttribute("ids", d.getId());
	return "Prescriptionupdation.jsp";
}
	
	@GetMapping("Admin")
	public String admin() {
		return "Admin.jsp";
	}
	
	@GetMapping("Dashboard")
	public String dash() {
		return "Admindashboard.jsp";
		}
	@GetMapping("doctordashboard")
	public String doctordash() {
		return "doctordashboard.jsp";
		}
	@PostMapping("doctordashboard")
	public String delete(@RequestParam("id") int id) {
		System.out.println(id);
		repo.deleteById(id);
		return "doctordashboard.jsp";
		}
	
	@PostMapping("labdashboard1")
	public String deletelab(@RequestParam("id") int id) {
		System.out.println(id);
		l.deleteById(id);
		return "laboratory.jsp";
		}
	
	@GetMapping("patientdashboard")
	public String patientdash() {
		return "patientDashboard.jsp";
		}
	@PostMapping("patientdashboard")
	public String deletepatient(@RequestParam("id") int id) {
		System.out.println(id);
		re.deleteById(id);
		return "patientDashboard.jsp";
		}
	@GetMapping("appdashboard")
	public String appdash() {
		return "appointmentdashboard.jsp";
		}
	@PostMapping("appdashboard")
	public String appdash1(@RequestParam("id") int id) {
		a.deleteById(id);
		return "appointmentdashboard.jsp";
		}
	@PostMapping("hospitaldashboard1")
	public String hospitaldash1(@RequestParam("id") int id) {
		ht.deleteById(id);
		return "redirect:/hospitaldashboard";
		}
	
	@PostMapping("doctorsearch")
	public String Dsearch(Model model,HttpServletRequest request,@RequestParam("id") int id,@RequestParam("hospitalname") String hname,@RequestParam("speciality") String speciality)
	{
		request.setAttribute("hname",hname);
		request.setAttribute("speciality", speciality);
		model.addAttribute("ids", id);
		return "DoctorSearch.jsp";
	}
	
	
	
	
	@PostMapping("Dashboard")
	public String ds(Model model,HttpServletRequest request,@RequestParam("email") String email,@RequestParam("password") String password) {
		String p = "12345";
		
		if(email.equals("admin"))
		{
			
			if(p.compareTo(password)==0)
			{
				
				
				return "Admindashboard.jsp";
				}
				
			else {
				model.addAttribute("error","Password incorrect");
				return "Admin.jsp";
			}
	}
		else {
			model.addAttribute("error","email incorrect");
			return "Admin.jsp";
		}
	}
	
	@PostMapping("logout")
	public String logout()
	{
		return "Login.jsp";
	}
	@GetMapping("forgetpass")
	public String fp()
	{
		return "forgetpass.jsp";
	}
	
	@PostMapping("recovery")
	public String recovery(Model model,@RequestParam("email") String email,@RequestParam("user") String user) {
		if(user.equals("Doctor"))
		{
		Doctor d = repo.findByEmail(email);
		if(d !=null)
		{
			SendEmail e = new SendEmail();
			String sub = "Recovery Password";
			String body = "Here is your password\n" + "password:12345";
			
			e.sendforgetmail(d.getEmail(),sub,body);
			Users y = u.findByEmail(d.getEmail());
			y.setPassword(encoder.encode("12345"));
			u.save(y);
			return "redirect:login";
		}
		else
		{
			model.addAttribute("error", "Email is not found");
			return "forgetpass.jsp";
		}
		}
		else if(user.equals("Patient"))
		{
			Patient d = re.findByEmail(email);
			if(d !=null)
			{
				SendEmail e = new SendEmail();
				String sub = "Recovery Password";
				String body = "Here is your password\n" + "password:12345";
				
				e.sendforgetmail(d.getEmail(),sub,body);
				Users y = u.findByEmail(d.getEmail());
				y.setPassword(encoder.encode("12345"));
				u.save(y);
				return "redirect:login";
			}
			else
			{
				model.addAttribute("error", "Email is not found");
				return "forgetpass.jsp";
			}
		}
		else if(user.equals("Test Lab"))
		{
			Labtester d = l.findByEmail(email);
			if(d !=null)
			{
				SendEmail e = new SendEmail();
				String sub = "Recovery Password";
				String body = "Here is your password\n" + "password:12345";
				
				e.sendforgetmail(d.getEmail(),sub,body);
				Users y = u.findByEmail(d.getEmail());
				y.setPassword(encoder.encode("12345"));
				u.save(y);
				return "redirect:login";
			}
			else
			{
				model.addAttribute("error", "Email is not found");
				return "forgetpass.jsp";
			}
		}
		else
		{
			return"forgetpass.jsp";
		}
	}
	
	@PostMapping("dashboard")
	public String dashboa(Model model,HttpServletRequest request,@RequestParam("email") String email)
	{
		Users user = u.findByEmail(email);
		if(user != null)
		{
			if(user.getHasRole() == 0)
			{
				Doctor d = repo.findByEmail(user.getEmail());
				request.setAttribute("ids", d.getId());
				request.setAttribute("dname", d.getDoctorName());
				return "DoctorSuccess.jsp";
			}
			else if(user.getHasRole() == 1)
			{
				Patient p = re.findByEmail(user.getEmail());
				request.setAttribute("ids", p.getId());
				
				return "patientSuccess.jsp";
			}
			else if(user.getHasRole() == 2)
			{
				Labtester t = l.findByEmail(user.getEmail());
				request.setAttribute("ids", t.getId());
				return "labSuccess.jsp";
			}
			else {
				return "redirect:Dashboard";
			}
		}
		else {
			return "redirect:login";
		}
	}
	
	@GetMapping("/login")
	public String login1()
	{
		return"Login.jsp";
	}
	
	@GetMapping("prescription")
	public String p()
	{
		return"Prescriptionupdation.jsp";
	}
	
	@PostMapping("/Prescriptionupdate")
	public String prescription(HttpServletRequest request,@RequestParam("patientid") int patientid,@RequestParam("doctorid") int doctorid,@RequestParam("morning") String morning,@RequestParam("afternoon") String afternoon,@RequestParam("night") String night) {
		tablet ta = t.findByPatientid(patientid);
		if(ta != null)
		{
			if(ta.getDoctorid() == doctorid)
			{
				ta.setMorning(morning);
				ta.setAfternoon(afternoon);
				ta.setNight(night);
				t.save(ta);
				
			}
		}
		else
		{
		docStorageService.savepres(patientid, doctorid, morning, afternoon, night);
		}
		Doctor d = repo.getOne(doctorid);
		request.setAttribute("ids", d.getId());
		request.setAttribute("dname", d.getDoctorName());

		return"DoctorSuccess.jsp";
	}
	
	@PostMapping("patientSearch")
	public String patientsearch(HttpServletRequest request,@RequestParam("patientid") int pid)
	{
		Patient p = re.getOne(pid);
		request.setAttribute("ids", p.getId());
		
		return "PatientSearch.jsp";
	}
	
	@PostMapping("passchange")
	public String passchange(@RequestParam("password") String password,@RequestParam("email") String email)
	{
		Users y = u.findByEmail(email);
		y.setPassword(encoder.encode(password));
		u.save(y);
		return "redirect:login";
	}
	
	@GetMapping("app")
	public String backtoDash()
	{
		
		return "Appointment.jsp";
	}
	
	@PostMapping("patientdash")
	public String patientdashb(HttpServletRequest request,@RequestParam("id") int id,@RequestParam("email") String email)
	{
		a.deleteById(id);
		Patient p = re.findByEmail(email);
		request.setAttribute("ids", p.getId());
		
		return "patientSuccess.jsp";
		
	}
}
