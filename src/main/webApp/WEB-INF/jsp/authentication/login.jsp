<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html lang="en">
	<!--<![endif]-->
	<!-- start: HEAD -->
	<!-- start: HEAD -->
	<head>
		
		<title>Portal | Login  </title>
		<!-- start: META -->
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
		
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<!-- end: META -->
		
		<!-- start: GOOGLE FONTS -->
		<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
		<!-- end: GOOGLE FONTS -->
		<!-- start: MAIN CSS -->
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
		<link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
		<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
		<link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
		<!-- end: MAIN CSS -->
		
		<!-- start: SITE-INTRO CSS -->
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
		<!-- end: SITE-INTRO CSS -->
		
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
		<style>
			
			.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}
.req{
color: red; float: right; display:none;
}
		</style>
			<SCRIPT type="text/javascript">
			window.history.forward();
			function noBack() { window.history.forward(); }
		</SCRIPT>
		
	</head>
	<!-- end: HEAD -->
	<!-- start: BODY -->
	<body class="login" onload='document.loginForm.username.focus(); noBack();'  onpageshow="if (event.persisted) noBack();" onunload="">
			<br/><br/>
		<!-- start: LOGIN -->
		<div class="row">
			<div class="main-login col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
				<div class="logo margin-top-30">
					<img src="assets/images/logoo.png" alt="LOGO" width="150px"/>
				</div>
				<!-- start: LOGIN BOX -->
				<div class="box-login">
				<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

					

					<form name='loginForm' class="form-login" action="<c:url value='./login_Authenticate.htm' />" method='POST' 
					onsubmit="return checkValidate()">

						<fieldset>
							<legend>
								Sign in to your account
							</legend>
							<p>
								Please enter your name and password to log in.
							</p>
							<div class="form-group">
								<span class="input-icon">
									<input type="text" class="form-control" name="username" placeholder="Username" id="username" maxlength="25">
									<i class="fa fa-user"></i> </span>
									<span class="req" id="username-error">username is required.</span>
							</div>
							<div class="form-group form-actions">
								<span class="input-icon">
									<input type="password" class="form-control password" name="password" placeholder="Password" id="password" maxlength="25">
									<i class="fa fa-lock"></i>
									<a class="forgot" id="showhide" data-val='1'>
										<span id='eye' class="glyphicon glyphicon-eye-open"></span>
									</a> </span>
									<span class="req" id="password-error">password is required.</span>
							</div>
							<div class="form-actions">
								<div class="checkbox clip-check check-primary">
									<input type="checkbox" id="remember" value="1">
									<label for="remember">
										Remember me on this computer
									</label>
								</div>
								<button type="submit" class="btn btn-primary pull-right">
									Login <i class="fa fa-arrow-circle-right"></i>
								</button>
							</div>
							<div class="new-account"><!--
								New account create
							-->Did you forget your password?<a class="" href="forget.htm" onclick="this.parentNode.submit()"> Reset password</a>
							
							
							
							
							</div>
						</fieldset>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
					<!-- start: COPYRIGHT -->
					<div class="copyright">
						&copy; <span class="current-year"></span><span class="text-bold text-uppercase"> Portal</span>. <span>All rights reserved</span>
					</div>
					<!-- end: COPYRIGHT -->
				</div>
				<!-- end: LOGIN BOX -->
			</div>
		</div>
		<!-- end: LOGIN -->
		<!-- start: MAIN JAVASCRIPTS -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="vendor/modernizr/modernizr.js"></script>
		<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
		<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script src="vendor/switchery/switchery.min.js"></script>
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<!-- start: SITE-INTRO JAVASCRIPTS -->
		<script src="assets/js/main.js"></script>
		<!-- start: JavaScript Event Handlers for this page -->
		<script src="assets/js/login.js"></script>
		<script src="resources/js/sha256.js"></script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: SITE-INTRO JAVASCRIPTS -->
		<script>
		function checkValidate(){
			
			if($('#username').val()==''){
				$('#username-error').show();
				$('#username').css('border-color', 'red');
				return false;
			}else if($('#password').val()==''){
				$('#password-error').show();
				$('#password').css('border-color', 'red');
				return false;
			}else{
			$('#password').val(Sha256.hash($('#password').val()));
			return true;
			}
		}
		
		$( "#username" ).click(function() {
		 $('#username-error').hide();
		 $('#username').css('border-color', '#e6e8e8'); 
		});
		$( "#password" ).click(function() {
		 $('#password-error').hide();
		 $('#password').css('border-color', '#e6e8e8');
		});
		
		$(document).ready(function(){
         $("#showhide").click(function() 
         {
            if ($(this).data('val') == "1") 
            {
               $("#password").prop('type','text');
               $("#eye").attr("class","glyphicon glyphicon-eye-close");
               $(this).data('val','0');
            }
            else
            {
               $("#password").prop('type', 'password');
               $("#eye").attr("class","glyphicon glyphicon-eye-open");
               $(this).data('val','1');
            }
         });
      });
		
		
		$('#remember').change(function() {
		 var user =$('#username').val();
		 var pass = $('#password').val();
		  if ($(this).is(':checked')) {
		    if(user == ''){
		    	$('#username-error').show();
				$('#username').css('border-color', 'red');
				return false;
		    }else{
		    	if (typeof(Storage) !== "undefined") {
			    	localStorage.setItem("remname", user);
			    }
		    }
		    if(pass == ''){
		    	$('#password-error').show();
				$('#password').css('border-color', 'red');
				return false;
		    }else{
		    	if (typeof(Storage) !== "undefined") {
			    	localStorage.setItem("remcode", pass );
			    }
		    }

		  } else {
		    localStorage.removeItem("remname");
		    localStorage.removeItem("remcode");		    
		  }
		});
		
		$(document).ready(function(){
			var remname=localStorage.getItem("remname");
			var remcode=localStorage.getItem("remcode");
			if(remname != null && remcode != null){
				$("#remember").prop( "checked", true );
				$('#username').val(remname);
				$('#password').val(remcode);
			}
		    
		});
		</script>
		
	</body>
	<!-- end: BODY -->
</html>