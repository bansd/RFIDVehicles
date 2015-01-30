<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%	
	int id = 1;
%>
<form action="addvehiclecode.jsp">
	<table>
		<thead>New Vehicle
		</thead>
		<tr>
			<td>Vehicle Number</td>
			<td><input type="text" placeholder="Vehicle number"
				name="vehicle_no"></td>
		</tr>
		<tr>
			<td>Vehicle Type</td>
			<td><select name="vehicle_type">
					<option value="Car/Van/Jeeps">Car/Van/Jeeps</option>
					<option value="Light Motor Vehicles">Light Motor Vehicles</option>
					<option value="Bus/Trucks">Bus/Trucks</option>
					<option value="Multi Excel Vehicles">Multi Excel Vehicles</option>
			</select></td>
		</tr>
		<tr>
			<td>RC Book Number</td>
			<td><input type="text" placeholder="RC Book Number"
				name="rc_book_no"></td>
		</tr>
		<tr>
			<td>Type of Transport</td>
			<td><select name="type_of_transport">
					<option value="public">Public</option>
					<option value="private">Private</option>					
			</select></td>
		</tr>
		<tr>
		<td><input type="submit"><td>
		</tr>
	</table>
	
</form>
<%
	
	//	String ot = "other";
	//	out.println("<option value = \"other\">" + ot + "</option>");
	//	out.println("</select>");
%>
