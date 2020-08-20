<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>

<body>
    <div class="main-wrapper">
        <div class="header">
			<div class="header-left">
				<a class="logo">
					<img src="assets/img/logo.png" width="35" height="35" alt=""> Virtusa <span></span>
				</a>
			</div>
			<a id="toggle_btn" href="javascript:void(0);"><i class="fa fa-bars"></i></a>
            <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
            <ul class="nav user-menu float-right">
               
                <li class="nav-item dropdown has-arrow">
                    <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                        <span class="user-img">
							<img class="rounded-circle" src="assets/img/user.jpg" width="24" alt="Admin">
							<span class="status online"></span>
						</span>
						<span>Admin</span>
                    </a>
					<div class="dropdown-menu">
						
						<a class="dropdown-item" href="logout">Logout</a>
					</div>
                </li>
            </ul>
            <div class="dropdown mobile-user-menu float-right">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
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
                        <li class="active">
                            <a href="Dashboard"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a>
                        </li>
						<li>
                            <a href="doctordashboard"><i class="fa fa-user-md"></i> <span>Doctors</span></a>
                        </li>
                        <li>
                            <a href="patientdashboard"><i class="fa fa-wheelchair"></i> <span>Patients</span></a>
                        </li>
                        <li>
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
                    <div class="col-md-7 col-sm-7 col-lg-7 col-xl-4">
                        <div class="dash-widget">
							<span class="dash-widget-bg1"><i class="fa fa-stethoscope" aria-hidden="true"></i></span>
							<div class="dash-widget-info text-right">
							<%
							try
							{
								 Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "select count(*) from project.doctor";
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  while(rs.next()){%>
								<h3><%= rs.getInt("COUNT(*)")%></h3>
								<% }
							}catch(Exception e)
							{
								
							} %>
								<span class="widget-title1">Doctors <i class="fa fa-check" aria-hidden="true"></i></span>
							</div>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-7 col-lg-7 col-xl-4">
                        <div class="dash-widget">
                            <span class="dash-widget-bg2"><i class="fa fa-user-o"></i></span>
                            <div class="dash-widget-info text-right">
                            <%
							try
							{
								 Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "select count(*) from project.patient";
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  while(rs.next()){%>
								<h3><%= rs.getInt("COUNT(*)")%></h3>
								<% }
							}catch(Exception e)
							{
								
							} %>
                               
                                <span class="widget-title2">Patients <i class="fa fa-check" aria-hidden="true"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 col-sm-7 col-lg-7 col-xl-4">
                        <div class="dash-widget">
                            <span class="dash-widget-bg3"><i class="fa fa-user-md" aria-hidden="true"></i></span>
                            <div class="dash-widget-info text-right">
                                 <%
							try
							{
								 Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "select count(*) from project.labtester";
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  while(rs.next()){%>
								<h3><%= rs.getInt("COUNT(*)")%></h3>
								<% }
							}catch(Exception e)
							{
								
							} %>
                               
                                <span class="widget-title3">Lab Assistant<i class="fa fa-check" aria-hidden="true"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
				
				<div class="row">
					<div class="col-12 col-md-6 col-lg-8 col-xl-8">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title d-inline-block">Upcoming Appointments</h4> <a href="appointments.html" class="btn btn-primary float-right">View all</a>
							</div>
							<div class="card-body p-0">
								<div class="table-responsive">
									<table class="table mb-0">
										<thead class="d-none">
											<tr>
												<th>Patient Name</th>
												<th>Doctor Name</th>
												<th>Timing</th>
												<th class="text-right">Status</th>
											</tr>
										</thead>
										<tbody>
											
												      <%
							try
							{
								 Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "select * from project.appointment";
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  while(rs.next()){
								 String query1 = "select * from project.patient where id = " + rs.getInt("patientid");
		  
		  ResultSet s = con.createStatement().executeQuery(query1); 
		  while(s.next()){
								%>
								<tr>
												<td style="min-width: 200px;">
													
													<h5><a><%=s.getString("patient_name") %><span><%=s.getInt("age") %></span></a></h5>
												</td>                 
												<td>
													<h5 class="time-title p-0">Appointment With</h5>
													<p>Dr.<%=rs.getString("doctorname") %></p>
												</td>
												<td>
													<h5 class="time-title p-0">Timing</h5>
													<p><%=rs.getString("time") %></p>
												</td>
												<td class="text-right">
													<a href="appdashboard" class="btn btn-outline-primary take-btn">Take up</a>
												</td>
											</tr>
											<% }}
							}catch(Exception e)
							{
								
							} %>
                               
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
                    <div class="col-12 col-md-6 col-lg-4 col-xl-4">
                        <div class="card member-panel">
							<div class="card-header bg-white">
								<h4 class="card-title mb-0">Doctors</h4>
							</div>
                            <div class="card-body">
                                <ul class="contact-list">
                                <% try
							{
								 Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "select * from project.doctor";
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  while(rs.next()){%>
								<li>
                                        <div class="contact-cont">
                                            <div class="float-left user-img m-r-10">
                                                <a href="profile.html" title="John Doe"><img src="assets/img/user.jpg" alt="" class="w-40 rounded-circle"><span class="status online"></span></a>
                                            </div>
                                            <div class="contact-info">
                                                <span class="contact-name text-ellipsis"><%= rs.getString("doctor_name") %></span>
                                                <span class="contact-date"><%= rs.getString("speciality") %></span>
                                            </div>
                                        </div>
                                    </li>
								<% }
							}catch(Exception e)
							{
								
							} %>
                               
                                   
                                </ul>
                            </div>
                            <div class="card-footer text-center bg-white">
                                <a href="doctors.html" class="text-muted">View all Doctors</a>
                            </div>
                        </div>
                    </div>
				</div>
				<div class="row">
					<div class="col-12 col-md-8 col-lg-12 col-xl-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title d-inline-block">New Patients </h4> <a href="patients.html" class="btn btn-primary float-right">View all</a>
							</div>
							<div class="card-block">
								<div class="table-responsive">
									<table class="table mb-0 new-patient-table">
										<tbody>
											
											<%
							try
							{
								 Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "select * from project.patient";
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  while(rs.next()){%>
								<tr>
								<td>
													<img width="28" height="28" class="rounded-circle" src="assets/img/user.jpg" alt=""> 
													<h2><%= rs.getString("patient_name") %></h2>
												</td>
												<td><%= rs.getString("email") %></td>
												<td><%= rs.getString("Phnumber") %></td>
												<td><button class="btn btn-primary btn-primary-one float-right">Fever</button></td>
											</tr>
								<% }
							}catch(Exception e)
							{
								
							} %>
                               
												
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					
				</div>
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
    <script src="assets/js/Chart.bundle.js"></script>
    <script src="assets/js/chart.js"></script>
    <script src="assets/js/app.js"></script>

</body>



</html>
