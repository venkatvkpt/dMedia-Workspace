package com.adminmodule.administration.bean;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.adminmodule.dao.AdminModuleDao;
import com.spring.beans.Beans;


@Entity
@Table(name="MST_SERVICE")
@SecondaryTable( name = "SERVICE_BOOTSTRAP")
public class CreateServicesBean {
	@Id
	@Column(name="SERVICE_ID")
	private int service_id;
	@Column(name="SERVICE_NAME")
	private String service_name;
	@Column(name="PARENT_ID")
	private int parent_id;
	@Column(name="SERVICE_LINK")
	private String service_link;
	@Column(name="DISPLAY_ORDER")
	private int display_order;
	
	@Column(name="ICON_BOOTSTROP", table="SERVICE_BOOTSTRAP")
	private String icon_bootstrop;
	@Column(name="SORT" ,table="SERVICE_BOOTSTRAP")
	private int sort;
	
	public int getService_id() {
		return service_id;
	}
	public void setService_id(int serviceId) {
		service_id = serviceId;
	}
	public String getService_name() {
		return service_name;
	}
	public void setService_name(String serviceName) {
		service_name = serviceName;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parentId) {
		parent_id = parentId;
	}
	public String getService_link() {
		return service_link;
	}
	public void setService_link(String serviceLink) {
		service_link = serviceLink;
	}
	public int getDisplay_order() {
		return display_order;
	}
	public void setDisplay_order(int displayOrder) {
		display_order = displayOrder;
	}
	
	public String getIcon_bootstrop() {
		return icon_bootstrop;
	}
	public void setIcon_bootstrop(String iconBootstrop) {
		icon_bootstrop = iconBootstrop;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	
	@Override
	public String toString(){
		return "service_id="+service_id+", service_name="+service_name+", parent_id="+parent_id+", " +
				"service_link="+service_link+", display_order="+display_order;
	}
	
	@Transient
	private String changer;
	
	
	public String getChanger() {
		return changer;
	}

	public void setChanger(String changer) {
		this.changer = changer;
	}
	@SuppressWarnings("unused")
	@Transient
	private  Map<String,String> ParentsList = new  LinkedHashMap<String,String>();
	@Transient
	public  Map<String,String> getParentsList() {
		AdminModuleDao dao =Beans.adminModuleDao;
		String sql="SELECT SERVICE_ID,SERVICE_NAME FROM MST_SERVICE WHERE SERVICE_LINK='#' ORDER BY SERVICE_ID,PARENT_ID";
		return dao.getSelectBox(sql);
	}
	public void setParentsList( Map<String,String> parentsList) {
		ParentsList = parentsList;
	}
	
	
}
