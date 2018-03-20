package com.commons;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmailUsingGMailSMTP {
	
	public static boolean doSendMail(String subjectTitle,String someHtmlMessage,String to_address) {
		boolean flag =false;
		final String username = "donot.replaythismails@gmail.com"; //our GMail Account
		final String password = "forgetpassword";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
		
		try {
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("donot.replaythismails@gmail.com", "Portal Administration"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(to_address));
			message.setSubject(subjectTitle);
			message.setContent(someHtmlMessage, "text/html; charset=utf-8");
			Transport.send(message);

			flag=true;
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
}
