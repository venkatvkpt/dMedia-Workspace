package com.reports.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.adminmodule.dao.AdminModuleDao;
import com.adminmodule.user.controller.AuditLog;
import com.commons.MessageDispatcher;
import com.dmedia.entity.NewsBean;
import com.reports.dao.ReportsModuleDao;
import com.reports.entity.PublishedNewsReportBean;
import com.reports.entity.PublishedNewsReportEntity;
import com.spring.beans.Beans;

@Controller
public class PublishedNewsReportController {

	/* It provides list of employees in model object */
	@RequestMapping("/publishedNewsReport")
	public ModelAndView viewPublishedNews(Model model) {

		PublishedNewsReportBean bean = new PublishedNewsReportBean();
		model.addAttribute("publish", bean);

		ModelAndView model1 = new ModelAndView();
		model1.setViewName("publishedNewsReport");
		return model1;
	}

	@RequestMapping(value = "/publishedNewsShow", method = RequestMethod.POST)
	public String dropServiceMAp(@ModelAttribute("publish") PublishedNewsReportBean bean,RedirectAttributes redirectAttrs)
			throws UnsupportedEncodingException {
		ReportsModuleDao dao = Beans.reportsModuleDao;
		String table = bean.getType() + "_" + bean.getLanguage();
		List<PublishedNewsReportEntity> data = dao.retrieveNews(table);
		
		redirectAttrs.addFlashAttribute("dbTable", table);
		redirectAttrs.addFlashAttribute("title", setTitleFor(bean.getType(),bean.getLanguage()));
		redirectAttrs.addFlashAttribute("news", data);
		return "redirect:/publishedNewsReport.htm";
	}

	/* delete news */

	@ResponseBody
	@RequestMapping(value = "/deletePublishNewsById/{newsCode}/{dbTable}")
	public Object getSearchResultViaAjaxLatestNewsToDelete(
			@PathVariable String newsCode, @PathVariable String dbTable) {

		ReportsModuleDao dao = Beans.reportsModuleDao;
		return dao.deletePublishNews(dbTable, newsCode);
	}

	public static String setTitleFor(String type, String lang) {
		String basha = "";
		if (lang.contains("UR")) {
			basha = " in Urdu Language";
		} else if (lang.contains("TE")) {
			basha = " in Telugu Language";
		} else if (lang.contains("HI")) {
			basha = " in Hindi Language";
		} else if (lang.contains("EN")) {
			basha = " in English Language";
		}

		if (type.contains("NEWS_LATEST")) {
			return "Latest News Published Articles" + basha;
		} else if (type.contains("NEWS_ENTERTAINMENT")) {
			return "Entertainment News Published Articles" + basha;
		} else if (type.contains("NEWS_SPORTS")) {
			return "Sports News Published Articles" + basha;
		} else if (type.contains("NEWS_BUSINESS")) {
			return "Business News Published Articles" + basha;
		} else if (type.contains("NEWS_EDU_EMP")) {
			return "Education/Employment News Published Articles" + basha;
		} else if (type.contains("NEWS_FAMILY")) {
			return "Family/Health News Published Articles" + basha;
		} else {
			return "";
		}
	}

}