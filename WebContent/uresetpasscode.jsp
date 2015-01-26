<%@ page import = "java.sql.*" %>
<%@page import="com.Data.connjdbc"%>

<%  

    
    try
    {
        int i=0;
        session.setAttribute("wrongcpass","");
      
      
        
        String uname = (String)session.getAttribute("user_username");
        String password = request.getParameter("oldpassword");
        String newpassword = request.getParameter("newpassword");
        
        String cpassword = request.getParameter("confirmpassword");
        
        
  
        Statement st = com.Data.connjdbc.getDatacn();
        
        
        
        String str = "SELECT * from admin_info WHERE admin_username = '"+uname+"'";
        ResultSet rs  = st.executeQuery(str);
        if(rs.next()){
	  System.out.println("rs exist");
            String pass = rs.getString(3);
        				if(pass.equals(password))
        				{
        		
        						if(newpassword.equals(cpassword)){  
        						int j,l=0;
                				String str1 = "UPDATE admin_info SET admin_password = '"+ newpassword +"' WHERE admin_password = '"+password+"'"; 
                				String str2 = "UPDATE user_info SET password = '"+ newpassword +"' WHERE password = '"+password+"'";
                				System.out.println("password changed111");
                				j = st.executeUpdate(str1);
                				l = st.executeUpdate(str2);

                				
                				System.out.println("password changed222");
                							if(j>0 || l>0){
                								
                					          
                    						response.sendRedirect("userhome.jsp");
                							}else{      
                								       
                    						response.sendRedirect("uresetpass.jsp"); 
                							}
                									}   
            				else{
            				
               				 String s = "password and confirm password doesnot match";
                			session.setAttribute("wrongcpass", s);
               				 response.sendRedirect("uresetpass.jsp"); 
           					 }  }
        
        else{
        	String s = "You have entered a wrong password";
            session.setAttribute("wrongcpass", s);
        	System.out.println("you have entered wrong password");
            response.sendRedirect("uresetpass.jsp"); 
        }}
       
        else{
        	System.out.println(" problem");
        	String s = "problem";
            session.setAttribute("wrongcpass", s);
            response.sendRedirect("uresetpass.jsp"); 
        }
    }
 
        catch (Exception e) {
		System.err.println(e);
	}
%>
