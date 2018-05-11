package com.others.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dmedia.entity.PoliticiansBean;
import com.others.entity.AdvertisementFormBean;
import com.others.entity.SurveyFormBean;

@Repository
public class OthersModuleDao {
	
	
	/*Jdbc Connection Template*/
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	/*Hibernate Connection Annotations*/
	@Autowired
	public SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	public boolean insertServeyQuestion(String sql,SurveyFormBean bean){
			
		int i =jdbcTemplate.update(sql,new Object[]{bean.getSurvey_id(),bean.getQuestion(),bean.getReleaseDate(),
													bean.getExpiryDate(),bean.getLanguage(),bean.getSource()});
		
		if(i>0){
			return true;
		}else{
			return false;	
		}	
	}
		public boolean insertServeyOptions(String sql,SurveyFormBean bean,String option){
			
			String seq=jdbcTemplate.queryForObject("SELECT NVL(MAX(OPTION_ID),0)+1 AS SEQ FROM SURVEY_APPLICATION_RESULT",  String.class);
			
		int i =jdbcTemplate.update(sql,new Object[]{bean.getSurvey_id(),seq,option,bean.getReleaseDate(),
													bean.getExpiryDate(),bean.getLanguage(),bean.getSource()});
		
		if(i>0){
			return true;
		}else{
			return false;	
		}	
	}

	public String getSurveySeqValue(String table){
		String count ="1";
		String sql="SELECT NVL(MAX(SURVEY_ID),0)+1 AS SEQ FROM "+table.toUpperCase();
		try{
			count = jdbcTemplate.queryForObject(sql,String.class);
		}catch(Exception e){
			count ="1";
		}
		return 	count;
	}
	
	public String getAdvertisementSeqValue(String table){
		String count ="1";
		String sql="SELECT NVL(MAX(ADVERTISEMENT_ID),0)+1 AS SEQ FROM "+table.toUpperCase();
		try{
			count = jdbcTemplate.queryForObject(sql,String.class);
		}catch(Exception e){
			count ="1";
		}
		return 	count;
	}
	

	public boolean insertAdvertisement(String sql,AdvertisementFormBean bean){
		int i=0;
		try{
		 i =jdbcTemplate.update(sql,new Object[]{bean.getAdvertisement_id(),bean.getReleaseDate(),bean.getExpiryDate(),
													bean.getImagepath()});
		}catch(Exception e){
			e.printStackTrace();
		}
		if(i>0){
			return true;
		}else{
			return false;	
		}	
	}

	//For Dashboard and all
	public List<Map<String, Object>> getListValues(String sql) {
		List<Map<String, Object>> lst =null;
		try {		
			 lst = getJdbcTemplate().queryForList(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lst;		
	}
	//For Registered Members Count for Dashboard
	public String getRegMembersCountValue(){
		String count ="0";
		String sql="SELECT COUNT(*) AS REGCOUNT FROM REGISTERED_MEMBERS ";
		try{
			count = jdbcTemplate.queryForObject(sql,String.class);
		}catch(Exception e){
			count ="0";
		}
		return 	count;
	}

}
