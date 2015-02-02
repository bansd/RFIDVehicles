<!DOCTYPE html>
<html>
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>zGallering Free Html5 Responsive Template</title>
<meta name="description"
	content="Free Html5 Templates and Free Responsive Themes Designed by Kimmy | zerotheme.com">
<meta name="author" content="www.zerotheme.com">

<!-- Mobile Specific Metas
  ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
  ================================================== -->
<link rel="stylesheet" href="css/userwebstyle.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel='stylesheet' href="css/camera.css">

<script type='text/javascript' src='js/user/jquery.min.js'></script>
<script type='text/javascript' src='js/user/jquery.easing.1.3.js'></script>
<script type='text/javascript' src='js/user/camera.min.js'></script>

<script>
	jQuery(function() {
		jQuery('#camera_wrap').camera({
			height : '400px',
			loader : 'bar',
			pagination : false,
			thumbnails : true
		});
	});
</script>

</head>
<body>

	<!--------------Header--------------->


	<div class="wrap-header">
		<div id="logo" style="border-bottom: dotted;">
			<span style="margin-left: 30px;"><b>Automatic Toll
					Collection System </b></span>
			<span style="float:right; font-size: medium; margin-top:10px; margin-left:20px; margin-right:20px;"><a href="userlogin.jsp" >Logout</a></span>
			<span style="float:right; font-size: medium; margin-top:10px; margin-right:20px;"> Welcome, <%=session.getAttribute("fname")+" "+session.getAttribute("lname") %></span>
		</div>

		<nav>
			<ul>
				<li class="current"><a href="userhome.jsp">Home</a></li>
				<li><a href="transaction.jsp">View Transaction</a></li>
				<li><a href="personalinfo.jsp">Personal Information</a></li>
				<li><a href="about.jsp">About</a></li>
				<li><a href="contact.jsp">Contact</a></li>
			</ul>
		</nav>
	</div>


	<!--------------Content--------------->
	<section id="content">
		<div class="feature">
			<div class="camera_wrap camera_magenta_skin" id="camera_wrap">
				<div data-thumb="images/slides/thumbs/1.jpg"
					data-src="images/slides/slide1.jpg">
					<div class="camera_caption fadeFromBottom"><em>National Highway</em></div>
				</div>
				<div data-thumb="images/slides/thumbs/2.jpg"
					data-src="images/slides/slide2.jpg">
					<div class="camera_caption fadeFromBottom"><em>National Highway</em></div>
				</div>
				<div data-thumb="images/slides/thumbs/3.jpg"
					data-src="images/slides/slide3.jpg">
					<div class="camera_caption fadeFromBottom">
						<em>National Highway</em>
					</div>
				</div>
				<div data-thumb="images/slides/thumbs/7.jpg"
					data-src="images/slides/slide4.jpg">
					<div class="camera_caption fadeFromBottom">
						<em>National Highway</em>
					</div>
				</div>
				<div data-thumb="images/slides/thumbs/5.jpg"
					data-src="images/slides/slide5.jpg">
					<div class="camera_caption fadeFromBottom">
						<em>National Highway</em>
					</div>
				</div>
				
			</div>
			<div style="clear: both; display: block; height: 10px"></div>
		</div>
		<div class="welcome">
			<p>
				Welcome to National Highway Website. We are pleased to inform you that we have implemented RFID Automatic Toll Collection. Now no need to wait in long queues.
			</p>
		</div>
		<div class="zerogrid">
			<div class="row block01">
				
			</div>
		</div>
	</section>
</body>
</html>