package com.reports.entity;

public class RegisteredMembersProgressiveReportBean {
	
	
	private int sno;
	
	private String district;
	
	private int districtCode;
	
	private String Assembly;
	
	private int totalRegisteredMembers;

	public int getSno() {
		return sno;
	}


	public void setSno(int sno) {
		this.sno = sno;
	}


	public int getDistrictCode() {
		return districtCode;
	}


	public void setDistrictCode(int districtCode) {
		this.districtCode = districtCode;
	}


	public String getDistrict() {
		return district;
	}




	public String getAssembly() {
		return Assembly;
	}


	public void setAssembly(String assembly) {
		Assembly = assembly;
	}


	public void setDistrict(String district) {
		this.district = district;
	}


	public int getTotalRegisteredMembers() {
		return totalRegisteredMembers;
	}


	public void setTotalRegisteredMembers(int totalRegisteredMembers) {
		this.totalRegisteredMembers = totalRegisteredMembers;
	}
   
	   
	}