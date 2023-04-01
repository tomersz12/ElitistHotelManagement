<!DOCTYPE html>
<%@ page import = "com.db.jsp.* , java.sql.*" %>
<html>
    <head>
        <link href="styles.css" rel="stylesheet">
        <title>Welcome!</title>
    </head>
    <body>

    <div class = "navbar">
        <a class="active" href="#home">Home</a>
        <a href="#news">News</a>
        <a href="#contact">Contact</a>
        <a href="#about">About</a>
    </div>
    <div class = "stockImage">
        <img src = "images/vacation.jpeg" alt = "Vacation!" class = "vacation">
        <div class = "description">
            <h3>The Industrial Revolution shifted from an agrarian economy to a manufacturing economy 
                where products were no longer made solely by hand but by machines. This led to increased 
                production and efficiency, lower prices, more goods, improved wages, and migration from rural
                areas to urban areas.</h3>
                <h3><%=ContactProgram.add()%></h3>
        </div>
    </div>
    <div class = "hotelChains">
        <div class = "marriot">
            <h2>Marriot</h2>
            <p>Planning a getaway?</p>
            <p>Explore our latest properties around the globe, from sun-warming escapes to stylish city skylines.</p>
            <p>Enjoy an intimate experience!</p>
            <a href = "genericbookingscreen.jsp"><button class = "buttonMarriot">Explore Marriot</button></a>
        </div>
        <div class = "hilton">
			<h2>Hilton</h2>
            <p>Luxury Living, Elevated</p>
            <p>An American flagship hotel and resort brand, offering luxurious hotel spaces and resorts at affordable costs.</p>
            <p>Come book a memory today!</p>
            <button class = "buttonHilton">Explore Hilton</button>
        </div>
        <div class = "airBnb">
			<h2>AirBnB</h2>
            <p>Forget Old, Hello New!</p>
            <p>A new way of finding cozy, comfortable and gorgeous living space anywhere. Ditch the old, join the new AirBnB!</p>
            <p>Get a place while you can!</p>
            <button class = "buttonAirbnb">Explore AirBnB</button>
        </div>
        <div class = "tomerTravelLodges">
        	<h2>Tomer's Lodges</h2>
            <p>Peak Relaxation</p>
            <p>Home style lodges, inspired by the founder's Argentinian heritage. Get a relaxing sense of warmth and home.</p>
            <p>Book a place now!</p>
            <button class = "buttonTomerLodge">Explore Tomer Lodges</button>
        </div>
        <div class = "wangResorts">
        	<h2>Wang's Resorts</h2>
            <p>Ain't Nothing Like This!</p>
            <p>Inspired by the beauty of the Chinese landscapes, Wang's resorts will say "Wassup Beijing", every night!</p>
            <p>Come and get em!</p>
            <button class = "buttonWangResort">Explore Wang Resorts</button>
        </div>
    </div>

    </body>
</html>