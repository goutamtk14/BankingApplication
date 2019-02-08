package com.fhb.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import com.fhb.entity.Passbook;

import com.fhb.entity.Account;

public class DaoFactory {
	public static Account getAccount(String uname) throws ClassNotFoundException, SQLException {

		Class.forName("org.h2.Driver");
		String url = "jdbc:h2:tcp://localhost/~/fhb";
		String username = "gautam";
		String password = "1234gaut";
		String query = "select * from accounts where username='" + uname + "'";
		Connection conn = DriverManager.getConnection(url, username, password);
		Statement st = conn.createStatement();

		ResultSet rs = st.executeQuery(query);
		rs.next();
		Account a = new Account();
		a.setAccountno(rs.getInt(1));
		a.setName(rs.getString(2));
		a.setUsername(rs.getString(3));
		a.setPassword(rs.getString(4));
		a.setBalance(rs.getDouble(5));
		a.setCount(rs.getInt(6));
		st.close();
		conn.close();
		return a;

	}

	public static int countAccounts() throws ClassNotFoundException, SQLException {

		Class.forName("org.h2.Driver");
		String url = "jdbc:h2:tcp://localhost/~/fhb";
		String username = "gautam";
		String password = "1234gaut";
		String query = "select * from accounts";
		Connection conn = DriverManager.getConnection(url, username, password);
		Statement st = conn.createStatement();
		int count = 0;
		ResultSet rs = st.executeQuery(query);
		while (rs.next()) {
			count++;
		}
		st.close();
		conn.close();
		return count;

	}

	public static void invalidCount(String uname) throws ClassNotFoundException, SQLException {

		Class.forName("org.h2.Driver");
		String url = "jdbc:h2:tcp://localhost/~/fhb";
		String username = "gautam";
		String password = "1234gaut";
		String query = "update accounts set count=? where username='" + uname + "'";
		String query1 = "select count from accounts where username='" + uname + "'";

		Connection conn = DriverManager.getConnection(url, username, password);
		PreparedStatement st = conn.prepareStatement(query);
		Statement st1 = conn.createStatement();
		ResultSet rs = st1.executeQuery(query1);
		rs.next();
		int count = rs.getInt(1);
		st.setInt(1, count + 1);
		st.executeUpdate();

		st1.close();
		st.close();
		conn.close();

	}

	public static int getCount(String uname) throws ClassNotFoundException, SQLException {

		Class.forName("org.h2.Driver");
		String url = "jdbc:h2:tcp://localhost/~/fhb";
		String username = "gautam";
		String password = "1234gaut";
		String query1 = "select count from accounts where username='" + uname + "'";

		Connection conn = DriverManager.getConnection(url, username, password);
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query1);
		rs.next();
		int count = rs.getInt(1);

