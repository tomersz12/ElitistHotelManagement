<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.db.jsp.* , java.sql.*"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User Profile</title>
	</head>
	<body>
		<div class="tableOfUserInfo">
		<TABLE BORDER="1" id="DisplayTable">
			<TR>
				<TH>SIN Number</TH>
				<TH>Full Name</TH>
				<TH>Your Address</TH>
				<TH>Date You Registered</TH>
				<TH>    </TH>
			</TR>
			<%ResultSet resultset = ContactProgram.showUserProfile(); %>
			<% while(resultset.next()){ %>
			<TR>
				<TD><%= resultset.getString(1) %></TD>
				<TD><%= resultset.getString(2) %></TD>
				<TD><%= resultset.getString(3) %></TD>
				<TD><%= resultset.getString(4) %></TD>
				<TD><button class="bookButton">Change -></button></TD>
			</TR>
			<% } %>
		</TABLE>
	</div>
	</body>
</html>