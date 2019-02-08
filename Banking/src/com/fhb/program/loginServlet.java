package com.fhb.program;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fhb.entity.Account;
import com.fhb.util.DaoFactory;

import com.fhb.util.DaoFactory;

@WebServlet("/login")
public class loginServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) {

		try {

			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if(username.equals("")) {
				request.setAttribute("t", "NoUserName");
				RequestDispatcher rd = request.getRequestDispatcher("start1.jsp");
				rd.forward(request, response);
			}
			Account a = DaoFactory.getAccount(username);
			String u = a.getUsername();
			String p = a.getPassword();
			if (!password.equals(p)) {
				request.setAttribute("t", "Invalid Password");
				DaoFactory.invalidCount(username);
				int remainingattempts = 5 - DaoFactory.getCount(username);
				request.setAttribute("remainingattempts", remainingattempts);

				if (DaoFactory.getCount(username) > 4) {
					RequestDispatcher rd = request.getRequestDispatcher("lock.jsp");
					rd.forward(request, response);
				}
				RequestDispatcher rd = request.getRequestDispatcher("start1.jsp");
				rd.forward(request, response);

			}

			if (username.equals(u) && password.equals(p)) {
				if (DaoFactory.getCount(username) > 4) {
					RequestDispatcher rd = request.getRequestDispatcher("lock.jsp");
					rd.forward(request, response);
				}
				DaoFactory.setCount(username);
				HttpSession session = request.getSession();
				session.setAttribute("u", username);
				session.setAttribute("account", a);
				response.sendRedirect("welcome.jsp");
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			try {
				request.setAttribute("t", "Invalid Username");
				RequestDispatcher rd = request.getRequestDispatcher("start1.jsp");
				rd.forward(request, response);
			} catch (IOException e1) {
			} catch (ServletException e1) {
				e1.printStackTrace();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}

	}

}
