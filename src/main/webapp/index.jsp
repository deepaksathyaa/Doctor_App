<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Index</title>
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
		<script src="js/jquery.min.js"></script>
		<link href="css/style.css" rel='stylesheet' type='text/css' />
   		 <!-- Custom Theme files -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		</script>
		<script type="text/javascript" src="js/move-top.js"></script>
		<script type="text/javascript" src="js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
		<link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
	</head>
	<body>
			<div id="home" class="header">
					<div class="top-header">
						<div class="container">
						<div class="logo">
							<img src="assets/img/logo.png" width="70" height="70" alt="">
						</div>
						 <nav class="top-nav">
							<ul class="top-nav">
								<li class="active"><a href="#home" class="scroll">Home </a></li>
								<li><a href="#about" >About us</a></li>
								<li><a href="#services" class="scroll">our services</a></li>
								<li><a href="#team" class="scroll">our team</a></li>
								<li><a href="#contact" class="scroll">Contact</a></li>
								<li><a href="appointment" class="">Appointment</a></li>
								<li><a href="mainlogin" class="">Login</a></li>
								
							</ul>
							
							<a href="#" id="pull"><img src="images/menu-icon.png" title="menu" /></a>
						</nav>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
		<!----- //End-header---->
		<!----start-slider-script---->
			<script src="js/responsiveslides.min.js"></script>
			 <script>
			    // You can also use "$(window).load(function() {"
			    $(function () {
			      // Slideshow 4
			      $("#slider4").responsiveSlides({
			        auto: true,
			        pager: true,
			        nav: true,
			        speed: 500,
			        namespace: "callbacks",
			        before: function () {
			          $('.events').append("<li>before event fired.</li>");
			        },
			        after: function () {
			          $('.events').append("<li>after event fired.</li>");
			        }
			      });
			
			    });
			  </script>
			<!----//End-slider-script---->
			<!-- Slideshow 4 -->
			    <div  id="top" class="callbacks_container">
			      <ul class="rslides" id="slider4">
			        <li>
			          <img src="images/slide1.jpg" alt="">
			          <div class="caption">
			          	<div class="slide-text-info">
			          		<h1>providing</h1>
			          		<label>highquality service for men & women</label>
			          		<a class="slide-btn" href="#">learn more</a>
			          	</div>
			          </div>
			        </li>
			        <li>
			          <img src="images/slide1.jpg" alt="">
			          <div class="caption">
			          	<div class="slide-text-info">
			          		<h1>providing</h1>
			          		<label>highquality service for men & women</label>
			          		<a class="slide-btn" href="#">learn more</a>
			          	</div>
			          </div>
			        </li>
			        <li>
			          <img src="images/slide1.jpg" alt="">
			           <div class="caption">
			           	<div class="slide-text-info">
			          		<h1>providing</h1>
			          		<label>highquality service for men & women</label>
			          		<a class="slide-btn" href="#">learn more</a>
			          	</div>
			          </div>
			        </li>
			      </ul>
			    </div>
			    <div class="clearfix"> </div>
			<!----- //End-slider---->
			<!---- about ---->
			<div id="about" class="about">
				<div class="container">
					<div class="header about-header text-center">
						<h2>about us</h2>
						<p>we have providing best treatment across the world</p>
					</div>
					<!---- About-grids ---->
					<div class="about-grids">
						<div class="col-md-4">
							<div class="about-grid">
								<img src="images/img1.jpg" title="name" />
								<div class="about-grid-info text-center">
									<h3><a href="#">Child's specialist</a></h3>
									<p>Child life specialists work in health care settings to help infants, children, adolescents, and their families through illness or injury. One of the primary roles of the child life specialist is to ease the anxiety and stress.Child's health includes a wide range</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="about-grid n-about-grid n-about-grid1">
								<img src="images/img2.jpg" title="name" />
								<div class="about-grid-info text-center">
									<h3><a href="#">Women's specialist</a></h3>
									<p>Women's health refers to the branch of medicine that focuses on the treatment and diagnosis of diseases and conditions that affect a woman's physical and emotional well-being.Women's health includes a wide range of specialties</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="about-grid n-about-grid n-about-grid2">
								<img src="images/img3.jpg" title="name" />
								<div class="about-grid-info text-center">
									<h3><a href="#">Men's specialist</a></h3>
									<p>Men is the medical specialty that deals with male health, particularly relating to the problems of the male reproductive system and urological problems that are unique to men.Men's health includes a wide range of specialties</p>
								</div>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
					<!---- About-grids ---->
				</div>
				
			</div>
			<!---- about ---->
			<!--- services --->
			<div id="services" class="services">
				<div class="container">
					<div class="header services-header text-center">
						<h2>our services</h2>
						<p>We are providing best services like</p>
					</div>
					<!---- service-grids--->
					<div class="service-grids">
						<div class="col-md-3">
							<div class="service-grid text-center">
								<a href="#"><span class="s1-icon"> </span></a>
								<h3><a href="#">Heart problem</a></h3>
							</div>
						</div>
						<div class="col-md-3">
							<div class="service-grid text-center">
								<a href="#"><span class="s2-icon"> </span></a>
								<h3><a href="#">brain problem</a></h3>
							</div>
						</div>
						<div class="col-md-3">
							<div class="service-grid text-center">
								<a href="#"><span class="s3-icon"> </span></a>
								<h3><a href="#">knee problem</a></h3>
							</div>
						</div>
						<div class="col-md-3">
							<div class="service-grid text-center">
								<a href="#"><span class="s4-icon"> </span></a>
								<h3><a href="#">human bones problem</a></h3>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
					<!----//service-grids--->
				</div>
				
			</div>
			<!--- services --->
			<!--- team --->
			<div id="team" class="team">
				<div class="container">
					<div class="header team-head text-center">
						<h2>our team</h2>
						<p>we are providing best Doctor acroos the world pls use it</p>
					</div>
					<!--- teammember-grids ---->
					<div class="team-member-grids">
						<div class="team-member-grid">
							<img src="images/t1.jpg" title="name" />
							<div class="team-member-info bottom-t-info">
								<span> </span>
								<h3><a href="#">Dr.G. Venu , M.D.</a></h3>
								<p>Your participation in the survey will help other patients make informed decisions. You will also be helping Dr.G. Venu and his staff know how they are doing and how they can improve their services</p>
							</div>
						</div>
						<div class="team-member-grid">
							<div class="team-member-info bottom-t-info bottom-t-info-b">
								<span> </span>
								<h3><a href="#">Dr. Rajesh Shankar Iyer  M.D.</a></h3>
								<p>Dr. Rajesh Shankar Iyer is a Leading Neurologist and Epileptologist at PSG Hospitals in Coimbatore, Tamil Nadu. He has special expertise in the fields of Epilepsy and Sleep Medicine.</p>
							</div>
							<img src="images/t2.jpg" title="name" />
						</div>
						<div class="team-member-grid">
							<img src="images/t3.jpg" title="name" />
							<div class="team-member-info bottom-t-info">
								<span> </span>
								<h3><a href="#">Dr. L. Venkatakrishnan, M.D.</a></h3>
								<p>Dr. L. Venkatakrishnan is a consultant Gastroenterologist associated with PSG Hospitals and Coimbatore Kidney Centre, Coimbatore. He has special expertise in the fields of Epilepsy and Sleep.</p>
							</div>
						</div>
						<div class="team-member-grid">
							<div class="team-member-info bottom-t-info bottom-t-info-b">
								<span> </span>
								<h3><a href="#">Dr.R. Senthilkumar Iyer, M.D.</a></h3>
								<p>Dr.R. Senthilkumar is a consultant Diabetologist associated with PSG Hospitals and Dr. Balakrishna Hospitals, Coimbatore. He has special expertise in the fields of Epilepsy and Sleep Medicine.</p>
							</div>
							<img src="images/t4.jpg" title="name" />
						</div>
						<div class="team-member-grid">
							<img src="images/t5.jpg" title="name" />
							<div class="team-member-info bottom-t-info">
								<span> </span>
								<h3><a href="#">Dr. Michael, M.D.</a></h3>
								<p>He completed DNB - Pulmonary Medicine from National Board of Examinations Ministry of Health Government of India in 2017 and MD - Pulmonary Medicine from Sri Balaji Vidyapeeth University (SBVU) </p>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
					<!---//teammember-grids ---->
				</div>
			</div>
			<!--- team --->
			<!---- contact ---->
			<div id="contact" class="contact">
				<div class="map">
					
					<div class="contact-info">
						<div class="container">
						<!---- contact-grids ---->
						<div class="contact-grids">
							<h3>contact us</h3>
							<div class="col-md-5 contact-grid-left">
								<h4>contact information</h4>
								<ul>
									<li><span class="cal"> </span><label>Monday - Friday :</label><small>9:30 AM to 6:30 PM</small></li>
									<li><span class="pin"> </span><label>Address :</label><small>123 Some Street , London, UK, CP 123</small></li>
									<li><span class="phone"> </span><label>Phone :</label><small>(032) 987-1235</small></li>
									<li><span class="fax"> </span><label>Fax :</label><small>(123) 984-1234</small></li>
									<li><span class="mail"> </span><label>Email :</label><small> info@doctor.com</small></li>
								</ul>
							</div>
							<div class="col-md-7 contact-grid-right">
								<h4>leave us a message</h4>
								<form>
									<input type="text" value="Name:" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name:';}">
									<input type="text" value="Email:" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email:';}">
									<input type="text" value="Phone No:" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Phone No:';}">
									<textarea rows="2" cols="70" onfocus="if(this.value == 'Message:') this.value='';" onblur="if(this.value == '') this.value='Message:';">Message:</textarea>
									<input type="submit" value="SEND MESSAGE" />
								</form>
							</div>
							<div class="clearfix"> </div>
						</div>
						<!---- contact-grids ---->
					</div>
					</div>
				</div>
			</div>
			<!---- contact ---->
			<div class="clearfix"> </div>
			<!--- copy-right ---->
			<div class="copy-right">
				<div class="container">
				<div class="copy-right-left">
					<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script>
					<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
				</div>
				<div class="copy-right-right">
					<ul>
						<li><a class="facebook" href="#"><span> </span></a></li>
						<li><a class="twitter" href="#"><span> </span></a></li>
						<li><a class="skype" href="#"><span> </span></a></li>
						<div class="clearfix"> </div>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			</div>
	</body>
</html>

