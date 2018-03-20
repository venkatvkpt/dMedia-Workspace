package com.adminmodule.administration.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="MST_POSTS")

public class CreatePostsBean implements java.io.Serializable{	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="POST_ID" )
	private int post_id;
	
	
	@Column(name="POST_NAME" )
	private String post_name;
	
	@Column(name = "ROLE_ID")
	private int role_id;
	
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_name(String post_name) {
		this.post_name = post_name;
	}
	public String getPost_name() {
		return post_name;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public int getRole_id() {
		return role_id;
	}
	
	
	
}
