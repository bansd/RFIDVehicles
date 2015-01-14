package com.Data;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 *
 * @author Bansari
 */
public class connjdbc {
    
     public static Statement  getDatacn()throws ClassNotFoundException
	{ 
		try
		{
                    Class.forName("com.mysql.jdbc.Driver");      
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/rfid","root","root");
                    Statement st = cn.createStatement();
//                    System.out.print("connection Established");
                    return st;
                }
                catch(Exception e)
		{
			return null;
		}
        }
}
