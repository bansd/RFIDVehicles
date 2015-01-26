<!DOCTYPE html>
<html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<head>
<%
	try{
%>
<meta charset="utf-8">
<title>Automatic Toll Collection</title>
<meta name="description" content="Automatic toll collection site">
<meta name="author" content="bansari">
<!-- Mobile Specific Metas
  ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/userwebstyle.css">
<link rel="stylesheet" href="css/responsive.css">
<script type="text/javascript">
	function showNewVehicle() {
		var str = 1;
		if (str == "") {
			document.getElementById("destinationcity").innerHTML = "";
			return;
		}
		if (window.XMLHttpRequest) {
			// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {
			// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("newvehicle").innerHTML = xmlhttp.responseText;
			}
		};
		xmlhttp.open("GET", "getnewvehicle.jsp?q=" + str, true);
		xmlhttp.send();
	}
</script>

</head>
<body>

	<!--------------Header--------------->
	


	<div class="wrap-header">
				<span style="float:right; font-size: medium; margin-top:10px; margin-left:20px\; margin-right:20px;"><a href="logout.jsp" >Logout</a></span>
					<span style="float:right; font-size: medium; margin-top:10px; margin-left:20px\; margin-right:20px;"><a href="uresetpass.jsp" >    Reset password</a></span>
				
		<div id="logo" style="border-bottom: dotted;">
			<span style="margin-left: 30px;"><b>Automatic Toll
					Collection System </b></span>
					<span style="float:right; font-size: medium; margin-top:10px; margin-right:20px;"> Welcome, <%=session.getAttribute("fname")+" "+session.getAttribute("lname") %></span>
		
		</div>

		<nav>
			<ul>
				<li class="current"><a href="userhome.jsp">Home</a></li>
				<li><a href="transaction.jsp">View Transaction</a></li>
				<li><a href="personalinfo.jsp">PROFILE</a></li>
				<li><a href="about.jsp">About</a></li>
				<li><a href="contact.jsp">Contact</a></li>
			</ul>
		</nav>
	</div>
	<section id="content"
		style="margin-bottom: 40px; padding-bottom: 40px;">
		<div class="zerogrid">

			<div id="main-content">
				<article>
				<div class="content info">
				<form action="uresetpasscode.jsp" method="post">
						<table>
							<thead><p></p>
								<tr>
									<td colspan="2"><b>Reset Password:</b></td>
								</tr>
							</thead>
							<tbody class="tbody">
								<tr>
									<td><b>Old password</b></td>
									<td><input type="password" id="oldpassword" name="oldpassword"></td>
								</tr>
								<tr>
									<td><b>New password </b></td>
									<td><input type="password" id="newpassword" name="newpassword" ></td>
								</tr>
								<tr>
									<td><b>Confirm password: </b></td>
									<td><input type="password" id="confirmpassword" name="confirmpassword" ></td>
								</tr></tbody>
								
								</table>
								<input type="submit" value = "Reset" class="button btn btn-success btn-large">				
				
		</form>
								   <p style=" color: red;"><%
                                if(session.getAttribute("wrongcpass") != null){
                                    out.println(session.getAttribute("wrongcpass"));
                                }
                                    %></p>	
								</div>
								</article>
								</div>
								</div>
								</section>
								<%
		} catch (Exception e) {
			System.err.println(e);
		}
	%>
</body></html>