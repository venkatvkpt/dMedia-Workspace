package com.adminmodule.administration.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.adminmodule.administration.bean.CreateRolesBean;
import com.adminmodule.dao.AdminModuleDao;
import com.adminmodule.user.controller.AuditLog;
import com.commons.MessageDispatcher;
import com.spring.beans.Beans;


@Controller
public class CreateRolesController {

	@RequestMapping(value = "/createRole", method = RequestMethod.GET)
	public ModelAndView listRoles(Model model) {
		AdminModuleDao dao = Beans.adminModuleDao;
		JdbcTemplate temp =dao.getJdbcTemplate();
		String sql="SELECT R.ROLE_ID,R.ROLE_NAME,P.POSTS_LIST  FROM ROLES_POSTLIST P, MST_ROLES R WHERE P.ROLE_ID=R.ROLE_ID ORDER BY R.ROLE_ID";
		List<Map<String, Object>> lst=temp.queryForList(sql);
		model.addAttribute("role_id", temp.queryForObject("SELECT NVL(MAX(ROLE_ID)+1,1) FROM MST_ROLES",Integer.class));
		model.addAttribute("post_id", temp.queryForObject("SELECT NVL(MAX(POST_ID)+1,1) FROM MST_POSTS",Integer.class));
		model.addAttribute("listRoles", lst);
		ModelAndView model1 = new ModelAndView();
		model1.setViewName("createRole");
		return model1;
	}

	//For add and update person both
	@RequestMapping(value= "/roles/add", method = RequestMethod.POST)
	public String addRoles(@ModelAttribute("role") CreateRolesBean bean,RedirectAttributes redirectAttrs, HttpServletRequest request){
		AdminModuleDao dao = Beans.adminModuleDao;
		Session session = dao.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		String hql="";
		String list="";
		int length =(bean.getLength());
		int br=2;
		bean.setIs_advance("N");
		if((bean.getChanger()).equals("1")){			
			int id=(bean.getRole_id());
			int i=deleteRow("MST_POSTS", id, dao);
			int r=0;
			if(i>0){				
				deleteRow("ROLES_POSTLIST", id, dao);
				r = deleteRow("MST_ROLES", id, dao);
			}
			if(r>0){
				int postId= bean.getPost_id();
				int maxlength=length-1;
				for(int j=0;j<=maxlength;j++){	
					hql="insert into MST_POSTS (POST_ID, POST_NAME, ROLE_ID )" +
					" values ("+postId+", '"+bean.getBean("postname"+j)+"', "+id+")";
					dao.insertValuesSQL(hql);
					list=list+bean.getBean("postname"+j)+", ";
					if(j==br){
						list=list+" <br/>";
						br=br+2;
					}
					postId++;
				}
				list = list.substring(0, list.length() - 2);
				bean.setPosts_list(list);
				boolean res=dao.insertValues(bean);
				if(res){
					redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message(AuditLog.userActivity("Modified Data of Role.",request),true));
					dao.close();
				}else{
					redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("Role updation is failed,Try Again.",false));
				}
				tx.commit();
			}
		}else{					

			int roleId=(bean.getRole_id());
			int postId= bean.getPost_id();
			for(int j=0;j<=length;j++){	
				hql="insert into MST_POSTS (POST_ID, POST_NAME, ROLE_ID )" +
				" values ("+postId+", '"+bean.getBean("postname"+j)+"', "+roleId+")";
				dao.insertValuesSQL(hql);
				list=list+bean.getBean("postname"+j)+", ";
				if(j==br){
					list=list+" <br/>";
					br=br+2;
				}
				postId++;
			}
			list = list.substring(0, list.length() - 2);
			bean.setPosts_list(list);
			boolean res=dao.insertValues(bean);
			if(res){
				redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message(AuditLog.userActivity("Added Data of Role.",request),true));
				dao.close();
			}else{
				redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("Role creation is failed,Try Again.",false));
			}
			tx.commit();
		}			
		return "redirect:/createRole.htm";		
	}

	@RequestMapping("/role/remove/{id}")
	public String removeService(@PathVariable("id") int id,RedirectAttributes redirectAttrs, 
			HttpServletRequest request){
		AdminModuleDao dao = Beans.adminModuleDao;
		int i=deleteRow("MST_POSTS", id, dao);
		if(i>0){				
			deleteRow("ROLES_POSTLIST", id, dao);
			deleteRow("MST_ROLES", id, dao);
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message(AuditLog.userActivity("Removed Data of Role.",request),true));
		}else{
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("Role removing failed,try again.",false));
		}

		return "redirect:/createRole.htm";
	}

	public int deleteRow(String table,int id,Object dao){			
		String sql="DELETE FROM "+table+" WHERE ROLE_ID="+id;
		int result =((AdminModuleDao) dao).insertValuesSQL(sql);	
		return result;		
	}

}
