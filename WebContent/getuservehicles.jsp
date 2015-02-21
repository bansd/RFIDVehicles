<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%

	Statement st = connjdbc.getDatacn();
	String sn = request.getParameter("q");
	ResultSet rs = st
			.executeQuery("SELECT a.vehicle_id,a.vehicle_no FROM vehicle_info a INNER JOIN user_info b WHERE a.user_id=b.user_id AND b.username='"+sn+"' AND a.is_stolen=FALSE");
	
	out.println("<label for=\"vehicleid\">Select Vehicle</label>");
	out.println("<select name=\"vehicleid\">");
	out.println("<option value = \"-1\">Select Vehicle</option>");
	
	while (rs.next()) {
		out.println("<option value=" + rs.getInt(1) + ">"
				+ rs.getString(2) + "</option>");
	}

//	out.println("<option value = \"other\">" + ot + "</option>");
//	out.println("</select>");
%>
