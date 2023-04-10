<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.db.jsp.* , java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>View All Hotels Room Avaliability%></title>
	</head>
	<body>
		<div class="tableOfHotelRoom">
		<TABLE BORDER="1" id="DisplayTable">
			<TR>
				<TH>City</TH>
				<TH>Rooms Avaliable</TH>
			</TR>
	
			<%ResultSet resultset = ContactProgram.createAreaView();%>
			<% while(resultset.next()){ %>
			<TR>
				<TD><%= resultset.getString(1) %></TD>
				<TD><%= resultset.getString(2) %></TD>
			</TR>
			<% } %>
		</TABLE>
	</div>
		
	</body>
</html>