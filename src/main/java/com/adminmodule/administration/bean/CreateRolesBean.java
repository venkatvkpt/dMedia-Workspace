package com.adminmodule.administration.bean;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name="MST_ROLES")
@SecondaryTable(name="ROLES_POSTLIST")
public class CreateRolesBean {
	@Id
	@Column(name="ROLE_ID")
	private int role_id;
	@Column(name="ROLE_NAME")
	private String role_name;
	@Column(name="IS_ADVANCE")
	private String is_advance;
	@Column(name="POSTS_LIST", table="ROLES_POSTLIST")
	private String posts_list;

	
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int roleId) {
		role_id = roleId;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String roleName) {
		role_name = roleName;
	}
	public String getIs_advance() {
		return is_advance;
	}
	public void setIs_advance(String isAdvance) {
		this.is_advance=isAdvance ;
	}
	public void setPosts_list(String posts_list) {
		this.posts_list = posts_list;
	}
	public String getPosts_list() {
		return posts_list;
	}
	
	
	@Transient
	private int length;
	public void setLength(int length) {
		this.length = length;
	}
	public int getLength() {
		return length;
	}
	@Transient
	private String changer;
	public void setChanger(String changer) {
		this.changer = changer;
	}
	public String getChanger() {
		return changer;
	}
	@Transient
	private int post_id;
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public int getPost_id() {
		return post_id;
	}
	
	
	
	
	
	
	//BeanGetter
	@Transient
	private final Map<String, Object> beans = new HashMap<String, Object>();
	@Transient
	public Map<String, Object> getBeans() { return beans; }
	@Transient
	public Object getBean(String value){
		 return  getBeans().get(value);
	}
	
	
	
	
	
	
}
