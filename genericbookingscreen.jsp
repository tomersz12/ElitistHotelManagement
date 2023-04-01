<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.db.jsp.* , java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="genericbookingStyles.css" rel="stylesheet">
		<title>Booking Screen</title>
	</head>
	<body>
		<div class = "title">
			<h1>Find a Hotel For You!</h1>
			<h3>Use our search feature to narrow down the hotels that accommodate you!</h3>
		</div>
		<div class = "filters">
			<form>
				<input type = "text" class = "destination" placeholder = "Where To?">
				<input type = "date" class = "startDate" placeholder = "Start Date">
				<input type = "date" class = "endDate" placeholder = "End Date">
				<input type = "number" class = "guests" placeholder = "Number of Guests?" min="1" max="10">
				<input type = "submit" class = "submit" value="Find Now!">
			</form>
			<button class = "showAll">Show All</button>
		</div>
		<div class = "tableOfHotels">
			<TABLE BORDER="1">
		      <TR>
		      <TH>ID</TH>
		      <TH>Address</TH>
		      <TH># of Hotels</TH>
		      <TH>Name</TH>
		      <TH>    </TH>
		      </TR>
		      <% ResultSet resultset = ContactProgram.showAll(); %>
		      <% while(resultset.next()){ %>
		      <TR>
		       <TD> <%= resultset.getString(1) %></TD>
		       <TD> <%= resultset.getString(2) %></TD>
		       <TD> <%= resultset.getString(3) %></TD>
		       <TD> <%= resultset.getString(4) %></TD>
		       <TD> <button class = "bookButton">Book Now -></button>
		      </TR>
		      <% } %>
		     </TABLE>
		</div>
	</body>
</html>