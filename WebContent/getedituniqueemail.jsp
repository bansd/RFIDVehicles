<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%
       Statement st = com.Data.connjdbc.getDatacn(); 
       String sn = request.getParameter("q");
      	String email = session.getAttribute("email")+"";
      	System.out.println("here"+sn);
       ResultSet rs = st.executeQuery("select email_address from user_info where email_address ='"+sn+"' AND email_address!='"+email+"'");
  
       if (rs.next()) {
             out.println("Someone already has that username!Try other!");
       }
      
%>