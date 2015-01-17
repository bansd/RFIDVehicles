<%-- 
    Document   : city code
    Created on : Oct 16, 2014, 6:52:00 PM
    Author     : Bansari
--%>

<%@ page import = "java.sql.*" %>

<%   
    String state_name = request.getParameter("state_name");       
    Statement st = com.Data.connjdbc.getDatacn();
    int id = 1;
    try
    {
        int i=0;
        String str = "INSERT INTO state_info(state_name,country_id) VALUES('"+ state_name +"',"+ id +")";   
        i= st.executeUpdate(str);
        if(i>0){
           System.out.println("Successfully");
           response.sendRedirect("state.jsp");
        }
        else
           response.sendRedirect("login.jsp"); 
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
%>
