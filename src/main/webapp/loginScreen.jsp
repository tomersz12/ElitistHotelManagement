<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/loginStyles.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Please Login</title>
</head>
<body>
	<button class="CustomerLogin" id = "userLogin">Customer Login</button>
	<div class = "customerLoginForm" id = "userForm">
		<h3 class = "loginUserTitle">USER LOGIN:</h3>
		<form id = "customerLogin" action="${pageContext.request.contextPath}/MyServlet" method="POST">
			<input type = "text" class="userlogin" name = "userSIN" placeholder="Enter Your SIN Number">
			<br></br>
			<input type = "submit" value = "userSubmit" name = "Button">
		</form>
	</div>	
	<br></br>
	
	<button class="EmployeeLogin" id = "employeeLogin">Employee Login</button>
		<div class = "employeeLoginForm" id = "employeeForm">
		<h3 class = "loginEmployeeTitle">EMPLOYEE LOGIN:</h3>
		<form id = "employeeLogin" action="${pageContext.request.contextPath}/MyServlet" method="POST">
			<input type = "text" class="employeeLogin" name="employeeSIN" placeholder="Enter Your SIN Number">
			<br></br>
			<input type = "submit" value = "employeeSubmit" name = "Button">
		</form>
	</div>
	
	<script src = "scripts.js"></script>
</body>
</html>