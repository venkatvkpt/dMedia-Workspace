package com.adminmodule.authentication;

import com.adminmodule.administration.bean.CreateServicesBean;
import com.adminmodule.dao.AdminModuleDao;
import com.spring.beans.Beans;

public class ServicesInsertByDeveloper {
	
	public static boolean executeInserting(){
		try {
			
				AdminModuleDao dao = Beans.adminModuleDao;
				CreateServicesBean bean1 = new CreateServicesBean();
				bean1.setService_id(0);
				bean1.setService_name("Navigation Bar");
				bean1.setParent_id(99999);
				bean1.setService_link("#");
				bean1.setDisplay_order(0);
				bean1.setIcon_bootstrop("NP");
				bean1.setSort(0);
				dao.insertValues(bean1);

				//1	User Profile	0	#	1	Menu Tab for User Profile acess
				CreateServicesBean bean2 = new CreateServicesBean();
				bean2.setService_id(1);
				bean2.setService_name("User Profile");
				bean2.setParent_id(0);
				bean2.setService_link("#");
				bean2.setDisplay_order(1);
				bean2.setIcon_bootstrop("ti-user");
				bean2.setSort(1);
				dao.insertValues(bean2);

				//2	Administration	0	#	2	Menu Tab for Administration links acess
				CreateServicesBean bean3 = new CreateServicesBean();
				bean3.setService_id(2);
				bean3.setService_name("Administration");
				bean3.setParent_id(0);
				bean3.setService_link("#");
				bean3.setDisplay_order(2);
				bean3.setIcon_bootstrop("ti-settings");
				bean3.setSort(2);
				dao.insertValues(bean3);

				//3	Edit Profile	1	editProfile.htm	1	Edit Profile Details
				CreateServicesBean bean4 = new CreateServicesBean();
				bean4.setService_id(3);
				bean4.setService_name("Edit Profile");
				bean4.setParent_id(1);
				bean4.setService_link("editProfile.htm");
				bean4.setDisplay_order(1);
				bean4.setIcon_bootstrop("2SP");
				bean4.setSort(1);
				dao.insertValues(bean4);

				//4	Create User	2	createUser.htm	3	New User Creation
				CreateServicesBean bean5 = new CreateServicesBean();
				bean5.setService_id(4);
				bean5.setService_name("Create User");
				bean5.setParent_id(2);
				bean5.setService_link("createUser.htm");
				bean5.setDisplay_order(3);
				bean5.setIcon_bootstrop("2SP");
				bean5.setSort(2);
				dao.insertValues(bean5);

				//5	Create Role	2	createRole.htm	2	New Role Creation Link
				CreateServicesBean bean6 = new CreateServicesBean();
				bean6.setService_id(5);
				bean6.setService_name("Create Role");
				bean6.setParent_id(2);
				bean6.setService_link("createRole.htm");
				bean6.setDisplay_order(2);
				bean6.setIcon_bootstrop("2SP");
				bean6.setSort(2);
				dao.insertValues(bean6);

				//6	Create Service	2	createService.htm	1	Services Creation link
				CreateServicesBean bean7 = new CreateServicesBean();
				bean7.setService_id(6);
				bean7.setService_name("Create Service");
				bean7.setParent_id(2);
				bean7.setService_link("createService.htm");
				bean7.setDisplay_order(1);
				bean7.setIcon_bootstrop("2SP");
				bean7.setSort(2);
				dao.insertValues(bean7);

				//7	Map Services	2	mapServices.htm	4
				CreateServicesBean bean8 = new CreateServicesBean();
				bean8.setService_id(7);
				bean8.setService_name("Map Services");
				bean8.setParent_id(2);
				bean8.setService_link("mapServices.htm");
				bean8.setDisplay_order(4);
				bean8.setIcon_bootstrop("2SP");
				bean8.setSort(2);
				dao.insertValues(bean8);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return true;
	}

}
