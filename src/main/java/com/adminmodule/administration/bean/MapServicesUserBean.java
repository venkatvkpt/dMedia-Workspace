package com.adminmodule.administration.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="MAP_SERVICES_USER")
public class MapServicesUserBean {
	
	private int uniquerow;	
	private int service_id;	
	private int user_serial_no;
	
	@Id
	@GeneratedValue
	@Column(name="UNIQUEROW")
	public int getUniquerow() {
		return uniquerow;
	}
	public void setUniquerow(int uniquerow) {
		this.uniquerow = uniquerow;
	}
	
	@Column(name="SERVICE_ID")
	public int getService_id() {
		return service_id;
	}
	public void setService_id(int serviceId) {
		service_id = serviceId;
	}
	
	@Column(name="USER_SERIAL_NO")
	public int getUser_serial_no() {
		return user_serial_no;
	}
	public void setUser_serial_no(int userSerialNo) {
		user_serial_no = userSerialNo;
	}
	
	
	
	

}
