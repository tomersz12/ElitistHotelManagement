<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.db.jsp.* , java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/genericbookingStyles.css" rel="stylesheet">
<title>Booking Screen</title>
</head>
<body>

	<%Object sinUser = request.getAttribute("userinfo");%>
	<div class="title">
		<h1>Find a Hotel For You!</h1>
		<h3>Pick a room that fits you!</h3>
	</div>
	
	<div class="tableOfHotels">
		<TABLE BORDER="1" id="DisplayTable">
			<TR>
				<TH>Hotel Chain</TH>
				<TH>Branch Rating</TH>
				<TH>Number of Rooms</TH>
				<TH>City</TH>
				<TH>Room Price</TH>
				<TH>Room Capacity</TH>
				<TH>View Type</TH>
				<TH>Can I Extend My Stay?</TH>
				<TH></TH>
			</TR>
			<%Object test1 = request.getAttribute("chosenCity"); %>
			<%Object test2 = request.getAttribute("chosenStartDate"); %>
			<%Object test3 = request.getAttribute("chosenEndDate"); %>
			<%Object test4 = request.getAttribute("chosenGuestAmount"); %>
			<%Object test5 = request.getAttribute("chosenHotel"); %>
			<%Object test6 = request.getAttribute("chosenRatings"); %>
			<%Object test7 = request.getAttribute("chosenNumberOfRooms"); %>
			<%Object test8 = request.getAttribute("chosenPrice"); %>
			
			<%ResultSet resultset = ContactProgram.showFiltered(test1, test2, test3, test4, test5, test6, test7, test8); %>
			<% while(resultset.next()){ %>
			<TR>
				<TD><%= resultset.getString(1) %></TD>
				<TD><%= resultset.getString(2) %>/5 Stars</TD>
				<TD><%= resultset.getString(3) %></TD>
				<TD><%= resultset.getString(4) %></TD>
				<TD>$<%= resultset.getString(6) %></TD>
				<TD><%= resultset.getString(7) %></TD>
				<TD><%= resultset.getString(8) %></TD>
				<TD><%= resultset.getString(9) %></TD>
				<TD><form action="${pageContext.request.contextPath}/MyServlet" method="post">
				<input type="submit" name="Button" class="bookButton" value="Book Now!"> 
				<input type="hidden" name="roomData" value=<%=resultset.getString(5)%>>
				<input type="hidden" name="userSinFinal" value=<%=sinUser%>>
				<input type="hidden" name="bookingStart" value=<%=test2%>>
				<input type="hidden" name="bookingEnd" value=<%=test3%>></form></TD>
			</TR>
			<% } %>
		</TABLE>
	</div>
</body>
</html>