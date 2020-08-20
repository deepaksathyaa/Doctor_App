<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <title>Add Appointment</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    
</head>

<body>
    <div class="main-wrapper">
        <div class="header">
			<div class="header-left">
				<a class="logo">
					<img src="assets/img/logo.png" width="35" height="35" alt=""> <span>Virtusa</span>
				</a>
			</div>
			<a id="toggle_btn" href="javascript:void(0);"><i class="fa fa-bars"></i></a>
            <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
            <ul class="nav user-menu float-right">
                
                            
               
                <li class="nav-item dropdown has-arrow">
                    <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                        <span class="user-img"><img class="rounded-circle" src="assets/img/user.jpg" width="40" alt="Admin">
							<span class="status online"></span></span>
                        <span>Admin</span>
                    </a>
					<div class="dropdown-menu">
						
						<a class="dropdown-item" href="logout">Logout</a>
					</div>
                </li>
            </ul>
            <div class="dropdown mobile-user-menu float-right">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                <div class="dropdown-menu dropdown-menu-right">
                   
                    <a class="dropdown-item" href="logout">Logout</a>
                </div>
            </div>
        </div>
        <div class="sidebar" id="sidebar">
            <div class="sidebar-inner slimscroll">
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <li class="menu-title">Main</li>
                        <li>
                            <a href="Dashboard"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a>
                        </li>
						<li>
                            <a href="doctordashboard"><i class="fa fa-user-md"></i> <span>Doctors</span></a>
                        </li>
                        <li>
                            <a href="patientdashboard"><i class="fa fa-wheelchair"></i> <span>Patients</span></a>
                        </li>
                        <li class="active">
                            <a href="appdashboard"><i class="fa fa-calendar"></i> <span>Appointments</span></a>
                        </li>
                        <li>
                            <a href="labdashboard"><i class="fa fa-calendar"></i> <span>Laboratory</span></a>
                        </li>
						<li>
                            <a href="hospitaldashboard"><i class="fa fa-user-md"></i> <span>Hospital</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="page-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                    <p>${error}</p>
                        <h4 class="page-title">Add Appointment</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <form action = "/appsdashboard" method = "POST">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
										<label>Patient ID</label>
										<input class="form-control" type = "number" name = "patientid" id = "patientid">
									</div>
                                </div>
                                <div class="col-md-6">
									<div class="form-group">
										<label>Patient Name</label>
										<select class="select" >
											<% 
				  try{
					  Class.forName("com.mysql.jdbc.Driver");
					  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
					  
					  String query = "select patient_name from project.patient";
					  
					  ResultSet rs = con.createStatement().executeQuery(query); 
					 
					  while(rs.next())
					  {
						   %>
						  <option value="<%=rs.getString("patient_name") %>"><%=rs.getString("patient_name") %>
						  </option>
						<% }
					  }catch(Exception e)
				  		{
						  out.print(e.getMessage());
				 		 }%> 
					  
                  </select>
									</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Department</label>
                                        <select class="select">
                                            <option>Select</option>
                                            <option>Dentists</option>
                                            <option>Neurology</option>
                                            <option>Opthalmology</option>
                                            <option>Orthopedics</option>
                                            <option>Cancer Department</option>
                                            <option>ENT Department</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Doctor</label>
                                        <select class="select" name = "doctorname" id = "doctoname">
											<option>Select</option>
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
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Date</label>
                                       
                                            <input class="form-control" type="date"name ="date">
                                      
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Time</label>
                                        <select class="select" name="time" id="time">
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
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Patient Email</label>
                                        <input class="form-control" type="email">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Appointment Type</label>
                                        <select class="select" name="type" id="type">
                     <option value="">Select Type</option>
                     <option>A new patient appointment</option>
                     <option>A routine checkup</option>
                     <option>A comprehensive health exam</option>
                  </select>
                                    </div>
                                </div>
                            </div>
                           
                            <div class="m-t-20 text-center">
                                <button class="btn btn-primary submit-btn">Create Appointment</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
			
        </div>
    </div>
    <div class="sidebar-overlay" data-reff=""></div>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>
    <script src="assets/js/select2.min.js"></script>
	<script src="assets/js/moment.min.js"></script>
	<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="assets/js/app.js"></script>
	<script>
            $(function () {
                $('#datetimepicker3').datetimepicker({
                    format: 'LT'

                });
            });
     </script>
</body>


</html>
