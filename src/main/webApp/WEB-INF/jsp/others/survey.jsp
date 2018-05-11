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
		


		<style>
select option {
	color: black;
}

select option:first-child {
	color: grey;
}

select.empty {
	color: grey;
}

label {
	font-weight: normal;
	color: #858585;
}

.select2-container--default .select2-selection--single {
	background-color: #fff;
	border: 1px solid #aaa;
	border-radius: 0px;
}

.select2-container .select2-selection--single {
	box-sizing: border-box;
	cursor: pointer;
	display: block;
	height: 30px;
	user-select: none;
	-webkit-user-select: none;
}

/* Hidden placeholder */
select option[disabled]:first-child {
	display: none;
}
</style>
		<style type="text/css">
.container {
	margin-top: 20px;
}

.image-preview-input {
	position: relative;
	overflow: hidden;
	margin: 0px;
	color: #333;
	background-color: #fff;
	border-color: #ccc;
}

.image-preview-input input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity =           0);
}

.image-preview-input-title {
	margin-left: 2px;
}

.img-control {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.428571429;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, box-shadow
		ease-in-out .15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
</style>
		<script type="text/javascript">

function selectValidate() {

	var lang = $('#language').val();
	var releaseDate = $('#releaseDate').val();
	var expiryDate = $('#expiryDate').val();
	var source = $('#source').val();

	var question = $('#question').val();
	var option1 = $('#option1').val();
	var option2 = $('#option2').val();
	var option3 = $('#option3').val();
	var option4 = $('#option4').val();

	var flag = true;

	if (question === "" || question === " ") {
		if ($('#article_titleerror').length) {
			$('#article_titleerror').show();
		} else {
			$("#question")
					.after(
							"<span class='error' id='article_titleerror'>Question is required.</span>");
		}
		flag = false;
	} else {
		$('#article_titleerror').hide();
	}
	if (option1 === "" || option1 === " ") {
		if ($('#option1_error').length) {
			$('#option1_error').show();
		} else {
			$("#option1")
					.after(
							"<span class='error' id='option1_error'>Option1 is required.</span>");
		}
		flag = false;
	} else {
		$('#option1_error').hide();
	}
	if (option2 === "" || option2 === " ") {
		if ($('#option2_error').length) {
			$('#option2_error').show();
		} else {
			$("#option2")
					.after(
							"<span class='error' id='option2_error'>Option2 is required.</span>");
		}
		flag = false;
	} else {
		$('#option2_error').hide();
	}
	if (option3 === "" || option3 === " ") {
		if ($('#option3_error').length) {
			$('#option3_error').show();
		} else {
			$("#option3")
					.after(
							"<span class='error' id='option3_error'>Option3 is required.</span>");
		}
		flag = false;
	} else {
		$('#option3_error').hide();
	}
	if (option4 === "" || option4 === " ") {
		if ($('#option4_error').length) {
			$('#option4_error').show();
		} else {
			$("#option4")
					.after(
							"<span class='error' id='option4_error'>Option4 is required.</span>");
		}
		flag = false;
	} else {
		$('#option4_error').hide();
	}

	if (lang === "S" || lang === 0 || lang == "S" || lang == 0) {
		if ($('#languageerror').length) {
			$('#languageerror').show();
		} else {
			$("#language")
					.after(
							"<p class='error' id='languageerror'>Language is required.</p>");
		}
		flag = false;
	} else {
		$('#languageerror').hide();
	}

	if (releaseDate === "" || releaseDate === " ") {
		if ($('#releaseDate_error').length) {
			$('#releaseDate_error').show();
		} else {
			$("#release_date_icon")
					.after(
							"<span class='error' id='releaseDate_error'>Release Date is required.</span>");
		}
		flag = false;
	} else {
		$('#releaseDate_error').hide();
	}

	if (expiryDate === "" || expiryDate === " ") {
		if ($('#expiryDate_error').length) {
			$('#expiryDate_error').show();
		} else {
			$("#expiry_date_icon")
					.after(
							"<span class='error' id='expiryDate_error'>Expiry Date is required.</span>");
		}
		flag = false;
	} else {
		$('#expiryDate_error').hide();
	}

	if (source === "" || source === " ") {
		if ($('#source_error').length) {
			$('#source_error').show();
		} else {
			$("#source")
					.after(
							"<span class='error' id='source_error'>Source is required.</span>");
		}
		flag = false;
	} else {
		$('#source_error').hide();
	}

	return flag;
}
</script>
	</head>

	<body>

		<div class="col-md-6" style="padding-left: 0px;">
			<a id="myLink" href="${pageContext.request.contextPath}/getPoll.htm"
				target="_blank">Polling View Page</a>
		</div>
		<div class="container">


			<br>
			<form:form method="post" class="form form-horizontal"
				commandName="survey" enctype="multipart/form-data"
				action="./addSurveyQuestion.htm" onsubmit="return selectValidate()">

				<div class="col-md-12">
					<div class="col-md-3">
						<div class="form-group" style="padding-right: 25px">
							<label for="form-field-select-2">
								Language
							</label>
							<form:select class="cs-select cs-skin-elastic" path="language"
								id="language">
								<form:option value="0">Select a Language</form:option>
								<form:option value="ur">Urdu</form:option>
								<form:option value="te">Telugu</form:option>
								<form:option value="hi">Hindi</form:option>
								<form:option value="en">English</form:option>
							</form:select>

						</div>
					</div>

					<div class="col-md-3">
						<div class="form-group" style="padding-right: 25px">
							<label for="form-field-select-2">
								Release Date
							</label>
							<span class="input-group input-append datepicker date"
								style="padding: 0px;" id="release_date_icon"> <form:input
									type="text" class="form-control" path="releaseDate"
									id="releaseDate" readonly="true" /> <span
								class="input-group-btn">
									<button type="button" class="btn btn-default">
										<i class="glyphicon glyphicon-calendar"
											style="color: #007aff; padding: 3px;"></i>
									</button> </span> </span>
						</div>
					</div>

					<div class="col-md-3">
						<div class="form-group" style="padding-right: 25px">
							<label for="form-field-select-2">
								Expiry Date
							</label>
							<span class="input-group input-append datepicker date"
								style="padding: 0px;" id="expiry_date_icon"> <form:input
									type="text" class="form-control" path="expiryDate"
									id="expiryDate" readonly="true" /> <span
								class="input-group-btn">
									<button type="button" class="btn btn-default">
										<i class="glyphicon glyphicon-calendar"
											style="color: #007aff; padding: 3px;"></i>
									</button> </span> </span>
						</div>
					</div>



					<div class="col-md-3">
						<div class="form-group" style="padding-right: 20px;">
							<label for="form-field-select-2">
								Source
							</label>
							<form:input class="form-control" path="source" id="source" />

						</div>
					</div>

				</div>
				<div class="col-md-12">

					<div class="col-md-12">

						<div class="form-group" style="padding-right: 20px">
							<label>
								Question
							</label>
							<input type="text" class="form-control" id="question"
								name="question" />
						</div>

					</div>
				</div>




				<div class="col-md-12">

					<div class="col-md-6">

						<div class="form-group" style="padding-right: 20px">
							<label>
								Option 1
							</label>
							<input type="text" class="form-control" id="option1"
								name="option1" />

						</div>

					</div>
					<div class="col-md-6">

						<div class="form-group" style="padding-right: 20px">
							<label>
								Option 2
							</label>
							<input type="text" class="form-control" id="option2"
								name="option2" />

						</div>

					</div>
				</div>
				<div class="col-md-12">

					<div class="col-md-6">

						<div class="form-group" style="padding-right: 20px">
							<label>
								Option 3
							</label>
							<input type="text" class="form-control" id="option3"
								name="option3" />

						</div>

					</div>
					<div class="col-md-6">

						<div class="form-group" style="padding-right: 20px">
							<label>
								Option 4
							</label>
							<input type="text" class="form-control" id="option4"
								name="option4" />

						</div>

					</div>
				</div>






				<div class="col-md-12"
					style="margin-top: 13px; padding-right: 35px;">

					<form:button type="submit" class="btn btn-o btn-wide btn-primary"
						style="float:right;margin-left:10px">
					Submit
				</form:button>
					<form:button type="button" class="btn btn-o btn-wide btn-default"
						style="float:right">
										Reset
									</form:button>


				</div>

			</form:form>
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
