<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%
       Statement st = com.Data.connjdbc.getDatacn(); 
       String sn = request.getParameter("q");
      sn.trim();
       ResultSet rs = st.executeQuery("select email_address from user_info where email_address ='"+sn+"'");
  
       if (rs.next()) {
             out.println("Someone already has that email!Try other!");
       }
      
%>