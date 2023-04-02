package com.db.jsp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ContactProgram {
	static String jdbcURL = "jdbc:postgresql://localhost:5432/hotelmanagement";
    static String username = "";
    static String password = "";

    public static String add() throws SQLException{
        String address = "";

        Connection connection = DriverManager.getConnection(jdbcURL, username, password);
        System.out.println("connected");
        
        String sql = "SELECT * FROM hotelchain";
        
        Statement statement = connection.createStatement();
        
        ResultSet result = statement.executeQuery(sql);
        while (result.next()) {
        	 address = result.getString("centralOfficeAddress");
        }
        
        connection.close();
        
        return address;
    }
    
    public static ResultSet showAll() throws SQLException{
    	Connection connection = DriverManager.getConnection(jdbcURL, username, password);
    	String sql = "SELECT * FROM hotelchain";
        
        Statement statement = connection.createStatement();
        
        ResultSet result = statement.executeQuery(sql);
        
		return result;
    }
}