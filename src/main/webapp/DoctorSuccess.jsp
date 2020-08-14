<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet" href = "assets/css/success.css">
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
<title>Doctor Dashboard</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="main-wrapper">
        <div class="header">
			<div class="header-left">
				<a href="index-2.html" class="logo">
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
                        <span>User</span>
                    </a>
					<div class="dropdown-menu">
						<form action = "logout" method = "POST">
                    <button type = "submit"name = "log" value = "${ids }">Logout</button>
                    </form>
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
    <li class="active"><a data-toggle="pill" href="#home">User Profile</a></li>
    <li><a data-toggle="tab" href="#menu1">Appointment</a></li>
   
     <li><a data-toggle="tab" href="#menu2">Prescription Updation</a></li>
     <li><a data-toggle="tab" href="#menu3">Patient Tracker</a></li>
     <li><a data-toggle="tab" href="#menu4">Change Password</a></li>
  </ul>
                </div>
            </div>
        </div>
<div class="container">
 
  
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <div class = container>
      <%
      try{
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "select *from project.doctor where id = " +request.getAttribute("ids");
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  
		  while(rs.next())
		  {
			   %>
			   <br><br><h2 style="text-align:center">User Profile Card</h2>

			<div class="card">
				  <img src="https://png.pngtree.com/png-vector/20190120/ourmid/pngtree-mbe-mbe-style-chemistry-chemical-ware-png-image_489601.jpg" alt="John" style="width:100%">
				  <h1><%=rs.getString("doctor_name") %></h1>
				  <p class="title"><%= rs.getString("email")%></p>
				  <p><%= rs.getString("hospital_name")%></p>
				 
				 <p><button>Contact</button></p>
				</div>
			   
			
		  <%} 
		  }catch(Exception e)
	  		{
			  out.print(e.getMessage());
	 		 }%> 

      </div>
    </div>
    <div id="menu1" class="tab-pane fade" >
 	<div class="page-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-sm-4 col-3">
                        <h4 class="page-title"style = "color:white;">Appointments</h4>
                    </div>
                    
                </div>
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table table-striped custom-table">
								<thead>
									<tr>
										<th>Appointment ID</th>
										<th>Patient Name</th>
										<th>Age</th>
										
										<th>Appointment Date</th>
										<th>Appointment Time</th>
										
										
									</tr>
								</thead>
								<tbody>
								<%
      try{
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  System.out.println(request.getAttribute("dname"));
		  String query = "SELECT project.appointment.*, project.patient.patient_name,project.patient.Age,project.doctor.speciality FROM project.appointment JOIN project.patient  ON project.patient.id  = project.appointment.patientid JOIN project.doctor ON project.doctor.doctor_name = project.appointment.doctorname where doctorname = '" + request.getAttribute("dname") + "' ORDER BY project.appointment.id";
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  while(rs.next())
		  {
		   %>
								
									<tr>
										<td><%=rs.getInt("id") %></td>
										<td><img width="28" height="28" src="assets/img/user.jpg" class="rounded-circle m-r-5" alt=""><%=rs.getString("patient_name") %> </td>
										<td><%=rs.getInt("age") %></td>
										
										<td><%=rs.getString("date") %></td>
										<td><%=rs.getString("time") %></td>
										
										
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
  

   
   <div id="menu2" class="tab-pane fade">
     <form action = "prescriptionupload" method="post" enctype="multipart/form-data">
  
  <br><br><h1><strong>Prescription upload</strong></h1>
  
  <div class="form-group">
    <label for="title">Doctor Id</label>
     <%
    try{
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "select *from project.doctor where id = " + request.getAttribute("ids");
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  while(rs.next())
		  {
			   %>
			   
			   <input type="text" name="doctorid" id="title" value = "<%=rs.getInt("id") %>"class="form-controll"/>
			<%} 
		  }catch(Exception e)
	  		{
			  out.print(e.getMessage());
	 		 }%> 
    
  </div>
  
  <div class="form-group">
    <label for="title">Patient Id</label>
   <select class="form-controll" name = "patientid" id = "patientid">
				  <option value="" style = "color:black">Patient Id</option>
				  <% 
				  try{
					  Class.forName("com.mysql.jdbc.Driver");
					  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
					  
					  String query = "select id from project.patient";
					  
					  ResultSet rs = con.createStatement().executeQuery(query); 
					 
					  while(rs.next())
					  {
						   %>
						  <option style = "color:black" value="<%=rs.getInt("id") %>"><%=rs.getInt("id") %>
						  </option>
						<% }
					  }catch(Exception e)
				  		{
						  out.print(e.getMessage());
				 		 }%> 
					  
                  </select>
  </div>
  <div class="form-group">
    <label for="caption">Prescription Description</label>
    <input type="text" name="description" id="caption" class="form-controll"/>
  </div>
  
  <div class="form-group file-area">
        <label for="file">File</label>
    <input type="file" name="file" id="file" required="required">
    <div class="file-dummy">
      
    </div>
  </div>
  
  <div class="form-group">
    <button type="submit">Upload Prescription</button>
  </div>
  
</form>


    </div>
    
     <div id="menu3" class="tab-pane fade">
     <form action = "patientSearch" method="post">
  
  <br><br><h1><strong> Search Patient</strong></h1>
  
  
  
  <div class="form-group">
    <label for="title" style = "color:white;">Patient Id</label>
    <input type="text" name="patientid" id="patientid" class="form-controll"/>
  </div>
  
  
  
  <div class="form-group">
    <button type="submit" style = "color:white;">Search</button>
  </div>
  
</form>


    </div>
    
    <div id="menu4" class="tab-pane fade">
     <form action = "passchange" method="post">
  
  <br><br><h1><strong> Password Change</strong></h1>
  
  
  
  <div class="form-group">
    <label for="title" style = "color:white;">New password</label>
    <input type="password" name="password" id="password" class="form-controll"/>
  </div>
  
  <div class="form-group">
    <label for="title" style = "color:white;">confirm password</label>
    <input type="password" name="cpassword" id="cpassword" class="form-controll"/>
  </div>
  <% 
   try{
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "select *from project.doctor where id = " + request.getAttribute("ids");
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  while(rs.next())
		  {
			   %>
			   
			   <div class="form-group">
    <button type="submit" name = "email" value ="<%=rs.getString("email") %>"  style = "color:white;">Change</button>
  </div>
			<%} 
		  }catch(Exception e)
	  		{
			  out.print(e.getMessage());
	 		 }%> 
  
  
</form>


    </div>
   
  </div>
</div>


</body>
</html>
