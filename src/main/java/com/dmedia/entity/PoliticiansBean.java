package com.dmedia.entity;

import java.net.URLDecoder;

import org.springframework.web.multipart.MultipartFile;

public class PoliticiansBean {
	
	private String politicId;
	private String nameEn;
	private String locationEn;
	private String postEn;
	
	private String nameTe;
	private String locationTe;
	private String postTe;
	
	private String nameHi;
	private String locationHi;
	private String postHi;
	
	private String nameUr;
	private String locationUr;
	private String postUr;
	
	private String lang;
	private String imgPath;
	private MultipartFile image;
	private String contact;
	private String email;
	private String partyCode;
	
	private String createdBy ="dMedia";
	private String isActive ="Y";
	public String getPoliticId() {
		return politicId;
	}
	public void setPoliticId(String politicId) {
		this.politicId = politicId;
	}
	public String getNameEn() {
		return nameEn;
	}
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	public String getLocationEn() {
		return locationEn;
	}
	public void setLocationEn(String locationEn) {
		this.locationEn = locationEn;
	}
	public String getPostEn() {
		return postEn;
	}
	public void setPostEn(String postEn) {
		this.postEn = postEn;
	}
	public String getNameTe() {
		
		return nameTe;
	}
	public void setNameTe(String nameTe) {
		this.nameTe = nameTe;
	}
	public String getLocationTe() {
		return locationTe;
	}
	public void setLocationTe(String locationTe) {
		this.locationTe = locationTe;
	}
	public String getPostTe() {
		return postTe;
	}
	public void setPostTe(String postTe) {
		this.postTe = postTe;
	}
	public String getNameHi() {
		return nameHi;
	}
	public void setNameHi(String nameHi) {
		this.nameHi = nameHi;
	}
	public String getLocationHi() {
		return locationHi;
	}
	public void setLocationHi(String locationHi) {
		this.locationHi = locationHi;
	}
	public String getPostHi() {
		return postHi;
	}
	public void setPostHi(String postHi) {
		this.postHi = postHi;
	}
	public String getNameUr() {
		return nameUr;
	}
	public void setNameUr(String nameUr) {
		this.nameUr = nameUr;
	}
	public String getLocationUr() {
		return locationUr;
	}
	public void setLocationUr(String locationUr) {
		this.locationUr = locationUr;
	}
	public String getPostUr() {
		return postUr;
	}
	public void setPostUr(String postUr) {
		this.postUr = postUr;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getIsActive() {
		return isActive;
	}
	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setPartyCode(String partyCode) {
		this.partyCode = partyCode;
	}
	public String getPartyCode() {
		return partyCode;
	}
	
	

}
