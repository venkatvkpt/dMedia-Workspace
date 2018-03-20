package com.adminmodule.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import com.adminmodule.dao.AdminModuleDao;
import com.adminmodule.user.bean.NotificationsLogEntity;
import com.spring.beans.Beans;

public class NotificationsLog {
	
	public static void insertlog(String userId,String imgUrl,String title,String msg){
		AdminModuleDao dao=Beans.adminModuleDao;
		NotificationsLogEntity entity =new NotificationsLogEntity();
		entity.setUser_serial_no(userId);
		entity.setImg_url(imgUrl);
		entity.setTitle(title);
		entity.setMessage(msg);
		dao.insertValues(entity);	
	}
	
	public static int getCount(String userId){
		AdminModuleDao dao=Beans.adminModuleDao;
		String sql="SELECT NOTIFICATION_COUNT FROM NOTIFICATIONS_COUNT where USER_SERIAL_NO= ?";		
		JdbcTemplate temp=dao.getJdbcTemplate();		
		int result =0;
		try {
			result = temp.queryForObject(sql, new Object[] { userId },Integer.class);
		} catch (Exception e) {
			String insert="INSERT INTO NOTIFICATIONS_COUNT(LOG_ID, NOTIFICATION_COUNT, USER_SERIAL_NO) VALUES("+userId+", 0, '"+userId+"')";
			temp.execute(insert);
		}			
		return result;	
	}
	
	public static void updateCount(String userId){
		AdminModuleDao dao=Beans.adminModuleDao;
		String sql="UPDATE NOTIFICATIONS_COUNT  SET  NOTIFICATION_COUNT= NOTIFICATION_COUNT+1  WHERE USER_SERIAL_NO= ?";
		JdbcTemplate temp=dao.getJdbcTemplate();				
			temp.update(sql, new Object[] {  userId });	
	}
	
	public static void updateCountforAll(){
		AdminModuleDao dao=Beans.adminModuleDao;
		JdbcTemplate temp=dao.getJdbcTemplate();
		String getSerials="SELECT USER_SERIAL_NO FROM MST_USERS";
		String getCount="SELECT NOTIFICATION_COUNT FROM NOTIFICATIONS_COUNT where USER_SERIAL_NO= ?";
		String update="UPDATE NOTIFICATIONS_COUNT  SET  NOTIFICATION_COUNT= NOTIFICATION_COUNT+1  WHERE USER_SERIAL_NO= ?";
		List<Map<String, Object>> serialsNo =temp.queryForList(getSerials);
	
		for (Map<String, Object> map : serialsNo) {
		    for (Map.Entry<String, Object> entry : map.entrySet()) {
		    	 Object value = entry.getValue();
		    	
		    	 try {
					temp.queryForObject(getCount, new Object[] { value },Integer.class);
					temp.update(update, new Object[] {  value });
				} catch (Exception e) {
					String insert="INSERT INTO NOTIFICATIONS_COUNT(LOG_ID, NOTIFICATION_COUNT, USER_SERIAL_NO) VALUES("+value+", 1, '"+value+"')";
					temp.execute(insert);	
				}
		    }
		}
	}

	
	
}
