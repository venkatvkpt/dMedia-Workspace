package com.others.entity;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class AdvertisementFormBean {
	
	private String advertisement_id;
	
	private Date releaseDate;
	private Date expiryDate;
	private String imagepath;
	
	private MultipartFile image;
	
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public Date getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public String getAdvertisement_id() {
		return advertisement_id;
	}
	public void setAdvertisement_id(String advertisementId) {
		advertisement_id = advertisementId;
	}

	
   
}