package com.dmedia.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

@Entity
@Table(name = "NEWS_LATEST_TE")
public class NewsLatestTEEntity {
	
	@Id
	@Column(name="NEWS_ID" ,length=200)
	@TableGenerator(name="latestNews_id",table="latestnewspktb",pkColumnName="latestnewskey",pkColumnValue="latestnewsvalue",allocationSize=1)
	@GeneratedValue(strategy=GenerationType.TABLE,generator="latestNews_id")
	private String latestNews_id;
	
	@Column(name="LANGUAGE_ID",length=10)
	   private String language;
		
	@Column(name="NEWS_HEADLINE",length=4000)
	   private String title;
	
	@Column(name="NEWS_CONTENT",length=4000)  
	   private String discription;
	
	@Column(name="IMAGE_PATH",length=250) 
	private String imagepath;
	
	@Column(name="NO_OF_VIEWED") 
	private int noOfViewed=0;
	
	@Column(name="VIEWED_LOCATION",length=200) 
	private String viewedLocation="Android";
	
	@Column(name="STATE_ID")
	   private int state;
	
	@Column(name="DISTRICT_ID")
	   private int district;
	
	@Column(name="LOKSABHA_ID")  
	   private int loksaba=0;
	   
	@Column(name="ASSEMBLY_ID")  
	   private int assembly;
	   	   
	@Column(name="MANDAL_ID") 
	   private int mandal;
	
	@Column(name="VILLAGE_ID") 
	   private int village;	
	   
	@Column(name="CREATED_DATE")  
	   private Date date;
	
	@Column(name="CREATED_BY")  
	   private String user="dmedia";	
	
	@Column(name="SOURCE_OF_NEWS")  
	   private String source="dmedia";		
	
	@Column(name="RECEIPT_NO")  
	   private String receipt_no="Receipt Number";	
	
	@Column(name="PARTY_ID")   
	   private int party;

	public String getLatestNews_id() {
		return latestNews_id;
	}

	public void setLatestNews_id(String latestNewsId) {
		latestNews_id = latestNewsId;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}

	public int getNoOfViewed() {
		return noOfViewed;
	}

	public void setNoOfViewed(int noOfViewed) {
		this.noOfViewed = noOfViewed;
	}

	public String getViewedLocation() {
		return viewedLocation;
	}

	public void setViewedLocation(String viewedLocation) {
		this.viewedLocation = viewedLocation;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getDistrict() {
		return district;
	}

	public void setDistrict(int district) {
		this.district = district;
	}

	public int getLoksaba() {
		return loksaba;
	}

	public void setLoksaba(int loksaba) {
		this.loksaba = loksaba;
	}

	public int getAssembly() {
		return assembly;
	}

	public void setAssembly(int assembly) {
		this.assembly = assembly;
	}

	public int getMandal() {
		return mandal;
	}

	public void setMandal(int mandal) {
		this.mandal = mandal;
	}

	public int getVillage() {
		return village;
	}

	public void setVillage(int village) {
		this.village = village;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getReceipt_no() {
		return receipt_no;
	}

	public void setReceipt_no(String receiptNo) {
		receipt_no = receiptNo;
	}

	public int getParty() {
		return party;
	}

	public void setParty(int party) {
		this.party = party;
	}
	
	
	
	

}
