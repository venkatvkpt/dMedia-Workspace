


<!DOCTYPE html>
<html >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
  <meta charset="UTF-8">
  <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
 
  <title>Reset Password | Portal</title>
  
  
    <link rel="stylesheet" href="https://static.parastorage.com/services/third-party/fonts/Helvetica/fontFace.css">
  <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
   
    <link rel="stylesheet" href="assets/css/forgotStyle.css">
	<link href="vendor/sweetalert/sweet-alert.css" rel="stylesheet" media="screen">
	
	
	<style type="text/css">
	.password{
	
	background-color: #FFFFFF !important;
    background-image: none !important;
    border: 1px solid #c8c7cc !important;
    border-radius: 0 0 0 0 !important;
    color: #5b5b60 !important;
    font-family: inherit !important;
    font-size: 14px !important;
    line-height: 1.2 !important;
    padding: 5px 4px !important;
    transition-duration: 0.1s !important;
    box-shadow: none !important;
    width:80%;
	}
	.btn{
	width:38%;
	}
	
	.btn {
      display: inline-block;
    min-width: 100px;
    padding: 4px 12px 4px 12px;
    margin-top: 4px;
    margin-bottom: 4px;
    position: relative;
    max-width: 100%;
    text-align: center;
    white-space: nowrap;
    overflow: hidden;
    vertical-align: middle;
    text-overflow: ellipsis;
    touch-action: manipulation;
    color: #fff;
    border-style: solid;
    border-width: 2px;
    border-color: transparent;
    background-color: #005da6;
    border-radius: 0px;
}

.btn:hover {
  background: #0067b8;
  text-decoration: none;
  color: #fff;
}
	
	</style>
	
 

</head>

<body translate="no" >
<br><br>
<div>&ensp;&ensp;<img src="assets/images/logo.png" alt="Logo"></div>
<c:choose> 
 		 <c:when test="${msg == 'invalid'}">
    	<div class="sweet-alert showSweetAlert visible"  style="display: block; margin-top: -222px;">
    	
    	
    	 <div class="sa-icon sa-error animateErrorIcon" style="display: block;">
    	 <span class="sa-x-mark animateXMark"><span class="sa-line sa-left"></span>
    	 <span class="sa-line sa-right"></span></span></div>
    	 
    	 
    	 <h2>Time Out</h2>
    	 <p style="display: block;">This password reset link is expired or invalid </p>
    	 <br/>
    	 <form action="forgetEmailCheck.htm" method="POST" id="myform">
    	  <input type="hidden"  name="forget_email" value="${email}">
    	 <a onclick="document.getElementById('myform').submit();" style="cursor: pointer" type="submit">I want password reset link, send me again.</a>
    	 </form>
    	 </div>
 
  </c:when>
  
  <c:when test="${msg == 'sucess'}">
    	<div class="sweet-alert showSweetAlert visible"  style="display: block; margin-top: -222px;">
    	
    	<div class="sa-icon sa-success animate" style="display: block;"> <span class="sa-line sa-tip animateSuccessTip"></span> 
    	<span class="sa-line sa-long animateSuccessLong"></span> <div class="sa-placeholder"></div> <div class="sa-fix"></div>
    	 </div> <div class="sa-icon sa-custom" style="display: none;"></div> <h2>Reseted your password</h2>
    	 <p style="display: block;">Your portal account password is reseted successfully</p>
    	 
    	 <a href="login.htm" style="cursor: pointer">continue to login.</a>
    	 </div>
 
  </c:when>
  
  <c:otherwise>
    	<div class="sweet-alert showSweetAlert visible"  style="display: block; margin-top: -222px;">
    	<form action="resetPassword.htm" method="post" onsubmit="return submitValidate()" >
    	
    	'
    	 <h2>Reset your password</h2>
    	<center> <p style='display: block;'>
    	<input type='password' class='password' placeholder='New password' name='password' id="password"/>
    	<span class="pass" style="display: none; color:red">Password is required.</span> </p><br/>
    	<p>&ensp;</p>
    	 <p style='display: block;'>
    	 <input type='password' class='password' placeholder='Reenter password' name='re_password' id="password_again"/>
    	 <span class="passagin" style="display: none; color:red;">Reenter Password is required.</span> </p></center>
    	 <br/><br/><div >
    	 <input type='hidden' name='email' value='${email}' />
    	<input type='hidden' name='userId' value='${userId}' />
    	<p><a href='login.htm'><input type='button' class='btn' style='background-color: #b2b2b2;color:black' value='Cancle' ></a> &ensp;
    	<input type='submit' class='btn ' value='Reset'></p>
    	 
    	  </div>
    	  </form>
    	 </div>
 </c:otherwise>
 </c:choose>
  
  
  
  


 
  
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="resources/js/sha256.js"></script>
  	<script>
  	
  	function submitValidate(){	    
				
				var pass =$('#password').val();
				var aginpass =$('#password_again').val();
				
					if(pass === ''){
						$('.pass').show();
						
						return false;
					}else if(aginpass === ''){
						$('.passagin').show();
						
						return false;
					}else if(!(pass === aginpass)){
						$('.passagin').show().text("Reenter password is not match with password").css("color","red");
						
						return false;			
					}else{
						$('#password').val(Sha256.hash($('#password').val()));
						$('#password_again').val(Sha256.hash($('#password_again').val()));
						return true;
					}						
			}
			
			$('#password').on('change', function() {
			 $('.pass').hide();
			})
			$('#password_again').on('change', function() {
			  $('.passagin').hide();
			})
  	
  	
  	</script>
  
  

</body>
</html>
 