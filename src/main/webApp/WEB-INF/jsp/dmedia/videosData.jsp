<%@ page language="java"  import="java.util.*" %>

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
		--><base href="<%=basePath%>"><!--
		 <meta charset="UTF-8">
		--><link
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


	</head>
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
    .container{
    margin-top:20px;
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
	filter: alpha(opacity=0);
}
.image-preview-input-title {
    margin-left:2px;
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
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
    </style>
	<body>
		<div class="container">


   <br>
			<form:form method="post" class="form form-horizontal" commandName="video"
				enctype="multipart/form-data" action="./addVideoData.htm" onsubmit="return selectValidate()">

				<div class="panel panel-white">

					<div class="panel-body" style="padding: 20px">
						<div class="col-md-12">
							<div class="col-md-4">

								<div class="form-group" style="padding-right: 20px">
										<label>State Name</label>
									<form:select class="form-control selectpicker required" data-live-search="true" 
											id="state" path="state" >
												 <option value='0'>--Select a State--</option>
												 <form:options items="${StatesList}" />
												
										</form:select>	
								</div>
						
							</div>
							<div class="col-md-4">
							
							<div class="form-group" style="padding-right: 20px">
									<label>District Name</label>

									<form:select class="form-control selectpicker required" data-live-search="true" 
											id="district" path="district" >
												 <option value='0'>--Select a District--</option>
												 
												
										</form:select>	
									
							</div>

					</div>
							<div class="col-md-4" >

								<div class="form-group" >
										<label>Assembly Name</label>
										
									<form:select class="form-control selectpicker required" data-live-search="true" 
											id="assembly" path="assembly" >
												 <option value='0'>--Select a Assembly--</option>
												
										</form:select>	
										
								</div>

							</div>
						</div>
						
								<div class="col-md-12">
							<div class="col-md-4">

								<div class="form-group" style="padding-right: 20px">
										<label>Mandal Name</label>

											<form:select class="form-control selectpicker required" data-live-search="true" 
											id="mandal" path="mandal" >
												 <option value='0'>--Select a Mandal--</option>
												
										</form:select>	
										
								</div>
						
							</div>
							<div class="col-md-4">
							
							<div class="form-group" style="padding-right: 20px">
									<label>Village Name</label>

									<form:select class="form-control selectpicker required" data-live-search="true" 
											id="village" path="village" >
												 <option value='0'>--Select a Village--</option>
												
										</form:select>	
									
							</div>

					</div>
							<div class="col-md-4" >

								<div class="form-group" >
										<label>Party Name</label>
						<form:select class="form-control selectpicker required" data-live-search="true" 
											id="party" path="party" >

											<option value="1">--Select a Party--</option>
											<option value="0" >ALL</option>
											<option value="2" >Congress</option>
											<option value="3" >CPI</option>
											<option value="4" >CPM</option>
											<option value="5" >TDP</option>
											<option value="6" >TRS</option>
										</form:select>	

								</div>

							</div>
						</div>
					</div>
				</div> <!--Panel end -->
				
				<div class="col-md-12" >
				<div class="col-md-3" >
				<div class="form-group" style="padding-right:25px">
					<label for="form-field-select-2"> Language</label>
							<form:select class="cs-select cs-skin-elastic" path="language" id="language">
								<form:option value="0" >Select a Language</form:option>
								<form:option value="ur">Urdu</form:option>
								<form:option value="te">Telugu</form:option>
								<form:option value="hi">Hindi</form:option>
								<form:option value="en">English</form:option>
							</form:select>
				</div>				
				</div>
				
				<div class="col-md-3" >
				<div class="form-group" >
					<label for="form-field-select-2">Video Duration </label>
							<form:input class="form-control" path="duration" id="duration"/>
				</div>				
				</div>
				
			
				
				<div class="col-md-6" >
				<div class="form-group" style="padding-left:25px">
					<label for="form-field-select-2">Youtube Code <span style="padding:5px;cursor: pointer;"> 
					<span id="help" title="Example for code" data-html="true"  data-toggle="popover" data-placement="top" 
					data-content="
					<div > www.youtube.in/watch?v=<u><b>auxrmpxko</b></u>
					<br><br>Youtube video url look like above link, in the url we need that highlighted information code only.</div>
					">
					<i class="ti-help-alt text-large text-primary"></i></span></span></label>
							<form:input class="form-control" path="youtubeCode" id="youtubeCode"/>
								
				</div>				
				</div>
				
				</div>
				
				<div class="col-md-12" style="margin-bottom: 13px;">
				<label for="form-field-select-2">Video Title</label>
				<input type="text"  class="form-control"  onchange=" encode_title(this.value);" id="title"/>
				<form:input type="hidden" id="n_title" path="title" />
				</div>
				
				
				<div class="col-md-12" style="margin-top: 13px;">
				<div class="col-md-6 clip-radio radio-primary" >
				
		
				<div class="clip-radio radio-primary" >
						<form:radiobutton id="notification" path="notification" value="true"/>
									<label for="notification">
											Enable this video notifications
										</label>
										
									</div>
				</div> 
				
				<div class="col-md-6">
				<form:button type="submit" class="btn btn-o btn-wide btn-primary" style="float:right;margin-left:10px">
					Submit
				</form:button>
				<form:button type="button" class="btn btn-o btn-wide btn-default" style="float:right">
										Reset
									</form:button>
									</div>
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
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.min.js"></script>
	<!-- start: JavaScript Event Handlers for this page -->
	<script src="assets/js/form-elements.js">
</script>
	<script>
	function encode_title( s )
	{

		var res = encodeURI(s);
		
		$('#n_title').val(res);
	}
	

	
jQuery(document).ready(function() {

	FormElements.init();
});
</script>
	<script type="text/javascript">
	$("#help").popover().on("show.bs.popover", function(e){
    	p.data("bs.popover").tip().css({"max-width": "500px"});
	});
	$(document).on('click', '#close-preview', function(){ 
    $('.image-preview').popover('hide');
    // Hover befor close the preview
    $('.image-preview').hover(
        function () {
           $('.image-preview').popover('show');
        }, 
         function () {
           $('.image-preview').popover('hide');
        }
    );    
});

    	$(function() {
    		
			$('#state').on('change', function(){
			var selected = $(this).find("option:selected").val();   	   		 
			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/ajaxController/districtsList/'+selected+'.htm',	
				 beforeSend: function(){
						        $('#divLoading').show();
						    },
						complete: function(){
						        $('#divLoading').hide();
						    },			
				success:function(data){
					$('#district').html(data);
					$('#district').selectpicker('refresh');
					}
				});	
			});
						$('#district').on('change', function(){
			var selected = $(this).find("option:selected").val();   	   		 
			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/ajaxController/assemblyList/'+selected+'.htm',	
				 beforeSend: function(){
						        $('#divLoading').show();
						    },
						complete: function(){
						        $('#divLoading').hide();
						    },			
				success:function(data){
					$('#assembly').html(data);
					$('#assembly').selectpicker('refresh');
					}
				});	
			});
			
									$('#assembly').on('change', function(){
			var selected = $(this).find("option:selected").val();   	   		 
			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/ajaxController/mandalList/'+selected+'.htm',	
				 beforeSend: function(){
						        $('#divLoading').show();
						    },
						complete: function(){
						        $('#divLoading').hide();
						    },			
				success:function(data){
					$('#mandal').html(data);
					$('#mandal').selectpicker('refresh');
					}
				});	
			});
			
									$('#mandal').on('change', function(){
			var selected = $(this).find("option:selected").val();   	   		 
			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/ajaxController/villageList/'+selected+'.htm',	
				 beforeSend: function(){
						        $('#divLoading').show();
						    },
						complete: function(){
						        $('#divLoading').hide();
						    },			
				success:function(data){
					$('#village').html(data);
					$('#village').selectpicker('refresh');
					}
				});	
			});

		});

