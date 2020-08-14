package com.doctor.firstapp;

import org.springframework.data.jpa.repository.JpaRepository;

import com.doctor.firstapp.model.labtest;

public interface labtestRepo extends JpaRepository<labtest, Integer> {

	
}
