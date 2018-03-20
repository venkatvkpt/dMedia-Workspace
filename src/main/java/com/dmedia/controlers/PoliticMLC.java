package com.dmedia.controlers;

import java.io.IOException;
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
import com.dmedia.entity.PoliticiansBean;
import com.dmedia.utils.ImageUpload;
import com.dmedia.utils.UTFTranslator;
import com.spring.beans.Beans;
@Controller
public class PoliticMLC {
	@RequestMapping(value = "/mlc", method = RequestMethod.GET)
	public ModelAndView execute(Model model) {
		PoliticiansBean bean = new PoliticiansBean();
		model.addAttribute("politics", bean);
		return new ModelAndView("mlc");
	}
@RequestMapping(value = "/addMLC", method = RequestMethod.POST)
	public String addLatestNews(Map<String, Object> map,
			@ModelAttribute("politics") PoliticiansBean bean, ModelMap model,
			HttpServletRequest req, HttpServletResponse res,
			RedirectAttributes redirectAttrs) throws IOException {
		String table= "POLITICS_MLC";
		boolean checkEn,checkTe,checkHi,checkUr;
		bean.setImgPath(ImageUpload.uploadImage(bean.getImage(), "pt\\mlc"));
		bean.setCreatedBy("dMedia");
		DMediaModuleDao dao = Beans.dMediaModuleDao;
		
		checkEn=dao.insertValuesPolitics(table, "en", bean.getNameEn(), bean.getLocationEn(), bean.getPostEn(),  bean);
		checkTe=dao.insertValuesPolitics(table, "te",
				UTFTranslator.decodeUTF(bean.getNameTe()), UTFTranslator.decodeUTF(bean.getLocationTe()),
				UTFTranslator.decodeUTF(bean.getPostTe()), bean);
		checkHi=dao.insertValuesPolitics(table, "hi",
				UTFTranslator.decodeUTF(bean.getNameHi()), UTFTranslator.decodeUTF(bean.getLocationHi()),
				UTFTranslator.decodeUTF(bean.getPostHi()), bean);
		checkUr=dao.insertValuesPolitics(table, "ur",
				UTFTranslator.decodeUTF(bean.getNameUr()), UTFTranslator.decodeUTF(bean.getLocationUr()),
				UTFTranslator.decodeUTF(bean.getPostUr()), bean);
		
		if(checkEn && checkTe && checkHi && checkUr){
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher
					.message(AuditLog.userActivity(
							"MLC Information Submitted in Different Languages.", req), true));
		}else{
			dao.deletePoliticsByImagePath(table, bean.getImgPath());
			redirectAttrs.addFlashAttribute("messenger", MessageDispatcher
					.message(AuditLog.userActivity(
							"MLC Information Submission is Failed,Try Again.", req), false));		
		}
		
		return "redirect:/mlc.htm";
		
		
	}
	
	
}
