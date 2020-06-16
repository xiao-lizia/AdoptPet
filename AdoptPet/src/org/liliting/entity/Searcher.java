package org.liliting.entity;

import java.sql.Timestamp;

public class Searcher {
	private int sId;
	private int uId;
	private String sTitle;
	private String sDesc;
	private int sType;
	private String sPic;
	private Timestamp sTime;
	public Searcher() {
	}
	public Searcher(int sId, int uId, String sTitle, String sDesc, int sType, String sPic, Timestamp sTime) {
		this.sId = sId;
		this.uId = uId;
		this.sTitle = sTitle;
		this.sDesc = sDesc;
		this.sType = sType;
		this.sPic = sPic;
		this.sTime = sTime;
	}
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsDesc() {
		return sDesc;
	}
	public void setsDesc(String sDesc) {
		this.sDesc = sDesc;
	}
	public int getsType() {
		return sType;
	}
	public void setsType(int sType) {
		this.sType = sType;
	}
	public String getsPic() {
		return sPic;
	}
	public void setsPic(String sPic) {
		this.sPic = sPic;
	}
	public Timestamp getsTime() {
		return sTime;
	}
	public void setsTime(Timestamp sTime) {
		this.sTime = sTime;
	}

}
