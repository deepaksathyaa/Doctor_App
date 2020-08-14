<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Doctor Search Form a Flat Responsive Widget Template :: w3layouts </title>
      <!-- Meta tags -->
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta name="keywords" content="Doctor Search Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"
         />
      <script>
         addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
      </script>
      <!-- Meta tags -->
      <!-- Calendar -->
      <link rel="stylesheet" href="assets/css/jquery-ui.css" />
      <!-- //Calendar -->
      <!--stylesheets-->
      <link href="assets/css/style1.css" rel='stylesheet' type='text/css' media="all">
      <!--//style sheet end here-->
      <link href="//fonts.googleapis.com/css1?family=Cuprum:400,700" rel="stylesheet">
   </head>
   <body>
      <h1 class="header-w3ls">
         Doctor Appointment Form
      </h1>
      <div class="doctor-form">
         <h2 class="doctor-list-w3l">Appointment Here Doctor</h2>
         <h5>${error}</h5>
         <form action="/success" method="post">
           
            <div class="main">
               <div class="form-left-to-w3l">
                  <select class="form-control" name = "patientid" id = "patientid">
				  <option value="">Patient Id</option>
				  <% 
				  try{
					  Class.forName("com.mysql.jdbc.Driver");
					  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
					  
					  String query = "select id from project.patient";
					  
					  ResultSet rs = con.createStatement().executeQuery(query); 
					 
					  while(rs.next())
					  {
						   %>
						  <option value="<%=rs.getInt("id") %>"><%=rs.getInt("id") %>
						  </option>
						<% }
					  }catch(Exception e)
				  		{
						  out.print(e.getMessage());
				 		 }%> 
					  
                  </select>
                  <div class="clear"></div>
               </div>
               </div>
                <div class="main">
               <div class="form-left-to-w3l">
                   <select class="form-control" name = "doctorname" id = "doctoname">
				  <option value="">Select Doctor</option>
				  <% 
				  try{
					  Class.forName("com.mysql.jdbc.Driver");
					  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
					  
					  String query = "select doctor_name from project.doctor";
					  
					  ResultSet rs = con.createStatement().executeQuery(query); 
					 
					  while(rs.next())
					  {
						   %>
						  <option value="<%=rs.getString("doctor_name") %>"><%=rs.getString("doctor_name") %>
						  </option>
						<% }
					  }catch(Exception e)
				  		{
						  out.print(e.getMessage());
				 		 }%> 
					  
                  </select>
                  <div class="clear"></div>
               </div>
               <div class="form-right-to-w3l">
                  <select class="form-control" name = "" id = "" >
				  <option value="">Select Speciality</option>
				  <% 
				  try{
					  Class.forName("com.mysql.jdbc.Driver");
					  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
					  
					  String query = "select Distinct(speciality) from project.doctor";
					  
					  ResultSet rs = con.createStatement().executeQuery(query); 
					 
					  while(rs.next())
					  {
						   %>
						  <option value="<%=rs.getString("speciality") %>"><%=rs.getString("speciality") %>
						  </option>
						<% }
					  }catch(Exception e)
				  		{
						  out.print(e.getMessage());
				 		 }%> 
					  
                  </select>
               </div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <input  id="datepicker1" name="date" type="date" placeholder="(YYYY-MM-DD)Appointment Date" required>
               </div>
               <div class="form-right-to-w3l">
                  <select class="form-control buttom" name = "" id = "">
                     <option value="">
                        Select Hospital
                     </option>
                     <% 
				  try{
					  Class.forName("com.mysql.jdbc.Driver");
					  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
					  
					  String query = "select Distinct(hospital_name) from project.doctor";
					  
					  ResultSet rs = con.createStatement().executeQuery(query); 
					 
					  while(rs.next())
					  {
						   %>
						  <option value="<%=rs.getString("hospital_name") %>"><%=rs.getString("hospital_name") %>
						  </option>
						<% }
					  }catch(Exception e)
				  		{
						  out.print(e.getMessage());
				 		 }%> 
					  
                     
                  </select>
                  <div class="clear"></div>
               </div>
            </div>
            <div class="clear"></div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <select class="form-control" name = "time" id = "time">
                  <option value="">Select Appointment Time</option>
                     <option>9.00 AM</option>
                     <option>10.00 AM</option>
                     <option>11.00 AM</option>
                     <option>12.00 PM</option>
                     <option>01.00 PM</option>
                     <option>02.00 PM</option>
                     <option>03.00 PM</option>
                     <option>04.00 PM</option>
                     <option>05.00 PM</option>
                  </select>
                  <div class="clear"></div>
               </div>
               <div class="form-right-to-w3l gap-top">
                  <select class="form-control" name = "type" id = "type">
                     <option value="">Select Type</option>
                     <option>A new patient appointment</option>
                     <option>A routine checkup</option>
                     <option>A comprehensive health exam</option>
                  </select>
               </div>
                  
                  <div class="clear"></div>
               </div>

            <div class="btnn">
               <button type="submit">SEARCH</button><br>
            </div>
         </form>
      </div>
      <!--scripts-->
      <script src='assets/js/jquery-2.2.3.min.js'></script>
      <!--//scripts-->
      <!-- //js -->
      <!-- Calendar -->
      <script src="assets/js/jquery-ui.js"></script>
      
      <!-- //Calendar -->
   </body>
</html>