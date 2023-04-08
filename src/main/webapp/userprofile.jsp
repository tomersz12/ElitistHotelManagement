<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.db.jsp.* , java.sql.*"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User Profile</title>
		<link href="css/profilestyles.css" rel="stylesheet">
	</head>
	<body>
		<div>
			<h2 class = "title">User Information:</h2>
			<%Object sinNumber = null;%>
			<%Object fullName = null;%>
			<%Object userAddress = null;%>
			<%Object registerDate = null;%>
			<TABLE BORDER="1" id="DisplayTable" class="tableOfUserInfo">
				<TR>
					<TH>SIN Number</TH>
					<TH>Full Name</TH>
					<TH>Your Address</TH>
					<TH>Date You Registered</TH>
				</TR>
				<%Object sin = request.getAttribute("userSin"); %>
				<%ResultSet resultset = ContactProgram.showUserProfile(sin); %>
				<% while(resultset.next()){ %>
				<%sinNumber = resultset.getString(1);%>
				<%fullName = resultset.getString(2);%>
				<%userAddress = resultset.getString(3);%>
				<%registerDate = resultset.getString(4);%>
				<TR>
					<TD><%= sinNumber %></TD>
					<TD><%= fullName %></TD>
					<TD><%= userAddress %></TD>
					<TD><%= registerDate %></TD>
				</TR>
				<% } %>
			</TABLE>
		</div>
		<br></br>
		<div class = "changeInfoForm">
			<form action="${pageContext.request.contextPath}/MyServlet" method="POST">
				<input type = "text" name="sinNumber" value=<%=sinNumber%> readonly>
				<br></br>
				<input type = "text" name="name" value=<%=fullName%>>
				<br></br>
				<input type = "text" name="address" value=<%=userAddress%>>
				<br></br>
				<input type = "text" name="dateOfRegister" value=<%=registerDate%> readonly>
				<br></br>
				<input type="submit" name="Button" class="changeInfo" value="Change Info">
			</form>
		</div>
		<br></br>
		<h3 class = "bookingTitle">View Your Bookings!</h3>
		<div>
			<TABLE BORDER="1" id="DisplayTable" class="userbookings">
			<TR>
				<TH>Booking ID</TH>
				<TH>SIN</TH>
				<TH>Full Name</TH>
				<TH>Start Date</TH>
				<TH>End Date</TH>
			</TR>
			<%ResultSet bookingset = ContactProgram.getUserBookings(sin); %>
			<% while(bookingset.next()){ %>
			<TR>
				<TD><%= bookingset.getString(1) %></TD>
				<TD><%= bookingset.getString(2) %></TD>
				<TD><%= bookingset.getString(3) %></TD>
				<TD><%= bookingset.getString(4) %></TD>
				<TD><%= bookingset.getString(5) %></TD>
			</TR>
			<% } %>
		</TABLE>
		</div>
	</body>
</html>