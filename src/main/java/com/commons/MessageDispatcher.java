package com.commons;

public class MessageDispatcher {
	//In method parameter =>RedirectAttributes redirectAttrs
	//redirectAttrs.addFlashAttribute("messenger", MessageDispatcher.message("message",false));
	public static String message(String msg,boolean condition){
		String bsAlert=null;
		if(condition){
			bsAlert="<div class='alert alert-success alert-dismissable fade in'> "+
		    " <a href='' class='close' data-dismiss='alert' aria-label='close'>&times;</a> "+
		    " <strong>Success!</strong> "+msg+
		    " </div>";
		}else{
			bsAlert="<div class='alert alert-danger alert-dismissable fade in'> "+
			    " <a href='' class='close' data-dismiss='alert' aria-label='close'>&times;</a> "+
			    " <strong>Error!</strong> "+msg+
			    " </div>";
		}
		return bsAlert;	
	}

}
