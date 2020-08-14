package com.doctor.firstapp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.doctor.firstapp.model.tablet;

public interface TabletRepo extends JpaRepository<tablet, Integer> {

	tablet findByPatientid(int patientid);

}
