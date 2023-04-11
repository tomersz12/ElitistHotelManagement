<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.db.jsp.* , java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Capacity View</title>
	</head>
	<body>
		<%Object hotelID = request.getAttribute("chosenHotelID");%>
		<div class="tableforview">
			<TABLE BORDER="1" id="DisplayTable">
				<TR>
					<TH>Hotel Name</TH>
					<TH>Branch ID</TH>
					<TH>Room ID</TH>
					<TH>Rooms Capacity</TH>
				</TR>
		
				<%ResultSet resultset = ContactProgram.createCapacityView(hotelID);%>
				<% while(resultset.next()){ %>
				<TR>
					<TD><%= resultset.getString(1) %></TD>
					<TD><%= resultset.getString(2) %></TD>
					<TD><%= resultset.getString(3) %></TD>
					<TD><%= resultset.getString(4) %></TD>
				</TR>
				<% } %>
			</TABLE>
		</div>
	</body>
</html>