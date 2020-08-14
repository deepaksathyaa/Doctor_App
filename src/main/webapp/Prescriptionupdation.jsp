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
    <title>Prescription Updation</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    

<body>
    <div class="main-wrapper  account-wrapper">
        <div class="account-page">
            <div class="account-center">
                <div class="account-box">
                    <form action="Prescriptionupdate" class="form-signin" method = "POST">
						<div class="account-logo">
                            <a><img src="assets/img/logo-dark.png" alt=""></a>
                        </div>
                        <div class="form-group">
                             <label>Patient id</label>
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
                        </div>
                        <div class="form-group">
                            <label>Doctor id</label>
                            <select class="form-control" name = "doctorid" id = "doctorid">
				  <option value="">DoctorId</option>
				  <% 
				  try{
					  Class.forName("com.mysql.jdbc.Driver");
					  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
					  
					  String query = "select id from project.doctor";
					  
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
                        </div>
                        <div class="form-group">
                            <label>Morning</label>
                            <input type="text" class="form-control" name = "morning" placeholder = "Morning Tablets">
                        </div>
                        <div class="form-group">
                            <label>Afternoon</label>
                            <input type="text" class="form-control" name = "afternoon" placeholder = "Afternoon Tablets">
                        </div>
						<div class="form-group">
                            <label>Night</label>
                            <input type="text" class="form-control" name = "night" placeholder = "Night Tablets">
                        </div>
						
                        
                        <div class="form-group text-center">
                            <button class="btn btn-primary account-btn" type="submit">ADD</button>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/app.js"></script>
</body>
</html>
