<%-- 
    Document   : emailcode
    Created on : Dec 25, 2014, 2:45:51 PM
    Author     : dell
--%>

<%@ page import="java.sql.*"%>

<%
	String vehicle_id = request.getParameter("id");
	Statement st = com.Data.connjdbc.getDatacn();
	try {
		int i = 0;
		i = st.executeUpdate("UPDATE vehicle_info SET is_stolen=FALSE where vehicle_id="
				+ vehicle_id);
		if (i > 0) {
			response.sendRedirect("stolenvehicles.jsp");
		} else
			response.sendRedirect("index.html");
	} catch (Exception e) {
		System.out.println(e);
	}
%>

