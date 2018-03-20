package com.dmedia.entity;

import org.springframework.web.multipart.MultipartFile;

public class FamilyNewsBean {
	
	   
	   private String state;
	   private String district;
	   private String assembly;
	   private String mandal;
	   private String village;
	   
	   private String party;
	   
	   private String title;
	   
	   private String language;
	   private String discription;
	   
	   private MultipartFile image;
	   
	   
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getAssembly() {
		return assembly;
	}
	public void setAssembly(String assembly) {
		this.assembly = assembly;
	}
	public String getMandal() {
		return mandal;
	}
	public void setMandal(String mandal) {
		this.mandal = mandal;
	}
	public String getVillage() {
		return village;
	}
	public void setVillage(String village) {
		this.village = village;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public String getParty() {
		return party;
	}
	public void setParty(String party) {
		this.party = party;
	}



	   
	   
	   
	}