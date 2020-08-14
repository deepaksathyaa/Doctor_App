<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <title>Appointments</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    
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
                    <div class="col-sm-4 col-3">
                        <h4 class="page-title">Appointments</h4>
                    </div>
                    <div class="col-sm-8 col-9 text-right m-b-20">
                        <a href="addappointment" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add Appointment</a>
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
		  
		  String query = "SELECT project.appointment.*, project.patient.patient_name,project.patient.Age,project.doctor.speciality FROM project.appointment JOIN project.patient  ON project.patient.id  = project.appointment.patientid JOIN project.doctor ON project.doctor.doctor_name = project.appointment.doctorname ORDER BY project.appointment.id;";
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  while(rs.next())
		  {
		   %>
								
									<tr>
										<td><%=rs.getInt("id") %></td>
										<td><img width="28" height="28" src="assets/img/user.jpg" class="rounded-circle m-r-5" alt=""><%=rs.getString("patient_name") %> </td>
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
            <form action="appdashboard" method="post">
			<div id="delete_appointment" class="modal fade delete-modal" role="dialog">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-body text-center">
							<img src="assets/img/sent.png" alt="" width="50" height="46">
							<h3>Are you sure want to delete this Appointment?</h3>
							<div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">Close</a>
								<button id="bt" name="id" type="submit" class="btn btn-danger" value= "1" >Delete</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
    </div>
    <div class="sidebar-overlay" data-reff=""></div>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
     <script>
function myFunction(id) {
  document.getElementById("bt").value = id;
}
</script>
	<script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>
    <script src="assets/js/select2.min.js"></script>
    <script src="assets/js/app.js"></script>
	<script>
            $(function () {
                $('#datetimepicker3').datetimepicker({
                    format: 'LT'
                });
				$('#datetimepicker4').datetimepicker({
                    format: 'LT'
                });
            });
     </script>
</body>


</html>



