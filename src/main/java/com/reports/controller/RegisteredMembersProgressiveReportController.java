package com.reports.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.adminmodule.dao.AjaxControllerDao;
import com.reports.dao.ReportsModuleDao;
import com.reports.entity.RegisteredMembersProgressiveReportBean;
import com.spring.beans.Beans;

@Controller
public class RegisteredMembersProgressiveReportController {

	/* It provides list of employees in model object */
	@RequestMapping("/regMemProgressiveReport")
	public ModelAndView viewRegisteredMembers() {
		System.out.println("HI");
		ReportsModuleDao dao = Beans.reportsModuleDao;// will inject dao from
		// xml file
		List<RegisteredMembersProgressiveReportBean> list = dao
				.retrieveRegisteredMembers();
		return new ModelAndView("regMemProgressiveReport", "list", list);
	}

	@ResponseBody
	@RequestMapping(value = "/getAssemblyWise/{districtId}")
	public String getSearchResultViaAjaxAssembly(@PathVariable String districtId) {
		
		ReportsModuleDao dao = Beans.reportsModuleDao;
		
		
		return dao.retrieveRegisteredMembersAssembly(districtId).toString();

	}
	
	@ResponseBody
	@RequestMapping(value = "/getMandalWise/{assemblyId}")
	public String getSearchResultViaAjaxMandal(@PathVariable String assemblyId) {
		
		ReportsModuleDao dao = Beans.reportsModuleDao;
		
		
		return dao.retrieveRegisteredMembersMandal(assemblyId).toString();

	}
	
	@ResponseBody
	@RequestMapping(value = "/getPanchayatiWise/{mandalId}")
	public String getSearchResultViaAjaxPanchayati(@PathVariable String mandalId) {
		
		ReportsModuleDao dao = Beans.reportsModuleDao;
		
		
		return dao.retrieveRegisteredMembersPanchayati(mandalId).toString();

	}
	
	@ResponseBody
	@RequestMapping(value = "/getPolingStationWise/{panchayatiId}")
	public String getSearchResultViaAjaxPolingStation(@PathVariable String panchayatiId) {
		
		ReportsModuleDao dao = Beans.reportsModuleDao;
				
		return dao.retrieveRegisteredMembersPolingStation(panchayatiId).toString();

	}
	
	@ResponseBody
	@RequestMapping(value = "/getPolingStationWiseDetails/{polingStationId}")
	public String getSearchResultViaAjaxPolingStationPolingStationWiseDetails(@PathVariable String polingStationId) {
		
		ReportsModuleDao dao = Beans.reportsModuleDao;
				
		return dao.retrieveRegisteredMembersPolingStationDetails(polingStationId).toString();

	}

}