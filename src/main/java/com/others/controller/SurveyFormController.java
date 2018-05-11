package com.others.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.adminmodule.user.controller.AuditLog;
import com.commons.MessageDispatcher;
import com.dmedia.dao.DMediaModuleDao;
import com.dmedia.entity.NewsBean;
import com.dmedia.utils.ImageUpload;
import com.others.dao.OthersModuleDao;
import com.others.entity.SurveyFormBean;
import com.reports.dao.ReportsModuleDao;
import com.spring.beans.Beans;

@Controller
public class SurveyFormController {

	@RequestMapping(value = "/survey", method = RequestMethod.GET)
	public ModelAndView survey(Model model) {
		SurveyFormBean bean = new SurveyFormBean();
		model.addAttribute("survey", bean);
		return new ModelAndView("survey");
	}

	@RequestMapping(value = "/addSurveyQuestion", method = RequestMethod.POST)
	public String addSuveyQuestion(Map<String, Object> map,
			@ModelAttribute("survey") SurveyFormBean bean, ModelMap model,
			HttpServletRequest req, HttpServletResponse res,
			RedirectAttributes redirectAttrs) throws IOException {
		
	System.out.println("hello");
		OthersModuleDao dao = Beans.othersModuleDao;

		bean.setSurvey_id(dao.getSurveySeqValue("SURVEY_APPLICATION"));
		
		String sql = "INSERT INTO SURVEY_APPLICATION(SURVEY_ID, QUESTION, CREATED_DATE, RELEASED_DATE, EXPIRY_DATE, LANGUAGE, SOURCE) "+
					"  VALUES(?,?,SYSDATE,? ,? , ?, ?)";
				
		String sql2 = 	" INSERT INTO DMEDIA.SURVEY_APPLICATION_RESULT(SURVEY_ID, OPTION_ID, OPTION_NAME, RESULT, CREATED_DATE, " +
						" RELEASE_DATE, EXPIRY_DATE, LANGUAGE, SOURCE) "+
          				" VALUES(?, ?, ?, 0, SYSDATE, ?,?, ?, ?)";

		boolean option1=dao.insertServeyOptions(sql2,bean,bean.getOption1());
		boolean option2=dao.insertServeyOptions(sql2,bean,bean.getOption2());
		boolean option3=dao.insertServeyOptions(sql2,bean,bean.getOption3());
		boolean option4=dao.insertServeyOptions(sql2,bean,bean.getOption4());
		
		if (dao.insertServeyQuestion(sql,bean)) {
			if (option1==true && option2==true && option3==true && option4==true) {
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher
					.message(AuditLog.userActivity(
							"Survey Question is Submitted.", req), true));

		}} else {
			redirectAttrs
					.addFlashAttribute(
							"messenger",
							MessageDispatcher
									.message(
											"Survey Question Submission is Failed,Try Again.",
											false));
		}

		return "redirect:/survey.htm";
	}
	
	
	   @RequestMapping(value = "/getPoll", method = RequestMethod.GET)
	   public String redirect() {
	      return "redirect:surveyPoll.htm";
	   }
	   
	   @RequestMapping(value = "/surveyPoll", method = RequestMethod.GET)
		public ModelAndView surveyPoll(Model model) {
			
			return new ModelAndView("surveyPoll");
		}

}
