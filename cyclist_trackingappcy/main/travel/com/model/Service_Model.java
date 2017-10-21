/**
 * 
 */
package com.model;

/**
 * @author lisa
 *
 */
public class Service_Model {
	private String charged_fee;
	private String serviced_by;
	private String dates;
	private String serial_number;
	private String model;
	public String getCharged_fee() {
		return charged_fee;
	}
	public void setCharged_fee(String charged_fee) {
		this.charged_fee = charged_fee;
	}
	public String getServiced_by() {
		return serviced_by;
	}
	public void setServiced_by(String serviced_by) {
		this.serviced_by = serviced_by;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public String getSerial_number() {
		return serial_number;
	}
	public void setSerial_number(String serial_number) {
		this.serial_number = serial_number;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}	
}
