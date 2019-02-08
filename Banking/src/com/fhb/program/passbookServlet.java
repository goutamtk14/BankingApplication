package com.fhb.program;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fhb.entity.Account;
import com.fhb.entity.Passbook;
import com.fhb.util.DaoFactory;

@WebServlet("/passbook")
public class passbookServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();
			Account a = (Account) session.getAttribute("account");
			ArrayList<Passbook> entries = DaoFactory.getPassbookEntries(a.getAccountno());
			Collections.sort(entries,Collections.reverseOrder());
			request.setAttribute("entries", entries);
			RequestDispatcher rd = request.getRequestDispatcher("passbook.jsp");
			rd.forward(request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
