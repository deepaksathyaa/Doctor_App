package com.doctor.firstapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
//import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import com.doctor.firstapp.model.Doctor;



@RestController

public class DoctorController {

	@Autowired
	DoctorRepo r;
	

	@GetMapping("/doctor")
	public List<Doctor> getDoctor(){
		List<Doctor> d = r.findAll();
		return d;
	}
	
	@GetMapping("doctor/{id}")
	public Doctor getDoctorbyid(@PathVariable("id") int id){
		Doctor d = r.findById(id).orElse(new Doctor());
		return d;
		
	}
	
	@GetMapping("doctors/{name}")
	public List<Doctor> getDoctorbyName(@PathVariable("name") String name){
		List<Doctor> d = r.findByDoctorName(name);
		return d;
		
	}
	
}
