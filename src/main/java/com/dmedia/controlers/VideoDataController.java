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
import com.dmedia.entity.VideoDataBean;
import com.dmedia.utils.ImageUpload;
import com.spring.beans.Beans;

@Controller
public class VideoDataController {
	@RequestMapping(value = "/videos", method = RequestMethod.GET)
	public ModelAndView execute(Model model) {
		VideoDataBean bean = new VideoDataBean();
		model.addAttribute("video", bean);
		model.addAttribute("StatesList", bean.getStatesList());
		return new ModelAndView("videos");
	}
	
	@RequestMapping(value = "/addVideoData", method = RequestMethod.POST)
	public String addLatestNews(Map<String, Object> map,
			@ModelAttribute("video") VideoDataBean bean, ModelMap model,
			HttpServletRequest req, HttpServletResponse res,
			RedirectAttributes redirectAttrs) throws IOException {
		DMediaModuleDao dao = Beans.dMediaModuleDao;
		String table = "VIDEO_INFO_EN";

		if (bean.getLanguage().equalsIgnoreCase("te")) {
			table = "VIDEO_INFO_TE";
		} else if (bean.getLanguage().equalsIgnoreCase("hi")) {
			table = "VIDEO_INFO_HI";
		} else if (bean.getLanguage().equalsIgnoreCase("ur")) {
			table = "VIDEO_INFO_UR";
		} else {
			table = "VIDEO_INFO_EN";
		}

		bean.setTitle(URLDecoder.decode(bean.getTitle(), "UTF-8"));
		

		String sql = "INSERT INTO  "+table+"(VIDEO_ID, YOUTUBE_CODE, VIDEO_TITLE, VIDEO_DURATION, NO_OF_VIEWED," +
				" STATE_ID, DISTRICT_ID, LOKSABHA_ID, ASSEMBLY_ID, MANDAL_ID, VILLAGE_ID, CREATED_DATE, CREATED_BY, PARTY_ID) "+
    " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, ?, ?)";

		if (dao.insertValuesVideos(sql,table,bean)) {
			if(bean.getNotification().equalsIgnoreCase("true")){
				
				//dao.insertValuesNotification(bean);
			}

			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher
					.message(AuditLog.userActivity(
							"New Latest News Article Submited.", req), true));

		} else {
			redirectAttrs
					.addFlashAttribute(
							"messenger",
							MessageDispatcher
									.message(
											"Latest News Article Submission is Failed,Try Again.",
											false));
		}
		redirectAttrs.addFlashAttribute("messenger", MessageDispatcher
				.message(AuditLog.userActivity(
						"New Latest News Article Submited.", req), true));
		return "redirect:/videos.htm";
	}

}
