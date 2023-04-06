<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.db.jsp.* , java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="genericbookingStyles.css" rel="stylesheet">
<title>Booking Screen</title>
</head>
<body>
	<div class="title">
		<h1>Find a Hotel For You!</h1>
		<h3>Use our search feature to narrow down the hotels that
			accommodate you!</h3>
	</div>
	<%-- <div class="filters">
		<form action="${pageContext.request.contextPath}/MyServlet"
			method="post">
			<input type="text" class="destination" placeholder="Where To?">
			<input type="date" class="startDate" placeholder="Start Date">
			<input type="date" class="endDate" placeholder="End Date"> <input
				type="number" class="guests" placeholder="Number of Guests?" min="1"
				max="10"> <input type="submit" name="Button" class="submit"
				value="Find Now!"> <input type="submit" name="Button"
				class="showAll" value="Show All!">
		</form>
	</div> --%>
	<div class="tableOfHotels">
		<TABLE BORDER="1" id="DisplayTable">
			<TR>
				<TH>Hotel Chain</TH>
				<TH>Branch Rating</TH>
				<TH>Number of Rooms</TH>
				<TH>Branch Address</TH>
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
				<TD><%= resultset.getString(2) %></TD>
				<TD><%= resultset.getString(3) %></TD>
				<TD><%= resultset.getString(4) %></TD>
				<TD><button class="bookButton">Book Now -></button></TD>
			</TR>
			<% } %>
		</TABLE>
	</div>
</body>
</html>