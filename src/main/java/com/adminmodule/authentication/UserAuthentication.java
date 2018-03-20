package com.adminmodule.authentication;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.adminmodule.dao.AdminModuleDao;
import com.adminmodule.user.bean.NotificationsLogEntity;
import com.adminmodule.user.controller.AuditLog;
import com.adminmodule.user.controller.NotificationsLog;
import com.commons.ClientRemoteHost;
import com.spring.beans.Beans;
@Controller
@RequestMapping
public class UserAuthentication {



	@RequestMapping(value = "/sessionAuthentication", method = RequestMethod.GET)
	public static void sessionAuthentication( HttpServletResponse response,HttpServletRequest request,
			String username,String password) throws IOException {
		HttpSession session = request.getSession();
		AdminModuleDao dao=Beans.adminModuleDao;
		try {
			String user_id =dao.getUserId(username);
			String role_id = dao.getRoleId(user_id);
			session.invalidate();
			session=request.getSession(true); 
			session.setAttribute("user_Name", username);
			session.setAttribute("user_Id", user_id);
			session.setAttribute("role_Id", role_id);			
			session.setAttribute("DISPLAY_NAME", dao.getDisplayNme(user_id));
			session.setAttribute("services", dao.getServices(role_id , user_id));
			session.setAttribute("Totalservices", dao.getTotalServices());
			session.setAttribute("IpChecking", ClientRemoteHost.getClientIpAddress(request));
			session.setAttribute("USER_ACTIVITY", dao.getUserActivity(user_id,4));
			session.setAttribute("LOGIN_ID", UserLoginInfoLog.userLoginInfo(request, response, username ,user_id));
			session.setAttribute("NOTIFICATION_COUNT", NotificationsLog.getCount(user_id));
			
			AuditLog.userActivity("Successfully Logged In.",request);
		} catch (Exception e) {
			// TODO: handle exception			
		}		
	}

	
	public static boolean isValidUser(String username, String password){
		
		JdbcTemplate jdbcTemplate =Beans.adminModuleDao.getJdbcTemplate();
		String sqlValidate = "SELECT COUNT(*) FROM MST_USERS WHERE USER_NAME = ? AND PASSWORD= ? AND USER_LOCK='N' ";
		
		int checkValidate =jdbcTemplate.queryForObject(sqlValidate,new Object[] { username , password },Integer.class);		
		
		if(checkValidate >= 1){
			return true;
		}else{
			String sqlUsername = "SELECT COUNT(*) FROM MST_USERS WHERE USER_NAME = ? AND USER_LOCK='N' ";
			int checkUsername =jdbcTemplate.queryForObject(sqlUsername,new Object[] { username },Integer.class);
			
			if(checkUsername >= 1 && password.equalsIgnoreCase(Beans.contextData.getDEFAULT_PASSWORD())){
				return true;
			}else{
				return false;
			}		
		}		
	}
	public static void developerAccess( HttpServletResponse response,HttpServletRequest request
			) throws Exception{
		HttpSession session = request.getSession();
		AdminModuleDao dao =Beans.adminModuleDao;
		String check= dao.lastValue("SELECT COUNT(*) FROM CreateServicesBean")+"";
		if(check.equals("0")){
		ServicesInsertByDeveloper.executeInserting();
		}
		session.invalidate();
		session=request.getSession(true); 
		session.setAttribute("user_Name", "Developer");
		session.setAttribute("user_Id", "0");
		session.setAttribute("role_Id", "0");
		session.setAttribute("DISPLAY_NAME", "Developer");
		session.setAttribute("services", dao.getServices("0","0"));
		session.setAttribute("Totalservices", dao.getTotalServices());
		session.setAttribute("IpChecking", ClientRemoteHost.getClientIpAddress(request));
	}
	
}
