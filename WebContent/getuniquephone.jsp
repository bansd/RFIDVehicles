<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%
       Statement st = com.Data.connjdbc.getDatacn(); 
       String sn = request.getParameter("q");
      
       ResultSet rs = st.executeQuery("select contact_no from user_info where contact_no ="+sn+" OR alternate_contact_no="+sn);
  
       if (rs.next()) {
             out.println("Please choose different number!");
       }
      
%>