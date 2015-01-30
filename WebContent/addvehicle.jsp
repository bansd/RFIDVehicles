<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vehicle Information</title>
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
<h1>Vehicle Information</h1>
<button onclick="showNewVehicle()">Add new Vehicle</button>
<div id="newvehicle">
</div>
<br>
<br>
<%
try {
//	int uid = Integer.parseInt(session.getAttribute("user_id"));
	int uid = 1;
	Statement st = com.Data.connjdbc.getDatacn();	
	ResultSet rs = st.executeQuery("select * from vehicle_info where user_id="+uid);	
	ArrayList<ArrayList> arr = new ArrayList<ArrayList>();
	
	while (rs.next()) {
		ArrayList<String> a = new ArrayList<String>();
		System.out.println(rs.getInt(1)+" "+rs.getString(3)+" "+rs.getString(4)+"  "+rs.getString(5)+"  "+rs.getString(6));
		a.add(rs.getInt(1)+"");
		a.add(rs.getString(3));
		a.add(rs.getString(4));
		a.add(rs.getString(5));
		a.add(rs.getString(6));	
		arr.add(a);
	}
	

%>
<%
for(int i = 0;i < arr.size();i++){
	ArrayList<String> vehicle = new ArrayList<String>();
	vehicle = arr.get(i);
%>
<table>
	<thead>Vehicle <%=i+1 %> </thead>
	<tr>
		<td>Vehicle Number</td>
		<td><%out.println(vehicle.get(1)); %></td>
	</tr>
	<tr>
		<td>Vehicle Type</td>
		<td><%out.println(vehicle.get(2)); %></td>
	</tr>
	<tr>
		<td>RC Book Number</td>
		<td><%out.println(vehicle.get(3)); %></td>
	</tr>
	<tr>
		<td>Type of Transport</td>
		<td><%out.println(vehicle.get(4)); %></td>
	</tr>
</table>
<%
} 
%>
<%} catch (Exception e) {
	System.err.println(e);	
} %>
</body>
</html>