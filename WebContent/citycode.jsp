
<%@page import="com.Data.connjdbc"%>
<%@ page import = "java.sql.*" %>

<%     
    String city_name = request.getParameter("city_name");
    int state_id = Integer.parseInt(request.getParameter("state_name"));
    
    Statement st = connjdbc.getDatacn();
   
    try
    {
        int i=0;        
        String str = "INSERT INTO city_info(city_name,state_id) VALUES('"+ city_name +"',"+state_id +")";   

        System.out.println(str);
        i= st.executeUpdate(str);
        out.println("successfully added");
        if(i>0){
           System.out.println("Successfully");
           response.sendRedirect("city.jsp");
        }
        else
           response.sendRedirect("index.html");    
    }    
    catch(Exception e)
    {
        System.out.println(e);
    }
%>
