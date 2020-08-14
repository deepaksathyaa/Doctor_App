package com.doctor.firstapp;

import org.springframework.data.jpa.repository.JpaRepository;

import com.doctor.firstapp.model.Prescription;

public interface PrescriptionRepo extends JpaRepository<Prescription, Integer> {

}
