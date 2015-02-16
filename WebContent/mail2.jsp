<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Date" %>

<%@page import="com.Data.connjdbc"%>
<%@page import ="java.sql.*" %>
        <%
        			        
        			Statement st=connjdbc.getDatacn();
         %>
         <%		
 
   ResultSet rs = null;
   
  
   	String reply=null;
   
   	String subject="Contact info ";
    String text=null;
    String to=null;
    String host = "smtp.gmail.com";
	String userid = "jalpa4557@gmail.com"; 
	String password = "FI9IAMFI9"; 
	System.out.println("abc");
    String reply_id = (String)session.getAttribute("reply_id");
    System.out.println(reply_id);
    String str = "SELECT * from contact_info WHERE contact_id = '"+reply_id+"'";
    System.out.println("ghi");
    ResultSet rs2  = st.executeQuery(str);
    
    if(rs2.next()){
    	
    	 to = rs2.getString(3);
   		System.out.println(to);
    if(to!=null)
    {	
    	System.out.println("try again");
    Properties props = System.getProperties(); 
	props.put("mail.smtp.starttls.enable", "true"); 
	props.put("mail.smtp.host",host); 
	props.setProperty("mail.transport.protocol", "smtps");
	props.put("mail.smtp.user", userid); 
	props.put("mail.smtp.password", password); 
	props.put("mail.smtp.port", "465"); 
	props.put("mail.smtps.auth", "true"); 
	Session mailSession = Session.getDefaultInstance(props); 
	MimeMessage message = new MimeMessage(mailSession); 
	InternetAddress fromAddress = null;
	InternetAddress toAddress = null; 
    	try
    	{
    		 System.out.println("E-Mail Hasnt been sent SuccessFully");
    		text=request.getParameter("reply");
    		System.out.println(text);
			fromAddress = new InternetAddress(userid);
			toAddress = new InternetAddress(to);
		} 
		catch (AddressException e) 
		{
			e.printStackTrace();
		}
		finally
		{}
	message.setFrom(fromAddress);
	message.setRecipient(Message.RecipientType.TO, toAddress);
	message.setSubject(subject);
	System.out.println(text);

	message.setText(text); 
	Transport transport = mailSession.getTransport("smtps"); 
	transport.connect(host, userid, password); 
	transport.sendMessage(message, message.getAllRecipients());
	transport.close(); 
    System.out.println("E-Mail Has been sent SuccessFully");
    
    
     }   }
	 %>
	                          

