package com.doctor.firstapp;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.doctor.firstapp.model.Doctor;

public interface DoctorRepo extends JpaRepository<Doctor,Integer>{
	List<Doctor> findByDoctorName(String name);

	Doctor findByEmail(String email);

	

}
