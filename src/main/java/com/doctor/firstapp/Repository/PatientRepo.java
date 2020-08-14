package com.doctor.firstapp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.doctor.firstapp.model.Patient;

public interface PatientRepo extends JpaRepository<Patient,Integer>{

	Patient findByPatientName(String name);

	Patient findByEmail(String email);

}
