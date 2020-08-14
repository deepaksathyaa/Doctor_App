<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Recovery</title>
       
<meta charset="ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
 
       <link rel="stylesheet" type="text/css" href="assets/css/main.css">
       </head>
<body>	
	<img src="assets/img/logo.png" width="70" height="70" alt="">
   <div class="loginbox">
   <img src="assets/img/log.png" class="log">
      <h1>HELLO DOCTOR:)</h1>
      
      <h1>Recovery</h1>
      <p style= "color:red">${error}</p>
      <form action = "recovery" method = "POST">
      <p>User</p>
       <select class = "form-control" name = "user" id = "user">
                  <option value="">Select User</option>
                     <option>Doctor</option>
                     <option>Patient</option>
                     <option>Test Lab</option>
                  </select>
         <p>EmailId</p>
         <input type="text" id="email"name="email" placeholder="Enter Username">
         
         <button type = "submit" name = "submit" id = "submit">Submit</button>
         </form>
         
        
   </div>
</body>
</head>
</html> 