package com.adminmodule.user.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="EVENT_CALENDAR")
public class CalendarBean {
	
	private int eventid;
	private String eventName;
	private Date eventStartDate;
	private Date eventEndDate;
	private String optionsCategory;
	private int userserial;
	
	@Id
	@GeneratedValue
	@Column(name="EVENT_ID")
	public int getEventid() {
		return eventid;
	}
	public void setEventid(int eventid) {
		this.eventid = eventid;
	}
	@Column(name="EVENT_NAME")
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	@Column(name="EVENT_STARTDATE")
	public Date getEventStartDate() {
		return eventStartDate;
	}
	public void setEventStartDate(Date eventStartDate) {
		this.eventStartDate = eventStartDate;
	}
	@Column(name="EVENT_ENDDATE")
	public Date getEventEndDate() {
		return eventEndDate;
	}
	public void setEventEndDate(Date eventEndDate) {
		this.eventEndDate = eventEndDate;
	}
	@Column(name="OPTIONSCATEGORY")
	public String getOptionsCategory() {
		return optionsCategory;
	}
	public void setOptionsCategory(String optionsCategory) {
		this.optionsCategory = optionsCategory;
	}
	@Column(name="USER_SERIAL_NO")
	public int getUserserial() {
		return userserial;
	}
	public void setUserserial(int userserial) {
		this.userserial = userserial;
	}
	
	

}
