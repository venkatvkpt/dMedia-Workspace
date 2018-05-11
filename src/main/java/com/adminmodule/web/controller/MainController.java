package com.adminmodule.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.commons.WelcomeStatistics;

@Controller
public class MainController {

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		
		ModelAndView model = new ModelAndView();
		getDashboardInfo(model);
		model.setViewName("access");
		return model;

	}
	@RequestMapping(value = { "/", "/invalidAccess**" }, method = RequestMethod.GET)
	public ModelAndView invalidPage() {
		
		ModelAndView model = new ModelAndView();
		model.setViewName("invalidAccess");
		return model;

	}
	
	private void getDashboardInfo(ModelAndView model) {
		WelcomeStatistics welcome = new WelcomeStatistics();
		model.addObject("viewsData", "");
		model.addObject("memberCount", welcome.getRegisterMembersCount());
		model.addObject("dstPercent", welcome.getRegisterMembersPercent());

	}
}
