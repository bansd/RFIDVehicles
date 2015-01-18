<%@page import="java.util.StringTokenizer"%>
<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%
	Statement st = connjdbc.getDatacn();
	String dstate = request.getParameter("q");
	String ocity = request.getParameter("ocity");
	String editcity = request.getParameter("editcityid");
	
	if(dstate.matches("[0-9]+") && ocity.matches("[0-9]+")){
		
		int stateId = Integer.parseInt(dstate);
		int ocityId = Integer.parseInt(ocity);
		System.out.println(stateId);
		ResultSet rs = st
				.executeQuery("select * from city_info where state_id = "
						+ stateId + "");
		
		out.println("<select name=\"destination_city_name\" id=\"dcity\">");
		out.println("<option value = \"-1\">Select City</option>");
		
		while (rs.next()) {
			int i = rs.getInt(1);
			if(i != ocityId){
				out.println("<option value=" + rs.getInt(1) + ">"
						+ rs.getString(2) + "</option>");
			}else{
				
			}
			
		}
		out.println("</select>");
	}else if(dstate.matches("[0-9]+")){
		
		int stateId = Integer.parseInt(dstate);
		ResultSet rs = st
				.executeQuery("select * from city_info where state_id = "
						+ stateId + "");
		
		out.println("<select name=\"destination_city_name\" id=\"dcity\">");
		out.println("<option value = \"-1\">Select City</option>");
		
		while (rs.next()) {
			
				out.println("<option value=" + rs.getInt(1) + ">"
						+ rs.getString(2) + "</option>");
		}
		out.println("</select>");
		
	}else{
		out.println("<select name=\"destination_city_name\" id=\"dcity\">");
		out.println("<option value = \"-1\">Select City</option>");
		out.println("</select>");
	}
%>