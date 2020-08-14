package com.doctor.firstapp.Security;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.security.crypto.password.PasswordEncoder;





@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter
{
	@Autowired
	
	private UserDetailsService userDetailsService1;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
	    return new BCryptPasswordEncoder();
	}
	
	@Bean
	  public AuthenticationProvider authProvider()
	{
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(userDetailsService1);
		provider.setPasswordEncoder(passwordEncoder());
		return provider;
		  
	  }
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.csrf().disable()
			.authorizeRequests().antMatchers(
	               "/assets/css/**",
	               "/assets/fonts/**",
	               "/assets/img/**",
	               "/assets/js/**",
	                "/js/**",
	                "/css/**",
	                "/images/**",
	                "/Doctor"
	                ).permitAll()
			.antMatchers("/mainlogin").permitAll()
			.antMatchers("/Patientsignup").permitAll()
			.antMatchers("/Doctorsignup").permitAll()
			.antMatchers("/doctorsuccess").permitAll()
			.antMatchers("/Labsignup").permitAll()
			.antMatchers("/forgetpass").permitAll()
			.antMatchers("/recovery").permitAll()
			.antMatchers("backtodash/{id}").permitAll()
			.anyRequest().authenticated()
			.and()
			.formLogin()
			.loginPage("/login").failureUrl("/login").usernameParameter("email").passwordParameter("password").successForwardUrl("/dashboard").loginProcessingUrl("/dashboard").permitAll()
			
			.and()
			
			.logout()
			.logoutSuccessUrl("/login").permitAll();
	}
	 @Override
	    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	        auth.authenticationProvider(authProvider());
	    }
	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//	    http
//	      .csrf().disable()
//	    .authorizeRequests()
//		.antMatchers("/success").permitAll()
//		.antMatchers("/Patient").permitAll()
//		.antMatchers("/index").permitAll()
//		.antMatchers("/doctorsuccess").permitAll()
//		.anyRequest().authenticated()
//		.and()
//		.formLogin()
//		.loginPage("/Doctor").permitAll()
//		.and()
//		.logout().invalidateHttpSession(true)
//		.clearAuthentication(true)
//		.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
//		.logoutSuccessUrl("/index").permitAll();
//	}
}
