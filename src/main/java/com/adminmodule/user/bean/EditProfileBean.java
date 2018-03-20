package com.adminmodule.user.bean;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


@Entity
@Table(name="USER_PROFILE")
public class EditProfileBean {
	
	private int user_id;
	private String user_name;
	private String first_name;
	private String last_name;
	private String email_id;
	private String phone_number;
	private String gender;
	private String address;
	private String city;
	private String image_name;
	private String passwordCheck;
	private String password;
	private CommonsMultipartFile fileData;
	
	@Id
	@Column(name="USER_SERIAL_NO")
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int userId) {
		user_id = userId;
	}
	
	@Column(name="USER_NAME")
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String userName) {
		user_name = userName;
	}
	
	@Column(name="FIRST_NAME")
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String firstName) {
		first_name = firstName;
	}
	
	@Column(name="LAST_NAME")
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String lastName) {
		last_name = lastName;
	}
	
	@Column(name="EMAIL_ID")
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String emailId) {
		email_id = emailId;
	}
	
	@Column(name="PHONE_NUMBER")
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phoneNumber) {
		phone_number = phoneNumber;
	}
	
	@Column(name="GENDER")
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	@Column(name="ADDRESS")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(name="CITY")
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	@Column(name="IMAGE_NAME")
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String imageName) {
		image_name = imageName;
	}
	


	//BeanGetter For JSP use "beans['name']"
	@Transient
	private final Map<String, Object> beans = new HashMap<String, Object>();
	@Transient
	public Map<String, Object> getBeans() { return beans; }
	@Transient
	public Object getBean(String value){
		 return  getBeans().get(value);
	}

	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}
	@Transient
	public CommonsMultipartFile getFileData() {
		return fileData;
	}
	@Transient
	public String getPasswordCheck() {
		return passwordCheck;
	}	
	public void setPasswordCheck(String passwordCheck) {
		this.passwordCheck = passwordCheck;
	}

	@Transient
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
