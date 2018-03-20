package com.adminmodule.user.controller;

import javax.servlet.http.HttpServletRequest;

import com.adminmodule.dao.AdminModuleDao;
import com.adminmodule.user.bean.AuditLogEntity;
import com.commons.ClientRemoteHost;
import com.spring.beans.Beans;

public class AuditLog {
		
	public static String userActivity(String message,HttpServletRequest request){
		AdminModuleDao dao=Beans.adminModuleDao;
		AuditLogEntity entity =new AuditLogEntity();
		entity.setUser_serial_no((String)request.getSession().getAttribute("user_Id"));
		entity.setMessage(message);
		entity.setHost(ClientRemoteHost.getClientIpAddress(request));		
		dao.insertValues(entity);
		return message;
	}
	
	/*With User serial number passing*/
	public static void userActivity(String message,String userId,HttpServletRequest request){
		AdminModuleDao dao=Beans.adminModuleDao;
		AuditLogEntity entity =new AuditLogEntity();
		entity.setUser_serial_no(userId);
		entity.setMessage(message);
		entity.setHost(ClientRemoteHost.getClientIpAddress(request));	
		dao.insertValues(entity);		
	}
	
	
	
}
