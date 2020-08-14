package com.doctor.firstapp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.doctor.firstapp.model.Labtester;



public interface LabRepo extends JpaRepository<Labtester,Integer>{

	Labtester findByTestlabname(String name);

	Labtester findByEmail(String email);
	@Modifying
	@Query("update Labtester u set u.active= ?1 where u.id = ?2")
	void setUserInfoById(int active, Integer userId);

}
