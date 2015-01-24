<%-- 
    Document   : emailcode
    Created on : Dec 25, 2014, 2:45:51 PM
    Author     : dell
--%>

<%@ page import = "java.sql.*" %>

<%   
    
    
    String message_content = request.getParameter("message_content");
	String type = request.getParameter("submit");
    Statement st = com.Data.connjdbc.getDatacn();
    try
    {
    	if(type.equals("Add")){
	        int i=0;
	        String str = "INSERT INTO message_type_info(message_content) VALUES('"+ message_content +"')";   
	
	        System.out.println(str);
	        i= st.executeUpdate(str);
	        if(i>0){
	           System.out.println("Successfully");
	           response.sendRedirect("message.jsp");
	        }
	        else
	           response.sendRedirect("login.jsp");  
    	}else{
    		int id = Integer.parseInt(session.getAttribute("edit_id")+"");
    		System.out.println("id is"+id);
    		String str = "UPDATE message_type_info SET message_content='"+message_content+"' where message_content_id="+id;
    		int i = 0;
    		i  = st.executeUpdate(str);
    		if(i>0){
 	           System.out.println("Successfully");
 	           response.sendRedirect("message.jsp");
 	        }
 	        else
 	           response.sendRedirect("indexx.jsp"); 
    	}
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
%>

