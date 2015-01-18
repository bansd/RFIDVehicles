<%@page import="java.util.StringTokenizer"%>
<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%
	Statement st = connjdbc.getDatacn();
	String sn = request.getParameter("q");
	String s = request.getParameter("city");
	int i = Integer.parseInt(sn);
	int ocityid = Integer.parseInt(s);
	System.out.println("ocity"+ocityid);
	ResultSet rs = st
			.executeQuery("select * from city_info where state_id = "
					+ i + "");
	out.println("<label for=\"city_name\">Origin City:</label>");%>	
	<select name="origin_city_name" id="ocity" onChange="showDestCity()">
	
	<%out.println("<option value = \"-1\">Select City</option>");	
	while (rs.next()) {%>
		<option <%=ocityid==rs.getInt(1)?"selected":"" %> value="<%=rs.getInt(1)%>">
				<%=rs.getString(2)%></option>
	<%}%>
	
	</select>
<%	rs.close();
%>
