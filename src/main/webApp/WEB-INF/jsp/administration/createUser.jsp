<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		.lockY{
		background-color: #cd5c5c;
		border-color: #cd5c5c;
		color:white;
		}
		.lockY:active, .lockY.active, .lockY.active:focus, 
		.lockY:active:focus, .lockY:active:hover, .lockY.dropdown-toggle:active:hover ,.lockY:hover {
		    background-color: #df9898 !important;
		    border-color: #df9898;
		    color:white;
		}
		.error{
			color:red;
		}
		.disableY{
		
		}
		
			</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.min.css">
  </head>
  
  <body >
  <p> 
  <button type="button" class="btn btn-success btn-info btn-scroll btn-scroll-left ti-user" id="showbutton"
  	  onclick="newCreate();"><span>Create New User</span>
	</button>
  </p>
  <div class="row margin-left-30" id="tableHide">
		
       
        <div class="col-md-11 panel panel-white" >
         
        <div class="table-responsive margin-top-10 margin-bottom-30">

                <div class="input-group col-md-12">
			<p><span class="input-icon input-icon-right">
			<input type="search" placeholder="Search" id="search" class="form-control">
			<i class="ti-search"></i> </span></p>
			</div>
     <table id="mytable" class="table table-bordred table-striped table-search">
                   
                   <thead>                                    
                   <th>User ID</th>
                    <th> Name of User</th>          
                     <th>Role Name</th>
                     <th>Post Name</th>
                    
                      <th>Edit</th> 
                       <th>Block/ UnBlock</th>
                      <th>Reset Password</th>                    
                      
                   </thead>
    <tbody>	
		<c:forEach items="${listUsers}" var="user"  varStatus="status">
		<tr>
			<td >${user.user_serial_no}</td>
			<td>${user.user_login_name}</td>						
			<td>${user.role_name}</td>
			<td>${user.post_name}</td>

			<td><button class="btn btn-primary btn-xs disable${user.user_lock} " 
			onclick="callEditAjaxRequest(${user.user_serial_no});">
    <span class="glyphicon glyphicon-pencil"></span></button></td>
    
    <td style="text-align: center; vertical-align: middle;">
    
    <button onclick="callDelateRequest(${user.user_serial_no} , '${user.user_login_name}','${user.user_lock}' )" 
    class="btn btn-xs btn-light-blue lock${user.user_lock}"  data-title="Delete" data-toggle="modal" data-target="#delete" >
    <span class="glyphicon glyphicon-ban-circle"></span>
    </button>
    
    </td>
    
    
    <td style="text-align: center; vertical-align: middle;" ><button class="btn btn-warning btn-xs disable${user.user_lock}" 
			onclick="callResetRequest(${user.user_serial_no} , '${user.user_login_name}');">
    <span class="glyphicon glyphicon-wrench"></span></button></td>
		</tr>
		
	</c:forEach>
		
	
  
   </tbody>
        
