<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.db.jsp.* , java.sql.*"%>
<html>
<head>
	<link href="css/employeestyles.css" rel="stylesheet">
	<title>Employee Page</title>
	<meta charset="UTF-8">
</head>
<body>

	<%Object sin = request.getAttribute("employeeSin");%>
	<%ResultSet employeeset = ContactProgram.showEmployeeProfile(sin); %>
	<% employeeset.next(); %>
	<h1><%= "Signed in as: " + employeeset.getString(2) %></h1>
	
	<h3>List of Bookings</h3>
	<div>
			<TABLE BORDER="1" id="DisplayTable" class="table">
			<TR>
				<TH>Booking ID</TH>
				<TH>SIN</TH>
				<TH>Room ID</TH>
				<TH>Full Name</TH>
				<TH>Start Date</TH>
				<TH>End Date</TH>
				<TH>Checked In</TH>
			</TR>
			<%ResultSet bookingset = ContactProgram.getBranchBookings(employeeset.getString(4)); %>
			<% while(bookingset.next()){ %>
			<TR>
				<TD><%= bookingset.getString(1) %></TD>
				<TD><%= bookingset.getString(2) %></TD>
				<TD><%= bookingset.getString(3) %></TD>
				<TD><%= bookingset.getString(4) %></TD>
				<TD><%= bookingset.getString(5) %></TD>
				<TD><%= bookingset.getString(6) %></TD>
				<TD><%= bookingset.getString(7) %></TD>
				<TD>
					<form action="${pageContext.request.contextPath}/MyServlet" method="post">
					<input type="submit" name="Button" class="cancelBookingButton" value="Cancel Booking">
					<input type="hidden" name="employeeSIN" value=<%=employeeset.getString(1)%>> 
					<input type="hidden" name="bookingID" value=<%=bookingset.getString(1)%>>
					</form>
				</TD>
			</TR>
			<% } %>
		</TABLE>
		</div>

</body>
</html>