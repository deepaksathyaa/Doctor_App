package com.doctor.firstapp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.doctor.firstapp.model.Hospital;

public interface HospitalRepo extends JpaRepository<Hospital, Integer> {
	Hospital findByEmail(String email);
}
