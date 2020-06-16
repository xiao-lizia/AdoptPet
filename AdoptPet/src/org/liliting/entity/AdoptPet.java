package org.liliting.entity;

import java.sql.Timestamp;

public class AdoptPet {
	private int aId;
	private int pId;
	private int uId;
	private int aType;
	private Timestamp applyTime; 
	private Timestamp checkTime; 
	public AdoptPet() {
	}
	public AdoptPet(int aId, int pId, int uId, int aType, Timestamp applyTime, Timestamp checkTime) {
		this.aId = aId;
		this.pId = pId;
		this.uId = uId;
		this.aType = aType;
		this.applyTime = applyTime;
		this.checkTime = checkTime;
	}

	public int getaId() {
		return aId;
	}
	public void setaId(int aId) {
		this.aId = aId;
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
	public int getaType() {
		return aType;
	}
	public void setaType(int aType) {
		this.aType = aType;
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
