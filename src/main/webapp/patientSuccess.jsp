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
<title>PatientSuccess</title>
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
    <li><a data-toggle="tab" href="#menu1">Appointment</a></li>
    <li><a data-toggle="tab" href="#menu2">Test Result</a></li>
     <li><a data-toggle="tab" href="#menu3">Prescription</a></li>
  	<li><a data-toggle="tab" href="#menu4">Change Password</a></li>
  	<li><a data-toggle="tab" href="#menu5">Doctor Search</a></li>
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
		  
		  String query = "select *from project.patient where id = " + request.getAttribute("ids");
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  
		  while(rs.next())
		  {
			   %>
			   <br><br><h2 style="text-align:center">User Profile Card</h2>

			<div class="card">
				  <img src="https://paramountsprx.com/wp-content/uploads/2017/09/MAN_AVATAR.png" alt="John" style="width:100%">
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
    <div id="menu1" class="tab-pane fade" >
 	<div class="page-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-sm-4 col-3">
                        <h4 class="page-title"style = "color:white;">Appointments</h4>
                    </div>
                    <div class="col-sm-8 col-9 text-right m-b-20">
                        <a href="/appointment" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add Appointment</a>
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
										<th>Doctor Name</th>
										<th>Department</th>
										<th>Appointment Date</th>
										<th>Appointment Time</th>
										
										<th class="text-right">Action</th>
									</tr>
								</thead>
								<tbody>
								<%
      try{
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "SELECT project.appointment.*, project.patient.patient_name,project.patient.Age,project.doctor.speciality FROM project.appointment JOIN project.patient  ON project.patient.id  = project.appointment.patientid JOIN project.doctor ON project.doctor.doctor_name = project.appointment.doctorname where patientid = "+request.getAttribute("ids")+" ORDER BY project.appointment.id";
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  while(rs.next())
		  {
		   %>
								
									<tr>
										<td><%=rs.getInt("id") %></td>
										<td><%=rs.getString("patient_name") %> </td>
										<td><%=rs.getInt("age") %></td>
										<td><%=rs.getString("doctorname") %></td>
										<td><%=rs.getString("speciality") %></td>
										<td><%=rs.getString("date") %></td>
										<td><%=rs.getString("time") %></td>
										<td class="text-right">
											<div class="dropdown dropdown-action">
												<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
												<div class="dropdown-menu dropdown-menu-right">
													
													<a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_appointment" onclick="myFunction(<%=rs.getInt("id") %>)" ><i class="fa fa-trash-o m-r-5"></i> Delete</a>
												</div>
											</div>
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
           <form action="patientdash" method="post">
			<div id="delete_appointment" class="modal fade delete-modal" role="dialog">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-body text-center">
							<img src="assets/img/sent.png" alt="" width="50" height="46">
							<h3>Are you sure want to delete this Appointment?</h3>
							 <div class="col-sm-6">
                                    <div class="form-group">
                                        <label>Enter your Email <span class="text-danger">*</span></label>
                                        <input class="form-control" type="email" name = "email">
                                    </div>
                                </div>
							<br><div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">Close</a>
								<button id="bt" name="id" type="submit" class="btn btn-danger" value= "1" >Delete</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			</form>
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
										<td><form action = "downloadFile/<%= rs.getInt("id") %>" method = "POST">
										<button type = "submit" style = "color:white;">download</button></form>
										
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
										<td><form action = "downloadPrescription/<%= rs.getInt("id") %>" method = "POST">
										<button type = "submit" style = "color:white;">download</button></form>
										
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
		  
		  String query = "select *from project.patient where id = " + request.getAttribute("ids");
		  
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
   
  <div id="menu5" class="tab-pane fade">
     <form action = "doctorsearch" method="post">
  
  <br><br><h1><strong>Doctor Search</strong></h1>
  
  
  
  <div class="form-group">
    <label for="title" style = "color:white;">Select Speciality:</label>
    <select class="form-controll"name = "speciality">
                                            <option style = "color : black;">Select</option>
                                            <option style = "color : black;">Dentists</option>
                                            <option style = "color : black;">Neurology</option>
                                            <option style = "color : black;">Opthalmology</option>
                                            <option style = "color : black;">Orthopedics</option>
                                            <option style = "color : black;">Cancer Department</option>
                                            <option style = "color : black;">ENT Department</option>
                                        </select>
  </div>
  
  <div class="form-group">
  <br><label for="title" style = "color:white;">Select Hospital:</label>
    <br><select class="form-controll" name = "hospitalname" id = "">
                     <option style = "color : black;"value="">
                        Select Hospital
                     </option>
                     <% 
				  try{
					  Class.forName("com.mysql.jdbc.Driver");
					  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
					  
					  String query = "select Distinct(hospitalname) from project.hospital";
					  
					  ResultSet rs = con.createStatement().executeQuery(query); 
					 
					  while(rs.next())
					  {
						  String query1 = "select id from project.patient where  id = "+request.getAttribute("ids");
						  
						  ResultSet s = con.createStatement().executeQuery(query1); 
						 while(s.next()){
						   %>
						  <option  style = "color : black;" value="<%=rs.getString("hospitalname") %>"><%=rs.getString("hospitalname") %>
						  </option>
						
                     
                  </select>
                  <br><br><div class="form-group">
    <button type="submit" name = "id" style = "color:white;" value ="<%=s.getInt("id") %>">Search</button>
    <% }}
					  }catch(Exception e)
				  		{
						  out.print(e.getMessage());
				 		 }%> 
					  
  </div>
  </div>
  
  
</form>


    </div>
  
    </div>
   
  </div>
</div>

<script>
function myFunction(id) {
  document.getElementById("bt").value = id;
}
</script>
</body>
</html>  