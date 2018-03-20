package com.commons;

import java.util.List;

public class ContextData {
	private String GUEST_PASSWORD = "";

	private String DEFAULT_PASSWORD = "";
	
	private List<String> ignoreServices;

	public String getGUEST_PASSWORD() {
		return GUEST_PASSWORD;
	}

	public void setGUEST_PASSWORD(String gUESTPASSWORD) {
		GUEST_PASSWORD = gUESTPASSWORD;
	}

	public String getDEFAULT_PASSWORD() {
		return DEFAULT_PASSWORD;
	}

	public void setDEFAULT_PASSWORD(String dEFAULTPASSWORD) {
		DEFAULT_PASSWORD = dEFAULTPASSWORD;
	}

	public List<String> getIgnoreServices() {
		return ignoreServices;
	}

	public void setIgnoreServices(List<String> ignoreServices) {
		this.ignoreServices = ignoreServices;
	}
	
	

}
