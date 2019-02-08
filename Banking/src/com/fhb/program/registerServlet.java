package com.fhb.program;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fhb.util.DaoFactory;

@WebServlet("/register")
public class registerServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) {

		try {
			String name = request.getParameter("name");
			String emailid = request.getParameter("emailid");
			String mobile = request.getParameter("mobile");
			String newusername = request.getParameter("newusername");
			String newpassword = request.getParameter("newpassword");
			System.out.println(name + " " + emailid + " " + mobile + " " + newusername + " " + newpassword);
			if (name.equals("")) {

				request.setAttribute("registerError", "NoName");
				System.out.println(request.getAttribute("registerError"));
				RequestDispatcher rd = request.getRequestDispatcher("register1.jsp");
				rd.forward(request, response);
			} else if (emailid.equals("")) {
				request.setAttribute("registerError", "NoEmail");
				System.out.println(request.getAttribute("registerError"));

				RequestDispatcher rd = request.getRequestDispatcher("register1.jsp");
				rd.forward(request, response);
			} else if (mobile.equals("")) {

				request.setAttribute("registerError", "NoMobile");
				System.out.println(request.getAttribute("registerError"));

				RequestDispatcher rd = request.getRequestDispatcher("register1.jsp");
				rd.forward(request, response);
			} else if (newusername.equals("")) {

				request.setAttribute("registerError", "NoUserName");
				System.out.println(request.getAttribute("registerError"));

				RequestDispatcher rd = request.getRequestDispatcher("register1.jsp");
				rd.forward(request, response);
			} else if (newpassword.equals("")) {

				request.setAttribute("registerError", "NoPassword");
				System.out.println(request.getAttribute("registerError"));

				RequestDispatcher rd = request.getRequestDispatcher("register1.jsp");
				rd.forward(request, response);
			} 
			else if(!(emailid.contains("@") && emailid.contains(".com"))) {
				request.setAttribute("registerError", "errorEmail");

				RequestDispatcher rd = request.getRequestDispatcher("register1.jsp");
				rd.forward(request, response);
			}
			else if(mobile.length()!=10) {
				request.setAttribute("registerError", "errorMobile");

				RequestDispatcher rd = request.getRequestDispatcher("register1.jsp");
				rd.forward(request, response);
			}
			else if(!(newpassword.length()!=8 && !newpassword.equals(newpassword.toLowerCase()) && !newpassword.equals(newpassword.toUpperCase())&& !newpassword.matches("[A-Za-z0-9 ]*"))) {
				request.setAttribute("registerError", "errornewPassword");

				RequestDispatcher rd = request.getRequestDispatcher("register1.jsp");
				rd.forward(request, response);
			}
			DaoFactory.registerAccount(name, newusername, newpassword);
			DaoFactory.createTable(newusername);
			request.setAttribute("t", "Success");
			RequestDispatcher rd = request.getRequestDispatcher("start1.jsp");
			rd.forward(request, response);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			request.setAttribute("registerError", "usernameexists");
			RequestDispatcher rd = request.getRequestDispatcher("register1.jsp");

			try {
				rd.forward(request, response);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
