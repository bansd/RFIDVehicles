<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%
       Statement st = com.Data.connjdbc.getDatacn(); 
       String sn = request.getParameter("q");
       int i = Integer.parseInt(sn);
       ResultSet rs = st
                       .executeQuery("select * from city_info where state_id = "
                                       + i + "");
       
       out.println("<select name=\"city_name\" style=\"color:#bdbdbd\">");
       
       while (rs.next()) {
               out.println("<option value=" + rs.getInt(1) + ">"
                               + rs.getString(2) + "</option>");
       }
       out.println("</select>");
%>