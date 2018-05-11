
<%@ page language="java"  import="java.util.*" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'politicMLA.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


   <style type="text/css">
    .btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file #imgB {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}



.help-block {
    display: none;
    margin-top: 0px;
    margin-bottom: 0px;
}
    </style>
  </head>
  
  <body>
  <!-- start: WIZARD DEMO -->
						<div class="container-fluid container-fullw bg-white">
							<div class="row">
								<div class="col-md-12">
								
									<!-- start: WIZARD FORM -->
						
									<form:form method="post" class="smart-wizard" id="form" commandName="politics"
				enctype="multipart/form-data" action="./addWomens.htm" >
										<div id="wizard" class="swMain">
											<!-- start: WIZARD SEPS -->
											<ul>
												<li>
													<a href="#step-1">
														<div class="stepNumber">
															1
														</div>
														<span class="stepDesc"><small> English Information </small></span>
													</a>
												</li>
												<li>
													<a href="#step-2">
														<div class="stepNumber">
															2
														</div>
														<span class="stepDesc"> <small> Telugu Information </small></span>
													</a>
												</li>
												<li>
													<a href="#step-3">
														<div class="stepNumber">
															3
														</div>
														<span class="stepDesc"> <small> Hindi Information </small> </span>
													</a>
												</li>
												<li>
													<a href="#step-4">
														<div class="stepNumber">
															4
														</div>
														<span class="stepDesc"> <small> Urdu Information </small> </span>
													</a>
												</li>
												<li>
													<a href="#step-5">
														<div class="stepNumber">
															5
														</div>
														<span class="stepDesc"> <small> Common Details </small> </span>
													</a>
												</li>
											</ul>
											<!-- end: WIZARD SEPS -->
											<!-- start: WIZARD STEP 1 -->
											<div id="step-1">
												<div class="row">
													<div class="col-md-5">
														<div class="padding-30">
															<h2 class="StepTitle"> Enter Politician information in <b>English</b> language.</h2>
															<p>
																In this section is used for enter politician data details in english.
															</p>
															
														</div>
													</div>
													<div class="col-md-7">
														<fieldset>
															<legend>
																English Information
															</legend>
															<div class="row">
																<div class="col-md-12">
																	<div class="form-group">
																		<label>
																			Politician Name <span class="symbol required"></span>
																		</label>
																		<input class="form-control" name="nameEn" id="nameEn" />
																		
																	</div>
																</div>
																
															</div>
															<div class="row">
															<div class="col-md-6">
																	<div class="form-group">
																		<label>
																			Constituency location <span class="symbol required"></span>
																		</label>
																		<input class="form-control"  id="locationEn"  name="locationEn" />
																		
																	</div>
																</div>
															
																<div class="col-md-6">
																	<div class="form-group">
																		<label class="control-label">
																			Position <span class="symbol required"></span>
																		</label>
																		<input class="form-control" name="postEn" id="postEn" />
																		
																	</div>
																</div>
																
															</div>
															
														</fieldset>
														
														<div class="form-group">
															<button class="btn btn-primary btn-o next-step btn-wide pull-right">
																Next <i class="fa fa-arrow-circle-right"></i>
															</button>
														</div>
													</div>
												</div><br/><br/>
											</div>
											<!-- end: WIZARD STEP 1 -->
											<!-- start: WIZARD STEP 2 -->
											<div id="step-2">
												<div class="row">
													<div class="col-md-5">
														<div class="padding-30">
															<h2 class="StepTitle"> Enter Politician information in <b>Telugu</b> language.</h2>
															<p>
															In this section is used for enter politician data details in telugu.
															</p>
															
														</div>
													</div>
													<div class="col-md-7">
														<fieldset>
															<legend>
																Telugu Information
															</legend>
															<div class="row">
																<div class="col-md-12">
																	<div class="form-group">
																		<label>
																			Politician Name <span class="symbol required"></span>
																		</label>
																		<input class="form-control" name="nameTev" id="nameTe" 
																		onchange="encoding_utf(this.value ,'p_nameTe')"/>
																		<form:input type="hidden" id="p_nameTe" path="nameTe" />
																	</div>
																</div>
																
															</div>
															<div class="row">
															<div class="col-md-6">
																	<div class="form-group">
																		<label>
																			 Constituency location <span class="symbol required"></span>
																		</label>
																		<input class="form-control" name="locationTev" id="locationTe" onchange="encoding_utf(this.value ,'p_locationTe')"/>
																		<form:input type="hidden" id="p_locationTe" path="locationTe" />
																	</div>
																</div>
															
																<div class="col-md-6">
																	<div class="form-group">
																		<label class="control-label">
																			Position <span class="symbol required"></span>
																		</label>
																		<input class="form-control" name="postTev" id="postTe" 
																		onchange="encoding_utf(this.value ,'p_postTe')"/>
																		<form:input type="hidden" id="p_postTe" path="postTe" />
																	</div>
																</div>
																
															</div>
															<a href="https://translate.google.co.in/?hl=en&tab=wT#en/te/" target="_new">
															Google Translator for English to Telugu.</a>
														</fieldset>
														<div class="form-group">
															<button class="btn btn-primary btn-o back-step btn-wide pull-left">
																<i class="fa fa-arrow-circle-left"></i> Back
															</button>
															<button class="btn btn-primary btn-o next-step btn-wide pull-right">
																Next <i class="fa fa-arrow-circle-right"></i>
															</button>
														</div>
													</div>
												</div><br/><br/>
											</div>
											<!-- end: WIZARD STEP 2 -->
											<!-- start: WIZARD STEP 3 -->
											<div id="step-3">
												<div class="row">
													<div class="col-md-5">
														<div class="padding-30">
															<h2 class="StepTitle"> Enter Politician information in <b>Hindi</b> language.</h2>
															<p>
																In this section is used for enter politician data details in hindi.
															</p>
															
														</div>
													</div>
													<div class="col-md-7">
														<fieldset>
															<legend>
																Hindi Information
															</legend>
															<div class="row">
																<div class="col-md-12">
																	<div class="form-group">
																		<label>
																			Politician Name <span class="symbol required"></span>
																		</label>
																		<input class="form-control" name="nameHiv" id="nameHi" 
																		onchange="encoding_utf(this.value ,'p_nameHi')"/>
																		<form:input type="hidden" id="p_nameHi" path="nameHi" />
																	</div>
																</div>
																
															</div>
															<div class="row">
															<div class="col-md-6">
																	<div class="form-group">
																		<label>
																			Constituency location <span class="symbol required"></span>
																		</label>
																		<input class="form-control" name="locationHiv" id="locationHi" onchange="encoding_utf(this.value ,'p_locationHi')"/>
																		<form:input type="hidden" id="p_locationHi" path="locationHi" />
																	</div>
																</div>
															
																<div class="col-md-6">
																	<div class="form-group">
																		<label class="control-label">
																			Position <span class="symbol required"></span>
																		</label>
																		<input class="form-control" name="postHiv" id="postHi" 
																		onchange="encoding_utf(this.value ,'p_postHi')"/>
																		<form:input type="hidden" id="p_postHi" path="postHi" />
																	</div>
																</div>
																
															</div>
															<a href="https://translate.google.co.in/?hl=en&tab=wT#en/hi/" target="_new">
															Google Translator for English to Hindi.</a>
														</fieldset>
														<div class="form-group">
															<button class="btn btn-primary btn-o back-step btn-wide pull-left">
																<i class="fa fa-arrow-circle-left"></i> Back
															</button>
															<button class="btn btn-primary btn-o next-step btn-wide pull-right">
																Next <i class="fa fa-arrow-circle-right"></i>
															</button>
														</div>
													</div>
												</div><br/><br/>
											</div>
											<!-- end: WIZARD STEP 3 -->
											<!-- start: WIZARD STEP 4 -->
											<div id="step-4">
												<div class="row">
													<div class="col-md-5">
														<div class="padding-30">
															<h2 class="StepTitle"> Enter Politician information in <b>Urdu</b> language.</h2>
															<p>
																In this section is used for enter politician data details in urdu.
															</p>
															
														</div>
													</div>
													<div class="col-md-7">
														<fieldset>
															<legend>
																Urdu Information
															</legend>
															<div class="row">
																<div class="col-md-12">
																	<div class="form-group">
																		<label>
																			Politician Name <span class="symbol required"></span>
																		</label>
																		<input class="form-control" name="nameUrv" id="nameUr" 
																		onchange="encoding_utf(this.value ,'p_nameUr')"/>
																		<form:input type="hidden" id="p_nameUr" path="nameUr" />
																	</div>
																</div>
																
															</div>
															<div class="row">
															<div class="col-md-6">
																	<div class="form-group">
																		<label>
																			Constituency location <span class="symbol required"></span>
																		</label>
																		<input class="form-control" name="locationUrv" id="locationUr" onchange="encoding_utf(this.value ,'p_locationUr')"/>
																		<form:input type="hidden" id="p_locationUr" path="locationUr" />
																	</div>
																</div>
															
																<div class="col-md-6">
																	<div class="form-group">
																		<label class="control-label">
																			Position <span class="symbol required"></span>
																		</label>
																		<input class="form-control" name="postUrv" id="postUr" 
																		onchange="encoding_utf(this.value ,'p_postUr')"/>
																		<form:input type="hidden" id="p_postUr" path="postUr" />
																	</div>
																</div>
																
															</div>
															<a href="https://translate.google.co.in/?hl=en&tab=wT#en/ur/" target="_new">
															Google Translator for English to Urdu.</a>
														</fieldset>
														<div class="form-group">
															<button class="btn btn-primary btn-o back-step btn-wide pull-left">
																<i class="fa fa-arrow-circle-left"></i> Back
															</button>
															<button class="btn btn-primary btn-o next-step btn-wide pull-right">
																Next <i class="fa fa-arrow-circle-right"></i>
															</button>
														</div>
													</div>
												</div><br/><br/>
											</div>
											<!-- end: WIZARD STEP 4 -->
											<!-- start: WIZARD STEP 5 -->
											<div id="step-5">
												<div class="row">
													<div class="col-md-5">
														<div class="padding-30">
															<h2 class="StepTitle"> Enter Politician Other information.</h2>
															<p>
																In this section is used for enter politician communication data details in english.
															</p>
															
														</div>
													</div>
													<div class="col-md-7">
														<fieldset>
															<legend>
																Other Information
															</legend>
															<div class="row">
																<div class="col-md-6">
																	<div class="form-group">
																		<label>
																			Politician Image <span class="symbol required"></span>
																		</label>
																		
