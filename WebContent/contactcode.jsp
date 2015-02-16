<%@page import="com.Data.connjdbc"%>
<%@ page import = "java.sql.*" %>

<%     
String name = request.getParameter("name");
String email = request.getParameter("email");
String cno = request.getParameter("cno");

String comment = request.getParameter("comment");



   
    Class.forName("com.mysql.jdbc.Driver");    
    
    Statement st = connjdbc.getDatacn();
   
    try
    {
        int i=0;        
        String str = "INSERT INTO contact_info(name,email,cno,comment) VALUES('"+ name +"','"+ email +"','"+ cno +"','"+ comment +"')";   

        System.out.println(str);
        i= st.executeUpdate(str);
        out.println("successfully added");
        if(i>0){
           System.out.println("Successfully");
           response.sendRedirect("contact.jsp");
        }
        else
           response.sendRedirect("index.html");    
    }    
    catch(Exception e)
    {
        System.out.println(e);
    }
%>