		st.close();
		conn.close();
		return count;

	}

	public static void setCount(String uname) throws ClassNotFoundException, SQLException {

		Class.forName("org.h2.Driver");
		String url = "jdbc:h2:tcp://localhost/~/fhb";
		String username = "gautam";
		String password = "1234gaut";
		String query = "update accounts set count=0 where username='" + uname + "'";

		Connection conn = DriverManager.getConnection(url, username, password);
		PreparedStatement st = conn.prepareStatement(query);
		st.executeUpdate();

		st.close();
		conn.close();

	}

	public static double getBalance(int acc) throws ClassNotFoundException, SQLException {
		Class.forName("org.h2.Driver");
		String url = "jdbc:h2:tcp://localhost/~/fhb";
		String username = "gautam";
		String password = "1234gaut";
		String query = "select balance from accounts where accountno=" + acc;
		Connection conn = DriverManager.getConnection(url, username, password);
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		rs.next();
		double balance = rs.getDouble(1);
		st.close();
		conn.close();
		return balance;

	}

	public static String getUsername(int acc) throws ClassNotFoundException, SQLException {
		Class.forName("org.h2.Driver");
		String url = "jdbc:h2:tcp://localhost/~/fhb";
		String username = "gautam";
		String password = "1234gaut";
		Connection conn = DriverManager.getConnection(url, username, password);
		String query = "select username from accounts where accountno=" + acc;
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		rs.next();
		String u = rs.getString(1);
		st.close();
		conn.close();
		return u;

	}

	public static void transferBalance(int acc1, int acc2, double amount) throws SQLException, ClassNotFoundException {
		Class.forName("org.h2.Driver");
		String url = "jdbc:h2:tcp://localhost/~/fhb";
		String username = "gautam";
		String password = "1234gaut";
		Connection conn = DriverManager.getConnection(url, username, password);
		String query1 = "update accounts set balance=? where accountno=" + acc1;
		PreparedStatement st = conn.prepareStatement(query1);
		double bal = getBalance(acc1) - amount;
		st.setDouble(1, bal);
		st.executeUpdate();
		String query2 = "update accounts set balance=? where accountno=" + acc2;
		PreparedStatement st1 = conn.prepareStatement(query2);
		bal = getBalance(acc2) + amount;
		st1.setDouble(1, bal);
		st1.executeUpdate();

		st.close();
		st1.close();
		conn.close();

	}

	public static String checkReceiversAccount(int acc) throws ClassNotFoundException, SQLException {
		Class.forName("org.h2.Driver");
		String url = "jdbc:h2:tcp://localhost/~/fhb";
		String username = "gautam";
		String password = "1234gaut";
		Connection conn = DriverManager.getConnection(url, username, password);
		String query = "select name from accounts where accountno=" + acc;
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		rs.next();
		String a = rs.getString(1);
		st.close();
		conn.close();
		return a;
	}

	public static void createTable(String newusername) throws SQLException, ClassNotFoundException {
		Class.forName("org.h2.Driver");
		String url = "jdbc:h2:tcp://localhost/~/fhb";
		String username = "gautam";
		String password = "1234gaut";
		Connection conn = DriverManager.getConnection(url, username, password);
		String query = "create table " + newusername
				+ "(dateandtime varchar, particulars varchar, withdrawal double, deposit double, balance double not null)";
		PreparedStatement st = conn.prepareStatement(query);
		st.executeUpdate();
		st.close();
		conn.close();
	}

	public static void registerAccount(String name, String newusername, String newpassword)
			throws ClassNotFoundException, SQLException {
		Class.forName("org.h2.Driver");
		String url = "jdbc:h2:tcp://localhost/~/fhb";
		String username = "gautam";
		String password = "1234gaut";
		Connection conn = DriverManager.getConnection(url, username, password);
		String query = "insert into accounts(accountno, name, username, password) values(?,?,?,?)";
		PreparedStatement st = conn.prepareStatement(query);
		st.setInt(1, countAccounts() + 1);
		st.setString(2, name);
		st.setString(3, newusername);
		st.setString(4, newpassword);
		st.executeUpdate();
		st.close();
		conn.close();
	}

	public static void passbookEntry(int acc1, int acc2, double amount, String particular)
			throws SQLException, ClassNotFoundException {
		Class.forName("org.h2.Driver");
		String url = "jdbc:h2:tcp://localhost/~/fhb";
		String username = "gautam";
		String password = "1234gaut";
		Connection conn = DriverManager.getConnection(url, username, password);
		String query1 = "insert into " + getUsername(acc1)
				+ "(dateandtime,particulars,withdrawal,balance) values(?,?,?,?)";
		String query2 = "insert into " + getUsername(acc2)
				+ "(dateandtime,particulars,deposit,balance) values(?,?,?,?)";
		PreparedStatement st1 = conn.prepareStatement(query1);
		PreparedStatement st2 = conn.prepareStatement(query2);
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		Date today = Calendar.getInstance().getTime();
		String date = df.format(today);

		st1.setString(1, date);
		st1.setString(2, particular + " sent to " + checkReceiversAccount(acc2));
		st1.setDouble(3, amount);

		st1.setDouble(4, getBalance(acc1));
		st2.setString(1, date);
		st2.setString(2, particular + " sent by " + checkReceiversAccount(acc1));
		st2.setDouble(3, amount);
		st2.setDouble(4, getBalance(acc2));
		st1.executeUpdate();
		st2.executeUpdate();

		st1.close();
		st2.close();
		conn.close();

	}

	public static ArrayList<Passbook> getPassbookEntries(int acc) throws ClassNotFoundException, SQLException {
		ArrayList<Passbook> entries = new ArrayList<>();
		Class.forName("org.h2.Driver");
		String url = "jdbc:h2:tcp://localhost/~/fhb";
		String username = "gautam";
		String password = "1234gaut";
		Connection conn = DriverManager.getConnection(url, username, password);
		String query = "select * from " + getUsername(acc);
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(query);
		while (rs.next()) {
			Passbook p = new Passbook();
			p.setDateandtime(rs.getString(1));
			p.setParticulars(rs.getString(2));
			p.setWithdrawal(rs.getDouble(3));
			p.setDeposit(rs.getDouble(4));
			p.setBalance(rs.getDouble(5));
			entries.add(p);
		}
		st.close();
		conn.close();
		return entries;
	}

}
