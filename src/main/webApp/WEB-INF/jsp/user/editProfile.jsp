<!DOCTYPE html>
<!--[if !IE]><!-->
<html lang="en">
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<!-- start: HEAD -->
	<head>
	
	 <meta name="_csrf" content="${_csrf.token}"/>
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
		<title></title>
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<link href="vendor/bootstrap-fileinput/jasny-bootstrap.min.css" rel="stylesheet" media="screen">
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
		<style>
		.fileinput-new.thumb {
		    width: 100%;
		}
		.Successfully {
		   border-left-color: #5cb85c !important;
		   
		}
		.Successfully:after {
		    border-color: #5cb85c !important;
		}
		.Modified {
		   border-left-color: #eea236 !important;
		   
		}
		.Modified:after {
		    border-color: #eea236 !important;
		}
		.Removed {
		   border-left-color: #d43f3a !important;
		   
		}
		.Removed:after {
		    border-color: #d43f3a !important;
		}
		.Added {
		   border-left-color: #007aff !important;
		   
		}
		.Added:after {
		    border-color: #007aff !important;
		}

    .cropArea {
	  background: #E4E4E4;
	  overflow: hidden;
	  width:500px;
	  height:350px;
	}

  </style><!--

	 <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.1/angular.js"></script>
	 <script type="text/javascript" src="https://cdn.rawgit.com/alexk111/ngImgCrop/master/compile/minified/ng-img-crop.js"></script>
     <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/alexk111/ngImgCrop/master/compile/minified/ng-img-crop.css">
     
	 If crroping here JavaScript CDATA -->
		
	</head>
	<!-- end: HEAD -->
	<body>
			
				<!-- start: USER PROFILE -->
						<div class="container-fluid container-fullw bg-white" style="margin-top:-50px; ">
							<div class="row">
								<div class="col-md-12">
									<div class="tabbable">
										<ul class="nav nav-tabs tab-padding tab-space-3 tab-blue" id="myTab4">
											<li class="active">
												<a data-toggle="tab" href="#panel_overview">
													Overview
												</a>
											</li>
											<li>
												<a data-toggle="tab" href="#panel_edit_account">
													Edit Account
												</a>
											</li>
											<li>
												<a data-toggle="tab" href="#panel_projects">
													Projects
												</a>
											</li>
										</ul>
										
										<div class="tab-content">
											<div id="panel_overview" class="tab-pane fade in active">
												<div class="row">
													<div class="col-sm-5 col-md-4">
													<c:forEach items="${listProfile}" var="profile"  varStatus="status">
														<div class="user-left">
															<div class="center">
																<h4>${profile.first_name} </h4>
																<div class="fileinput fileinput-new" data-provides="fileinput">
																	<div class="user-image">
																		<div class="fileinput-new thumbnail thumb">
																		<img  src="/ProfileImages/<%=request.getSession().getAttribute("user_Id") %>.png"  onerror="imgError(this);">
																		</div>
																		<div class="fileinput-preview fileinput-exists thumbnail"></div>
																		<div class="user-image-buttons">
																			
																		</div>
																	</div>
																</div>
																
																
																<br>
															</div>
															<table class="table table-condensed">
																<thead>
																	<tr>
																		<th colspan="3">Contact Information</th>
																	</tr>
																</thead>
																<tbody>
																	
																	<tr>
																		<td>email:</td>
																		<td>
																		<a href="">
																			${profile.email}
																		</a></td>
																		<td><a href="#panel_edit_account" class="show-tab"><i class="fa fa-pencil edit-user-info"></i></a></td>
																	</tr>
																	<tr>
																		<td>phone:</td>
																		<td>${profile.phone_number}</td>
																		<td><a href="#panel_edit_account" class="show-tab"><i class="fa fa-pencil edit-user-info"></i></a></td>
																	</tr>
																	<tr>
																		<td>address</td>
																		<td>
																		<a href="">
																			${profile.city}
																		</a></td>
																		<td><a href="#panel_edit_account" class="show-tab"><i class="fa fa-pencil edit-user-info"></i></a></td>
																	</tr>
																</tbody>
															</table>
															<table class="table">
																<thead>
																	<tr>
																		<th colspan="3">General information</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td>Position</td>
																		<td>${profile.post_name} </td>
																		
																	</tr>
																	<tr>
																		<td>Last Logged In</td>
																		<td>${profile.login_date}</td>
																		
																	</tr>
																	<tr>
																		<td>Role</td>
																		<td>${profile.role_name}</td>
																		
																	</tr>
																	<tr>
																		<td>Status</td>
																		<td><span class="label label-sm label-info">Active</span></td>
																		
																	</tr>
																</tbody>
															</table>
															<div style="height:200px"></div>
														</div>
														</c:forEach>
													</div>
													<div class="col-sm-7 col-md-8">
														<br/>
														<div class="panel panel-white" id="activities">
															<div class="panel-heading border-light">
																<h4 class="panel-title text-primary">Recent Activities</h4>
																<paneltool class="panel-tools" tool-collapse="tool-collapse" tool-refresh="load1" tool-dismiss="tool-dismiss"></paneltool>
															</div>
															<div collapse="activities" ng-init="activities=false" class="panel-wrapper">
																<div class="panel-body">
																	<ul class="timeline-xs">
																	<c:forEach items="${userActivity}" var="activity"  varStatus="cnt">
																		<li class="timeline-item ${activity.ACTIVITY_DESCRIPTION}">
																			<div class="margin-left-15">
																				<div class="text-muted text-small">
																				<c:out value="${activity.LOGDATE}"></c:out>
																					
																				</div>
																				<p>
																				<c:out value="${activity.ACTIVITY_DESCRIPTION}"></c:out>
																					
																				</p>
																			</div>
																		</li>
																		</c:forEach>
																		
																	</ul>
																</div>
															</div>
														</div>
														
													</div>
												</div>
											</div>
											<div id="panel_edit_account" class="tab-pane fade">
												<c:url var="addAction" value="/editProfile_imageUpload.htm" ></c:url>
    										
    	 											<form:form action="${addAction}" name="bean" commandName="bean" method="POST" enctype="multipart/form-data" id="customValidations" onsubmit="return submitValidate();">
													<fieldset>
														<legend>
															Account Info
														</legend>
														<c:forEach items="${listProfile}" var="list"  varStatus="st">
														<div class="row">
															<div class="col-md-6">
																<div class="form-group">
																	<label class="control-label">
																		First Name <span class="requried fname" >*</span>
																	</label>
																	<input type="text" placeholder="First Name" class="form-control requried only-letters" id="firstname" name="first_name"   value="${list.first_name}" maxlength="20">
																</div>
																<div class="form-group">
																	<label class="control-label">
																		Last Name
																	</label>
																	<input type="text" placeholder="Last Name/Sur Name" class="form-control only-letters" id="lastname" name="last_name" value="${list.last_name}" maxlength=20">
																</div>
																<div class="form-group">
																	<label class="control-label">
																		Email Address
																	</label>
																	<input type="email" placeholder="name@example.com" class="form-control" id="email" name="email_id" value="${list.email}">
																</div>
																<div class="form-group">
																	<label class="control-label">
																		Phone
																	</label>
																	<input type="text" placeholder="9999999999" class="form-control only-numbers" id="phone" name="phone_number" value="${list.phone_number}" maxlength="10">
																</div>
																
																
																<div class="checkbox clip-check check-primary checkbox-inline">
														<input type="checkbox" id="passwordCheck" value="off" name="passwordCheck" >
														<label for="passwordCheck">
															Do you want to change password?
														</label>
													</div>
																
																
																<div id="passInfo">
																<div class="form-group">
																	<label class="control-label">
																		Change Password <span class="need pass" ></span>
																	</label>
																	<input type="password" placeholder="password" class="form-control" name="password" id="password" readonly>
																</div>
																<div class="form-group">
																	<label class="control-label">
																		Confirm Password <span class="need passagin"></span>
																	</label>
																	<input type="password"  placeholder="confirm password" class="form-control" id="password_again" name="password_again" readonly>
																</div>
																</div>
																
																
																
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label class="control-label">
																		Gender
																	</label>
																	<div class="clip-radio radio-primary">
																		<input type="radio" value="female" name="gender" id="us-female">
																		<label for="us-female">
																			Female
																		</label>
																		<input type="radio" value="male" name="gender" id="us-male" checked>
																		<label for="us-male">
																			Male
																		</label>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-8">
																		<div class="form-group">
																			<label class="control-label">
																				Address
																			</label>
																			<input class="form-control" placeholder="Address" type="text" name="address" id="address" value="${list.address}">
																		</div>
																	</div>
																	<div class="col-md-4">
																		<div class="form-group">
																			<label class="control-label">
																				City
																			</label>
																			<input class="form-control tooltips" placeholder="City" type="text" data-original-title="We'll display it when you write reviews" data-rel="tooltip"  
																			title="" data-placement="top" name="city" id="city" value="${list.city}">
																		</div>
																	</div>
																</div>
																<div class="form-group">
																	<label>
																		Image Upload vr
																	</label>
													
																	
			<div class="fileinput fileinput-new" data-provides="fileinput">
				<div class="fileinput-new thumbnail" id="newInput">
				
					<img  src="/ProfileImages/<%=request.getSession().getAttribute("user_Id") %>.png" 
					 onerror="imgError(this);" class="file" id="fileId">
					 
				</div>
				<div class="fileinput-preview fileinput-exists thumbnail" id="existsInput"></div>
				<div class="user-edit-image-buttons">
					<span class="btn btn-azure btn-file"><span class="fileinput-new"><i class="fa fa-picture"></i> Select image</span>
						<span class="fileinput-exists"><i class="fa fa-picture"></i> Change</span>
						<input  id="inputFileToLoad" type="file" name="fileData" onchange="return imgValid(this);" >
					</span>
					<label id="inputFile-error" class="error" for="inputFileToLoad" ></label>
					<br/><label id="inputFile-size" class="error"  style="display:none; margin-left:10px;" >Image Width and Height should be between 200px and 260px;<br/>
					vist this site for <a href="http://imageresize.org/" target="_blank">Croping</a>,  please crop the image and try again. </label>
					
					<!-- errormsg <a href="#" class="btn fileinput-exists btn-red" data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>-->
				</div>
			</div>
			
	<!--<button class="btn btn-primary btn-o pull-right" data-toggle="modal" data-target=".bs-example-modal-lg" type="button"> If Croping </button>-->

