<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>

<html lang="en">
	<!--<![endif]-->
	<!-- start: HEAD -->
	<!-- start: HEAD -->
	<head>
		<title>Lock Screen | Portal</title>
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
		<!-- start: CLIP-TWO CSS -->
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
		<!-- end: CLIP-TWO CSS -->
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
		
			<SCRIPT type="text/javascript">
			window.history.forward();
			function noBack() { window.history.forward(); }
		</SCRIPT>
		
	</head>
	<!-- end: HEAD -->
	<!-- start: BODY -->
	<body class="login" onload='document.loginForm.username.focus(); noBack();'  onpageshow="if (event.persisted) noBack();" onunload="">
		<!-- start: LOCK SCREEN -->
		<div class="row">
			<div class="lock-screen">
				<div class="box-ls">
					<script>
						function imgErrors(image) {
						    image.onerror = "";
						    image.src = "assets/images/defaultprofile.png";
						    return true;
						}
					</script>
					<img  src="/ProfileImages/${userId}.png"  onerror="imgErrors(this)" class="img-rounded" style="width: 200px;height: 200px">
					<div class="user-info">
						<h4 id="user">${fullname}</h4>
						<span>${role}</span>
						<form name='loginForm' class="form-login" action="<c:url value='./login_Authenticate.htm' />" method='POST' 
						onsubmit="return checkValidation()">
							<div class="input-group">
								<input type="hidden"  name="username" id="username" value='${user}'>
								<input type="password" placeholder="Password to unlock" name="password" id="pass_word" class="form-control" onchange="validateMsg()">
								<span class="input-group-btn">
									<button class="btn btn-primary" type="submit">
										<i class="fa fa-chevron-right"></i>
									</button> </span>									
								<input type="hidden" name="check" id="passcheck" value="on"/>
							</div><span id="msg" style="color: red"></span>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- end: LOCK SCREEN -->
		<!-- start: MAIN JAVASCRIPTS -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="vendor/modernizr/modernizr.js"></script>
		<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
		<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script src="vendor/switchery/switchery.min.js"></script>
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<!-- start: CLIP-TWO JAVASCRIPTS -->
		<script src="assets/js/main.js"></script>
		<!-- start: JavaScript Event Handlers for this page -->
		
		<script src="resources/js/sha256.js"></script>
		<script>
			jQuery(document).ready(function() {
				Main.init();								
			});

		function checkValidation(){			
			var checker=$('#passcheck').val();
			console.log(checker);
			if($('#pass_word').val()===''){
				$('#msg').text("password is requried.").show();
				return false;
			}else if(checker == 'off'){				
				$('#msg').text("password is invalid.").show();
				return false;
			}else{
				$('#pass_word').val(Sha256.hash($('#pass_word').val()));
				return true;
			}			
		}
		
	function validateMsg(){
		$('#msg').hide();
		var password=Sha256.hash($('#pass_word').val());
		var username=$('#username').val();
		$.ajax({
			type:'GET',			
			url:'${pageContext.request.contextPath}/lockScreen_passwordCheck/'+username+'/'+password+'/'+username+'.htm',
			success:function(data){
				$('#passcheck').val(data);
			}
		});
			
			
	}
		
		</script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS  -->
	</body>
	<!-- end: BODY -->
</html>