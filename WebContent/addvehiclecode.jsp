<%-- 
    Document   : emailcode
    Created on : Dec 25, 2014, 2:45:51 PM
    Author     : dell
--%>

<%@ page import = "java.sql.*" %>

<%  

	int user_id = Integer.parseInt(session.getAttribute("user_id").toString());
	String veh_no = request.getParameter("vehicle_no");
	String veh_type = request.getParameter("vehicle_type");
	String rc_book_no = request.getParameter("rc_book_no");
	String type_of_transport = request.getParameter("type_of_transport");
	
    Statement st = com.Data.connjdbc.getDatacn();

    try
    {
        int i=0;
        String str = "INSERT INTO Vehicle_info(user_id,vehicle_no,vehicle_type,rc_book_no,type_of_transport) VALUES("+ user_id +",'"+ veh_no +"','"+ veh_type +"','"+ rc_book_no +"','"+ type_of_transport +"')";      

        i= st.executeUpdate(str);
        if(i>0){
           System.out.println("Successfully");
           response.sendRedirect("userhome.jsp");
        }
        else
           response.sendRedirect("index.html");    
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
%>

