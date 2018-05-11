package com.commons;

import java.util.List;
import java.util.Map;

import com.others.dao.OthersModuleDao;
import com.spring.beans.Beans;

public class WelcomeStatistics {

	public List<Map<String,Object>> getNewsViewsThisMo(){
		return null;	
	}
	
	public List<Map<String,Object>> getNewsViewsLastMo(){
		return null;	
	}
	
	public List<Map<String,Object>> getRegisterMembersPercent(){
		String sql="SELECT MD.DISTRICT_NAME,ROUND(COUNT(RM.REGISTRATION_ID) / 3 * 100)||'%' AS PERCENT " +
				" FROM REGISTERED_MEMBERS RM RIGHT JOIN MST_DISTRICT MD ON(RM.DISTRICT_CODE = MD.DISTRICT_CODE)" +
				" GROUP BY MD.DISTRICT_NAME ORDER BY PERCENT DESC";
		OthersModuleDao dao = Beans.othersModuleDao;
		return dao.getListValues(sql);	
	}
	
	public String getRegisterMembersCount(){
		OthersModuleDao dao = Beans.othersModuleDao;
		return dao.getRegMembersCountValue();	
	}
}
