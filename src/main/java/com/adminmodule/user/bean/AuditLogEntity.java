package com.adminmodule.user.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="AUDIT_ACTIVITY_LOG")
public class AuditLogEntity {
	
	private int unique;
	private String user_serial_no;
	private String message;
	private String host;
	private Date log_date=new Date();
	
	@Id
	@Column(name="LOG_ID")
	@GeneratedValue
	public int getUnique() {
		return unique;
	}
	public void setUnique(int unique) {
		this.unique = unique;
	}
	@Column(name="USER_SERIAL_NO")
	public String getUser_serial_no() {
		return user_serial_no;
	}
	public void setUser_serial_no(String userSerialNo) {
		user_serial_no = userSerialNo;
	}
	@Column(name="ACTIVITY_DESCRIPTION")
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Column(name="HOST")
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="LOG_DATE", insertable=true ,columnDefinition = "DATE")
	public Date getLog_date() {
		return log_date;
	}
	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}
	
	
	

}
