package com.adminmodule.administration.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.adminmodule.administration.bean.MapServicesRoleBean;
import com.adminmodule.administration.bean.MapServicesUserBean;
import com.adminmodule.dao.AdminModuleDao;
import com.adminmodule.user.controller.AuditLog;
import com.commons.MessageDispatcher;
import com.spring.beans.Beans;

@Controller
public class MapServicesController {
	
	@RequestMapping(value = "/mapServices", method = RequestMethod.GET)
	public ModelAndView listMapingService(Model model) {

		MapServicesRoleBean map=new MapServicesRoleBean();
		model.addAttribute("map", map);
		model.addAttribute("RolesList", map.getRolesList());
		model.addAttribute("UsersList", map.getUserList());		
		ModelAndView model1 = new ModelAndView();	
		model1.setViewName("mapServices");
		return model1;
	}
	
	@RequestMapping(value="mapServices/add/{id}/{service_id}/{flag}",  method = RequestMethod.GET)
	public String addServiceMAp(@PathVariable("id") String selectedid, @PathVariable("service_id") String service_id,
			@PathVariable("flag") String flag, RedirectAttributes redirectAttrs, HttpServletRequest request ){
		AdminModuleDao dao = Beans.adminModuleDao;
		String table;
		int uniqueRow;
		if (flag.equals("user")){
			table="MAP_SERVICES_USER(UNIQUEROW, USER_SERIAL_NO, SERVICE_ID)";
			uniqueRow = (Integer) dao.lastValue("SELECT NVL(MAX(uniquerow)+1,0) FROM MapServicesUserBean");
		}else{
		uniqueRow = (Integer) dao.lastValue("SELECT NVL(MAX(uniquerow)+1,0) FROM MapServicesRoleBean");
		table="MAP_SERVICES_ROLE(UNIQUEROW, ROLE_ID, SERVICE_ID)";
		}
		String sql="INSERT INTO "+table+" VALUES("+uniqueRow+", "+selectedid+", "+service_id+")";
		int task =dao.insertValuesSQL(sql);
		if(task > 0){
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message(AuditLog.userActivity("Allocated Service for "+flag+".",request),true));
			dao.close();
		}else{
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("Service Allocation is Failed,Try Again.",false));
		}
		
		return "redirect:/mapServices.htm";
	}
	
	@RequestMapping(value="mapServices/drop/{id}/{service_id}/{flag}",  method = RequestMethod.GET)
	public String dropServiceMAp(@PathVariable("id") String selectedid, @PathVariable("service_id") String service_id,
			@PathVariable("flag") String flag , RedirectAttributes redirectAttrs, HttpServletRequest request ){
		AdminModuleDao dao = Beans.adminModuleDao;
		String table="MAP_SERVICES_ROLE WHERE ROLE_ID= "+selectedid;
		if (flag.equals("user")){
			table="MAP_SERVICES_USER WHERE USER_SERIAL_NO = "+selectedid;
		}
		
		String sql="DELETE FROM "+table+" AND SERVICE_ID="+service_id;
		int task =dao.insertValuesSQL(sql);
		if(task > 0){
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message(AuditLog.userActivity("Deallocated Service for "+flag+".",request),true));			
			dao.close();
		}else{
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("Service Deallocation is Failed,Try Again.",false));
		}
		return "redirect:/mapServices.htm";
	}
	
	
	
	
	
	
	
	//Ajax Request for Display Allocated and UnAllocated Services
	@RequestMapping(value="MapServices/show/{selected}/{flag}",  method = RequestMethod.GET)
	@ResponseBody
	public String showMapingServices(@PathVariable("selected") String selected, @PathVariable("flag") String flag){
		AdminModuleDao dao = Beans.adminModuleDao;
		JdbcTemplate temp =dao.getJdbcTemplate();
		String link="";
		String lstsql;
		int val=2;
		if(flag.equalsIgnoreCase("role")){			
			link="SELECT SERVICE_ID,'checked=''''' AS SHOW FROM MAP_SERVICES_ROLE WHERE ROLE_ID = "+selected;
			val=1;
		}else{
			link="SELECT SERVICE_ID,'checked=''''' AS SHOW FROM MAP_SERVICES_USER WHERE USER_SERIAL_NO = "+selected;
		}
		
		lstsql="SELECT DECODE(SPACES,NULL,ICON_BOOTSTROP,SPACES) AS ICON,SERVICE_NAME,NVL(SHOW,' ') AS BOX,SERVICE_ID||','||'"+selected+"'||','||'"+val+"' as  EVENT FROM( "+
			" SELECT ICON_BOOTSTROP,SERVICE_NAME,S.SERVICE_ID FROM SERVICE_BOOTSTRAP B,MST_SERVICE S where B.SERVICE_ID=S.SERVICE_ID ORDER BY B.SORT, B.SERVICE_ID) "+
			" LEFT JOIN(SELECT SERVICE_ID ,'3SP' AS SPACES FROM MST_SERVICE MS WHERE PARENT_ID IN  (SELECT SERVICE_ID FROM MST_SERVICE WHERE SERVICE_ID !=0 AND SERVICE_LINK='#' AND PARENT_ID !=0))USING(SERVICE_ID)"+
			" LEFT JOIN("+link+")USING (SERVICE_ID)";
		
		List<Map<String, Object>> lst=temp.queryForList(lstsql);	
		String listed=converJson(lst);
	
		String bothJson = "["+listed+"]";
		return bothJson;
		
	}
	
	//Ajax Request Insert or Delete operations 
	@RequestMapping(value="MapServices/checkEvent/{service}/{role_user}/{check}",  method = RequestMethod.GET)
	@ResponseBody
	public String checkBoxEvent(@PathVariable("service") String serviceId, @PathVariable("role_user") String role_user, @PathVariable("check") int flag){
		AdminModuleDao dao = Beans.adminModuleDao;
		JdbcTemplate temp =dao.getJdbcTemplate();
		Object[] parameters=new Object[]{role_user,serviceId};
		Object insert;
	
		String sql,delete,output;
		if(flag == 1){//Role Operations
			sql="SELECT COUNT(*) AS VAL FROM MAP_SERVICES_ROLE WHERE ROLE_ID=? AND SERVICE_ID=?";
			delete ="DELETE FROM MAP_SERVICES_ROLE WHERE ROLE_ID=? AND SERVICE_ID=?";
			insert= new MapServicesRoleBean();
			((MapServicesRoleBean) insert).setService_id(Integer.parseInt(serviceId));
			((MapServicesRoleBean) insert).setRole_id(Integer.parseInt(role_user));			
		}else{//User Operations
			sql="SELECT COUNT(*) AS VAL FROM MAP_SERVICES_USER where USER_SERIAL_NO=? and SERVICE_ID=?";
			delete="DELETE FROM MAP_SERVICES_USER WHERE USER_SERIAL_NO=? AND SERVICE_ID=?";
			insert =new MapServicesUserBean();
			((MapServicesUserBean) insert).setService_id(Integer.parseInt(serviceId));
			((MapServicesUserBean) insert).setUser_serial_no(Integer.parseInt(role_user));
		}
		
		int result = temp.queryForObject(sql,parameters, Integer.class);
		if(result > 0){
			temp.update(delete, parameters);
			output="Service Deallocated.";		
		}else{
			dao.insertValues(insert);
			output="Service Allocated.";
		}
		return output;
		
	}
	
	
	public String converJson(List<Map<String, Object>> list)
	{       
	    JSONArray json_arr=new JSONArray();
	    for (Map<String, Object> map : list) {
	        JSONObject json_obj=new JSONObject();
	        for (Map.Entry<String, Object> entry : map.entrySet()) {
	            String key = entry.getKey();
	            Object value = entry.getValue();
	            try {
	                json_obj.put(key,value);
	            } catch (JSONException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }                           
	        }
	        json_arr.put(json_obj);
	    }
	    return json_arr.toString();
	}
	
	
	
}
