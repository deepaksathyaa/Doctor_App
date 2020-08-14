package com.doctor.firstapp;

import org.springframework.data.jpa.repository.JpaRepository;

import com.doctor.firstapp.model.Users;

public interface UserRepo extends JpaRepository<Users, Integer> {

	Users findByEmail(String email);

}
