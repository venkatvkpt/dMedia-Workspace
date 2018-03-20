package com.adminmodule.authentication;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.adminmodule.dao.AdminModuleDao;
import com.adminmodule.user.controller.AuditLog;
import com.spring.beans.Beans;
@Controller
@RequestMapping
public class LogoutController  {
	
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public ModelAndView onLogoutSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException, ServletException {			
		AdminModuleDao dao=Beans.adminModuleDao;
		ModelAndView model = new ModelAndView();
		HttpSession session =httpServletRequest.getSession();
		
        if (session != null ) {
        	UserLoginInfoLog.userLogoutupdate((Integer) session.getAttribute("LOGIN_ID"));
            try {
                String username = (String) session.getAttribute("user_Name");
        		String user_id =dao.getUserId(username);       		
        		if(!user_id.equals("0")){
        			AuditLog.userActivity("Successfully Logged Out.",user_id,httpServletRequest);
        		}
        		session.invalidate();
    			System.gc();               
            } catch (Exception e) {
                e.printStackTrace();
                e = null;
            }
        }
        
        model.addObject("msg", "You've been logged out successfully.");
        //redirect to login
        model.setViewName("login");
		return model;
    }

}