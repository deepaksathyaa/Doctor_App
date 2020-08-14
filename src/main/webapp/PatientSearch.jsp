<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
<title>Patient Search</title>
<link rel = "stylesheet" href = "assets/css/success.css">
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
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
    <li><a data-toggle="tab" href="#menu2">Test Result</a></li>
     <li><a data-toggle="tab" href="#menu3">Prescription</a></li>
  </ul>
                </div>
            </div>
        </div>
<div class="container">
 
  <div class = "container  bg-success text-white" >
  <ul class="nav nav-pills bg-secondary text-white">
    <li class="active"><a data-toggle="pill" href="#home">User Profile</a></li>
    <li><a data-toggle="pill" href="#menu1">Appointment</a></li>
    <li><a data-toggle="pill" href="#menu2">Prescription</a></li>
    
  </ul>
  </div>
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <div class = container>
      <%
      try{
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "select *from project.patient where id = " + request.getAttribute("ids");
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  
		  while(rs.next())
		  {
			   %>
			   <h2 style="text-align:center">User Profile Card</h2>

			<div class="card">
				  <img src="https://png.pngtree.com/png-vector/20190120/ourmid/pngtree-mbe-mbe-style-chemistry-chemical-ware-png-image_489601.jpg" alt="John" style="width:100%">
				  <h1><%=rs.getString("patient_name") %></h1>
				  <p class="title"><%= rs.getString("email")%></p>
				  <p><%= rs.getString("age")%></p>
				 
				 <p><button>Contact</button></p>
				</div>
			   
			
		  <%} 
		  }catch(Exception e)
	  		{
			  out.print(e.getMessage());
	 		 }%> 

      </div>
    </div>
    
  

   
   <div id="menu2" class="tab-pane fade">
    <div class="page-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-sm-4 col-3">
                        <h4 class="page-title"style = "color:white;">Test Result</h4>
                    </div>
                    
                </div>
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table table-striped custom-table">
								<thead>
									<tr>
										
										<th>Doctor Name</th>
										<th>Description</th>
										<th>Test Lab</th>
										<th>Download</th>
										
									</tr>
								</thead>
								<tbody>
								<%
								 try{
									  Class.forName("com.mysql.jdbc.Driver");
									  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
									  
									  String query = "SELECT project.labtest.id,project.labtest.description,project.labtest.data, project.labtester.Testlabname,project.doctor.doctor_name FROM project.labtest JOIN project.doctor  ON project.doctor.id  = project.labtest.doctorid  JOIN project.labtester ON project.labtester.id = project.labtest.testerid where patientid = "+request.getAttribute("ids")+" ORDER BY project.labtest.id";
									  
									  ResultSet rs = con.createStatement().executeQuery(query); 
									 
										  while(rs.next())
										  	{
											   %>
											   
							  
									
									<tr>
										
										<td><%=rs.getString("doctor_name") %> </td>
										<td><%=rs.getString("description") %></td>
										<td><%=rs.getString("Testlabname") %></td>
										<td><a href = "downloadfile/<%= rs.getInt("id") %>">download</a>
										</td>
										
										
										
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
  
    
<div id="menu3" class="tab-pane fade">
    <div class="page-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-sm-4 col-3">
                        <h4 class="page-title"style = "color:white;">Prescription</h4>
                    </div>
                    
                </div>
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<table class="table table-striped custom-table">
								<thead>
									<tr>
										<th>Doctor Name</th>
										<th>Description</th>
										<th>Download</th>
										
										
									</tr>
								</thead>
								<tbody>
								<%
								 try{
									  Class.forName("com.mysql.jdbc.Driver");
									  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
									  
									  String query = "SELECT project.prescription.id,project.prescription.description,project.prescription.data,project.doctor.doctor_name FROM project.prescription  JOIN project.doctor  ON project.doctor.id  = project.prescription.doctorid  where patientid = "+request.getAttribute("ids")+" ORDER BY project.prescription.id";
									  
									  ResultSet rs = con.createStatement().executeQuery(query); 
									 
										  while(rs.next())
										  	{
											   %>
											   
							  
									
									<tr>
										
										<td><%=rs.getString("doctor_name") %> </td>
										<td><%=rs.getString("description") %></td>
										<td><a href = "downloadPrescription/<%=rs.getInt("id") %>">download</a></td>
										
										
										
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


</body>
</html> 