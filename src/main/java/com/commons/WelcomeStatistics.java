package com.commons;

import java.util.List;
import java.util.Map;

import com.others.dao.OthersModuleDao;
import com.spring.beans.Beans;

public class WelcomeStatistics {

	public List<Map<String,Object>> getNewsViewsThisMo(){
		String sql="SELECT NEWS_TYPE,NO_OF_VIEWS,STATUS_ARROW FROM NEWS_NO_OF_VIEWS where MONTH_YEAR = TO_CHAR(TRUNC(SYSDATE),'MM-YYYY')";
		OthersModuleDao dao = Beans.othersModuleDao;
		return dao.getListValues(sql);	
	}
	
	public List<Map<String,Object>> getNewsViewsLastMo(){
		String sql="SELECT NEWS_TYPE,NO_OF_VIEWS,STATUS_ARROW FROM NEWS_NO_OF_VIEWS where MONTH_YEAR =TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE),-1),'MM-YYYY')";
		OthersModuleDao dao = Beans.othersModuleDao;
		return dao.getListValues(sql);
	}
	
	public List<Map<String,Object>> getRegisterMembersPercent(){
		String sql="SELECT MD.DISTRICT_NAME,ROUND(COUNT(RM.REGISTRATION_ID) / (SELECT COUNT(*) FROM REGISTERED_MEMBERS) * 100)||'%' AS PERCENT " +
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
