package com.adminmodule.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		
		ModelAndView model = new ModelAndView();
		model.setViewName("access");
		return model;

	}
	@RequestMapping(value = { "/", "/invalidAccess**" }, method = RequestMethod.GET)
	public ModelAndView invalidPage() {
		
		ModelAndView model = new ModelAndView();
		model.setViewName("invalidAccess");
		return model;

	}
}
