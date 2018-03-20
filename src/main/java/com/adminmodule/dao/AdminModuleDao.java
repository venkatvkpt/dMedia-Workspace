package com.adminmodule.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.adminmodule.administration.bean.CreateServicesBean;
import com.adminmodule.utils.JsonNodeRowMapper;

@Repository
public class AdminModuleDao {

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

	/* HQL Based retriving List Data using Hibernate */
	@Transactional
	@SuppressWarnings("unchecked")
	public List<Object[]> listValues(String hql) {
		List<Object[]> userList = null;
		try {
			userList = getSessionFactory().getCurrentSession().createQuery(hql)
					.list();
		} catch (Exception e) {
			System.out.println(e);
		}

		return userList;
	}

	/* SQL Based retriving List Data using Hibernate */
	@Transactional
	@SuppressWarnings("unchecked")
	public List<Object> listValuesSQL(String sql) {
		List<Object> userList = null;
		try {
			userList = getSessionFactory().getCurrentSession().createQuery(sql)
					.list();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return userList;
	}

	/* HQL query to get lastValue */
	@Transactional
	public Object lastValue(String hql) {
		Query query = null;
		try {
			query = getSessionFactory().getCurrentSession().createQuery(hql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return (Object) query.uniqueResult();
	}

	/* Hibernate Inserting using Entity Bean */
	@Transactional
	public boolean insertValues(Object insert) {
		boolean response;
		try {
			getSessionFactory().getCurrentSession().persist(insert);
			response = true;
		} catch (Exception e) {
			response = false;
			e.printStackTrace();
		}
		return response;
	}

	/* Hibernate Inserting using HQL */
	@Transactional
	public int insertValuesHQL(String hql) {
		Query query = getSessionFactory().getCurrentSession().createQuery(hql);
		int result = query.executeUpdate();
		return result;
	}

	/* Hibernate Inserting using SQL */
	@Transactional
	public int insertValuesSQL(String sql) {
		Query query = getSessionFactory().getCurrentSession().createSQLQuery(
				sql);
		int result = query.executeUpdate();
		return result;
	}

	/* Hibernate Updating using HQL */
	@Transactional
	public int updateValues(String hql) {
		Query query = getSessionFactory().getCurrentSession().createQuery(hql);
		int result = query.executeUpdate();
		return result;
	}

	@Transactional
	public boolean removeService(int id) {
		boolean res = false;
		Session session = this.sessionFactory.getCurrentSession();
		CreateServicesBean bean = (CreateServicesBean) session.load(
				CreateServicesBean.class, new Integer(id));
		if (null != bean) {
			try {
				session.delete(bean);
				res = true;
			} catch (Exception e) {
				res = false;
			}
		}
		return res;
	}

	// ==Authentication== JDBC retrieving Values for Sessions setting

	public int updateBySql(String sql) {
		return jdbcTemplate.update(sql);
	}

	public Object getServices(String role_id, String user_id) {
		String sql;
		if (user_id.equals("0")) { // Developer Services
			sql = "SELECT SERVICE_ID,SERVICE_NAME,PARENT_ID,SERVICE_LINK,ICON_BOOTSTROP FROM MST_SERVICE LEFT JOIN "
					+ "(SELECT SERVICE_ID,ICON_BOOTSTROP FROM SERVICE_BOOTSTRAP)USING(SERVICE_ID)WHERE PARENT_ID=0 AND SERVICE_LINK='#' "
					+ "ORDER BY SERVICE_ID,DISPLAY_ORDER ";

			return (jdbcTemplate.query(sql, new JsonNodeRowMapper(
					new ObjectMapper())));
		} else {
			sql = " SELECT SERVICE_ID,SERVICE_NAME,PARENT_ID,SERVICE_LINK,ICON_BOOTSTROP FROM MST_SERVICE LEFT JOIN (SELECT SERVICE_ID,ICON_BOOTSTROP FROM SERVICE_BOOTSTRAP)USING(SERVICE_ID)"
					+ " WHERE SERVICE_ID IN(SELECT SERVICE_ID FROM MAP_SERVICES_ROLE WHERE ROLE_ID= ?)"
					+ " OR SERVICE_ID IN (SELECT SERVICE_ID FROM MAP_SERVICES_USER WHERE USER_SERIAL_NO= ?)"
					+ " AND PARENT_ID=0 AND SERVICE_LINK='#' ORDER BY SERVICE_ID,DISPLAY_ORDER ";
			return (jdbcTemplate.query(sql, new Object[] { role_id, user_id },
					new JsonNodeRowMapper(new ObjectMapper())));
		}

	}

	public Object getTotalServices() {
		return (jdbcTemplate
				.query(
						"SELECT SERVICE_LINK FROM MST_SERVICE WHERE SERVICE_LINK !='#'",
						new JsonNodeRowMapper(new ObjectMapper())));
	}

	public Object getUserActivity(Object serialNo, int rownum) {
		String sql = "SELECT * FROM(SELECT CASE  WHEN TO_CHAR(LOG_DATE,'DD/MM/YYYY') IN TO_CHAR(SYSDATE,'DD/MM/YYYY')"
				+ " THEN TO_CHAR(LOG_DATE,'HH:MI AM')  ELSE TO_CHAR(TO_DATE(LOG_DATE,'DD/MM/YYYY'),'DY, DD MON') END AS LOGDATE"
				+ ",ACTIVITY_DESCRIPTION FROM AUDIT_ACTIVITY_LOG WHERE USER_SERIAL_NO= ? ORDER BY LOG_DATE DESC,LOG_ID)WHERE ROWNUM <= ?";
		return (jdbcTemplate.query(sql, new Object[] { serialNo, rownum },
				new JsonNodeRowMapper(new ObjectMapper())));
	}

	public String getRoleId(String userId) {
		String sql = "SELECT NVL(ROLE_ID,0) FROM MAP_USER_ROLE where USER_SERIAL_NO= ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { userId },
				String.class);
	}

	public String getUserId(String user) {
		String userId = "0";
		try {
			String sql = "SELECT USER_SERIAL_NO FROM MST_USERS WHERE USER_NAME= ?";
			userId = jdbcTemplate.queryForObject(sql, new Object[] { user },
					String.class);
		} catch (DataAccessException e) {
		}
		return userId;
	}

	public String getDisplayNme(String userId) {
		String sql = "SELECT NVL(FIRST_NAME,0) FROM USER_PROFILE WHERE USER_SERIAL_NO= ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { userId },
				String.class);
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

	public void close() {
		getSessionFactory().close();
		System.gc();
	}
}