</table>
                
            </div>
            
        </div>
	</div>

	<div id="createNew" style="display: none" class="Ajaxcalls">
	 <input type="hidden"  id="editlength" value='1' />
		<c:url var="addAction" value="/user/add.htm" ></c:url>
    	 <form:form action="${addAction}"  commandName="user" method="post" id="formCheckPassword" onsubmit="return selectValidate()">
    	 <input type="hidden" id="changer" name="changer">
    	 <input type="hidden" id="serial_no" name="serial_no" value="${user_id}">
    	 
	  <div class="col-md-12 panel panel-white" >
	  <div class="col-md-11" ><BR/><BR/>
	  <center>
	  <table width="60%" >
			<tr><th>	Role <span class="symbol required"></span></th>
			<td>
			<form:select class="form-control selectpicker required" data-live-search="true" 
				id="role_id" path="role_id" >
					 <option value='S'>--Select--</option>
					 <form:options items="${RolesList}" />
			</form:select>		
			</td></tr>
			<tr><td> &nbsp;</td></tr>
		<tr><th>	Post <span class="symbol required"></span></th>
			<td>
			<form:select class="form-control selectpicker required" data-live-search="true" 
				id="post_id" path="post_id" >
					 <option value='S'>--Select--</option>
			</form:select>
			</td></tr>
			<tr><td> &nbsp;</td></tr>
			<tr><th>
			First Name <span class="symbol required"></span>
			</th>
			<td><input type="text" placeholder="Enter First Name" class="form-control only-letters" id="firstname" name="firstname" ></td>
			</tr>
			<tr><td> &nbsp;</td></tr>
			<tr><th>
			Username <span class="symbol required"></span>
			</th>
			<td><input type="text" placeholder="Enter User Name" class="form-control only-letters" id="username" name="username"></td>
			</tr>
			<tr><td> &nbsp;</td></tr>
			<tr class="passwordHide"><th>
			Password <span class="symbol required"></span>
			</th>
			<td><input type="password" placeholder="Enter Password" class="form-control" id="password" name="password" ></td>
			</tr>
				<tr><td> &nbsp;</td></tr>
			<tr class="passwordHide"><th>
			Confirm Password <span class="symbol required"></span>
			</th>
			<td><input type="password"  placeholder="Re-Enter password" class="form-control" id="password_again" name="password_again" ></td>
			</tr>
	</table>
	  </center>
	  </div>
	  <div class="col-md-9 margin-bottom-15">
	  <button class="btn  btn-wide btn-azure pull-right margin-top-20 margin-left-20 " type="button" onclick="cancleCreate()">
													Cancel <i class="glyphicon glyphicon-remove"></i>
	  </button>
       <button class="btn  btn-wide btn-success pull-right margin-top-20 nameChange" type="submit" id="" >
													Register <i class="fa fa-arrow-circle-right"></i>
	   </button>
      </div>	
	  </div>	
	  </form:form>
	</div>



    
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading"><span class="blocking"></span> this User</h4>
      </div>
          <div class="modal-body bg-white">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span>
        Are you sure you want to <span class="blocking"></span> user <mark id="blockUser"></mark>?</div>
       
       
      </div>
        <div class="modal-footer ">
        <a id="delateUrl"><button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button></a>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div> 
    
    <div id="resetNew" style="display: none">
	 <input type="hidden"  id="editlength" value='1' />
		<c:url var="addAction" value="/createUsers/resetPassword.htm" ></c:url>
    	 <form:form action="${addAction}"  commandName="user" method="post" id="formCheck" onsubmit="return checkValidate()">
    	 <input type="hidden" id="reset_serial_no" name="serial_no" >
		  <div class="col-md-12 panel panel-white" >
		  <div class="col-md-11" ><BR/><BR/>
		  <center>
		  <table width="60%" >
			<tr ><th>
			Name of User 
			</th>
			<td ><span id="resetUserName"></span></td>
			</tr>
			<tr><td> &nbsp;</td></tr>
			<tr ><th>
			Old Password / Master Password<span class="symbol required"></span>
			</th>
			<td><input type="password" onchange="checkMaster(this);" placeholder="Enter Old Password" class="form-control" 
			id="master_password" name="master_password">
			<span id="passCheck"></span>
			</td>
			</tr>
			<tr><td> &nbsp;</td></tr><tr><td> &nbsp;</td></tr>
			<tr ><th>
			New Password <span class="symbol required"></span>
			</th>
			<td><input type="password" placeholder="Enter New Password" readonly title="First Enter Old Password/ Master Password"
			class="form-control" id="reset_password" name="reset_password"></td>
			</tr>
				<tr><td> &nbsp;</td></tr>
			<tr ><th>
			Confirm Password <span class="symbol required"></span>
			</th>
			<td><input type="password"  placeholder="Re-Enter New password" class="form-control" readonly id="re_newpassword" name="re_newpassword"></td>
			</tr>
	</table>
	  </center>
	  </div>
	  <div class="col-md-9 margin-bottom-15">
	  <button class="btn  btn-wide btn-azure pull-right margin-top-20 margin-left-20 " type="button" onclick="cancleCreate()">
													Cancel <i class="glyphicon glyphicon-remove"></i>
	  </button>
      <button  class="btn  btn-wide btn-success pull-right margin-top-20 nameChange"   type="submit" >
													Reset <i class="fa fa-arrow-circle-right"></i>
	   </button>
      </div>	
	  </div>	
	  </form:form>
	</div>
    
    
     
