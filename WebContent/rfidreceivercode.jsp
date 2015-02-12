<%-- 
    Document   : emailcode
    Created on : Dec 25, 2014, 2:45:51 PM
    Author     : dell
--%>

<%@ page import = "java.sql.*" %>

<%   
    
    
    String range = request.getParameter("range");
	String location =request.getParameter("city");
	String lat = request.getParameter("latitude");
	String longitude = request.getParameter("longitude");
	String type = request.getParameter("submit");
    Statement st = com.Data.connjdbc.getDatacn();
    try
    {
    	if(type.equals("Add")){
	        int i=0;
	        String str = "INSERT INTO rfid_info (rfid_receiver_range,rfid_receiver_location,rfid_receiver_latitude,rfid_receiver_longitude) VALUES('"+range+"','"+location+"','"+lat+"','"+longitude+"')";   
	
	        System.out.println(str);
	        i= st.executeUpdate(str);
	        if(i>0){
	           System.out.println("Successfully");
	           response.sendRedirect("rfidreceiver.jsp");
	        }
	        else
	           response.sendRedirect("login.jsp");  
    	}else{
    		int id = Integer.parseInt(session.getAttribute("edit_id")+"");
    		System.out.println("id is"+id);
    		String str = "UPDATE rfid_info SET rfid_receiver_range='"+range+"', rfid_receiver_location='"+location+"', rfid_receiver_latitude='"+lat+"',rfid_receiver_longitude='"+longitude+"' where rfid_receiver_id="+id;
    		int i = 0;
    		i  = st.executeUpdate(str);
    		if(i>0){
 	           System.out.println("Successfully");
 	           response.sendRedirect("rfidreceiver.jsp");
 	        }
 	        else
 	           response.sendRedirect("enter.jsp"); 
    	}
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
%>

