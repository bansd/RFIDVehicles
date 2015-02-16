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
   
  
   	String result=null;
   	String subject="Forgot Pasword? ";
    String text=null;
    String host = "smtp.gmail.com";
	String userid = "jalpa4555@gmail.com"; 
	String password = "FI9IAMFI9"; 
    String from = request.getParameter("email");
	System.out.println(from);
     
    if(from!=null)
    {	
    	System.out.println("try again");
    Properties props = System.getProperties(); 
	props.put("mail.smtp.starttls.enable", "true"); 
	props.put("mail.smtp.host",host); 
	props.setProperty("mail.transport.protocol", "smtps");
	props.put("mail.smtp.user", from); 
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
    		text="Hello,My Testing ";
    		
			fromAddress = new InternetAddress(from);
			toAddress = new InternetAddress(userid);
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
	message.setText(text); 
    
    Transport transport = mailSession.getTransport("smtps"); 
	transport.connect(host, from, password); 
	transport.sendMessage(message, message.getAllRecipients());
	transport.close(); 
    System.out.println("E-Mail Has been sent SuccessFully");
    
    
     }   
	 %>
	                          

