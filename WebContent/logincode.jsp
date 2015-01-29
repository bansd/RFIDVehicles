<%@page import="com.Data.connjdbc"%>
<%@ page pageEncoding="ISO-8859-1"  %>

<%@ page import = "java.sql.*" %>

<%   
    session.setAttribute("incorrectusernamepassword", "");
    session.setAttribute("incorrectpassword", "");
    String username = request.getParameter("email");
    String password = request.getParameter("password");
  	Statement st=connjdbc.getDatacn();
  	try
    {
        int i=0;
        String str = "SELECT * from admin_info WHERE admin_username = '"+username+"'";
        ResultSet rs  = st.executeQuery(str);
        System.out.println("here");
        if(rs.next())
        {
        	String uname = rs.getString(2);
            String pass = rs.getString(3);
            String usertype=rs.getString(4);
            rs.close();            
            if(pass.equals(password))
            {
            	
            	 if(usertype.equals("Admin"))
            	 {
            		 session.setMaxInactiveInterval(600);
            		 session.setAttribute("admin_name",username);
            		 response.sendRedirect("city.jsp");
            	 }else
            	 {
            		 session.setAttribute("user_username", username);
            		 rs = st.executeQuery("SELECT * from user_info where username='"+username+"'");
            		 if(rs.next()){
            			 String fname = rs.getString(5);
            			 String lname = rs.getString(7);
            			 fname = fname.substring(0, 1).toUpperCase()+ fname.substring(1);
            			 lname = lname.substring(0, 1).toUpperCase() + lname.substring(1);
            			 int id = rs.getInt(1);
            			 session.setAttribute("user_id", id);
            			 session.setAttribute("fname", fname);
            			 session.setAttribute("lname", lname);
            		 }
            		 
            		 response.sendRedirect("userhome.jsp");
            	 }
            	
            }
            else
            {
            	response.sendRedirect("userlogin.jsp?wrong=Pass is Not Valid");
            }
        }  
        else
        {
            response.sendRedirect("userlogin.jsp?wrong=Invalid Username And Password"); 
        }
    
            
            
   }
         	
            		
            	
    catch(Exception e)
    {
        System.out.println(e);
    }
%>

