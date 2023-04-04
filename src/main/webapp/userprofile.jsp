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
		<%Object sinNumber = null;%>
		<%Object fullName = null;%>
		<%Object userAddress = null;%>
		<%Object registerDate = null;%>
		<TABLE BORDER="1" id="DisplayTable">
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
	</body>
</html>