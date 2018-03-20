<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title><%=request.getSession().getAttribute("user_Name") %> | <tiles:getAsString name="title" /> | Portal</title>
		<!-- start: META -->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<meta http-equiv="refresh" content="<%= session.getMaxInactiveInterval() %>">
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
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
		<!-- start: CORE JS -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
		<!-- end: CORE JS -->
		<style type="text/css">
			.error{color:red};
		</style>
		<script>
		function imgError(image) {
		    image.onerror = "";
		    image.src = "assets/images/defaultuser.png";
		    return true;
		}
		</script>
		<SCRIPT type="text/javascript">
			window.history.forward();
			function noBack() { window.history.forward(); }
		</SCRIPT>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>

	  <link href='resources/css/nprogress.css' rel='stylesheet' />	 
	  <script src='resources/js/nprogress.js'></script>


	
	</head>
	<body  onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
	<div class="loader" id="progress"></div>
	
		<div id="app" ng-app="mainApp"> <!--start: app -->
			<tiles:insertAttribute name="menu" />
				<div class="app-content"> <!--start: app-content -->
					<tiles:insertAttribute name="header" />
					<div class="main-content"> <!--start: main-content -->
						<div class="wrap-content container" id="container"
						style="background-color: WHITE">
						<!-- start:Title of Page -->
						<section id="page-title" style="background-color:#FAFAFA "
							class="padding-top-25 padding-bottom-15 ng-scope">
						<div class="row">
							<div class="col-sm-8">
								<h1 class="mainTitle">
									<tiles:getAsString name="title" />
								</h1>
								<span class="mainDescription"><tiles:getAsString name="description" /></span>
							</div>
							<ol class="breadcrumb">
								<li>
									<span><tiles:getAsString name="NavigationName" /></span>
								</li>
								<li class="active">
									<span><tiles:getAsString name="title" /></span>
								</li>
							</ol>
						</div>
						</section><br/>
						<!-- end: Title of Page -->
						<!-- start: Content of Page -->
						<div class="container-fluid container-fullw bg-white">
							<div class="row">
							<div id="divLoading" style="display: none"><center><img src="assets/images/loading.gif" width="90px"></center></div>
							<core:if test="${not empty messenger}"><p>${messenger}</p> </core:if>
						<tiles:insertAttribute name="body" />
						</div>
							</div>
					</div>
				</div> <!--start: main-content -->
			</div> <!--end: app-content -->
			<!-- end: Content of Page -->
			<!-- start: Fotter of Page -->
			<tiles:insertAttribute name="footer" />
			<!-- end: Fotter of Page -->
			<!-- start: chatroom of Page -->
			<tiles:insertAttribute name="chatroom" />
			<!-- end: chatroom of Page -->
			<!-- start: Settings of Page -->
			<tiles:insertAttribute name="settings" />
			<!-- end: Settings of Page -->
		</div> <!--end: app -->
		
		<!-- start: MAIN JAVASCRIPTS -->
		
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="vendor/modernizr/modernizr.js"></script>
		<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
		<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script src="vendor/switchery/switchery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
		<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
		<script src="resources/js/customValidations.js"></script>
		<script src="resources/js/basicValidations.js"></script>
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: SITE JAVASCRIPTS -->
		<script src="assets/js/main.js"></script>
		 
		
	</body>
</html>
