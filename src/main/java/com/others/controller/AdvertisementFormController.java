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
import com.others.entity.AdvertisementFormBean;
import com.others.entity.SurveyFormBean;
import com.reports.dao.ReportsModuleDao;
import com.spring.beans.Beans;

@Controller
public class AdvertisementFormController {

	@RequestMapping(value = "/advertisement", method = RequestMethod.GET)
	public ModelAndView advertisement(Model model) {
		AdvertisementFormBean bean = new AdvertisementFormBean();
		model.addAttribute("advertisement", bean);
		return new ModelAndView("advertisement");
	}

	@RequestMapping(value = "/addAdvertisement", method = RequestMethod.POST)
	public ModelAndView addAdvertisement(Map<String, Object> map,
			@ModelAttribute("advertisement") AdvertisementFormBean bean, ModelMap model,
			HttpServletRequest req, HttpServletResponse res,
			RedirectAttributes redirectAttrs) throws IOException {
		
		System.out.println("hello");
		
		OthersModuleDao dao = Beans.othersModuleDao;

		bean.setAdvertisement_id(dao.getAdvertisementSeqValue("ADVERTISEMENT"));
		
		bean.setImagepath(ImageUpload.uploadImage(bean.getImage(), "advertisements"));
		
		String sql = " INSERT INTO ADVERTISEMENT(ADVERTISEMENT_ID, VALID_FROM, VALID_TO, IMAGE_PATH, CREATED_DATE) "+
					 " VALUES(?,?,?,?,SYSDATE)";
		
		if (dao.insertAdvertisement(sql,bean)) {
			
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher
					.message(AuditLog.userActivity(
							"Advertisement is Submitted.", req), true));

		} else {
			redirectAttrs
					.addFlashAttribute(
							"messenger",
							MessageDispatcher
									.message(
											"Advertisement Submission is Failed,Try Again.",
											false));
		}

		model.addAttribute("advertisement", bean);
		return new ModelAndView("advertisement");
	}

}
