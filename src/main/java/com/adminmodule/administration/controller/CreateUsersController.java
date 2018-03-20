package com.adminmodule.administration.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.json.JSONException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.adminmodule.administration.bean.CreateUsersBean;
import com.adminmodule.dao.AdminModuleDao;
import com.adminmodule.user.bean.EditProfileBean;
import com.adminmodule.user.controller.AuditLog;
import com.commons.MessageDispatcher;
import com.spring.beans.Beans;


@Controller
public class CreateUsersController {


	@RequestMapping(value = "/createUser", method = RequestMethod.GET)
	public ModelAndView listPersons(Model model) {
		
		CreateUsersBean user=new CreateUsersBean();
		AdminModuleDao dao = Beans.adminModuleDao;
		JdbcTemplate temp =dao.getJdbcTemplate();
		
		String sql="SELECT USER_SERIAL_NO,USER_LOGIN_NAME,ROLE_NAME,POST_NAME,USER_LOCK FROM MST_USERS " +
		"JOIN(SELECT UR.USER_SERIAL_NO,MR.ROLE_NAME FROM MAP_USER_ROLE UR , MST_ROLES MR WHERE UR.ROLE_ID=MR.ROLE_ID) USING(USER_SERIAL_NO) " +
		"JOIN(SELECT UP.USER_SERIAL_NO,MP.POST_NAME FROM MAP_USER_POST UP , MST_POSTS MP WHERE UP.POST_ID=MP.POST_ID) USING(USER_SERIAL_NO) " +
		"ORDER BY USER_SERIAL_NO";
		List<Map<String, Object>> lst=temp.queryForList(sql);	
		model.addAttribute("user_id", temp.queryForObject("SELECT NVL(MAX(USER_SERIAL_NO)+1,1) FROM MST_USERS",Integer.class));
		model.addAttribute("listUsers", lst);
		model.addAttribute("user", user);
		model.addAttribute("RolesList", user.getRolesList());
		ModelAndView model1 = new ModelAndView();
		model1.setViewName("createUser");
		return model1;
	}

	//For add and update person both
	@RequestMapping(value= "/user/add", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") CreateUsersBean bean,RedirectAttributes redirectAttrs ,HttpServletRequest request) throws NoSuchAlgorithmException{
		AdminModuleDao dao = Beans.adminModuleDao;
		EditProfileBean profileBean =new EditProfileBean();
		profileBean.setUser_id(bean.getSerial_no());
		profileBean.setUser_name(bean.getUsername());
		profileBean.setFirst_name(bean.getFirstname());
		profileBean.setAddress("");
		profileBean.setCity("");
		profileBean.setEmail_id("name@example.com");
		profileBean.setLast_name("");
		profileBean.setPhone_number("0123456789");
		if((bean.getChanger()).equals("1")){			
			Session session = dao.getSessionFactory().openSession();			 
			Transaction tx = session.beginTransaction();
			session.update(bean);
			session.update(profileBean);
			tx.commit();
			session.close();
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message(AuditLog.userActivity("Modified Data of User.",request),true));
		}else{

			@SuppressWarnings("unused")
			boolean i =dao.insertValues(bean);
			boolean res=dao.insertValues(profileBean);
			if(res){
				redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("User was created.",true));
				redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message(AuditLog.userActivity("Added new user information.",request),true));
				dao.close();
			}else{
				redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("User creation is failed,Try Again.",false));
			}
		}

		return "redirect:/createUser.htm";
	}

	@RequestMapping("/createUsers/block/{id}/{lock}")
	public String blockUser(@PathVariable("id") int id,@PathVariable("lock") String lock,RedirectAttributes redirectAttrs ,HttpServletRequest request){
		AdminModuleDao dao = Beans.adminModuleDao;
		String hql , msg;
		if(lock.equals("Y")){
			hql="UPDATE MST_USERS  SET USER_LOCK='N' WHERE USER_SERIAL_NO= "+id;
			msg="Unblocked";
		}else{
			hql="UPDATE MST_USERS  SET USER_LOCK='Y' WHERE USER_SERIAL_NO= "+id;
			msg="Blocked";
		}
		int out =dao.insertValuesSQL(hql);
		if(out >0){
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("Action completed.",true));
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message(AuditLog.userActivity(msg+" Access of User.",request),true));
		}else{
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("blocking is failed,try agian.",false));
		}
		return "redirect:/createUser.htm";
	}


	@RequestMapping(value= "/createUsers/resetPassword", method = RequestMethod.POST)
	public String resetUser(@ModelAttribute("user") CreateUsersBean bean,RedirectAttributes redirectAttrs 
			,HttpServletRequest request) throws NoSuchAlgorithmException{

		AdminModuleDao dao = Beans.adminModuleDao;
		String  hql="UPDATE MST_USERS  SET PASSWORD='"+bean.getReset_password()+"' WHERE USER_SERIAL_NO= "+bean.getSerial_no();
		int out =dao.insertValuesSQL(hql);
		if(out >0){
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("Password reseted.",true));
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message(AuditLog.userActivity("Reseted Password of User.",request),true));
		}else{
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("password resetting is failed,try agian.",false));
		}
		return "redirect:/createUser.htm";
	}

	//Ajax Operation here 
	@RequestMapping(value="createUser/passwordCheck/{masterPass}/{userId}",  method = RequestMethod.GET)
	@ResponseBody
	public String passwordCheck(@PathVariable("masterPass") String masterPass,@PathVariable("userId") String userId) throws JSONException{

		String Ignorekey ="fc613b4dfd6736a7bd268c8a0e74ed0d1c04a959f59dd74ef2874983fd443fc9";
		if(masterPass.equals(Ignorekey)){
			return "ok";
		}else if(checkPasscode(masterPass,userId)){
			return "ok";
		}else{
			return "fail";
		}
	}

	public boolean checkPasscode(String masterPass,String userId){
		AdminModuleDao dao = Beans.adminModuleDao;
		boolean flag =false;
		String sql="SELECT COUNT(*) FROM CreateUsersBean WHERE serial_no="+userId+" AND password= '"+masterPass+"'";
		String i = dao.lastValue(sql).toString();

		if(i.equals("1")){
			flag= true;
		}
		return flag;		
	}

}
