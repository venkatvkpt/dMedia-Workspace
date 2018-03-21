package com.dmedia.dao;

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

import com.dmedia.entity.NewsBean;
import com.dmedia.entity.PoliticiansBean;
import com.dmedia.entity.VideoDataBean;

@Repository
public class DMediaModuleDao {
	
	
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
	
	/*Hibernate Inserting using Entity Bean*/
	@Transactional
	public boolean insertValues(Object insert) {
		boolean response;
		try {

			sessionFactory.getCurrentSession().persist(insert);
			response=true;
		} catch (Exception e) {
			response=false;
			e.printStackTrace();
		}
		return response;
			
	}
	
	public boolean insertValuesNews(String sql,NewsBean bean){
			
		int i =jdbcTemplate.update(sql,new Object[]{bean.getNews_id(),bean.getLanguage(),bean.getTitle(),
				bean.getDiscription(),bean.getImagepath(),bean.getNoOfViewed(),bean.getViewedLocation(),
				bean.getState(),bean.getDistrict(),bean.getLoksaba(),bean.getAssembly(),bean.getMandal(),bean.getVillage(),
				bean.getDate(),bean.getUser(),bean.getSource(),bean.getReceipt_no(),bean.getParty()});
		if(i>0){
			return true;
		}else{
			return false;	
		}	
	}
	
	public boolean insertValuesNotification(NewsBean bean){
		/*String sql="";
		int i =jdbcTemplate.update(sql,new Object[]{bean.getNews_id(),bean.getLanguage(),bean.getTitle(),
				bean.getDiscription(),bean.getImagepath(),bean.getNoOfViewed(),bean.getViewedLocation(),
				bean.getState(),bean.getDistrict(),bean.getLoksaba(),bean.getAssembly(),bean.getMandal(),bean.getVillage(),
				bean.getDate(),bean.getUser(),bean.getSource(),bean.getReceipt_no(),bean.getParty()});
		if(i>0){
			return true;
		}else{
			return false;	
		}*/	
		System.out.println("Notification Operation ");
		return true;
	}
	
	public String getNewsSeqValue(String table){
		String count ="1";
		String sql="SELECT NVL(MAX(TO_NUMBER(NEWS_ID)),0)+1 AS SEQ FROM "+table.toUpperCase();
		try{
			count = jdbcTemplate.queryForObject(sql,String.class);
		}catch(Exception e){
			count ="1";
		}
		return 	count;
	}
	
	
	public List<Map<String, Object>> getListValues(String sql) {
		List<Map<String, Object>> lst =null;
		try {		
			 lst = getJdbcTemplate().queryForList(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lst;		
	}
	
	public boolean insertValuesVideos(String sql,String table, VideoDataBean bean) {
		String sqlIvl="SELECT NVL(MAX(TO_NUMBER(VIDEO_ID)),0)+1 AS SEQ FROM "+table;
		String videoId =jdbcTemplate.queryForObject(sqlIvl,String.class);
		
		int i =jdbcTemplate.update(sql,new Object[]{videoId,bean.getYoutubeCode(),bean.getTitle(),
				bean.getDuration(),bean.getNoOfViewed(),
				bean.getState(),bean.getDistrict(),bean.getLoksaba(),bean.getAssembly(),bean.getMandal(),bean.getVillage(),
				bean.getUser(),bean.getParty()});
		if(i>0){
			return true;
		}else{
			return false;	
		}	
		
	}
	
	public boolean insertValuesPolitics(String table,String lang,
			String name,String location,String post,
			PoliticiansBean bean){
		String sqlIvl="SELECT NVL(MAX(TO_NUMBER(POLITICS_ID)),0)+1 AS SEQ FROM "+table;
		String politicsId =jdbcTemplate.queryForObject(sqlIvl,String.class);
		String sql="INSERT INTO "+table+"(" +
		"POLITICS_ID, PARTY_ID, NAME, LOCATION, POST, IMAGE_PATH, " +
		"CONTACT_NUMBER, EMAIL, LANG_CODE, CREATED_DATE, CREATED_BY, " +
		" IS_ACTIVE)" 
		+"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, ?, 'Y')";
		
		int i =0;
		try {
			i = jdbcTemplate.update(sql,new Object[]{politicsId,bean.getPartyCode(),name,
					location,post,bean.getImgPath(),bean.getContact(),bean.getEmail(),lang,bean.getCreatedBy()});
		} catch (DataAccessException e) {
		}
		if(i>0){
			return true;
		}else{
			return false;	
		}	
	}
	
	public void deletePoliticsByImagePath(String table,String imagePath){
		String deleteSql="DELETE FROM "+table+" WHERE IMAGE_PATH= ?";
		try {
			jdbcTemplate.update(deleteSql,new Object[]{imagePath});
		} catch (DataAccessException e) {
		}
	}
	
	// Displaying Options Data on HTML Select tag
	@SuppressWarnings("unchecked")
	public synchronized Map<String, String> getSelectBox(String sql) {
		Map<String, String> selectData = new LinkedHashMap<String, String>();
		selectData = jdbcTemplate.query(sql, new ResultSetExtractor<Map>() {
			public Map extractData(ResultSet rs) throws SQLException,DataAccessException {
				HashMap<String, String> mapRet = new HashMap<String, String>();
				while (rs.next()) {
					mapRet.put(rs.getString(1), rs.getString(2));
				}
				return mapRet;
			}
		});
		return selectData;
	}
	
	@SuppressWarnings("unchecked")
	public synchronized  String getSelectBoxonHTML(String sql)  {
		String result="<option value='0'>--Select--</option>";
		Map<String,String> selectData = new LinkedHashMap<String,String>();
		selectData =jdbcTemplate.query(sql, new ResultSetExtractor<Map>(){
			public Map extractData(ResultSet rs) throws SQLException,
					DataAccessException {
				HashMap<String,String> mapRet= new HashMap<String,String>();
		        while(rs.next()){
		            mapRet.put(rs.getString(1),rs.getString(2));
		        }
		        return mapRet;
			}
		});	
		for (String key: selectData.keySet()) {
		    result=result+" <OPTION VALUE='"+key+"'>"+selectData.get(key)+"</OPTION> ";
		}
		
		return result;
	}

	


}
