package com.dmedia.entity;

import java.util.LinkedHashMap;
import java.util.Map;

import com.dmedia.dao.DMediaModuleDao;
import com.spring.beans.Beans;

public class VideoDataBean {

	private String videoId;
	
	private String youtubeCode;

	private String title;

	private String duration;

	private int noOfViewed = 0;
	
	private String language;

	private int state;

	private int district;

	private int loksaba = 0;

	private int assembly;

	private int mandal;

	private int village;

	private String user = "dmedia";

	private int party;
	
	private String notification = "false";


	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public String getYoutubeCode() {
		return youtubeCode;
	}

	public void setYoutubeCode(String youtubeCode) {
		this.youtubeCode = youtubeCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public int getNoOfViewed() {
		return noOfViewed;
	}

	public void setNoOfViewed(int noOfViewed) {
		this.noOfViewed = noOfViewed;
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

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
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

	public void setNotification(String notification) {
		this.notification = notification;
	}

	public String getNotification() {
		return notification;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getLanguage() {
		return language;
	}

}