<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
 
  <div class = "container  bg-success text-white" >
  <ul class="nav nav-pills bg-secondary text-white">
    <li class="active"><a data-toggle="pill" href="#home">User Profile</a></li>
    <li><a data-toggle="tab" href="#menu1">Appointment</a></li>
    <li><a data-toggle="tab" href="#menu2">Test Result</a></li>
     <li><a data-toggle="tab" href="#menu3">Prescription</a></li>
  </ul>
  </div>
	<div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <div class = container>
      <%
      try{
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "select *from project.patient ORDER BY id DESC LIMIT 1";
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  while(rs.next())
		  {
			   %>
			   <h2 style="text-align:center"></h2>

			<div class="card">
				  <img src="https://png.pngtree.com/png-vector/20190120/ourmid/pngtree-mbe-mbe-style-chemistry-chemical-ware-png-image_489601.jpg" alt="John" style="width:100%">
				  <h1><%=rs.getString("patient_name") %></h1>
				  <p class="title"><%= rs.getString("email")%></p>
				  <p><%= rs.getString("Phnumber")%></p>
				 
				 <p><button>Contact</button></p>
				</div>
			   
			<%} 
		  }catch(Exception e)
	  		{
			  out.print(e.getMessage());
	 		 }%> 

      </div>
    </div>
    <div id="menu1" class="tab-pane fade">

  
  <h1><strong>Appointment</strong></h1>
  <div class = "container-fluid">
  <div class="row">
    <div class="col-md-3">Doctor Name</div>
    <div class="col-md-3">Date</div>
    <div class="col-md-3">Time</div>
    <div class="col-md-3">Type</div>
  </div>
  </div>
  <br>
  <br>
    
<%
    try{
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "Select * from project.appointment where patientid = (3)";
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		 
			  while(rs.next())
			  	{
				   %>
				   
  <div class = "container-fluid">
  <div class="row">
    <div class="col-md-3"><%= rs.getString("doctorname")%></div>
    <div class="col-md-3"><%= rs.getString("date")%></div>
    <div class="col-md-3"><%= rs.getString("time")%></div>
    <div class="col-md-3"><%= rs.getString("type")%></div><br><br>
  </div>
</div>
		  <% }
		  }catch(Exception e)
	  		{
			  out.print(e.getMessage());
	 		 }%>
    
  


    </div>
   <div id="menu2" class="tab-pane fade">
   <h1><strong>Test Result</strong></h1>
   <div class = "container-fluid">
  <div class="row">
    <div class="col-md-3">Description</div>
    <div class="col-md-3">Patient Id</div>
    <div class="col-md-3">Filename</div>
    <div class="col-md-3">Download</div><br><br>
    <% try{
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "Select * from project.labtest where patientid = (3)";
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  
			  
			  while(rs.next())
			  	{
				   %>
				   
				   <div class="container-fluid">
					  <div class="row">
    <div class="col-md-3" ><%= rs.getString("description")%></div>
    <div class="col-md-3" ><%= rs.getString("patientid")%></div>
    <div class="col-md-3" ><%= rs.getString("docname")%></div>
					     <div class="col-md-3">
					     <form action="downloadFile/<%= rs.getInt("id")%>">
					     <button type="submit" class="btn btn-primary">download</button>
					     </form>
					     </div>
					    </div>
					  </div>
		 <% }
		  }catch(Exception e)
	  		{
			  out.print(e.getMessage());
	 		 }%>
	 		 
  </div>
  </div>
  <br>
  <br>
   </div>
   
   <div id="menu3" class="tab-pane fade">
   <h1><strong>Prescription</strong></h1>
   <div class = "container-fluid">
  <div class="row">
    
    <div class="col-md-4">Doctor Name</div>
    <div class="col-md-4">Description</div>
    <div class="col-md-4">Download</div><br><br>
    <% try{
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Mohan007@123");
		  
		  String query = "Select * from project.prescription where patientid = (3)";
		  
		  ResultSet rs = con.createStatement().executeQuery(query); 
		  
			  
			  while(rs.next())
			  	{
				  String query1 = "Select doctor_name from project.doctor where id = " + rs.getInt("doctorid");
				  
				  ResultSet s = con.createStatement().executeQuery(query1); 
				  while(s.next())
				  {
				   %>
				   
				   <div class="container-fluid">
					  <div class="row">
	<div class="col-md-4" ><%= s.getString("doctor_name")%></div>
    <div class="col-md-4" ><%= rs.getString("description")%></div>
					     <div class="col-md-4">
					     <form action="downloadPrescription/<%= rs.getInt("id")%>" method = "post">
					     <button type="submit" class="btn btn-primary">download</button>
					     </form>
					     </div>
					    </div>
					  </div>
		 <% }
			  	}
		  }catch(Exception e)
	  		{
			  out.print(e.getMessage());
	 		 }%>
	 		 
  </div>
  </div>
  <br>
  <br>
   </div>
   </div>
  </div>
</div>



	
</body>
</html>