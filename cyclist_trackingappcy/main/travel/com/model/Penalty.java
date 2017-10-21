/**
 * 
 */
package com.model;

/**
 * @author lisa
 *
 */
public class Penalty {
	private String panalty_fee;
	private String lost_by;
	private String model;
	private String serial;
	private String dates;
	public String getPanalty_fee() {
		return panalty_fee;
	}
	public void setPanalty_fee(String panalty_fee) {
		this.panalty_fee = panalty_fee;
	}
	public String getLost_by() {
		return lost_by;
	}
	public void setLost_by(String lost_by) {
		this.lost_by = lost_by;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getSerial() {
		return serial;
	}
	public void setSerial(String serial) {
		this.serial = serial;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
}
