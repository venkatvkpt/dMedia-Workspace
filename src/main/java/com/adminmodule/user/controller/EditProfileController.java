package com.adminmodule.user.controller;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.adminmodule.dao.AdminModuleDao;
import com.adminmodule.user.bean.EditProfileBean;
import com.adminmodule.user.bean.PasswordChangeLogEntity;
import com.commons.MessageDispatcher;
import com.spring.beans.Beans;


@Controller
public class EditProfileController {
	
		@RequestMapping(value = "/editProfile", method = RequestMethod.GET)
		public ModelAndView listPersons(Model model, HttpServletRequest request) {
			AdminModuleDao dao=Beans.adminModuleDao;
			JdbcTemplate temp =dao.getJdbcTemplate();
			Object serial_no =request.getSession().getAttribute("user_Id");
			String sql="SELECT * FROM(SELECT 407 AS TEMP,USER_SERIAL_NO,initcap(FIRST_NAME) as FIRST_NAME,initcap(LAST_NAME) as LAST_NAME,lower(EMAIL_ID) as email,PHONE_NUMBER, "+
				" initcap(ADDRESS) as address,initcap(CITY) as city,POST_NAME, NVL(TO_CHAR(LOGIN_TIME,'DD-Mon-YY  HH:MI AM'),'N/A') AS LOGIN_DATE ,ROLE_NAME,GENDER,IMAGE_NAME,USER_NAME FROM USER_PROFILE "+
				" JOIN(SELECT initcap(MP.POST_NAME) as POST_NAME,MUP.USER_SERIAL_NO FROM MST_POSTS MP ,MAP_USER_POST MUP WHERE MP.POST_ID=MUP.POST_ID) USING(USER_SERIAL_NO) "+
				" JOIN(SELECT initcap(MR.ROLE_NAME) as ROLE_NAME,MUR.USER_SERIAL_NO FROM  MST_ROLES MR ,MAP_USER_ROLE MUR WHERE MR.ROLE_ID=MUR.ROLE_ID) USING(USER_SERIAL_NO) "+
				" LEFT JOIN(SELECT LOGIN_TIME,USER_SERIAL_NO FROM (SELECT LOGIN_TIME,USER_SERIAL_NO,  row_number() over (order by LOGIN_TIME desc) as row_num FROM USER_LOGIN_INFOLOG) t WHERE row_num = 2 )USING(USER_SERIAL_NO) "+
				" WHERE USER_SERIAL_NO= "+serial_no+") RIGHT JOIN(SELECT 407 AS TEMP FROM DUAL)USING(TEMP)";
				
			EditProfileBean bean=new EditProfileBean();
			model.addAttribute("bean", bean);
						
			List<Map<String, Object>> lst=temp.queryForList(sql);	
			String ql="SELECT * FROM(SELECT CASE  WHEN TO_CHAR(LOG_DATE,'DD/MM/YYYY') IN TO_CHAR(SYSDATE,'DD/MM/YYYY')" +
			" THEN TO_CHAR(LOG_DATE,'HH:MI AM')  ELSE TO_CHAR(TO_DATE(LOG_DATE,'DD/MM/YYYY'),'Dy, DD Mon') END AS LOGDATE" +
			",ACTIVITY_DESCRIPTION FROM AUDIT_ACTIVITY_LOG WHERE USER_SERIAL_NO= '"+serial_no+"' ORDER BY LOG_DATE DESC,LOG_ID)WHERE ROWNUM <= 14";
			model.addAttribute("userActivity",temp.queryForList(ql) );
			model.addAttribute("listProfile", lst);

			ModelAndView model1 = new ModelAndView();
		      model1.setViewName("editProfile");
			return model1;
		}
		
		//For add and update person both
		@RequestMapping(value= "/editProfile_imageUpload", method = RequestMethod.POST)
		public String addServices(@ModelAttribute("bean" ) EditProfileBean bean,Model model,HttpServletRequest req,HttpServletResponse res,RedirectAttributes redirectAttrs){
			HttpSession session =req.getSession();			
			AdminModuleDao dao=Beans.adminModuleDao;
		
			String userId=(String) session.getAttribute("user_Id");
			 String userName=(String) session.getAttribute("user_Name");
			 String imageName=userId+".png";
			 CommonsMultipartFile file =bean.getFileData();
			if (!file.isEmpty()) {
				try {
					byte[] bytes = file.getBytes();

					// Creating the directory to store file
					final String rootPath = System.getProperty("catalina.home");
					final File dir = new File(rootPath + File.separator + "webapps\\ProfileImages");
					if (!dir.exists())
						dir.mkdirs();

					// Create the file on server
					File serverFile = new File(dir.getAbsolutePath()+ File.separator + imageName );
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();
					
					res.setHeader("Cache-Control","no-cache"); 
		             res.setHeader("Cache-Control","no-store"); 
		             res.setDateHeader("Expires", 0); 
		             res.setHeader("Pragma","no-cache"); 

				} catch (Exception e) {					
				}
			}
			try {
				if (bean.getPasswordCheck().equalsIgnoreCase("on")) {
					String sql = "SELECT 'VALUE' AS VAL FROM PasswordChangeLogEntity WHERE userserial="
							+ userId;
					String Oldpass = (String) dao.lastValue("SELECT password FROM CreateUsersBean WHERE serial_no="+ userId);
					PasswordChangeLogEntity entity = new PasswordChangeLogEntity();
					entity.setUserserial(Integer.parseInt(userId));
					entity.setNewpassword(bean.getPassword());
					entity.setOldpassword(Oldpass);

					String update = "UPDATE PasswordChangeLogEntity SET oldpassword='"+ Oldpass	+ "',newpassword='"+ bean.getPassword()+ "'"+ ",changedate=SYSDATE WHERE userserial="+ userId;
					Object test = "";
					try {
						test = dao.lastValue(sql);
						if (test.equals("VALUE")) {
							dao.updateValues(update);
						}
					} catch (Exception e) {
						dao.insertValues(entity);
					}
					String hqlm="UPDATE MST_USERS  SET  PASSWORD='"+bean.getPassword()+"',  PASSWORD_CHANGED_DATE=SYSDATE WHERE USER_SERIAL_NO="+userId;
					dao.updateBySql(hqlm);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			String hql="UPDATE EditProfileBean  SET  address='"+bean.getAddress()+"', city='"+bean.getCity()+"', email_id='"+bean.getEmail_id()+"', " +
						"first_name='"+bean.getFirst_name()+"', gender='"+bean.getGender()+"', image_name='"+imageName+"', last_name='"+bean.getLast_name()+"'," +
						"phone_number='"+bean.getPhone_number()+"', user_name='"+userName+"',user_id="+userId+" WHERE user_serial_no="+userId;

			int reslt =dao.updateValues(hql);
			
			if(reslt >0){

				redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message(AuditLog.userActivity("Edited your profile information.",req),true));
				dao.close();
			}else{
				redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("Profile edting is Failed,Try Again.",false));
			}
			
		       
			
			return "redirect:/editProfile.htm";
			
		}
		

	
}
