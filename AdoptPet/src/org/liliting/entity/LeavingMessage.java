package org.liliting.entity;

import java.sql.Timestamp;

public class LeavingMessage {
	
	private int lmId;
	private int uId;
	private String lmContent;
	private Timestamp lmTime;
	public LeavingMessage() {
		
	}

	public LeavingMessage(int lmId, int uId, String lmContent, Timestamp lmTime) {
		super();
		this.lmId = lmId;
		this.uId = uId;
		this.lmContent = lmContent;
		this.lmTime = lmTime;
	}

	public int getLmId() {
		return lmId;
	}
	public void setLmId(int lmId) {
		this.lmId = lmId;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getLmContent() {
		return lmContent;
	}
	public void setLmContent(String lmContent) {
		this.lmContent = lmContent;
	}

	public Timestamp getpTime() {
		return lmTime;
	}

	public void setpTime(Timestamp lmTime) {
		this.lmTime = lmTime;
	}

	
}
