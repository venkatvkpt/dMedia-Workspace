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
@Table(name="NOTIFICATIONS_LOG")
public class NotificationsLogEntity {
	
	private int unique;
	private String user_serial_no;
	private String title;
	private String message;
	private String img_url;
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
	@Column(name="NOTIFICATION_TITLE")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name="NOTIFICATION_DESCRIPTION")
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="LOG_DATE", insertable=true ,columnDefinition = "DATE")
	public Date getLog_date() {
		return log_date;
	}
	public void setLog_date(Date log_date) {
		this.log_date = log_date;
	}
	
	@Column(name="IMAGE_URL")
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	
}


@Entity
@Table(name="NOTIFICATIONS_COUNT")
class NotificationsCountEntity {
	
	private int unique;
	private String user_serial_no;
	private int count;
	
	
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
	
	@Column(name="NOTIFICATION_COUNT")
	public int getCount() {
		return count;
	}	
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}

