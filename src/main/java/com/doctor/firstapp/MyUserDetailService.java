package com.doctor.firstapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.doctor.firstapp.model.Doctor;
import com.doctor.firstapp.model.Users;

@Service
public class MyUserDetailService implements UserDetailsService {

	@Autowired
	UserRepo u;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Users d = u.findByEmail(username);
		if(d == null)
		{
			throw new UsernameNotFoundException("User 404");
		}
		return new UserPrinciple(d);
	}

}
