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
	filter: alpha(opacity =         0);
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

function selectValidate(){

	var releaseDate =$('#releaseDate').val();
	var expiryDate =$('#expiryDate').val();
	var path =$('#img_path').val();

	var flag = true;
		
		if (releaseDate === "" || releaseDate ===" "){
			if($('#releaseDate_error').length){
				$('#releaseDate_error').show();								
			}else{
				$( "#release_date_icon" ).after( "<span class='error' id='releaseDate_error'>Release Date is required.</span>" );
			}	
								flag = false;
		}else{
			$('#releaseDate_error').hide();
		}
		
						if (expiryDate === "" || expiryDate ===" "){
			if($('#expiryDate_error').length){
				$('#expiryDate_error').show();								
			}else{
				$( "#expiry_date_icon" ).after( "<span class='error' id='expiryDate_error'>Expiry Date is required.</span>" );
			}	
								flag = false;
		}else{
			$('#expiryDate_error').hide();
		}
		
				
		if (path === "" || path ===" "){
			if($('#img_patherror').length){
				$('#img_patherror').show();								
			}else{
				$( "#img_path_icon" ).after( "<span class='error' id='img_patherror'>Advertisement image is required.</span>" );
			}	
			flag = false;
		}else{
			$('#img_patherror').hide();
		}
		

		
return flag;					
}

</script>
	</head>

	<body>
	
		<div class="container">

			<br>
			<form:form method="post" class="form form-horizontal"
				commandName="advertisement" enctype="multipart/form-data"
				action="./addAdvertisement.htm" onsubmit="return selectValidate()">

				<div class="panel panel-info col-md-12" >

	    			<div class="panel-heading"><b>Note:: </b>Advertisement PopUp banner Image must be 600X800 size,for better visible.Download 600X800 Image <a href="#">Template</a> here </div>

	  			</div>
				<div class="col-md-12">

					<div class="col-md-4">
						<div class="form-group" style="padding-right: 25px">
							<label for="form-field-select-2">
								Valid from
							</label>
							<span class="input-group input-append datepicker date"
								style="padding: 0px;" id="release_date_icon"> <form:input
									type="text" class="form-control" path="releaseDate" id="releaseDate"
									readonly="true" /> <span class="input-group-btn">
									<button type="button" class="btn btn-default">
										<i class="glyphicon glyphicon-calendar"
											style="color: #007aff; padding: 3px;"></i>
									</button> </span> </span>
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="form-group" style="padding-right: 25px">
							<label for="form-field-select-2">
								Valid to
							</label>
							<span class="input-group input-append datepicker date"
								style="padding: 0px;" id="expiry_date_icon"> <form:input
									type="text" class="form-control" path="expiryDate" id="expiryDate"
									readonly="true" /> <span class="input-group-btn">
									<button type="button" class="btn btn-default">
										<i class="glyphicon glyphicon-calendar"
											style="color: #007aff; padding: 3px;"></i>
									</button> </span> </span>
						</div>
					</div>
					
				<div class="col-md-4">
						<div class="form-group">
							<label for="form-field-select-2">
								Advertisement Image
							</label>
							<!-- image-preview-filename input [CUT FROM HERE]-->
							<div class="input-group image-preview" id="img_path_icon">
								<input type="text" id="img_path"
									class="form-control image-preview-filename" readonly="true"
									style="border-radius: 4px">
								<!-- don't give a name === doesn't send on POST/GET -->
								<span class="input-group-btn"> <!-- image-preview-clear button -->
									<button type="button"
										class="btn btn-default image-preview-clear"
										style="display: none;">
										<span class="glyphicon glyphicon-remove"
											style="color: #9acaff"></span> Clear
									</button> <!-- image-preview-input -->
									<div class="btn btn-default image-preview-input">
										<span class="glyphicon glyphicon-folder-open"
											style="color: #007aff !important"></span>
										<span class="image-preview-input-title">Browse</span>
										<form:input type="file"
											accept="image/png, image/jpeg, image/gif" path="image" />

										<!-- rename it -->
									</div> </span>
							</div>
							<!-- /input-group image-preview [TO HERE]-->
						</div>

					</div>			

				</div>	

				<div class="col-md-12" style="margin-top: 13px;  padding-right: 15px;">
			
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
	<script type="text/javascript">
$(document).on('click', '#close-preview', function() {
	$('.image-preview').popover('hide');
	// Hover befor close the preview
		$('.image-preview').hover(function() {
			$('.image-preview').popover('show');
		}, function() {
			$('.image-preview').popover('hide');
		});
	});

$(function() {
    // Create the close button
    var closebtn = $('<button/>', {
        type:"button",
        text: 'x',
        id: 'close-preview',
        style: 'font-size: initial;',
    });
    closebtn.attr("class","close pull-right");
    // Set the popover default content
    $('.image-preview').popover({
        trigger:'manual',
        html:true,
        title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
        content: "There's no image",
        placement:'bottom'
    });
    // Clear event
    $('.image-preview-clear').click(function(){
        $('.image-preview').attr("data-content","").popover('hide');
        $('.image-preview-filename').val("");
        $('.image-preview-clear').hide();
        $('.image-preview-input input:file').val("");
        $(".image-preview-input-title").text("Browse"); 
    }); 
    // Create the preview image
    $(".image-preview-input input:file").change(function (){     
        var img = $('<img/>', {
            id: 'dynamic',
            width:250,
            height:200
        });      
        var file = this.files[0];
        var reader = new FileReader();
        // Set preview image into the popover data-content
        reader.onload = function (e) {
            $(".image-preview-input-title").text("Change");
            $(".image-preview-clear").show();
            $(".image-preview-filename").val(file.name);            
            img.attr('src', e.target.result);
            $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
        }        
        reader.readAsDataURL(file);
    });  
});

	</script>
	
</html>
