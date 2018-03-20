package com.adminmodule.user.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="PASSWORD_CHANGE_LOG")
public class PasswordChangeLogEntity {
	private int userserial;
	private String oldpassword;
	private String newpassword;
	private Date changedate =new Date();
	
	@Id
	@Column(name="USER_SERIAL_NO")
	public int getUserserial() {
		return userserial;
	}
	public void setUserserial(int userserial) {
		this.userserial = userserial;
	}
	@Column(name="OLD_PASSWORD")
	public String getOldpassword() {
		return oldpassword;
	}
	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}
	@Column(name="NEW_PASSWORD")
	public String getNewpassword() {
		return newpassword;
	}
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CHANGE_DATE", insertable=true ,columnDefinition = "DATE")
	public Date getChangedate() {
		return changedate;
	}
	public void setChangedate(Date changedate) {
		this.changedate = changedate;
	}
	
	

}