</body>

		
		<!-- end: JavaScript Event Handlers for this page -->
		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="resources/js/sha256.js"></script>
		<script src="resources/js/tablesearch.js"></script>
		 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.min.js"></script>
		 <!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="vendor/ckeditor/ckeditor.js"></script>
		<script src="vendor/ckeditor/adapters/jquery.js"></script>
		<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		 
		<script>
		
		function newCreate(){
			$('#createNew').show();
			$('#resetNew').hide();
			$('#tableHide,#showbutton').hide();
			$('.passwordHide').show();
			$('.nameChange').html("Register <i class='fa fa-arrow-circle-right'></i>").removeClass("btn-warning").addClass("btn-primary");
		}
	
		function cancleCreate(){
			location.reload();
		}
		
		function callEditAjaxRequest(userId){
		    $('#changer').val("1");
		    $('#serial_no').val(userId);
		    $('.passwordHide').hide();
		    	$.ajax({
					type:'GET',
					url:'${pageContext.request.contextPath}/ajaxController/editusers/'+userId+'.htm',
					 dataType: 'json',
					 beforeSend: function(){
						        $('#divLoading').show();
						         document.getElementsByClassName("Ajaxcalls")[0].style.filter = "blur(3px)";
						    },
						complete: function(){
						        $('#divLoading').hide();
						         document.getElementsByClassName("Ajaxcalls")[0].style.filter = "blur(0px)";
						    },
						success:function(data){
							 $.each(data, function(index, op) {
							 	$('#serial_no').val(op.USER_SERIAL_NO);
							 	$('#role_id').val(op.ROLE_ID);
							 	$('#post_id').html("<option value="+op.POST_ID+">"+op.POST_NAME+"</option>");
							 	$('#firstname').val(op.USER_LOGIN_NAME);
							 	$('#username').val(op.USER_NAME);
							 	
							 	$('#role_id').selectpicker('refresh');
							 	$('#post_id').selectpicker('refresh');
					        });				
						}		
				});	
			$('#resetNew').hide();
			$('#createNew').show();
			$('#tableHide,#showbutton').hide();
			$('.nameChange').html("Update <i class='fa fa-arrow-circle-right'></i>").addClass("btn-warning");			
		  }
    
			function callDelateRequest(id , name,lock){
				if(lock === 'Y'){
				$('.blocking').text("Un Block");
				}else{
				$('.blocking').text("Block");
				}
				$('#blockUser').text(name);
				$("#delateUrl").attr("href", "createUsers/block/"+id+"/"+lock+".htm");
			}
		
    	$(function() {
    	alert(pageContext.request.contextPath);
    		$('.disableY').prop('disabled', true);
    		$('.lockY').removeClass( "btn-light-blue" );
			$('#role_id').on('change', function(){
			var selected = $(this).find("option:selected").val();   	   		 
			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/ajaxController/postsList/'+selected+'.htm',	
				 beforeSend: function(){
						        $('#divLoading').show();
						    },
						complete: function(){
						        $('#divLoading').hide();
						    },			
				success:function(data){
					$('#post_id').html(data);
					$('#post_id').selectpicker('refresh');
					}
				});	
			});
		});
		
	
		function callResetRequest(userId, name){
			$('#resetUserName').html("<b>"+name+"</b>");
			$('#reset_serial_no').val(userId);
			$('#resetNew').show();
			$('#createNew').hide();
				$('#tableHide,#showbutton').hide();
				$('.nameChange').html("Reset <i class='fa fa-arrow-circle-right'></i>").addClass("btn-warning");
		}
		
		$("#formCheckPassword").validate({
           rules: {         
           	 firstname: {
           	 required: true,
           	 },
           	 username: {
           	 	required: true,
           	 },
               password: { 
                 required: true,
                    minlength: 6
                    
               } , 
                   password_again: { 
                    required: true,
                    equalTo: "#password",
                     minlength: 6                     
               }
           },          		
		   messages:{
		     	username: { 
		                 required:"Username is required"
		               },
		         password: { 
		                 required:"Password is required"
		               },
		         firstname: { 
		                 required:"Firstname is required"
		               },
		         password_again: {
		         	required:"Confirm Password is required"
		         }
		    }
		     
	      });	

	
	  $("#formCheck").validate({
           rules: {    		
	           	master_password :{
	           	  required: true,
	           	},
	            reset_password: { 
	              required: true,
	              minlength: 2

	            } , 
	            re_newpassword: { 
	               required: true,
	               equalTo: "#reset_password",
	               minlength: 2       
	           }
           },
           		
    		 messages:{
		         master_password: { 
		                 required:"Old Password is required"
		               },
		         reset_password: { 
		                 required:"New Password is required"
		               },
		         re_newpassword: { 
		                 required:"Confirm New Password is required"
		               },
    
     		}
     
	      });	
	      
	      function selectValidate(){	    
					var req = $('#post_id').val();
					var role = $('#role_id').val();
						
						 if($('#password_again').val() != ""){
							$('#password').val(Sha256.hash($('#password').val()));
							$('#password_again').val(Sha256.hash($('#password_again').val()));							
						}
						
						if (role === "S" || role ===0 || role=="S" || role==0){
							if($('#roleerror').length){		
							}else{
								$( "#role_id" ).after( "<span class='error' id='roleerror'>Role Name is required</span>" );
							}	
								return false;
						}
						if (req === "S" || req ===0 || req=="S" || req==0){
							if($('#posterror').length){		
							}else{
								$( "#post_id" ).after( "<span class='error' id='posterror'>Post Name is required</span>" );
							}	
								return false;
						}
						
						$( "#role_id" ).after( "<span class='error' id='roleerror'></span>" );
						$( "#post_id" ).after( "<span class='error' id='posterror'></span>" );
					
						return true;			
		}
	  
	      
	      function checkMaster(master){
	      		var masterPass = master.value;
	      		var userId = $('#reset_serial_no').val();
		      	$.ajax({
					type:'GET',
					url:'${pageContext.request.contextPath}/createUser/passwordCheck/'+Sha256.hash(masterPass)+'/'+userId+'.htm',
					 beforeSend: function(){
							        $('#divLoading').show();
							    },
							complete: function(){
							        $('#divLoading').hide();
							    },				
					success:function(data){
						
						if(data == "ok"){
							
								$( "#passCheck" ).html( "<span Style='color:green'>Password is valid</span>" );
								 $("#reset_password").attr("readonly", false);
								 $("#re_newpassword").attr("readonly", false);
									
						}else{
							$( "#passCheck" ).html( "<span Style='color: red'>Password is invalid</span>" );
							$("#reset_password").attr("readonly", true);
							$("#re_newpassword").attr("readonly", true);
						}
					}
				});
	      }         	
		  
		  function checkValidate(){	    
											
			 	if($('#re_newpassword').val() != ""){
					$('#reset_password').val(Sha256.hash($('#reset_password').val()));
					$('#re_newpassword').val(Sha256.hash($('#re_newpassword').val()));							
				}
				return true;			
		}
		  
		</script>

</html>
