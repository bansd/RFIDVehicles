<%@page import="com.Data.connjdbc"%>
<%@page import="java.sql.*"%>
<%
       Statement st = com.Data.connjdbc.getDatacn(); 
       String sn = request.getParameter("q");
      
       ResultSet rs = st.executeQuery("select username from user_info where username ='"+sn+"'");
  		System.out.println("here");
       if (rs.next()) {
             out.println("Someone already has that username!Try other");
       }else{
    	   
       }
      
%>