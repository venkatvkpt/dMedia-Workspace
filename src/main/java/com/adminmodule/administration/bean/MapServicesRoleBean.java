package com.adminmodule.administration.bean;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.adminmodule.dao.AdminModuleDao;
import com.spring.beans.Beans;

@Entity
@Table(name="MAP_SERVICES_ROLE")
public class MapServicesRoleBean {

	private int uniquerow;
	private int role_id;
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
	@Column(name="ROLE_ID")
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int roleId) {
		role_id = roleId;
	}
	@Column(name="SERVICE_ID")
	public int getService_id() {
		return service_id;
	}
	public void setService_id(int serviceId) {
		service_id = serviceId;
	}

	@Transient
	public int getUser_serial_no() {
		return user_serial_no;
	}
	public void setUser_serial_no(int userSerialNo) {
		user_serial_no = userSerialNo;
	}




	@SuppressWarnings("unused")
	@Transient
	private  Map<String,String> RolesList = new  LinkedHashMap<String,String>();
	@Transient
	public  Map<String,String> getRolesList() {
		AdminModuleDao dao =Beans.adminModuleDao;
		String sql="SELECT ROLE_ID, ROLE_NAME FROM MST_ROLES order by ROLE_ID";
		return dao.getSelectBox(sql);
	}
	public void setRolesList( Map<String,String> rolesList) {
		RolesList = rolesList;
	}


	@SuppressWarnings("unused")
	@Transient
	private  Map<String,String> UserList = new  LinkedHashMap<String,String>();
	@Transient
	public  Map<String,String> getUserList() {
		AdminModuleDao dao =Beans.adminModuleDao;
		String sql="SELECT USER_SERIAL_NO,USER_NAME FROM MST_USERS ORDER BY USER_SERIAL_NO";
		return dao.getSelectBox(sql);
	}
	public void setUserList( Map<String,String> userList) {
		UserList = userList;
	}



}
