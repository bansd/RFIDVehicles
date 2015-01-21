<%-- 
    Document   : city code
    Created on : Oct 16, 2014, 6:52:00 PM
    Author     : Bansari
--%>

<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="utf-8">
    <title>Login - Automatic Toll Collection System</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"> 
    
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="css/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/pages/signin.css" rel="stylesheet" type="text/css">
</head>

<body>	
    <div class="navbar navbar-fixed-top">	
        <div class="navbar-inner">		
            <div class="container">			
		<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
		</a>			
		<a class="brand" href="index.html">
                    Automatic Toll Collection System				
		</a>			
                
            </div> <!-- /container -->		
        </div> <!-- /navbar-inner -->	
    </div> <!-- /navbar -->
    
    <div class="account-container">	
	<div class="content clearfix">		
            <form action="adminresetpasswordcode.jsp" method="post">		
		<h1>Reset Password</h1>		
                    <div class="login-fields">			
			<p>Please provide your details</p>
                       <div class="field">
                            <label for="oldpassword">Old Password:</label>
                            <input type="password" id="password" name="oldpassword" value="" placeholder="Password" class="login password-field"/>
			</div>  <!-- /field -->
				
			<div class="field">
                            <label for="password">Password:</label>
                            <input type="password" id="password" name="password" value="" placeholder="Password" class="login password-field"/>
			</div> <!-- /password -->
                        
                        <div class="field">
                            <label for="confirmpassword">Confirm Password:</label>
                            <input type="password" id="password" name="confirmpassword" value="" placeholder="Confirm Password" class="login password-field"/>
			</div> <!-- /password -->
                        <p style=" color: red;"><%
                                if(session.getAttribute("wrongcpass") != null){
                                    out.println(session.getAttribute("wrongcpass"));
                                }
                                    %></p>	
                    </div> <!-- /login-fields -->
			
                    <div class="login-actions">							
				<input type="submit" value = "Reset" class="button btn btn-success btn-large">				
			</div> <!-- .actions -->	
		</form>
		
	</div> <!-- /content -->
	
</div> <!-- /account-container -->

<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/signin.js"></script>

</body>

</html>

