package com.adminmodule.user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.adminmodule.dao.AdminModuleDao;
import com.adminmodule.user.bean.CalendarBean;
import com.commons.MessageDispatcher;
import com.spring.beans.Beans;



@Controller
public class CalendarController {

	
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public ModelAndView calendar(Model model) {
		CalendarBean calendar=new CalendarBean();
		AdminModuleDao dao=Beans.adminModuleDao;
		JdbcTemplate temp =dao.getJdbcTemplate();	
		String sql="SELECT  EVENT_NAME as \"title\",TO_CHAR(EVENT_STARTDATE, 'MM DD YYYY HH24:MI:SS') AS \"start\",TO_CHAR(EVENT_ENDDATE, " +
		"'MM DD YYYY HH24:MI:SS') AS \"end\",'event-'|| OPTIONSCATEGORY as \"className\",OPTIONSCATEGORY as \"category\"," +
		"' ' as \"content\" FROM EVENT_CALENDAR";
		List<Map<String, Object>> lst=temp.queryForList(sql);	
		model.addAttribute("calendar", calendar);
		model.addAttribute("eventData", convert(lst));

		ModelAndView model1 = new ModelAndView();

		model1.setViewName("calendar");

		return model1;

	}


	@RequestMapping(value= "/calendarAdd", method = RequestMethod.POST)
	public String addEvent(@ModelAttribute("calendar") CalendarBean bean,
			RedirectAttributes redirectAttrs,HttpServletRequest request) {
		AdminModuleDao dao=Beans.adminModuleDao;
		NotificationsLog.insertlog("0", "assets/images/calendarIcon.png", "New Calendar Event", "A new event has been added to this date in Calendar, So check the Event Calendar once.");
		boolean res=	dao.insertValues(bean);
		if(res){
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message(AuditLog.userActivity("Added new event information in calandar.",request),true));
			dao.close();
		}else{
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("Event Adding is Failed,Try Again.",false));
		}

		return "redirect:/calendar.htm";

	}

	public String convert(List<Map<String, Object>> list)
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
