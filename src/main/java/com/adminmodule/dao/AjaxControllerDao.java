package com.adminmodule.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;



public class AjaxControllerDao {

	/*Jdbc Connection*/
	private JdbcTemplate jdbcTemplate;
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	public  List<Map<String, Object>> getSubMenuServices(String parent_id,String role_Id,String user_id)
	 {		
		String sql;
		if(role_Id.equalsIgnoreCase("0") ){
			sql="SELECT SERVICE_NAME,SERVICE_LINK,SERVICE_ID FROM MST_SERVICE WHERE PARENT_ID= ?  ORDER BY DISPLAY_ORDER";
			return jdbcTemplate.queryForList(sql,new Object[]{parent_id});
		}
		else{
		 sql="SELECT SERVICE_NAME,SERVICE_LINK,SERVICE_ID FROM MST_SERVICE WHERE PARENT_ID= ?" +
				" AND  SERVICE_ID IN(SELECT SERVICE_ID FROM MAP_SERVICES_ROLE WHERE ROLE_ID= ?) " +
				" OR SERVICE_ID IN ( SELECT SERVICE_ID FROM MST_SERVICE WHERE SERVICE_ID IN( " +
				" SELECT SERVICE_ID FROM MAP_SERVICES_USER WHERE USER_SERIAL_NO= ?) AND PARENT_ID=? ) AND PARENT_ID !=0 " +
				" ORDER BY DISPLAY_ORDER";
		
		return jdbcTemplate.queryForList(sql,new Object[]{parent_id, role_Id ,user_id, parent_id});
		}
	}



	public List<Map<String, Object>> editData(String sql) {
		return jdbcTemplate.queryForList(sql);
	}
	
	public String stringSingleValue(String sql) {
		
		return jdbcTemplate.queryForObject(sql, String.class);
	}
	
	@SuppressWarnings("unchecked")
	public synchronized  String getSelectBoxonHTML(String sql)  {
		String result="<option value='S'>--Select--</option>";
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
