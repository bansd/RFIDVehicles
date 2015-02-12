<%-- 
    Document   : addcities
    Created on : Dec 27, 2014, 3:02:46 PM
    Author     : Bansari
--%>

<%@page language="java" import ="java.sql.*" %>  
<%  
   
    String country=request.getParameter("state_name");  
    response.setContentType("text/html");   
    response.setHeader("Cache-Control","no-cache");  
    try  {
        String buffer="<select name='state'><option value='-1'>Select city</option>";  
        Statement stmt = com.Data.connjdbc.getDatacn();  
        String query = "Select * from city_info where state_id='"+country+"' ";  
        System.out.println(query);  
        ResultSet rs = stmt.executeQuery(query);  
        while(rs.next()){
          buffer=buffer+"<option value='"+rs.getInt(1)+"'>"+rs.getString(2)+"</option>";  
      }  
        buffer=buffer+"</select>";  
        response.getWriter().println(buffer);  
    }  
    catch(Exception e){
        response.getWriter().println(e);  
    }  
%>

