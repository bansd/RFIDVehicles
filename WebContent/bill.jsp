<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String str = request.getParameter("transaction_id");
	int id = str != null ? Integer.parseInt(str) : 0;
	Statement st = connjdbc.getDatacn();
	String date = "", no = "", from = "", to = "", start = "", end = "", toll = "", trip = "";
	ResultSet rs = st
			.executeQuery("SELECT a.date,a.toll_amount,a.trip_type,b.vehicle_no,c.vehicle_in_time,d.city_name,c.vehicle_out_time,e.city_name,c.vehicle_out_time FROM transaction_info a INNER JOIN vehicle_info b ON a.vehicle_id=b.vehicle_id INNER JOIN vehicle_in_out_info c ON a.vehicle_inout_id=c.vehicle_inout_id INNER JOIN city_info d ON c.vehicle_in_city_id=d.city_id INNER JOIN city_info e ON c.vehicle_out_city_id=e.city_id WHERE transaction_info_id="
					+ id);
	if (rs.next()) {
		date = rs.getString(1);
		toll = rs.getString(2);
		trip = rs.getString(3);
		no = rs.getString(4);
		start = rs.getString(5);
		from = rs.getString(6);
		end = rs.getString(7);
		to = rs.getString(8);
	}
%>
<html>
<head>
<style type="text/css" media="print"></style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bill</title>
</head>
<body>
	<h1 align="center">National Express Highway</h1>
	<div style="border-style: solid;">
		<div>
			<div style="float: left;">
				No:<%=no%></div>
			<div style="float: right;">
				Date:<%=date%></div>
		</div>
		<table style="border-collapse: collapse;">
			<thead><tr><td colspan="4">Bill Details</td></tr></thead>

			<tbody>
				<tr>
					<td>From:<%=from%></td>
					<td>To:<%=to%></td>
				</tr>
				<tr>
					<td>Starting Time:<%=start%></td>
					<td>End Time:<%=end%></td>
				</tr>
				<tr>
					<td>Trip Type: <%=trip%></td>
					<td>Toll Amount:<%=toll%></td>
				</tr>
			</tbody>
		</table>

		<div>Thank You For Visiting!</div>
	</div>
	<script type="text/javascript">
		window.print();
	</script>


</body>
</html>