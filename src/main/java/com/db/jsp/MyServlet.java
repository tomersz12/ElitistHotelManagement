package com.db.jsp;

import java.io.IOException;
import java.sql.SQLException;

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
				request.getRequestDispatcher("/customerintro.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/loginScreen.jsp").forward(request, response);
			}
		
		//filter request
		}else {
			String chosenCity = request.getParameter("city");
			String chosenStartDate = request.getParameter("startdate");
			String chosenEndDate = request.getParameter("enddate");
			String chosenGuestAmount = request.getParameter("guestamount");
			
			request.setAttribute("chosenCity", chosenCity);
			request.setAttribute("chosenStartDate", chosenStartDate);
			request.setAttribute("chosenEndDate", chosenEndDate);
			request.setAttribute("chosenGuestAmount", chosenGuestAmount);
			
			request.getRequestDispatcher("/genericbookingscreen.jsp").forward(request, response);
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
	}
}
