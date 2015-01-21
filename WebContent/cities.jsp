<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%
	try {
		Statement st = connjdbc.getDatacn();
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage City</title>
<%@ include file="links.jsp"%>
<script>
	
	function showUser() {
		var str = document.getElementById("state").value;

		if (str == "") {
			document.getElementById("city").innerHTML = "";
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
				document.getElementById("city").innerHTML = xmlhttp.responseText;
			}
		};
		xmlhttp.open("GET", "getdata.jsp?q=" + str, true);
		xmlhttp.send();
	}

	function showTable() {
		var str = document.getElementById("state").value;

		if (str == "") {
			document.getElementById("showtable").innerHTML = "";
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
				document.getElementById("showtable").innerHTML = xmlhttp.responseText;
			}
		};
		xmlhttp.open("GET", "gettable.jsp?q=" + str, true);
		xmlhttp.send();
	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="main">
		<div class="main-inner">
			<div class="container">
				<div class="row">
					<div class="span6">
						<div class="widget widget-nopad">
							<div class="content clearfix">
								<form action="citycode.jsp" method="post">
									<label for="state_name">State:</label> <select
										name="state_name" id="state" onChange="showTable()">
										<option>Select State</option>
										<%
											ResultSet rs = st.executeQuery("select * from state_info");
												while (rs.next()) {
													out.println("<option value=" + rs.getInt(1) + ">"
															+ rs.getString(2) + "</option>");
												}
											} catch (Exception e) {

											}
										%>
									</select>
									<div id="city" style="width: 100px; border: 0px solid gray;">
										<label for="city_name">Select City</label> <select
											name="city_name">
											<option value="-1">Select City</option>
										</select>
									</div>
								</form>
							</div>

							<div id="showtable"></div>

						</div>
						<!-- /widget -->
					</div>
					<!-- /span6 -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /main-inner -->
	</div>
	<!-- /main -->

</body>
</html>