<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%
	Statement st = connjdbc.getDatacn();
	String sn = request.getParameter("q");
	int i = Integer.parseInt(sn);
	ResultSet rs = st
			.executeQuery("select * from city_info where state_id = "
					+ i + "");
	
	out.println("<label for=\"city_name_list\">Select City</label>");
	out.println("<select name=\"city_name_list\"> id=\"valueofcity\" ");
	out.println("<option value = \"-1\">Select City</option>");
	
	while (rs.next()) {
		out.println("<option value=" + rs.getInt(1) + ">"
				+ rs.getString(2) + "</option>");
	}
//	String ot = "other";
//	out.println("<option value = \"other\">" + ot + "</option>");
//	out.println("</select>");
%>
