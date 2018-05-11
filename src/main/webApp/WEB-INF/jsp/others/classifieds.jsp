<%@ page language="java" import="java.util.*"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<link href="assets/css/classifieds.css" type="text/css" rel="stylesheet"/>
		<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		-->
		<base href="<%=basePath%>">
		<!--
		 <meta charset="UTF-8">
		-->		
		<link
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
		<link
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" />
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
		<!-- start: MAIN CSS -->
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet"
			href="vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet"
			href="vendor/themify-icons/themify-icons.min.css">
		<link href="vendor/animate.css/animate.min.css" rel="stylesheet"
			media="screen">
		<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css"
			rel="stylesheet" media="screen">
		<link href="vendor/switchery/switchery.min.css" rel="stylesheet"
			media="screen">
		<!-- end: MAIN CSS -->
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<link
			href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css"
			rel="stylesheet" media="screen">
		<link href="vendor/select2/select2.min.css" rel="stylesheet"
			media="screen">
		<link
			href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css"
			rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css"
			rel="stylesheet" media="screen">
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
		<!-- start: CLIP-TWO CSS -->
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css"
			id="skin_color" />
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.min.css">
		<!-- end: CLIP-TWO CSS -->
<style type="text/css">
.tab-content {
    background-color: #FAFAFA;
    position: relative;
}

</style>
	</head>

	<body>
<div id="content_middle">

<div class="container inner-content">
<h2 style="padding-top:12px;">Select Eenadu Newspaper Ad Category to start your booking:</h2>
<div class="categories-section tab-content">
<div id="category">
<ul class="cats">


<li><h4><a style="background: url('//www.ads2publish.com/assets/images/property-for-sale-icon.png') no-repeat scroll left center;" href="/classified-ad/eenadu/property-for-sale" title="Book-Eenadu-Property For Sale-Ads"><span>Property For Sale</span></a></h4></li>
<li><h4><a style="background: url('//www.ads2publish.com/assets/images/vehicles-icon.png') no-repeat scroll left center;" href="/classified-ad/eenadu/vehicles" title="Book-Eenadu-Vehicles-Ads"><span>Vehicles</span></a></h4></li>
<li><h4><a style="background: url('//www.ads2publish.com/assets/images/astrology-icon.png') no-repeat scroll left center;" href="/classified-ad/eenadu/astrology" title="Book-Eenadu-Astrology-Ads"><span>Astrology</span></a></h4></li>
<li><h4><a style="background: url('//www.ads2publish.com/assets/images/business-icon.png') no-repeat scroll left center;" href="/classified-ad/eenadu/business" title="Book-Eenadu-Business-Ads"><span>Business</span></a></h4></li>
<li><h4><a style="background: url('//www.ads2publish.com/assets/images/computers-icon.png') no-repeat scroll left center;" href="/classified-ad/eenadu/computers" title="Book-Eenadu-Computers-Ads"><span>Computers</span></a></h4></li>
<li><h4><a style="background: url('//www.ads2publish.com/assets/images/education-icon.png') no-repeat scroll left center;" href="/classified-ad/eenadu/education" title="Book-Eenadu-Education-Ads"><span>Education</span></a></h4></li>
<li><h4><a style="background: url('//www.ads2publish.com/assets/images/retail-icon.png') no-repeat scroll left center;" href="/classified-ad/eenadu/retail" title="Book-Eenadu-Retail-Ads"><span>Retail</span></a></h4></li>
<li><h4><a style="background: url('//www.ads2publish.com/assets/images/services-icon.png') no-repeat scroll left center;" href="/classified-ad/eenadu/services" title="Book-Eenadu-Services-Ads"><span>Services</span></a></h4></li>
<li><h4><a style="background: url('//www.ads2publish.com/assets/images/travel-icon.png') no-repeat scroll left center;" href="/classified-ad/eenadu/travel" title="Book-Eenadu-Travel-Ads"><span>Travel</span></a></h4></li>
</ul>
</div>
<br><br>
</div>


</div>

</div>

	</body>
	
	<script type="text/javascript">

</script>
	<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
	<script src="vendor/maskedinput/jquery.maskedinput.min.js">
</script>
	<script
		src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js">
</script>
	<script src="vendor/autosize/autosize.min.js">
</script>
	<script src="vendor/selectFx/classie.js">
</script>
	<script src="vendor/selectFx/selectFx.js">
</script>
	<script src="vendor/select2/select2.min.js">
</script>
	<script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js">
</script>
	<script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js">
</script>
	<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
	<!-- start: CLIP-TWO JAVASCRIPTS -->
	<script src="assets/js/main.js">
</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.min.js">
</script>
	<!-- start: JavaScript Event Handlers for this page -->
	<script src="assets/js/form-elements.js">
</script>
	<script>
jQuery(document).ready(function() {

	FormElements.init();
});
</script>
	
</html>
