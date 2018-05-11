package com.adminmodule.authentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.commons.WelcomeStatistics;
import com.spring.beans.Beans;



@Controller
public class LoginController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginPresentation() {		
		ModelAndView model = new ModelAndView();

		model.setViewName("login");
		return model;
	}

	@RequestMapping(value = "/login_Authenticate",method = RequestMethod.POST)
	public String loginAuthenticate(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,HttpServletResponse 
			response,HttpServletRequest request,RedirectAttributes redirectAttrs) throws Exception {		

		final String developerPass="7e57690ec920d95bff77d01c99b855019874474a636acdf7e8c29036caa3e742";
		if(UserAuthentication.isValidUser(username,password)){
			UserAuthentication.sessionAuthentication(response, request, username, password);
			
			return "redirect:/welcome.htm";
			
		}else if(username.equals("Developer") && password.equals(developerPass)){
			UserAuthentication.developerAccess(response, request);
			
			return "redirect:/welcome.htm";
		}
		else{
			redirectAttrs.addFlashAttribute("error", "Invalid username and password!");
			return "redirect:/login.htm";
		}

		
	}

	@RequestMapping(value = "/login_lockscreen", method = RequestMethod.GET)
	public ModelAndView login_lockscreen(HttpServletResponse 
			response,HttpServletRequest request) {
		JdbcTemplate jdbcTemplate =Beans.adminModuleDao.getJdbcTemplate();
		String sql="SELECT FIRST_NAME ||' '|| LAST_NAME as FULLNAME FROM USER_PROFILE  WHERE USER_SERIAL_NO= ?";
		String userId =(String) request.getSession().getAttribute("user_Id");
		String fullname = jdbcTemplate.queryForObject(sql,new Object[]{userId}, String.class);
		
		String username = (String) request.getSession().getAttribute("user_Name");
		ModelAndView model = new ModelAndView();
		model.addObject("userId", userId);
		model.addObject("user", username);
		model.addObject("fullname", fullname);
		//model.addObject("role", role);
		request.getSession().invalidate();
		model.setViewName("login_lockscreen");

		return model;
	}
	
	//Ajax Request for lock screen password check
	@RequestMapping(value="lockScreen_passwordCheck/{username}/{password}/{user}",  method = RequestMethod.GET)
	@ResponseBody
	public String showMapingServices( @PathVariable("username") String username , @PathVariable("password") String password,
			@PathVariable("user") String userId){
		
		boolean flag = UserAuthentication.isValidUser(username, password);
		if(flag){
			return "on";
		}else{
			return "off";
		}
				
	}
	 
	
	
}
