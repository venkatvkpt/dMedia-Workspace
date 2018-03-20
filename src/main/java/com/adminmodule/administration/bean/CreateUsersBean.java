package com.adminmodule.administration.bean;


import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SecondaryTable;
import javax.persistence.SecondaryTables;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.adminmodule.dao.AdminModuleDao;
import com.spring.beans.Beans;

@SuppressWarnings("unused")
@Entity
@Table(name="MST_USERS")
@SecondaryTables({
        @SecondaryTable(name="MAP_USER_ROLE"),
        @SecondaryTable(name="MAP_USER_POST")
})

public class CreateUsersBean {

	private int serial_no;
	private String firstname;
	private String username;
	private String password;
	private String userlock="N";
	private Date change_date=new Date();
	
	private Integer role_id;
	private Integer post_id;
	private String changer;
	
	@Id
	@Column(name="USER_SERIAL_NO")
	public int getSerial_no() {
		return serial_no;
	}
	public void setSerial_no(int serialNo) {
		serial_no = serialNo;
	}
	@Column(name="USER_LOGIN_NAME")
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	@Column(name="USER_NAME")
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Column(name="PASSWORD")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(name="USER_LOCK")
	public String getUserlock() {
		return userlock;
	}
	public void setUserlock(String userlock) {
		this.userlock = userlock;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="PASSWORD_CHANGED_DATE", insertable=false ,columnDefinition = "DATE")
	public Date getChange_date() {
		return change_date;
	}
	public void setChange_date(Date changeDate) {
		change_date = changeDate;
	}
	
	@Column(name="ROLE_ID" , table="MAP_USER_ROLE")
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer roleId) {
		role_id = roleId;
	}
	@Column(name="POST_ID" , table="MAP_USER_POST")
	public Integer getPost_id() {
		return post_id;
	}
	public void setPost_id(Integer postId) {
		post_id = postId;
	}
	@Transient	
	public String getChanger() {
		return changer;
	}
	public void setChanger(String changer) {
		this.changer = changer;
	}

	@Transient
	private  Map<String,String> RolesList = new  LinkedHashMap<String,String>();
	@Transient
	public Map<String, String> getRolesList() {
		AdminModuleDao dao =Beans.adminModuleDao;
		String sql="SELECT ROLE_ID,ROLE_NAME FROM MST_ROLES ORDER BY ROLE_ID";
		return dao.getSelectBox(sql);
	}
	public void setRolesList(Map<String, String> rolesList) {
		RolesList = rolesList;
	}
	
	@Transient
	private String reset_password;
	@Transient
	public String getReset_password() {
		return reset_password;
	}
	public void setReset_password(String resetPassword) {
		reset_password = resetPassword;
	}
	
		
}
