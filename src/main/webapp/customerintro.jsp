<!DOCTYPE html>
<%@ page import="com.db.jsp.* , java.sql.*"%>
<html>
<head>
<link href="css/styles.css" rel="stylesheet">
<title>Welcome!</title>
</head>
<body>

	<%Object sin = request.getAttribute("userSin");%>
	<div class="navbar">
		<form action="${pageContext.request.contextPath}/MyServlet" method="POST">
			<input type="hidden" name="USERSIN" value=<%=sin%>>
			<input type="submit" name="Button" class="profile" value="Profile">
		</form>
		<h2>Elitest Hotel Manager</h2>
	</div>
	
	<div class="filters">
		<form action="${pageContext.request.contextPath}/MyServlet"
			method="POST">
			<input type="text" class="destination" name = "city" placeholder="Where To?">
			<input type="date" class="startDate" name = "startdate" placeholder="Start Date" min=<%=java.time.LocalDate.now()%>>
			<input type="date" class="endDate" name = "enddate" placeholder="End Date" min=<%=java.time.LocalDate.now()%>> 
			<input type="text" class="guests" name = "guestamount" placeholder="Number of Guests?">
			<input type="text" class="hotelchain" name = "hotelname" placeholder="Name of Hotel?"> 
			<input type="text" class="stars" name = "starrating" placeholder="Star Rating?">
			<input type="text" class="avaiable" name = "roomsfree" placeholder="How Many Rooms?">
			<input type="text" class="price" name = "price" placeholder="Max Price?">
			<input type="hidden" name="USERSINBOOKING" value=<%=sin%>>
			
	 		<input type="submit" name="Button" class="submit" value="Find Now!"> 
			<input type="submit" name="Button" class="showAll" value="Show All!">
			<br></br>
			<input type="text" class="hotelID" name = "hotelid" placeholder="HotelID">
			<input type="submit" name="Button" class="showRoomsOfHotel" value="View Hotels">
			
		</form>
	</div>
	
	<div class="stockImage">
		<img src="images/vacation.jpeg" alt="Vacation!" class="vacation">
		<div class="description">
			<h3>Here at Elitist Hotel Management, we believe you can
			find your next vacation right here! Explore one of our 5 WONDERFUL
			partner hotel chains and be amazed at all there offerings. I'm
			sure all the choices will be simply overwhelming, and will excite
			you into picking the right place for your next getaway!</h3>
		</div>
	</div>
	
	<div class="hotelChains">
		<div class="marriot">
			<h2>Marriot</h2>
			<p>Planning a getaway?</p>
			<p>Explore our latest properties around the globe, from
				sun-warming escapes to stylish city skylines.</p>
			<p>Enjoy an intimate experience!</p>
			<button class="buttonMarriot">Explore Marriot</button>
		</div>
		<div class="hilton">
			<h2>Hilton</h2>
			<p>Luxury Living, Elevated</p>
			<p>An American flagship hotel and resort brand, offering
				luxurious hotel spaces and resorts at affordable costs.</p>
			<p>Come book a memory today!</p>
			<button class="buttonHilton">Explore Hilton</button>
		</div>
		<div class="airBnb">
			<h2>AirBnB</h2>
			<p>Forget Old, Hello New!</p>
			<p>A new way of finding cozy, comfortable and gorgeous living
				space anywhere. Ditch the old, join the new AirBnB!</p>
			<p>Get a place while you can!</p>
			<button class="buttonAirbnb">Explore AirBnB</button>
		</div>
		<div class="tomerTravelLodges">
			<h2>Tomer's Lodges</h2>
			<p>Peak Relaxation</p>
			<p>Home style lodges, inspired by the founder's Argentinian
				heritage. Get a relaxing sense of warmth and home.</p>
			<p>Book a place now!</p>
			<button class="buttonTomerLodge">Explore Tomer Lodges</button>
		</div>
		<div class="wangResorts">
			<h2>Wang's Resorts</h2>
			<p>Ain't Nothing Like This!</p>
			<p>Inspired by the beauty of the Chinese landscapes, Wang's
				resorts will say "Wassup Beijing", every night!</p>
			<p>Come and get em!</p>
			<button class="buttonWangResort">Explore Wang Resorts</button>
		</div>
	</div>

</body>
</html>