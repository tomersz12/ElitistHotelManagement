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
	<h1><%= "Signed in as: " + employeeset.getString(2) +" at Branch " + employeeset.getString(4) %></h1>
	<% boolean isManager = "t".equals(employeeset.getString(5)); %>
	
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
				<TH></TH>
				<TH></TH>
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
				<TD>
					<form action="${pageContext.request.contextPath}/MyServlet" method="post">
					<input type="submit" name="Button" class="beginRentingButton" value="Begin Rental">
					<input type="hidden" name="employeeSIN" value=<%=employeeset.getString(1)%>> 
					<input type="hidden" name="bookingID" value=<%=bookingset.getString(1)%>>
					<input type="hidden" name="checkedIn" value=<%=bookingset.getString(7)%>>
					</form>
				</TD>
			</TR>
			<% } %>
		</TABLE>
	</div>
		
	<h3>List of Rentals</h3>
	<div>
		<TABLE BORDER="1" id="DisplayTable" class="table">
			<TR>
				<TH>Rental ID</TH>
				<TH>Booking ID</TH>
				<TH>SIN</TH>
				<TH>Employee SIN</TH>
				<TH>Room ID</TH>
				<TH>Resident Name</TH>
				<TH>Start Date</TH>
				<TH>End Date</TH>
				<TH>Check In</TH>
				<TH>Payment Status</TH>
				<TH></TH>
			</TR>
			<%ResultSet rentalset = ContactProgram.getBranchRentals(employeeset.getString(4)); %>
			<% while(rentalset.next()){ %>
			<TR>
				<TD><%= rentalset.getString(1) %></TD>
				<TD><%= rentalset.getString(2) %></TD>
				<TD><%= rentalset.getString(3) %></TD>
				<TD><%= rentalset.getString(4) %></TD>
				<TD><%= rentalset.getString(5) %></TD>
				<TD><%= rentalset.getString(6) %></TD>
				<TD><%= rentalset.getString(7) %></TD>
				<TD><%= rentalset.getString(8) %></TD>
				<TD><%= rentalset.getString(9) %></TD>
				<TD><%= rentalset.getString(10) %></TD>
				<TD>
					<form action="${pageContext.request.contextPath}/MyServlet" method="post">
					<input type="submit" name="Button" class="confirmPaymentButton" value="Confirm Payment">
					<input type="hidden" name="employeeSIN" value=<%=employeeset.getString(1)%>> 
					<input type="hidden" name="rentalID" value=<%=rentalset.getString(1)%>>
					</form>
				</TD>
			</TR>
			<% } %>
		</TABLE>
	</div>
	
	<h3>Create Rental</h3>
	<div class = "form">
			<form action="${pageContext.request.contextPath}/MyServlet" method="POST">
				<input type = "text" name="sinNumber" placeholder="Customer SIN" >
				<br></br>
				<input type = "text" name="roomID" placeholder="Room ID">
				<br></br>
				<input type = "date" name="endDate" placeholder="End Date" min=<%=java.time.LocalDate.now().plusDays(1)%>>
				<br></br>
				<input type="submit" name="Button" class="createRentalButton" value="Create Rental">
				<input type="hidden" name="employeeSIN" value=<%=employeeset.getString(1)%>> 
			</form>
	</div>
	
	<% //Management Tools are below %>
	
	<div>
	<% if (isManager) { %>
	<h3>Management Tools</h3>
	<div>
		<TABLE BORDER="1" id="DisplayTable" class="table">
			<TR>
				<TH>Employee SIN</TH>
				<TH>Full Name</TH>
				<TH>Employee Address</TH>
				<TH></TH>
			</TR>
			<%ResultSet employeesList = ContactProgram.getEmployees(employeeset.getString(4)); %>
			<% while(employeesList.next()){ %>
			<TR>
				<TD><%= employeesList.getString(1) %></TD>
				<TD><%= employeesList.getString(2) %></TD>
				<TD><%= employeesList.getString(3) %></TD>
				<TD>
					<form action="${pageContext.request.contextPath}/MyServlet" method="post">
					<input type="submit" name="Button" class="fireEmployeeButton" value="Fire Employee">
					<input type="hidden" name="employeeSIN" value=<%=employeeset.getString(1)%>> 
					<input type="hidden" name="firedEmployeeSIN" value=<%=employeesList.getString(1)%>>
					</form>
				</TD>
			</TR>
			<% } %>
		</TABLE>
	</div>
	<% } %>
	
	<h3>Create Employee Account</h3>
	<div class = "form">
			<form action="${pageContext.request.contextPath}/MyServlet" method="POST">
				<input type = "text" name="fullName" placeholder="Employee Name" >
				<br></br>
				<input type = "text" name="address" placeholder="Employee Address">
				<br></br>
				<input type="submit" name="Button" class="createEmployeeButton" value="Create Employee">
				<input type="hidden" name="employeeSIN" value=<%=employeeset.getString(1)%>> 
				<input type="hidden" name="branchID" value=<%=employeeset.getString(4)%>> 
			</form>
	</div>
	
	<h3>Create Room</h3>
	<div class = "form">
			<form action="${pageContext.request.contextPath}/MyServlet" method="POST">
				<input type = "text" name="roomID" placeholder="Room ID" >
				<br></br>
				<input type = "text" name="price" placeholder="Price">
				<br></br>
				<input type = "number" name="roomCapacity" placeholder="Room Capacity">
				<br></br>
				<input type = "text" name="typeOfView" placeholder="Type of View">
				<br></br>
				<input type="checkbox" name="extendability">
				<label for="extendability"> Extendable? </label>
				<br></br>
				<input type = "text" name="amentities" placeholder="Any Amentities?">
				<br></br>
				<input type="submit" name="Button" class="createRoomButton" value="Create Room">
				<input type="hidden" name="employeeSIN" value=<%=employeeset.getString(1)%>> 
				<input type="hidden" name="branchID" value=<%=employeeset.getString(4)%>> 
			</form>
	</div>
	
	</div>
	
	
	
	
</body>
</html>