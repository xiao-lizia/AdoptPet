package org.liliting.entity;

import java.sql.Timestamp;

public class User {
	private int uId;
	private String uAccount;
	private String uPwd;
	private int uIdentify;
	private String uName;
	private String uQuestion;
	private String uAnswer;
	private String uPic;
	private String uPhone;
	private String uAddress;
	private int uSex;
	private Timestamp utime;
	public User() {
		
	}
	
	public User(int uId, String uAccount, String uPwd, int uIdentify, String uName, String uQuestion, String uAnswer,
			String uPic, String uPhone, String uAddress, int uSex, Timestamp utime) {
		this.uId = uId;
		this.uAccount = uAccount;
		this.uPwd = uPwd;
		this.uIdentify = uIdentify;
		this.uName = uName;
		this.uQuestion = uQuestion;
		this.uAnswer = uAnswer;
		this.uPic = uPic;
		this.uPhone = uPhone;
		this.uAddress = uAddress;
		this.uSex = uSex;
		this.utime = utime;
	}

	public User(int uId, String uAccount, String uPwd, int uIdentify) {
		this.uId = uId;
		this.uAccount = uAccount;
		this.uPwd = uPwd;
		this.uIdentify = uIdentify;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getuAccount() {
		return uAccount;
	}
	public void setuAccount(String uAccount) {
		this.uAccount = uAccount;
	}
	public String getuPwd() {
		return uPwd;
	}
	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}
	public int getuIdentify() {
		return uIdentify;
	}
	public void setuIdentify(int uIdentify) {
		this.uIdentify = uIdentify;
	}
	
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuQuestion() {
		return uQuestion;
	}
	public void setuQuestion(String uQuestion) {
		this.uQuestion = uQuestion;
	}
	public String getuAnswer() {
		return uAnswer;
	}
	public void setuAnswer(String uAnswer) {
		this.uAnswer = uAnswer;
	}
	public String getuPic() {
		return uPic;
	}
	public void setuPic(String uPic) {
		this.uPic = uPic;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getuAddress() {
		return uAddress;
	}
	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}
	public int getuSex() {
		return uSex;
	}
	public void setuSex(int uSex) {
		this.uSex = uSex;
	}
	public Timestamp getUtime() {
		return utime;
	}
	public void setUtime(Timestamp utime) {
		this.utime = utime;
	}

	@Override
	public String toString() {
		return "User [uId=" + uId + ", uAccount=" + uAccount + ", uPwd=" + uPwd + ", uIdentify=" + uIdentify
				+ ", uName=" + uName + ", uQuestion=" + uQuestion + ", uAnswer=" + uAnswer + ", uPic=" + uPic
				+ ", uPhone=" + uPhone + ", uAddress=" + uAddress + ", uSex=" + uSex + ", utime=" + utime + "]";
	}
	
	
}
