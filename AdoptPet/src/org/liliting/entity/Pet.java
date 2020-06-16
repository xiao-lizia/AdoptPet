package org.liliting.entity;

import java.sql.Timestamp;

public class Pet {
	private int pId;
	private int uId;
	private int pType;
	private int pSex;
	private String pPic;
	private float pAge;
	private String pKid;
	private String pName;
	private String pDesc;
	private int pVaccine;
	private int pStatus;
	private Timestamp applyTime;
	private Timestamp checkTime;
	public Pet() {
		
	}
	

	public Pet(int pId, int uId, int pType, int pSex, String pPic, float pAge, String pKid, String pName, String pDesc,
			int pVaccine, int pStatus, Timestamp applyTime, Timestamp checkTime) {
		this.pId = pId;
		this.uId = uId;
		this.pType = pType;
		this.pSex = pSex;
		this.pPic = pPic;
		this.pAge = pAge;
		this.pKid = pKid;
		this.pName = pName;
		this.pDesc = pDesc;
		this.pVaccine = pVaccine;
		this.pStatus = pStatus;
		this.applyTime = applyTime;
		this.checkTime = checkTime;
	}


	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public int getpType() {
		return pType;
	}
	public void setpType(int pType) {
		this.pType = pType;
	}
	public int getpSex() {
		return pSex;
	}
	public void setpSex(int pSex) {
		this.pSex = pSex;
	}
	public String getpPic() {
		return pPic;
	}
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}
	public float getpAge() {
		return pAge;
	}
	public void setpAge(float pAge) {
		this.pAge = pAge;
	}
	public String getpKid() {
		return pKid;
	}
	public void setpKid(String pKid) {
		this.pKid = pKid;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpDesc() {
		return pDesc;
	}
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	public int getpVaccine() {
		return pVaccine;
	}
	public void setpVaccine(int pVaccine) {
		this.pVaccine = pVaccine;
	}
	public int getpStatus() {
		return pStatus;
	}
	public void setpStatus(int pStatus) {
		this.pStatus = pStatus;
	}


	public Timestamp getApplyTime() {
		return applyTime;
	}


	public void setApplyTime(Timestamp applyTime) {
		this.applyTime = applyTime;
	}


	public Timestamp getCheckTime() {
		return checkTime;
	}


	public void setCheckTime(Timestamp checkTime) {
		this.checkTime = checkTime;
	}
	
	
	
}
