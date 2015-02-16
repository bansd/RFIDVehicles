<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Date"%>

<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%
	Statement st = connjdbc.getDatacn();
%>
<%
	Random rand = new Random();
	int n = rand.nextInt(90000) + 10000;
	System.out.println(n);
%>
<%
	ResultSet rs = null;

	String result = null;
	String subject = "Forgot Pasword? ";
	String text = null;
	String host = "smtp.gmail.com";
	String userid = "jalpa4557@gmail.com";
	String password = "FI9IAMFI9";
	String to = request.getParameter("email");
	System.out.println(to);

	if (to != null) {
		System.out.println("try again");
		Properties props = System.getProperties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.setProperty("mail.transport.protocol", "smtps");
		props.put("mail.smtp.user", userid);
		props.put("mail.smtp.password", password);
		props.put("mail.smtp.port", "465");
		props.put("mail.smtps.auth", "true");
		Session mailSession = Session.getDefaultInstance(props);
		MimeMessage message = new MimeMessage(mailSession);
		InternetAddress fromAddress = null;
		InternetAddress toAddress = null;
		try {
			System.out.println("E-Mail Hasnt been sent SuccessFully");
			text = "Please Login with your new password: "
					+ n
					+ "  \n You can always reset your password once logged in.";
			fromAddress = new InternetAddress(userid);
			toAddress = new InternetAddress(to);
			
			String pass = n+"";
			
			String email = session.getAttribute("email_address") + "";
			System.out.println("username" + email);
			String str1 = "UPDATE user_info SET password = '"+ pass +"' WHERE email_address = '" + to + "'";
			
				int i = st.executeUpdate(str1);
			if(i>0)
			{
				System.out.println("succesully updated password");
			}
			else
			{
				System.out.println("dosent exist email id");%>This email id doesnot exist<%
			}
			
			
		} catch (AddressException e) {
			e.printStackTrace();
		} finally {
		}
		message.setFrom(fromAddress);
		message.setRecipient(Message.RecipientType.TO, toAddress);
		message.setSubject(subject);
		message.setText(text);

		Transport transport = mailSession.getTransport("smtps");
		transport.connect(host, userid, password);
		transport.sendMessage(message, message.getAllRecipients());
		transport.close();
		System.out.println("E-Mail Has been sent SuccessFully");

	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

<link rel="stylesheet" href="css/reset.css">

    <link rel="stylesheet" href="css/styleuser.css" media="screen" type="text/css"  />

</head>
<body>
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
<form id="msform" action="mail1.jsp" method="post">
	
	<!-- fieldsets -->
	<fieldset style="margin-top: 100px;width: 500px;margin-left: 120px">
		<h2 class="fs-title" style="margin-bottom: 20px;font-weight: bold;font-size: 170%;">Reset Your New Password</h2>
		<div class="login-fields">

					<p style="margin-bottom: 10px;float: left">Fill Below Information:</p>
					<p style="color: red;">
						
					</p>
					<div class="field" style="width: 350px">
						 <input type="text" id="email" name="Code" value="" placeholder="Enter Code"
							class="login email-field" style="padding-left: 50px"/>
					</div>
					<div class="field" style="width: 350px">
						 <input type="password" id="email" name="New Password" value="" placeholder="Enter Password"
							class="login email-field" style="padding-left: 50px"/>
					</div>
					<!-- /field -->
					<p style="color: red">
						
					</p>

				</div>
				<!-- /login-fields -->
				
				<div>

			    <input type="submit" value="Submit"  class="action-button">

				</div>
				<!-- .actions -->
	</fieldset>
	
	
</form>

<!-- jQuery -->
<script src="js/user/jquery-1.9.1.min.js" type="text/javascript"></script>
<!-- jQuery easing plugin -->
<script src="js/user/jquery.easing.min.js" type="text/javascript"></script>

  <script src="js/indexuser.js"></script>

</body>
</html>