package com.adminmodule.authentication;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.jdbc.core.JdbcTemplate;

import com.adminmodule.authentication.entity.UserLoginInfoEntity;
import com.adminmodule.dao.AdminModuleDao;
import com.commons.ClientRemoteHost;
import com.spring.beans.Beans;

public class UserLoginInfoLog {
	
	public static int userLoginInfo(HttpServletRequest request,HttpServletResponse response,String username,String userId){
		AdminModuleDao dao=Beans.adminModuleDao;
		String ip=ClientRemoteHost.getClientIpAddress(request);
		Calendar now = Calendar.getInstance();
	    now.add(Calendar.MINUTE, 30);
	    Date logout_time = now.getTime();
	    UserLoginInfoEntity entity =new UserLoginInfoEntity();
	    
	    entity.setUser_serial_no(userId);
	    entity.setUser_name(username);
	    entity.setUser_details(ip);
	    entity.setLogout_time(logout_time);
	    
	    dao.insertValues(entity);
	    
		return entity.getInfolog_id();   
	    
	}
	
	public static void userLogoutupdate(int logId){
		AdminModuleDao dao=Beans.adminModuleDao;
		String update="UPDATE USER_LOGIN_INFOLOG SET  LOGOUT_TIME=SYSDATE WHERE INFOLOG_ID= "+logId;
		dao.updateBySql(update);
	}

}
