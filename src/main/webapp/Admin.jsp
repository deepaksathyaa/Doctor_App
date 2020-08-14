<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
<title>Login </title>
       <link rel="stylesheet" type="text/css" href="css/main.css">
<body>	
	<img src="assets/img/logo.png" width="70" height="70" alt="">
   <div class="loginbox";>
   <img src="images/log.png" class="log">
      <h1>HELLO Admin:)</h1>
      <h1>Login Here</h1>
      <p>${error}</p>
      <form action = "Dashboard" method = "POST">
         <p>Username</p>
         <input type="text" name="email" placeholder="Enter Username">
         <p>Password</p>
         <input type="password" name="password" placeholder="Enter Password">
         <input type="submit" name="" value="Login">
      </form>
        
   </div>
</body>
</head>
</html>  