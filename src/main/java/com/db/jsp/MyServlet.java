package com.db.jsp;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String button = request.getParameter("Button");
		
		//User login
		if ("userSubmit".equals(button)) {
			boolean check = false;
			String userSIN = request.getParameter("userSIN");
			try {
				check = ContactProgram.verifyCustomer(userSIN);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if (check) {
				request.setAttribute("userSin", userSIN);
				request.getRequestDispatcher("/customerintro.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/loginScreen.jsp").forward(request, response);
			}
		
		//check login
		}else if ("employeeSubmit".equals(button)) {
			boolean check = false;
			String employeeSIN = request.getParameter("employeeSIN");
			try {
				check = ContactProgram.verifyEmployee(employeeSIN);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if (check) {
				request.setAttribute("employeeSin", employeeSIN);
				request.getRequestDispatcher("/employeeintro.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/loginScreen.jsp").forward(request, response);
			}
		
		//check login
		}else if ("Profile".equals(button)){
			String usersin = request.getParameter("USERSIN");
			request.setAttribute("userSin", usersin);
			request.getRequestDispatcher("/userprofile.jsp").forward(request, response);
		
		//change user info request
		}else if ("Change Info".equals(button)) {
			String userSinChange = request.getParameter("sinNumber");
			String userFullName = request.getParameter("name");
			String userAddress = request.getParameter("address");
			
			request.setAttribute("userSin", userSinChange);
			
			try {
				ContactProgram.updateUserProfile(Integer.parseInt(userSinChange), userFullName, userAddress);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("/customerintro.jsp").forward(request, response);

			
		//booking
		}else if ("Create Rental".equals(button)) {
			String customerSIN = request.getParameter("sinNumber");
			String roomID = request.getParameter("roomID");
			String endDate = request.getParameter("endDate");
			String employeeSIN = request.getParameter("employeeSIN");

			try {
				ContactProgram.createRental(Integer.parseInt(customerSIN), Integer.parseInt(roomID), endDate, Integer.parseInt(employeeSIN));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("employeeSin", employeeSIN);
			request.getRequestDispatcher("/employeeintro.jsp").forward(request, response);
			
		}else if ("Create Employee".equals(button)) {
			String employeeName = request.getParameter("fullName");
			String employeeAddress = request.getParameter("address");
			String branchID = request.getParameter("branchID");
			String employeeSIN = request.getParameter("employeeSIN");

			try {
				ContactProgram.createEmployee(employeeName, employeeAddress, Integer.parseInt(branchID));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("employeeSin", employeeSIN);
			request.getRequestDispatcher("/employeeintro.jsp").forward(request, response);
			
		}else if ("Create Room".equals(button)) {
			String roomID = request.getParameter("roomID");
			String branchID = request.getParameter("branchID");
			String price = request.getParameter("price");
			String roomCapacity = request.getParameter("roomCapacity");
			String typeOfView = request.getParameter("typeOfView");
			String amentities = request.getParameter("amentities");
			
			boolean extendability = false;
			if (request.getParameter("extendability") != null) {
				extendability = true;
			}

			String employeeSIN = request.getParameter("employeeSIN");

			try {
				ContactProgram.createRoom(Integer.parseInt(roomID), Integer.parseInt(branchID), price, Integer.parseInt(roomCapacity), typeOfView, extendability, amentities);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("employeeSin", employeeSIN);
			request.getRequestDispatcher("/employeeintro.jsp").forward(request, response);
			
		}else if ("Book Now!".equals(button)) {
			String chosenRoomID = request.getParameter("roomData");
			String chosenSIN = request.getParameter("userSinFinal");
			String bookingStartDate = request.getParameter("bookingStart");
			String bookingEndDate = request.getParameter("bookingEnd");
			
			
			System.out.println(chosenRoomID);
			System.out.println(chosenSIN);
			System.out.println(bookingStartDate);
			System.out.println(bookingEndDate);
			
			try {
				ContactProgram.createBooking(Integer.parseInt(chosenRoomID), Integer.parseInt(chosenSIN), bookingStartDate, bookingEndDate);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("userSin", chosenSIN);
			request.getRequestDispatcher("/customerintro.jsp").forward(request, response);
		
			//cancel booking on employee side
		}else if ("Begin Rental".equals(button)) {
			String bookingID = request.getParameter("bookingID");
			String employeeSIN = request.getParameter("employeeSIN");
			String checkedIn = request.getParameter("checkedIn");
			
			try {
				ContactProgram.startRental(Integer.parseInt(bookingID), Integer.parseInt(employeeSIN), checkedIn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("employeeSin", employeeSIN);
			request.getRequestDispatcher("/employeeintro.jsp").forward(request, response);
		
			//cancel booking on employee side
		}else if ("Fire Employee".equals(button)) {
			String firedEmployeeSIN = request.getParameter("firedEmployeeSIN");
			String employeeSIN = request.getParameter("employeeSIN");
			
			try {
				ContactProgram.removeEmployee(Integer.parseInt(firedEmployeeSIN));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("employeeSin", employeeSIN);
			request.getRequestDispatcher("/employeeintro.jsp").forward(request, response);
		
			//cancel booking on employee side
		}else if ("Cancel Booking".equals(button)) {
			String bookingID = request.getParameter("bookingID");
			String employeeSIN = request.getParameter("employeeSIN");
			
			try {
				ContactProgram.deleteBooking(Integer.parseInt(bookingID));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("employeeSin", employeeSIN);
			request.getRequestDispatcher("/employeeintro.jsp").forward(request, response);
			
			
		}else if ("Confirm Payment".equals(button)) {
			String rentalID = request.getParameter("rentalID");
			String employeeSIN = request.getParameter("employeeSIN");
			
			try {
				ContactProgram.confirmPayment(Integer.parseInt(rentalID));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("employeeSin", employeeSIN);
			request.getRequestDispatcher("/employeeintro.jsp").forward(request, response);
			
			
		}else if ("Cancel My Booking".equals(button)) {
			String userBookingid = request.getParameter("bookingIDData");
			String userSinFromBooking = request.getParameter("userSINBooking");
			
			try {
				ContactProgram.deleteBooking(Integer.parseInt(userBookingid));
			} catch (NumberFormatException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("userSin", userSinFromBooking);
			request.getRequestDispatcher("/customerintro.jsp").forward(request, response);
			
		//filter stuff
		}else if ("Find Now!".equals(button)){
			String chosenCity = request.getParameter("city");
			String chosenStartDate = request.getParameter("startdate");
			String chosenEndDate = request.getParameter("enddate");
			String chosenGuestAmount = request.getParameter("guestamount");
			String chosenHotel = request.getParameter("hotelname");
			String chosenRatings = request.getParameter("starrating");
			String chosenNumberOfRooms = request.getParameter("roomsfree");
			String chosenPrice = request.getParameter("price");
			String sinForBooking = request.getParameter("USERSINBOOKING");
			
			request.setAttribute("chosenCity", chosenCity);
			request.setAttribute("chosenStartDate", chosenStartDate);
			request.setAttribute("chosenEndDate", chosenEndDate);
			request.setAttribute("chosenGuestAmount", chosenGuestAmount);
			request.setAttribute("chosenHotel", chosenHotel);
			request.setAttribute("chosenRatings", chosenRatings);
			request.setAttribute("chosenNumberOfRooms", chosenNumberOfRooms);
			request.setAttribute("chosenPrice", chosenPrice);
			request.setAttribute("userinfo", sinForBooking);
			
			request.getRequestDispatcher("/genericbookingscreen.jsp").forward(request, response);
			
		}else if("View Hotels".equals(button)) {
			String hotelID = request.getParameter("hotelid");
			
			request.setAttribute("chosenHotelID", hotelID);
			
			request.getRequestDispatcher("/capacityView.jsp").forward(request, response);

		//view for number of avaliable rooms per area
		}else {
			String cityToView = request.getParameter("city");
			request.setAttribute("chosenCity", cityToView);
			
			request.getRequestDispatcher("/hotelInAreaView.jsp").forward(request, response);
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
	}
}
