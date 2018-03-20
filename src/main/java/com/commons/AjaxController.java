package com.commons;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adminmodule.dao.AjaxControllerDao;
import com.dmedia.dao.DMediaModuleDao;
import com.spring.beans.Beans;
@Controller
@RequestMapping("ajaxController")
public class AjaxController {
	
// start:Dynamic Menu for Navigation Bar
	@RequestMapping(value="menu/{parent_Id}/{role_Id}",  method = RequestMethod.GET)
	@ResponseBody
	public String menu(@PathVariable("parent_Id") String parent_Id, @PathVariable("role_Id") String role_Id,HttpServletRequest req){
		ApplicationContext appContext = new ClassPathXmlApplicationContext("classpath:spring-database.xml");	
		AjaxControllerDao dao=(AjaxControllerDao)appContext.getBean("AjaxJdbcTemplate");
		
		String user_Id=(String) req.getSession().getAttribute("user_Id");
		role_Id =(String) req.getSession().getAttribute("role_Id");

		List<Map<String, Object>> myList = dao.getSubMenuServices(parent_Id, role_Id, user_Id);
		ArrayList<String> newList = new ArrayList<String>();
		for (int i = 0; i < myList.size(); i++) {
			   if(myList.get(i).get("SERVICE_LINK").equals("#")){
				   
				  newList.add( " <li onmouseover='getSubMenu("+myList.get(i).get("SERVICE_ID")+","+role_Id+");'><a href='javascript:;'>"
				   	+ "<span>"+myList.get(i).get("SERVICE_NAME")+"</span> <i class='icon-arrow'></i></a><ul class='sub-menu' id='"+myList.get(i).get("SERVICE_ID")+"'></ul>  ");
				   
				   
			   }else if(!(myList.get(i).get("SERVICE_LINK").equals("#"))){
				   newList.add( " <li><a href="+myList.get(i).get("SERVICE_LINK")+">"+myList.get(i).get("SERVICE_NAME")+"</a></li>  ");
			   }		
		}

		return(new JSONArray(newList).toString());
	}
	@RequestMapping(value="subMenu/{parent_Id}/{role_Id}",  method = RequestMethod.GET)
	@ResponseBody
	public String subMenu(@PathVariable("parent_Id") String parent_Id, @PathVariable("role_Id") String role_Id,HttpServletRequest req){
		ApplicationContext appContext = new ClassPathXmlApplicationContext("classpath:spring-database.xml");	
		AjaxControllerDao dao=(AjaxControllerDao)appContext.getBean("AjaxJdbcTemplate");

		String user_Id=(String) req.getSession().getAttribute("user_Id");
		role_Id =(String) req.getSession().getAttribute("role_Id");
		List<Map<String, Object>> myList = dao.getSubMenuServices(parent_Id, role_Id, user_Id);
		ArrayList<String> newList = new ArrayList<String>();
		for (int i = 0; i < myList.size(); i++) {
			   if(myList.get(i).get("SERVICE_LINK").equals("#")){
				   
				  newList.add( " <li onmouseover='getSubMenu("+myList.get(i).get("SERVICE_ID")+",'"+role_Id+"');'><a href='javascript:;'>"
				   	+ "<span>"+myList.get(i).get("SERVICE_NAME")+"</span> <i class='icon-arrow'></i></a><ul class='sub-menu' id='"+myList.get(i).get("SERVICE_ID")+"'></ul>  ");
				   
				   
			   }else if(!(myList.get(i).get("SERVICE_LINK").equals("#"))){
				   newList.add( " <li><a href="+myList.get(i).get("SERVICE_LINK")+">"+myList.get(i).get("SERVICE_NAME")+"</a></li>  ");
			   }		
		}

		
		return(new JSONArray(newList).toString());
	}
// end: Dynamic Menu for Navigation Bar

// start: Create Service Page	
	@RequestMapping(value="editServices/{serviceId}",  method = RequestMethod.GET)
	@ResponseBody
	public String editServices(@PathVariable("serviceId") String serviceId) throws JSONException{
		ApplicationContext appContext = new ClassPathXmlApplicationContext("classpath:spring-database.xml");	
		AjaxControllerDao dao=(AjaxControllerDao)appContext.getBean("AjaxJdbcTemplate");
		List<Map<String, Object>> myList = dao.editData("SELECT SERVICE_ID,SERVICE_NAME,SERVICE_LINK,PARENT_ID,DISPLAY_ORDER FROM MST_SERVICE WHERE SERVICE_ID="+serviceId);	
		JSONObject js= new JSONObject(myList.get(0));
		return "["+js.toString()+"]";
	}
	@RequestMapping(value="displayOrder/{parentId}",  method = RequestMethod.GET)
	@ResponseBody
	public String displayOrder(@PathVariable("parentId") String parentId) throws JSONException{
		ApplicationContext appContext = new ClassPathXmlApplicationContext("classpath:spring-database.xml");	
		AjaxControllerDao dao=(AjaxControllerDao)appContext.getBean("AjaxJdbcTemplate");
		String sql="SELECT NVL(MAX(DISPLAY_ORDER)+1,1) AS ORDERS FROM MST_SERVICE WHERE PARENT_ID="+parentId;
		return dao.stringSingleValue(sql);
	}
// end: Create Service Page	
	
// start: Create Roles Page	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="editRoles/{roleId}",  method = RequestMethod.GET)
	@ResponseBody
	public String editRoles(@PathVariable("roleId") String roleId) throws JSONException{
		ApplicationContext appContext = new ClassPathXmlApplicationContext("classpath:spring-database.xml");	
		AjaxControllerDao dao=(AjaxControllerDao)appContext.getBean("AjaxJdbcTemplate");
		String sql="SELECT R.ROLE_ID,R.ROLE_NAME,P.POST_NAME FROM MST_POSTS P JOIN MST_ROLES R ON P.ROLE_ID=R.ROLE_ID WHERE R.ROLE_ID="+roleId;
		List<Map<String, Object>> myList = dao.editData(sql);
		JSONObject result = new JSONObject();
	    JSONObject posts= new JSONObject(); 
		int i=0;
		for (Map m:myList){
			 posts.put("post_name"+i, m.get("POST_NAME"));
			 i++;
			 result.put("role_name", m.get("ROLE_NAME"));
			  result.put("role_id", m.get("ROLE_ID"));
		}
		 
	    result.put("posts", posts);

		return "["+result.toString()+"]";
	}
// end: Create Roles Page
	
// start: Create User Page	
	@RequestMapping(value="postsList/{roleId}",  method = RequestMethod.GET)
	@ResponseBody
	public String postsList(@PathVariable("roleId") String roleId) throws JSONException{
		ApplicationContext appContext = new ClassPathXmlApplicationContext("classpath:spring-database.xml");	
		AjaxControllerDao dao=(AjaxControllerDao)appContext.getBean("AjaxJdbcTemplate");
		String sql="SELECT POST_ID,POST_NAME FROM MST_POSTS WHERE ROLE_ID="+roleId;
		
		return dao.getSelectBoxonHTML(sql);
	}
	
	
	@RequestMapping(value="editusers/{userId}",  method = RequestMethod.GET)
	@ResponseBody
	public String editUser(@PathVariable("userId") String userId) throws JSONException{
		ApplicationContext appContext = new ClassPathXmlApplicationContext("classpath:spring-database.xml");	
		AjaxControllerDao dao=(AjaxControllerDao)appContext.getBean("AjaxJdbcTemplate");
		List<Map<String, Object>> myList = dao.editData("SELECT U.USER_SERIAL_NO,U.USER_NAME,U.USER_LOGIN_NAME,P.POST_ID,R.ROLE_ID,MP.POST_NAME" +
				" FROM MST_USERS U,MAP_USER_POST P,MAP_USER_ROLE R,MST_POSTS MP WHERE U.USER_SERIAL_NO =P.USER_SERIAL_NO AND U.USER_SERIAL_NO = R.USER_SERIAL_NO AND P.POST_ID=MP.POST_ID AND U.USER_SERIAL_NO="+userId);	
		JSONObject js= new JSONObject(myList.get(0));
		return "["+js.toString()+"]";
	}	
	
// end: Create User Page
	
	
	@RequestMapping(value="districtsList/{state}",  method = RequestMethod.GET)
	@ResponseBody
	public String districtsList(@PathVariable("state") String state) throws JSONException{
		DMediaModuleDao dao=Beans.dMediaModuleDao;
		String sql="SELECT DISTRICT_CODE,DISTRICT_NAME FROM MST_DISTRICT where STATE_CODE="+state+" ORDER BY DISTRICT_NAME";		
		return dao.getSelectBoxonHTML(sql);
	}
	
