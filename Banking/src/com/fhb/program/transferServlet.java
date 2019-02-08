package com.fhb.program;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fhb.entity.Account;
import com.fhb.util.DaoFactory;

@WebServlet("/transfer")
public class transferServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) {

		try {
			int raccount = Integer.parseInt(request.getParameter("bankaccount"));
			double amount = Double.parseDouble(request.getParameter("amount"));
			String particular=request.getParameter("particular");
			HttpSession session = request.getSession();
			Account a = (Account) session.getAttribute("account");
			DaoFactory.transferBalance(a.getAccountno(), raccount, amount);
			DaoFactory.passbookEntry(a.getAccountno(), raccount, amount, particular);
			request.setAttribute("transfer", "Transaction successful");
			a.setBalance(DaoFactory.getBalance(a.getAccountno()));
			RequestDispatcher rd = request.getRequestDispatcher("balance.jsp");
			rd.forward(request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			try {
				DaoFactory.checkReceiversAccount(Integer.parseInt(request.getParameter("bankaccount")));
			} catch (NumberFormatException e2) {
				e2.printStackTrace();
			} catch (ClassNotFoundException e2) {
				e2.printStackTrace();
			} catch (SQLException e2) {
				request.setAttribute("transfer", "ErrorReceiver");
				RequestDispatcher rd=request.getRequestDispatcher("balance.jsp");
				try {
					rd.forward(request,response);
				} catch (ServletException | IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			request.setAttribute("transfer", "Error");
			RequestDispatcher rd = request.getRequestDispatcher("balance.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException | IOException e1) {
				e1.printStackTrace();
			}
			

		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}

	}

}
