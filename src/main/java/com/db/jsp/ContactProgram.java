package com.db.jsp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;



public class ContactProgram {
	static String jdbcURL = "jdbc:postgresql://localhost:5432/hotelmanagement";
    static String username = "justinwang";
    static String password = "postwan07";

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
        System.out.println("hello");
        connection.close();
        
        return address;
    }
    
    public static ResultSet showAll() throws SQLException{
    	Connection connection = DriverManager.getConnection(jdbcURL, username, password);
    	String sql = "SELECT * FROM hotelchain";
        
        Statement statement = connection.createStatement();
        
        ResultSet result = statement.executeQuery(sql);
        
        connection.close();
        
		return result;
    }
    
    public static ResultSet showFiltered(Object city, Object startDate, Object endDate, Object guestAmount) throws SQLException{
    	Connection connection = DriverManager.getConnection(jdbcURL, username, password);
    	String sql;
    	
    	if (city.equals("Toronto")) {
    		sql = "SELECT * FROM hotelBranch";
    	}else {
    		sql = "SELECT * FROM hotelchain";
    	}
        
        Statement statement = connection.createStatement();
        
        ResultSet result = statement.executeQuery(sql);
        
		System.out.println(city);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(guestAmount);
		
		connection.close();
		
		return result;
    }
    
    
    //can be changed or removed
    public static ResultSet showUserProfile(Object sin) throws SQLException {
    	Connection connection = DriverManager.getConnection(jdbcURL, username, password);
    	String sql = "SELECT * FROM customer WHERE sin=" + sin.toString();
    	
    	Statement statement = connection.createStatement();
        
        ResultSet result = statement.executeQuery(sql);
        
        connection.close();
        
        return result;
    }
    
    public static void updateUserProfile(int sin, Object fullname, Object address) throws SQLException{
    	Connection connection = DriverManager.getConnection(jdbcURL, username, password);
    	System.out.println("check" + address);
    	
    	String sql = "UPDATE customer "
                + "SET customeraddress = ? "
                + "WHERE sin = ?";
        PreparedStatement pstmt = connection.prepareStatement(sql);
        pstmt.setString(1, address.toString());
        pstmt.setInt(2, sin);
        
        pstmt.executeUpdate();
        connection.close();
    }
    
    public static boolean verifyCustomer(String SIN) throws SQLException{
    	int counter = 0;
    	Connection connection = DriverManager.getConnection(jdbcURL, username, password);
    	String sql = "SELECT * FROM customer WHERE sin=" + SIN;
    	
    	Statement statement = connection.createStatement();
        
        ResultSet result = statement.executeQuery(sql);
        
        while(result.next()) {
        	counter++;
        }
        
        connection.close();
        
        if (counter == 0) {
        	return false;
        }else {
        	return true;
        }
        
    }	
}