package com.fhb.entity;

public class Passbook implements Comparable<Passbook> {
	private String dateandtime;
	private String particulars;
	private double withdrawal;
	private double deposit;
	private double balance;

	public String getDateandtime() {
		return dateandtime;
	}

	public void setDateandtime(String dateandtime) {
		this.dateandtime = dateandtime;
	}

	public String getParticulars() {
		return particulars;
	}

	public void setParticulars(String particulars) {
		this.particulars = particulars;
	}

	public double getWithdrawal() {
		return withdrawal;
	}

	public void setWithdrawal(double withdrawal) {
		this.withdrawal = withdrawal;
	}

	public double getDeposit() {
		return deposit;
	}

	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return dateandtime + " " + particulars + " " + withdrawal + " " + deposit + " " + balance;
	}

	@Override
	public int compareTo(Passbook o) {
		return dateandtime.compareTo(o.dateandtime);
	}

}
