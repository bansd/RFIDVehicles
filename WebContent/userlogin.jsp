<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title></title>

  <link rel="stylesheet" href="css/reset.css">

    <link rel="stylesheet" href="css/styleuser.css" media="screen" type="text/css"  />

</head>

<body>
<div class="navbar navbar-fixed-top">
		
		<div class="navbar-inner" style="color: white;text-align: center;font-size: 40px">
			<div class="container">

				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse" > <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> Automatic Toll Collection
					System

				<div class="nav-collapse"></div>
				<!--/.nav-collapse -->

			</div>
			<!-- /container -->
			
		</div>
		<!-- /navbar-inner -->

	</div>
	<!-- /navbar -->


  <!-- multistep form -->
<form id="msform" action="logincode.jsp" method="post">
	
	<!-- fieldsets -->
	<fieldset style="margin-top: 100px;width: 500px;margin-left: 120px">
		<h2 class="fs-title" style="margin-bottom: 20px;font-weight: bold;font-size: 170%;">SIGN IN</h2>
		<div class="login-fields">

					<p style="margin-bottom: 10px;float: left">Please provide your details</p>
					<p style="color: red;">
						
					</p>
					<div class="field" style="width: 350px">
						 <input type="text" id="email" name="email" value="" placeholder="Email or Username"
							class="login email-field" style="padding-left: 50px"/>
					</div>
					<!-- /field -->
					<p style="color: red">
						
					</p>
					<div class="field" style="width: 350px">
						<input type="password" id="password" name="password" value="" placeholder="Password"
							class="login password-field" style="padding-left: 50px"/>
					</div>
					<!-- /password -->

				</div>
				<!-- /login-fields -->
				
				<div>

			    <input type="submit" value="Sign In"  class="action-button">

				</div>
				<!-- .actions -->
		<a href="forgetpass.jsp">Forgot Password?</a>
	</fieldset>
	
	
</form>

<!-- jQuery -->
<script src="js/user/jquery-1.9.1.min.js" type="text/javascript"></script>
<!-- jQuery easing plugin -->
<script src="js/user/jquery.easing.min.js" type="text/javascript"></script>

  <script src="js/indexuser.js"></script>

</body>

</html>