<!-- Large Modal -->
	<div class="modal fade bs-example-modal-lg"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" 
	                    aria-hidden="true" style=" padding-top:8px " >
		<div class="modal-dialog modal-dialog modal-lg" >
			 <div class="modal-content" style="background-color: white;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					 <span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel"> <div>Select an image file: <input type="file" id="croper" /></div></h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
					<div class="col-md-12"> <div class="col-md-8" >
					                           
						<div class="cropArea">
						<img-crop image="myImage" result-image="myCroppedImage"></img-crop>
						</div>
						</div> 
						<div class="col-md-4" >
						<div>Cropped Image:</div>
						<div><img ng-src="{{myCroppedImage}}" /></div>
						</div>
					</div>
					
					</div>
				  
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary btn-o" data-dismiss="modal"> Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

<script>
  // tell the embed parent frame the height of the content
  if (window.parent && window.parent.parent){
    window.parent.parent.postMessage(["resultsFrame", {
      height: document.body.getBoundingClientRect().height,
      slug: "rw6q9"
    }], "*")
  }
</script>
  
<!-- /Large Modal -->
																	
																</div>
															</div>
														</div>
														</c:forEach>
													</fieldset>
													
													<div class="row">
														<div class="col-md-12">
															<div>
																Required Fields
																<hr>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-8">
															<p>
																By clicking UPDATE, you are agreeing to the Policy and Terms &amp; Conditions.
															</p>
														</div>
														<div class="col-md-4">
															<button class="btn btn-primary pull-right" type="submit">
																Update <i class="fa fa-arrow-circle-right"></i>
															</button>
														</div>
													</div>
												</form:form>
											</div>
											<div id="panel_projects" class="tab-pane fade">
												<table class="table" id="projects">
													<thead>
														<tr>
															<th>Project Name</th>
															<th class="hidden-xs">Client</th>
															<th>Proj Comp</th>
															<th class="hidden-xs">%Comp</th>
															<th class="hidden-xs center">Priority</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>IT Help Desk</td>
															<td class="hidden-xs">Master Company</td>
															<td>11 november 2014</td>
															<td class="hidden-xs">
															<div class="progress active progress-xs">
																<div style="width: 70%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="70" role="progressbar" class="progress-bar progress-bar-warning">
																	<span class="sr-only"> 70% Complete (danger)</span>
																</div>
															</div></td>
															<td class="center hidden-xs"><span class="label label-danger">Critical</span></td>
														</tr>
														<tr>
															<td>PM New Product Dev</td>
															<td class="hidden-xs">Brand Company</td>
															<td>12 june 2014</td>
															<td class="hidden-xs">
															<div class="progress active progress-xs">
																<div style="width: 40%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-info">
																	<span class="sr-only"> 40% Complete</span>
																</div>
															</div></td>
															<td class="center hidden-xs"><span class="label label-warning">High</span></td>
														</tr>
														<tr>
															<td>ClipTheme Web Site</td>
															<td class="hidden-xs">Internal</td>
															<td>11 november 2014</td>
															<td class="hidden-xs">
															<div class="progress active progress-xs">
																<div style="width: 90%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="90" role="progressbar" class="progress-bar progress-bar-success">
																	<span class="sr-only"> 90% Complete</span>
																</div>
															</div></td>
															<td class="center hidden-xs"><span class="label label-success">Normal</span></td>
														</tr>
														<tr>
															<td>Local Ad</td>
															<td class="hidden-xs">UI Fab</td>
															<td>15 april 2014</td>
															<td class="hidden-xs">
															<div class="progress active progress-xs">
																<div style="width: 50%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" role="progressbar" class="progress-bar progress-bar-warning">
																	<span class="sr-only"> 50% Complete</span>
																</div>
															</div></td>
															<td class="center hidden-xs"><span class="label label-success">Normal</span></td>
														</tr>
														<tr>
															<td>Design new theme</td>
															<td class="hidden-xs">Internal</td>
															<td>2 october 2014</td>
															<td class="hidden-xs">
															<div class="progress active progress-xs">
																<div style="width: 20%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="20" role="progressbar" class="progress-bar progress-bar-success">
																	<span class="sr-only"> 20% Complete (warning)</span>
																</div>
															</div></td>
															<td class="center hidden-xs"><span class="label label-danger">Critical</span></td>
														</tr>
														<tr>
															<td>IT Help Desk</td>
															<td class="hidden-xs">Designer TM</td>
															<td>6 december 2014</td>
															<td class="hidden-xs">
															<div class="progress active progress-xs">
																<div style="width: 40%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-warning">
																	<span class="sr-only"> 40% Complete (warning)</span>
																</div>
															</div></td>
															<td class="center hidden-xs"><span class="label label-warning">High</span></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- end: USER PROFILE -->
				<input type="hidden" value="off" id="imgSize">
		
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="vendor/bootstrap-fileinput/jasny-bootstrap.js"></script>
		<script src="resources/js/sha256.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script>
				$(document).ready(function(){
							$('.fname').css('color','red');	
																		    
					$('#passwordCheck').change(function() {
					if($(this).is(":checked")) {
						$('#password_again').removeAttr('readonly');
						$('#password').removeAttr('readonly');
						$(this).val("on");
						$('.need').text("*").css("color","red");
					}else{
						$('#password').attr('readonly', 'true');
						$('#password_again').attr('readonly', 'true');
						$(this).val("off");
						$('.need').text("");
					}
					});																				
				});
				
			function submitValidate(){	    
				var flag =$('#passwordCheck').val();
				var pass =$('#password').val();
				var aginpass =$('#password_again').val();
				var req=$('#firstname').val();
				
				if(req === ''){						
						$('.fname').text("requried").css("color","red");
						$('#firstname').focus();
						return false;			
					}
				if(flag === 'on'){
					if(pass === ''){
						$('.pass').text(" requried").css("color","red");
						$('#password').focus();
						return false;
					}else if(aginpass === ''){
						$('.passagin').text("requried").css("color","red");
						$('#password_again').focus();
						return false;
					}else if(!(pass === aginpass)){
						$('.passagin').text("not match with password").css("color","red");	
						return false;			
					} else{
						$('#password').val(Sha256.hash($('#password').val()));
						$('#password_again').val(Sha256.hash($('#password_again').val()));
						return true;
					}	
				}
				
				
				
				
								
			}
			
			$('#password').change(function() {
				if($(this).val() === ''){
				}else{
					$('.pass').text("*").css("color","red");
				}			
			});
			$('#password_again').change(function() {
				if($(this).val() === ''){
				}else{
					$('.passagin').text("*").css("color","red");
				}			
			});
			
			
			
			
			
			
			var _URL = window.URL || window.webkitURL;
				function imgValid(img) {
				var fileName = document.getElementById("inputFileToLoad").value;
			        var idxDot = fileName.lastIndexOf(".") + 1;
			        var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
			        if (extFile=="jpg" || extFile=="jpeg" || extFile=="png"){
			            $('#newInput').hide();
				     	 $('#existsInput').show();
				     	 $('#inputFile-error').hide();
				     	 $('#inputFile-size').hide();
			        }else{
			        	document.getElementById("inputFileToLoad").value="";
			       		 $('#newInput').show();
					     $('#existsInput').hide();
					     $('#inputFile-error').text("Only jpg/jpeg and png files are allowed!").css("color","red");
					     $('#inputFile-error').show();
					     $('#inputFile-size').hide();
					     
			        }   
					var x,y;
				
				   var file = img.files[0];
				   var img = new Image();
				   var sizeKB = file.size / 1024;
				   img.onload = function() {
					   	x =img.width;
					   	y=img.height;
					      
					     if(x >260 || y >260){	
						     $('#newInput').show();
						     $('#existsInput').hide();
						     $("#inputFile-size").show();
						     document.getElementById("inputFileToLoad").value=""; 
						     						   
					     }else{
					     	 $('#newInput').hide();
					     	 $('#existsInput').show();
					     	 $('#inputFile-size').hide();
					     	 $('#inputFile-error').hide();
					     }
				   }
				   
				   
				   img.src = _URL.createObjectURL(file);
				}
			
			
			
																
		</script>


		
	</body>
</html>
