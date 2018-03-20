package com.dmedia.entity;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.dmedia.dao.DMediaModuleDao;
import com.spring.beans.Beans;

public class VideoDataBean {

	private String news_id;
	
	private String language;

	private String title;

	private String discription;

	private String imagepath;

	private int noOfViewed = 0;

	private String viewedLocation = "Android";

	private int state;

	private int district;

	private int loksaba = 0;

	private int assembly;

	private int mandal;

	private int village;

	private Date date;

	private String user = "dmedia";

	private String source = "dmedia";

	private String receipt_no = "Receipt";

	private int party;
	
	private String notification = "false";

	private MultipartFile image;

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

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public String getImagepath() {
		return imagepath;
	}

	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
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

	@SuppressWarnings("unused")
	private Map<String, String> StatesList = new LinkedHashMap<String, String>();

	public Map<String, String> getStatesList() {
		DMediaModuleDao dao = Beans.dMediaModuleDao;
		String sql = "SELECT STATE_CODE,STATE_NAME FROM MST_STATES";
		return dao.getSelectBox(sql);
	}

	public void setStatesList(Map<String, String> statesList) {
		StatesList = statesList;
	}

	public void setNews_id(String news_id) {
		this.news_id = news_id;
	}

	public String getNews_id() {
		return news_id;
	}

	public void setNotification(String notification) {
		this.notification = notification;
	}

	public String getNotification() {
		return notification;
	}

}