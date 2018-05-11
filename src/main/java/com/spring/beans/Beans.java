package com.spring.beans;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.adminmodule.dao.AdminModuleDao;
import com.adminmodule.dao.AjaxControllerDao;
import com.commons.ContextData;
import com.dmedia.dao.DMediaModuleDao;
import com.others.dao.OthersModuleDao;
import com.reports.dao.ReportsModuleDao;

public class Beans {
	
	public static ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
	public static ContextData contextData = (ContextData)applicationContext.getBean("contextData");
	
	public static ApplicationContext springdatabase = new ClassPathXmlApplicationContext("classpath:spring-database.xml");	
	
	public static AdminModuleDao adminModuleDao=(AdminModuleDao) springdatabase.getBean("JdbcTemplate");	
	public static AjaxControllerDao ajaxControllerDao=(AjaxControllerDao) springdatabase.getBean("AjaxJdbcTemplate");
	
	public static DMediaModuleDao dMediaModuleDao = (DMediaModuleDao)springdatabase.getBean("dmediaJdbcTemplate");
	

	public static ReportsModuleDao reportsModuleDao = (ReportsModuleDao)springdatabase.getBean("reportsJdbcTemplate");
	
	public static OthersModuleDao othersModuleDao = (OthersModuleDao)springdatabase.getBean("othersJdbcTemplate");
	
}
