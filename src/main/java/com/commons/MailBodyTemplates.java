package com.commons;

@SuppressWarnings("unused")
public class MailBodyTemplates {


	public static String forgetPasswordHTMLTemplate(String username ,String link){
		String body=" <div style='background-color: #f7f7f7;font-family: Helvetica,Arial,sans-serif;font-size: 11px;color: #8c8c8c;'><br><br> .&emsp; "+
		" <table align='center' border='0' cellpadding='10' cellspacing='0' width='80%'> "+
		"  <tr> "+
		"   <td bgcolor='#ffffff'> "+
		"    <center><img src='https://image.ibb.co/nO2YHF/logo.png' width='250px'></center> "+
		"    <hr style='width: 95%'> "+
		"   </td> "+
		"  </tr> "+
		"  <tr> "+
		"   <td bgcolor='#ffffff' > "+
		"   <DIV style='font-family: Helvetica,Arial,sans-serif; font-size: 13px;color: #666666; padding: 60px; padding-top:0; padding-bottom:10 '> "+
		"    Dear "+username+", "+
		"    <br/> "+
		"    <p style='padding-left: 3.6em'>you recently requested to forget your password for your PORTAL account access.Click the link below to reset it.</p> "+
		"    <center><a href='"+link+"' target='_blank' style='background-color: #FFFDCC;padding: 8px 40px;text-align: center;text-decoration: none; display: inline-block; border:2px solid #ffeda5;'>Click to reset your password</a></center><br> "+
		"    <p style='padding-left: 3.6em'>If you did not request for send password. Please ignore this email or let us know.This password reset URL is only valid today. </p>	" +
		"   <br><p style='padding-left: 31.6em'> Sincerely,<br>Portal Team. </p> <br><br>" +
		"	 <p style='padding-left: 3.6em'>If you are having trouble with click password reset link, copy and paste the URL below into your web browser.<br>" +
		"		<br> "+link+" </p>"+
		"    </DIV> "+
		"   </td> "+
		"  </tr> "+
		"  <tr> "+
		"   <td bgcolor='#f7f7f7'> "+
		"    <center> "+
		"    	<p style='font-family: Helvetica,Arial,sans-serif; font-size: 11px;color: #8c8c8c;'> "+
		"    	Please do NOT forward this email to others. This URL belongs to your account access only we not accepts sharing.The system accepts only one response for each unique URL. "+
		"    	Please do not reply to this email. To get in touch with us, click <a href='#' style='text-decoration: none'>Help & Contact.</a> "+
		"    	<BR><br> "+
		"    	Copyright© 2017-2017 PORTAL. All rights reserved. "+
		"    	</p> "+
		"    </center> "+
		"   </td> "+
		"  </tr> "+
		" </table> "+
		" </div> ";
		
		
		return body;	
	}

}
