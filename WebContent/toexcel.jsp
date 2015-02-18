<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Export to Excel - Demo</title>
</head>
<body>
	<%
		Statement st = connjdbc.getDatacn();
		ResultSet rs = null;
		String exportToExcel = request.getParameter("exportToExcel");
		if (exportToExcel != null
				&& exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.pdf");
			response.setHeader("Content-Disposition", "inline; filename="
					+ "excel.pdf");

		}
	%>
	<table align="left" border="2">
		<thead>
			<tr bgcolor="lightgreen">
				<th>Sr. No.</th>
				<th>user id</th>
				<th>Vehicle id</th>
				<th>Date</th>
				<th>Toll Amount</th>
				<th>Vid</th>
				<th>Trip type</th>
			</tr>
		</thead>
		<tbody>
			<%
				String to = request.getParameter("to");
				String from = request.getParameter("from");
				rs = st.executeQuery("SELECT a.transaction_info_id,a.date,a.toll_amount,b.vehicle_no,c.vehicle_in_time, d.city_name, c.vehicle_out_time, e.city_name FROM transaction_info a INNER JOIN vehicle_info b ON a.vehicle_id=b.vehicle_id INNER JOIN vehicle_in_out_info c ON a.vehicle_inout_id=c.vehicle_inout_id INNER JOIN city_info d ON d.city_id=c.vehicle_in_city_id INNER JOIN city_info e ON e.city_id=c.vehicle_out_city_id WHERE a.date>='"+from+"' AND a.date<='"+to+"'");
				System.out.println(to+"  "+from);
				int i = 0;
				while(rs.next()){%>
				<tr bgcolor="lightblue">
				<td><%=++i %></td>
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td>
				<td align="center"><%=rs.getString(4) %></td>
				<td align="center"><%=rs.getString(5) %></td>
				<td align="center"><%=rs.getString(6) %></td>
				<td align="center"><%=rs.getString(7) %></td>
				</tr>
				<%}%>
			
			<%
				
			%>
		</tbody>
	</table>
	
	<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%
		if (exportToExcel == null) {
		String str = "toexcel.jsp?exportToExcel=YES&to="+to+"&from="+from;
	%>
	<a href="<%=str%>">Export to Excel</a>
	<%
		}
	%>
</body>
</html>