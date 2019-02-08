package com.fhb.program;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class logoutServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();
			session.removeAttribute("u");
			session.invalidate();

			response.sendRedirect("start.html");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
