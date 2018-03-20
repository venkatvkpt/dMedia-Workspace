package com.adminmodule.authentication.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="USER_LOGIN_INFOLOG")
public class UserLoginInfoEntity {
	
	private int infolog_id;
	private String user_serial_no;
	private String user_name;
	private String user_details;
	private Date login_time=new Date();
	private Date logout_time=new Date();
	
	@Id
	@Column(name="INFOLOG_ID")
	@GeneratedValue
	public int getInfolog_id() {
		return infolog_id;
	}
	public void setInfolog_id(int infologId) {
		infolog_id = infologId;
	}
	
	@Column(name="USER_SERIAL_NO")
	public String getUser_serial_no() {
		return user_serial_no;
	}
	public void setUser_serial_no(String userSerialNo) {
		user_serial_no = userSerialNo;
	}
	@Column(name="USER_NAME")
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String userName) {
		user_name = userName;
	}
	@Column(name="USER_IP_ADDRESS")
	public String getUser_details() {
		return user_details;
	}
	public void setUser_details(String userDetails) {
		user_details = userDetails;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="LOGIN_TIME", insertable=true ,columnDefinition = "DATE")
	public Date getLogin_time() {
		return login_time;
	}
	public void setLogin_time(Date login_time) {
		this.login_time = login_time;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="LOGOUT_TIME", insertable=true ,columnDefinition = "DATE")	
	public Date getLogout_time() {
		return logout_time;
	}
	
	public void setLogout_time(Date logoutTime) {
		logout_time = logoutTime;
	}
	
	

}
