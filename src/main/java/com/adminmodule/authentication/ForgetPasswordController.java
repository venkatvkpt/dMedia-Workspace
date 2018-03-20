package com.adminmodule.authentication;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.adminmodule.dao.AdminModuleDao;
import com.commons.MailBodyTemplates;
import com.commons.MessageDispatcher;
import com.commons.SendEmailUsingGMailSMTP;
import com.spring.beans.Beans;


@Controller
public class ForgetPasswordController {
	
	final DateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	Date date = new Date();
	
	@RequestMapping(value = "/forget", method = RequestMethod.GET)
	public ModelAndView forget_password( @RequestParam(value = "error", required = false, defaultValue = "false") boolean error,
			@RequestParam(value = "sucess", required = false, defaultValue = "false") boolean sucess,
			@RequestParam(value = "email", required = false) String email) {
		ModelAndView model = new ModelAndView();
		if(error){
			model.addObject("error", MessageDispatcher.message("This email (<b>"+email+"</b>) is not valid" +
					" or not registered with us." +
					"<p style='padding-left: 6.8em'>For more information, contact the administrator.</p>", false));
		}else if (sucess){
			model.addObject("msg","sucess");
			model.addObject("email",email);
		}
		
		
		model.setViewName("forget");

		return model;
	}

	
	@RequestMapping(value = "/forgetEmailCheck", method = RequestMethod.POST)
	public String forget_emailChecking(@RequestParam("forget_email") Object forget_email) {
		AdminModuleDao dao = Beans.adminModuleDao;		
		if(forget_email.equals("name@example.com")){
			return  "redirect:/forget.htm?error=true&email="+forget_email;
		}
		JdbcTemplate temp =dao.getJdbcTemplate();
		String sql="SELECT USER_SERIAL_NO,FIRST_NAME FROM USER_PROFILE WHERE EMAIL_ID='"+forget_email+"'";
		List<Map<String, Object>> lst=temp.queryForList(sql);
		if(lst.isEmpty()){
			return  "redirect:/forget.htm?error=true&email="+forget_email;
		}
		String name=lst.get(0).get("FIRST_NAME")+"";
		String userId=lst.get(0).get("USER_SERIAL_NO")+""; 
	     String currentDate=sdf.format(date);
	     String text=toHex(userId+"="+currentDate+"="+forget_email);     
		String subjectTitle="PORTAL : Forgot Password Reply for "+name;
		String someHtmlMessage=MailBodyTemplates.forgetPasswordHTMLTemplate(name, 
				"http://192.168.1.177:8088/Portal/resetlink.htm?validation=fw13t32vbv32h3tt72362h3v23f52362t3gh2eb2jy3e7263y2hvw2ht62t&isValidLink="+text);
		SendEmailUsingGMailSMTP.doSendMail(subjectTitle, someHtmlMessage, forget_email+"");

		return  "redirect:/forget.htm?sucess=true&email="+forget_email;
	}
	

	@RequestMapping(value = "/resetlink", method = RequestMethod.GET)
	public ModelAndView reset_password( @RequestParam(value = "isValidLink", required = false)String info,
			@RequestParam(value = "validation", required = false) String dump) {
		ModelAndView model = new ModelAndView();
		
		String data=null;
		try {
			data = fromHex(info);
		} catch (UnsupportedEncodingException e) {}
		String[] words=data.split("=");
		String userId=words[0];
		String getDate=words[1];
		String mail=words[2];
		if(isValidlink(getDate)){
			
			model.addObject("email",mail);
			model.addObject("userId",userId);
		}else{
			model.addObject("msg","invalid");
			model.addObject("email",mail);
		}
		
		model.setViewName("reset");

		return model;
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public ModelAndView resetPassword( @RequestParam(value = "email", required = false)String email,
			@RequestParam(value = "userId", required = false) String userId,@RequestParam(value = "password", required = false) String password) {

		AdminModuleDao dao = Beans.adminModuleDao;
		String sql="UPDATE MST_USERS SET  PASSWORD='"+password+"', PASSWORD_CHANGED_DATE=SYSDATE WHERE USER_SERIAL_NO="+userId;
		dao.updateBySql(sql);
		
		ModelAndView model = new ModelAndView();		
		model.addObject("msg","sucess");
		model.setViewName("reset");

		return model;
	}
		
	
	
	public static String fromHex(String hex) throws UnsupportedEncodingException {
	    hex = hex.replaceAll("^(00)+", "");
	    byte[] bytes = new byte[hex.length() / 2];
	    for (int i = 0; i < hex.length(); i += 2) {
	        bytes[i / 2] = (byte) ((Character.digit(hex.charAt(i), 16) << 4) + Character.digit(hex.charAt(i + 1), 16));
	    }
	    return new String(bytes);
	}
	public static String toHex(String arg) {
	    try {
			return String.format("%040x", new BigInteger(1, arg.getBytes("UTF-8")));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arg;
	}
	
	public boolean isValidlink(String getDate) {
		
	     if(getDate.equals(sdf.format(date))) 
	    	 return true;
	     else
	    	 return false;
	     
		}


}
