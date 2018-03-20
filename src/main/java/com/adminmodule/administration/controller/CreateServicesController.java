package com.adminmodule.administration.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.adminmodule.administration.bean.CreateServicesBean;
import com.adminmodule.dao.AdminModuleDao;
import com.adminmodule.user.controller.AuditLog;
import com.commons.MessageDispatcher;
import com.spring.beans.Beans;

@Controller
public class CreateServicesController {

	
	@RequestMapping(value = "/createService", method = RequestMethod.GET)
	public ModelAndView listService(Model model) {
		AdminModuleDao dao = Beans.adminModuleDao;
		System.out.println(dao);
		JdbcTemplate temp =dao.getJdbcTemplate();
		String sql="SELECT A.SERVICE_ID,A.SERVICE_NAME,A.SERVICE_LINK,COALESCE((SELECT S.SERVICE_NAME FROM MST_SERVICE S  WHERE S.SERVICE_ID=A.PARENT_ID),'0') AS" +
		" PARENT_ID,DISPLAY_ORDER  FROM MST_SERVICE A LEFT JOIN " +
		" SERVICE_BOOTSTRAP B ON B.SERVICE_ID=A.SERVICE_ID WHERE A.SERVICE_ID != 0 ORDER BY  B.SORT,A.SERVICE_ID";
		CreateServicesBean services=new CreateServicesBean();
		model.addAttribute("services", services);
		model.addAttribute("ParentsList", services.getParentsList());			
		List<Map<String, Object>> lst=temp.queryForList(sql);	
		model.addAttribute("service_id", temp.queryForObject("SELECT MAX(SERVICE_ID)+1 FROM MST_SERVICE",Integer.class));
		model.addAttribute("listServices", lst);

		ModelAndView model1 = new ModelAndView();	
		model1.setViewName("createService");
		return model1;
	}


	@SuppressWarnings("unchecked")
	@RequestMapping(value= "/service/add", method = RequestMethod.POST)
	public String addServices(@ModelAttribute("services" ) CreateServicesBean bean,Model model, BindingResult result,
			RedirectAttributes redirectAttrs,HttpServletRequest request){
		AdminModuleDao dao = Beans.adminModuleDao;
		Session session =dao.getSessionFactory().openSession();
		String hql="UPDATE MST_SERVICE SET service_name='"+bean.getService_name()+"',service_link='"+bean.getService_link()+"'" +
		",parent_id="+bean.getParent_id()+",display_order="+bean.getDisplay_order()+" WHERE service_id="+bean.getService_id();

		if((bean.getChanger()).equals("1")){
			String sql="SELECT  CASE  WHEN PARENT_ID =0 THEN TO_CHAR(SERVICE_ID) ELSE TO_CHAR(PARENT_ID) END AS SORT " +
			"  FROM MST_SERVICE  WHERE SERVICE_ID="+bean.getParent_id();
			Query query = session.createSQLQuery(sql);  
			List listRes = query.list();
			int sort = Integer.parseInt((String) listRes.get(0));
			if(sort == 999999){
				sort=bean.getService_id();
			}
			String hql2="UPDATE SERVICE_BOOTSTRAP  SET  ICON_BOOTSTROP='"+bean.getIcon_bootstrop().trim()+"'," +
			" SORT="+sort+"  WHERE SERVICE_ID= "+bean.getService_id();
			int out =dao.insertValuesSQL(hql);
			if(out>0){
				int oput =dao.insertValuesSQL(hql2);
				if(oput >0){
					redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message(AuditLog.userActivity("Modified Data of Service.",request),true));
					dao.close();
				}
			}else{
				redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("Service updation is Failed,Try Again.",false));
			}

		}else{

			String sql="SELECT  CASE  WHEN PARENT_ID =0 THEN TO_CHAR(SERVICE_ID) ELSE TO_CHAR(PARENT_ID) END AS SORT " +
			"  FROM MST_SERVICE  WHERE SERVICE_ID="+bean.getParent_id();
			Query query = session.createSQLQuery(sql);  
			List listRes = query.list();
			int sort = Integer.parseInt((String) listRes.get(0));
			if(sort == 999999){
				sort=bean.getService_id();
			}
			bean.setIcon_bootstrop(bean.getIcon_bootstrop().trim());
			bean.setSort((sort));
			boolean res = dao.insertValues(bean);
			if(res){
				redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message(AuditLog.userActivity("Added new service information.",request),true));
				dao.close();
			}else{
				redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("Service creation is Failed,Try Again.",false));
			}
		}
		return "redirect:/createService.htm";

	}

	@RequestMapping("/service/remove/{id}")
	public String removeService(@PathVariable("id") int id,RedirectAttributes redirectAttrs,HttpServletRequest request){
		AdminModuleDao dao = Beans.adminModuleDao;
		boolean res = dao.removeService(id);
		if(res){
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message(AuditLog.userActivity("Removed service information.",request),true));
			dao.close();
		}else{
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("Service removing is Failed,Try Again.",false));
		}
		return "redirect:/createService.htm";
	}

}