<div class="input-group">
            <span class="input-group-btn">
                <span class="btn btn-default btn-file">
                    Browse... <form:input type="file" accept="image/png, image/jpeg, image/gif" id="imgB" path="image"/>
                </span>
            </span>
            <input id='urlname'type="text" class="form-control" readonly>
        </div>

																	</div>
																</div>
																<div class="col-md-6" >

								<div class="form-group" >
										<label>Party Name</label> <span class="symbol required"></span>

								<form:select class="form-control selectpicker required" data-live-search="true" 
											id="party" path="partyCode" >

											<option value="">--Select a Party--</option>
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
															<div class="row">
															<div class="col-md-6">
																	<div class="form-group">
																		<label>
																			Mobile Number <span class="symbol required"></span>
																		</label>
																		<form:input class="form-control" path="contact" id="contact"  />
																	</div>
																</div>
															
																<div class="col-md-6">
																	<div class="form-group">
																		<label class="control-label">
																			Email Address <span class="symbol required"></span>
																		</label>
																		<form:input class="form-control" path="email" id="email"  />
																	</div>
																</div>
																
															</div>
															
														</fieldset>
														<div class="form-group">
															<button class="btn btn-primary btn-o back-step btn-wide pull-left">
																<i class="fa fa-arrow-circle-left"></i> Back
															</button>
															<form:button  class="btn btn-primary btn-o next-step btn-wide pull-right" onclick="submitBtn()">
																Submit <i class=" fa  fa-check-circle"></i>
															</form:button >
														</div>
													</div>
												</div><br/><br/>
											</div>
											<!-- end: WIZARD STEP 5 -->
											
											
											
											
										</div>
										</form:form>
									<!-- end: WIZARD FORM -->
								</div>
							</div>
						</div>
					
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
		<script src="vendor/jquery-smart-wizard/jquery.smartWizard.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<!-- start: CLIP-TWO JAVASCRIPTS -->
		<script src="assets/js/main.js"></script>
		<!-- start: JavaScript Event Handlers for this page -->
		<script src="assets/js/form-wizard.js"></script>
		<script>
			jQuery(document).ready(function() {
			
				FormWizard.init();
			});
		</script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->

		<script type="text/javascript">
	$(document).ready( function() {
    
    	$(document).on('change', '.btn-file :file', function() {
		var input = $(this),
			label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		input.trigger('fileselect', [label]);
		$('#imgB-error').hide();
		});

		$('.btn-file :file').on('fileselect', function(event, label) {
		   
		    var input = $(this).parents('.input-group').find(':text'),
		        log = label;
		    
		    if( input.length ) {
		        input.val(log);
		    } else {
		        if( log ) alert(log);
		    }
	    
		});
		
		function readURL(input) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        
		        reader.onload = function (e) {
		            $('#img-upload').attr('src', e.target.result);
		        }
		        
		        reader.readAsDataURL(input.files[0]);
		    }
		}

		$("#imgInp").change(function(){
		    readURL(this);
		});
		
		
	});
function submitBtn(){
 $("#form").submit();
}

function encoding_utf(data, idName){
	var res = encodeURI(data);	
		$('#'+idName).val(res);
}

	</script>
  </body>
</html>
