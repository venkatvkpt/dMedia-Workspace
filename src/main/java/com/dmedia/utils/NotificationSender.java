package com.dmedia.utils;

import com.dmedia.entity.NewsBean;
import com.dmedia.fcm.FireMessage;

public class NotificationSender {
	public static boolean make(NewsBean bean, String title, String intent) {

		String image = "http://18.188.67.28:8080/" + bean.getImagepath();
		try {
			new FireMessage(title, image, intent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
}
