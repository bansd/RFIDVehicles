<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%
       Statement st = com.Data.connjdbc.getDatacn(); 
       String sn = request.getParameter("q");
       String uname = session.getAttribute("user_username")+"";
      sn.trim();
       ResultSet rs = st.executeQuery("select username from user_info where username ='"+sn+"' AND username !='"+uname+"'");
       if (rs.next()) {    	  
             out.println("Someone already has that username!Try other");    	   
       }
      
%>