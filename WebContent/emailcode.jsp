<%-- 
    Document   : emailcode
    Created on : Dec 25, 2014, 2:45:51 PM
    Author     : dell
--%>

<%@ page import = "java.sql.*" %>

<%   
    
    String type = request.getParameter("submit");
    String email_content = request.getParameter("email_content");
    Statement st = com.Data.connjdbc.getDatacn();

    try
    {
    	if(type.equals("Add")){
	        int i=0;
	        String str = "INSERT INTO email_type_info(email_content) VALUES('"+ email_content +"')";   
	
	        System.out.println(str);
	        i= st.executeUpdate(str);
	        if(i>0){
	           System.out.println("Successfully");
	           response.sendRedirect("email.jsp");
	        }
	        else
	           response.sendRedirect("login.jsp"); 
    	}else{
    		int id = Integer.parseInt(session.getAttribute("edit_id")+"");
    		String str = "UPDATE email_type_info SET email_content='"+email_content+"' where email_content_id="+id;
    		int i = 0;
    		i  = st.executeUpdate(str);
    		if(i>0){
 	           System.out.println("Successfully");
 	           response.sendRedirect("email.jsp");
 	        }
 	        else
 	           response.sendRedirect("login.jsp");     		
    	}
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
%>

