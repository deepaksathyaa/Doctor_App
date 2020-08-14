package com.doctor.firstapp.Controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.doctor.firstapp.Repository.LabRepo;
import com.doctor.firstapp.model.Labtester;

@RestController
public class LabController {

	@Autowired
	LabRepo r;
	
	@GetMapping("Lab")
	public List<Labtester> getlab(){
		
		List<Labtester> l = r.findAll();
		return l;
	}
	
	@GetMapping("Lab/{id}")
	public Labtester getlabById(@PathVariable("id") int id){
		
		Labtester l = r.findById(id).orElse(new Labtester());
		return l;
	}
	
	@GetMapping("Labs/{name}")
	public Labtester getByname(@PathVariable("name") String name)
	{
		Labtester l = r.findByTestlabname(name);
		return l;
	}
}
