package com.doctor.firstapp;


import org.springframework.data.jpa.repository.JpaRepository;

import com.doctor.firstapp.model.Alien;



public interface AlienRepo extends JpaRepository<Alien, Integer>{

}
