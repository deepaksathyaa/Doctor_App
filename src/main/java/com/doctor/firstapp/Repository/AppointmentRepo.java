package com.doctor.firstapp.Repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.doctor.firstapp.model.Appointment;

public interface AppointmentRepo extends JpaRepository<Appointment,Integer>{

	

	ArrayList<Appointment> findAllByDate(String date);

	List<Appointment> findByDoctorname(String dname);



}
