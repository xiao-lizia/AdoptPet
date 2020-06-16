package org.liliting.entity;

public class AjaxResult {
	private boolean success;
	private String message;
	private int identify;

	public AjaxResult() {
	}
	
	public AjaxResult(boolean success, String message, int identify) {
		this.success = success;
		this.message = message;
		this.identify = identify;
	}
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getIdentify() {
		return identify;
	}
	public void setIdentify(int identify) {
		this.identify = identify;
	}
}
