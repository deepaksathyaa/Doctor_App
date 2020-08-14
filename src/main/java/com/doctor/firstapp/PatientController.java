package com.doctor.firstapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.doctor.firstapp.model.Patient;

@RestController
public class PatientController {

	@Autowired
	PatientRepo r;
	
	
	@GetMapping("patients")
	public List<Patient> getPatients()
	{
		List<Patient> p = r.findAll();
		return p;
		
	}
	
	@GetMapping("patient/{id}")
	public Patient getById(@PathVariable("id") int id)
	{
		Patient p = r.findById(id).orElse(new Patient());
		return p;
	}
	
	@GetMapping("patients/{name}")
	public Patient getByName(@PathVariable("name") String name)
	{
		Patient p = r.findByPatientName(name);
		return p;
	}
}
