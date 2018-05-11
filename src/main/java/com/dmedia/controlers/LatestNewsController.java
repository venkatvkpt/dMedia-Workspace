package com.dmedia.controlers;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.adminmodule.user.controller.AuditLog;
import com.commons.MessageDispatcher;
import com.dmedia.dao.DMediaModuleDao;
import com.dmedia.entity.NewsBean;
import com.dmedia.utils.ImageUpload;
import com.dmedia.utils.NotificationSender;
import com.spring.beans.Beans;

@Controller
public class LatestNewsController {

	@RequestMapping(value = "/latestnews", method = RequestMethod.GET)
	public ModelAndView latestNews(Model model) {
		NewsBean bean = new NewsBean();
		model.addAttribute("news", bean);
		model.addAttribute("StatesList", bean.getStatesList());
		return new ModelAndView("latestnews");
	}

	@RequestMapping(value = "/addLatestNews", method = RequestMethod.POST)
	public String addLatestNews(Map<String, Object> map,
			@ModelAttribute("news") NewsBean bean, ModelMap model,
			HttpServletRequest req, HttpServletResponse res,
			RedirectAttributes redirectAttrs) throws IOException {
		DMediaModuleDao dao = Beans.dMediaModuleDao;
		String table = "NEWS_LATEST_EN";

		if (bean.getLanguage().equalsIgnoreCase("te")) {
			table = "NEWS_LATEST_TE";
		} else if (bean.getLanguage().equalsIgnoreCase("hi")) {
			table = "NEWS_LATEST_HI";
		} else if (bean.getLanguage().equalsIgnoreCase("ur")) {
			table = "NEWS_LATEST_UR";
		} else {
			table = "NEWS_LATEST_EN";
		}
		bean.setNews_id(dao.getNewsSeqValue(table));
		bean.setImagepath(ImageUpload.uploadImage(bean.getImage(), "ln"));
		String title = bean.getTitle();
		
		bean.setTitle(URLDecoder.decode(bean.getTitle(), "UTF-8"));
		bean.setDiscription(URLDecoder.decode(bean.getDiscription(), "UTF-8"));

		String sql = "INSERT INTO "
				+ table
				+ "(NEWS_ID, LANGUAGE_ID, NEWS_HEADLINE, NEWS_CONTENT, IMAGE_PATH, "
				+ "NO_OF_VIEWED, VIEWED_LOCATION, STATE_ID, DISTRICT_ID, LOKSABHA_ID, ASSEMBLY_ID, MANDAL_ID, VILLAGE_ID,"
				+ " CREATED_DATE, CREATED_BY, SOURCE_OF_NEWS, RECEIPT_NO, PARTY_ID) "
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		if (dao.insertValuesNews(sql,bean)) {
			if(bean.getNotification().equalsIgnoreCase("true")){
				
				NotificationSender.make(bean, title, "LN");
			}

			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher
					.message(AuditLog.userActivity(
							"New Latest News Article Submitted.", req), true));

		} else {
			redirectAttrs
					.addFlashAttribute(
							"messenger",
							MessageDispatcher
									.message(
											"Latest News Article Submission is Failed,Try Again.",
											false));
		}

		return "redirect:/latestnews.htm";
	}

}
