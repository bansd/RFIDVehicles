<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>zGallering Free Html5 Responsive Template</title>


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
				<li><a href="userhome.jsp">Home</a></li>
				<li><a href="transaction.jsp">View Transaction</a></li>
				<li><a href="personalinfo.jsp">Personal Information</a></li>
				<li><a href="about.jsp">About</a></li>
				<li  class="current"><a href="contact.jsp">Contact</a></li>
			</ul>
		</nav>
	</div>

<!--------------Content--------------->
<section id="content">
	<div class="zerogrid">		
		<div class="row">
			<div id="main-content">

				<div class="comment">
					Your email address will not be published. Required fields are marked *
					<form>
						<div><input type="text" name="name" id="name"> Name *</div>
						<div><input type="email" name="email" id="email"> Email *</div>
						<div><input type="url" name="website" id="website"> Website</div>
						<div><textarea rows="10" name="comment" id="comment"></textarea></div>
						<div><input type="submit" name="submit" value="Submit"></div>
					</form>
				</div>
			</div>
			
		</div>
	</div>
</section>
<!--------------Footer--------------->

</body></html>