	@RequestMapping(value="assemblyList/{district}",  method = RequestMethod.GET)
	@ResponseBody
	public String assemblyList(@PathVariable("district") String district) throws JSONException{
		DMediaModuleDao dao=Beans.dMediaModuleDao;
		String sql="SELECT ASSEMBLY_CODE,ASSEMBLY_NAME FROM DMEDIA.MST_ASSEMBLY where DISTRICT_CODE="+district+" order by ASSEMBLY_NAME";		
		return dao.getSelectBoxonHTML(sql);
	}
		@RequestMapping(value="mandalList/{assembly}",  method = RequestMethod.GET)
	@ResponseBody
	public String mandalList(@PathVariable("assembly") String assembly) throws JSONException{
		DMediaModuleDao dao=Beans.dMediaModuleDao;
		String sql="SELECT MANDAL_CODE,MANDAL_NAME FROM DMEDIA.MST_MANDAL where ASSEMBLY_CODE="+assembly+" order by MANDAL_NAME";		
		return dao.getSelectBoxonHTML(sql);
	}	
		
	@RequestMapping(value="villageList/{mandal}",  method = RequestMethod.GET)
	@ResponseBody
	public String villageList(@PathVariable("mandal") String mandal) throws JSONException{
		DMediaModuleDao dao=Beans.dMediaModuleDao;
		String sql="SELECT PANCHAYATI_CODE,PANCHAYATI_NAME FROM DMEDIA.MST_PANCHAYATI where MANDAL_CODE="+mandal+" order by PANCHAYATI_NAME";		
		return dao.getSelectBoxonHTML(sql);
	}
}//end: AjaxController.Class
