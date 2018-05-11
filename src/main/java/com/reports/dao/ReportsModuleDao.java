package com.reports.dao;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.adminmodule.utils.JsonNodeRowMapper;
import com.dmedia.entity.NewsBean;
import com.reports.entity.PublishedNewsReportBean;
import com.reports.entity.PublishedNewsReportEntity;
import com.reports.entity.RegisteredMembersProgressiveReportBean;

@Repository
public class ReportsModuleDao {

	/* Jdbc Connection Template */
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	/* Hibernate Connection Annotations */
	@Autowired
	public SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public List<RegisteredMembersProgressiveReportBean> retrieveRegisteredMembers() {

		List<RegisteredMembersProgressiveReportBean> list = null;

		String sql = "SELECT ROW_NUMBER()  OVER (ORDER BY  MD.DISTRICT_NAME) AS SRNO, "
				+ " MD.DISTRICT_CODE, MD.DISTRICT_NAME, "
				+ " COUNT(RM.REGISTRATION_ID)  FROM MST_DISTRICT MD "
				+ " LEFT JOIN REGISTERED_MEMBERS RM "
				+ " ON MD.DISTRICT_CODE=RM.DISTRICT_CODE  "
				+ " GROUP BY MD.DISTRICT_NAME,MD.DISTRICT_CODE,MD.STATE_CODE ORDER BY MD.DISTRICT_NAME";

		list = jdbcTemplate.query(sql, new EmpListExtractor());
		return list;
	}// method

	private class EmpListExtractor implements
			ResultSetExtractor<List<RegisteredMembersProgressiveReportBean>> {

		public List<RegisteredMembersProgressiveReportBean> extractData(
				ResultSet rs) throws SQLException, DataAccessException {

			List<RegisteredMembersProgressiveReportBean> list = null;
			RegisteredMembersProgressiveReportBean bean = null;
			list = new ArrayList();
			// Copy ResultSet obj records to List
			while (rs.next()) {
				bean = new RegisteredMembersProgressiveReportBean();
				// copy each record to 1 Bean class object

				bean.setSno(rs.getInt(1));
				bean.setDistrictCode(rs.getInt(2));
				bean.setDistrict(rs.getString(3));
				bean.setTotalRegisteredMembers(rs.getInt(4));

				// Add BO obj ListBO
				list.add(bean);
			}// while
			return list;
		}// method
	}// inner class

	public Object retrieveRegisteredMembersAssembly(String districtCode) {

		String sql = "SELECT ROW_NUMBER()  OVER (ORDER BY  MA.ASSEMBLY_NAME) AS SRNO, "
				+ " MA.ASSEMBLY_NAME, "
				+ " COUNT(RM.REGISTRATION_ID) as counter,MA.ASSEMBLY_CODE  "
				+ " FROM MST_ASSEMBLY MA  "
				+ " LEFT JOIN REGISTERED_MEMBERS RM "
				+ " ON MA.ASSEMBLY_CODE=RM.ASSEMBLY_CODE  where MA.DISTRICT_CODE= "
				+ districtCode
				+ " GROUP BY MA.ASSEMBLY_NAME,MA.ASSEMBLY_CODE ORDER BY MA.ASSEMBLY_NAME";

		return (jdbcTemplate.query(sql, new JsonNodeRowMapper(
				new ObjectMapper())));

	}

	public Object retrieveRegisteredMembersMandal(String assemblyCode) {

		String sql = "SELECT ROW_NUMBER()  OVER (ORDER BY  MM.MANDAL_NAME) AS SRNO, "
				+ " MM.MANDAL_NAME, "
				+ " COUNT(RM.REGISTRATION_ID) AS COUNTER,MM.MANDAL_CODE "
				+ " FROM MST_MANDAL MM "
				+ " LEFT JOIN REGISTERED_MEMBERS RM "
				+ " ON MM.MANDAL_CODE=RM.MANDAL_CODE  WHERE MM.ASSEMBLY_CODE= "
				+ assemblyCode
				+ " GROUP BY MM.MANDAL_NAME,MM.MANDAL_CODE ORDER BY MM.MANDAL_NAME";

		return (jdbcTemplate.query(sql, new JsonNodeRowMapper(
				new ObjectMapper())));

	}