function selectValidate(){
	var party =$('#party').val();
	var lang = $('#language').val();	
	var youtubeCode =$('#youtubeCode').val();
	var title =$('#title').val();
	var duration = $('#duration').val();	
	
	
	var flag = true;
	if (party === "S" || party ===1 || party=="S" || party==1){
			if($('#partyerror').length){
				$('#partyerror').show();								
			}else{
				$( "#party" ).after( "<span class='error' id='partyerror'>&nbsp please select a party.</span>" );
			}	
								flag = false;
		}else{
			$('#partyerror').hide();
		}
		
		if (lang === "S" || lang ===0 || lang=="S" || lang==0){
			if($('#languageerror').length){
				$('#languageerror').show();								
			}else{
				$( "#language" ).after( "<p class='error' id='languageerror'>language is required.</p>" );
			}	
								flag = false;
		}else{
			$('#languageerror').hide();
		}
		
		if (youtubeCode === "" || youtubeCode ===" "){
			if($('#youtubeCodeerror').length){
				$('#youtubeCodeerror').show();								
			}else{
				$( "#youtubeCode" ).after( "<span class='error' id='youtubeCodeerror'>youtube video code is required.</span>" );
			}	
								flag = false;
		}else{
			$('#youtubeCodeerror').hide();
		}
		
		if (title === "" || title ===" "){
			if($('#titleerror').length){
				$('#titleerror').show();								
			}else{
				$( "#title" ).after( "<span class='error' id='titleerror'>video title is required.</span>" );
			}	
								flag = false;
		}else{
			$('#titleerror').hide();
		}
		
		if (duration === "" || duration ===" "){
			if($('#durationerror').length){
				$('#durationerror').show();								
			}else{
				$( "#duration" ).after( "<span class='error' id='durationerror'>video duration is required.</span>" );
			}	
								flag = false;
		}else{
			$('#durationerror').hide();
		}
		
		
		
return flag;					
}

	</script>
</html>