	public Object retrieveRegisteredMembersPanchayati(String mandalCode) {

		String sql = "SELECT ROW_NUMBER()  OVER (ORDER BY  MP.PANCHAYATI_NAME) AS SRNO, "
				+ " MP.PANCHAYATI_NAME, "
				+ " COUNT(RM.REGISTRATION_ID) AS COUNTER,MP.PANCHAYATI_CODE "
				+ " FROM MST_PANCHAYATI MP "
				+ " LEFT JOIN REGISTERED_MEMBERS RM "
				+ " ON MP.PANCHAYATI_CODE=RM.PANCHAYATI_CODE where MP.MANDAL_CODE= "
				+ mandalCode
				+ " GROUP BY MP.PANCHAYATI_NAME,MP.PANCHAYATI_CODE ORDER BY MP.PANCHAYATI_NAME";

		return (jdbcTemplate.query(sql, new JsonNodeRowMapper(
				new ObjectMapper())));

	}

	public Object retrieveRegisteredMembersPolingStation(String panchayatiCode) {

		String sql = "SELECT ROW_NUMBER()  OVER (ORDER BY  MPS.POLINGSTATION_NAME) AS SRNO, "
				+ " MPS.POLINGSTATION_NAME, "
				+ " COUNT(RM.REGISTRATION_ID) AS COUNTER,MPS.POLINGSTATION_CODE "
				+ " FROM MST_POLINGSTATION MPS "
				+ " LEFT JOIN REGISTERED_MEMBERS RM "
				+ " ON MPS.POLINGSTATION_CODE=RM.POLINGSTATION_CODE where MPS.PANCHAYATI_CODE= "
				+ panchayatiCode
				+ " GROUP BY MPS.POLINGSTATION_NAME,MPS.POLINGSTATION_CODE ORDER BY MPS.POLINGSTATION_NAME";

		return (jdbcTemplate.query(sql, new JsonNodeRowMapper(
				new ObjectMapper())));

	}

	public Object retrieveRegisteredMembersPolingStationDetails(
			String polingStationCode) {

		String sql = "SELECT ROW_NUMBER()  OVER (ORDER BY MEMBER_NAME) AS SRNO,MEMBER_NAME,MOBILE_NUMBER,EMAIL_ID "
				+ " FROM REGISTERED_MEMBERS  where POLINGSTATION_CODE="
				+ polingStationCode + " order by MEMBER_NAME";

		return (jdbcTemplate.query(sql, new JsonNodeRowMapper(
				new ObjectMapper())));

	}

	/* ------------NEWS REPORTS-------------- */
	public List<PublishedNewsReportEntity> retrieveNews(String table) {

		String sql = " SELECT  NEWS_ID,NEWS_HEADLINE,TO_CHAR(CREATED_DATE,'DD-Mon-YYYY') AS NEWS_DATE"
				+ " FROM " + table + " ORDER BY CREATED_DATE DESC";

		return getJdbcTemplate().query(sql,
				new RowMapper<PublishedNewsReportEntity>() {
					public PublishedNewsReportEntity mapRow(ResultSet rs,
							int rownumber) throws SQLException {
						PublishedNewsReportEntity e = new PublishedNewsReportEntity();
						String encode;
						try {
							encode = URLEncoder
									.encode(rs.getString(2), "UTF-8");
						} catch (UnsupportedEncodingException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
							encode = rs.getString(2);
						}
						e.setNewsId(rs.getString(1));
						e.setArticleName(encode);
						e.setDate(rs.getString(3));
						return e;
					}
				});
	}

	/* delete News */
	public String deletePublishNews(String table,String newsCode) {

		String sql = "delete from "+table+" where NEWS_ID=" + newsCode + "";

		int i = getJdbcTemplate().update(sql);
		if (i > 0) {
			return "DONE";
		} else {
			return "NOT DONE";
		}
	}

}
