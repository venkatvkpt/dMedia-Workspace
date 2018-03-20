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
    
    <title>My JSP 'mapServices.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.min.css">
	<style>
		.add{
			color: #d6e9c6
		}
		.add:hover{
			color:#70c69b;
		}
		.drop{
			color: #f2dede;
		}
		.drop:hover{
			color:#c67070;
		}
		
		.panel-heading, .panel-primary .panel-heading {
		    background-color: #ebebff;
		    border: none;
		}
			
	</style>
	
	   <style type="text/css">
    .checkbox {
  padding-left: 20px; 
       margin-top: 0px; 
    margin-bottom: -10px; 
  }
   
  .checkbox label {
    display: inline-block;
    position: relative;
    padding-left: 5px; }
    .checkbox label::before {
      content: "";
      display: inline-block;
      position: absolute;
      width: 17px;
      height: 17px;
      left: 0;
      margin-left: -20px;
      border: 1px solid #cccccc;
      border-radius: 3px;
      background-color: #fff;
      -webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
      -o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
      transition: border 0.15s ease-in-out, color 0.15s ease-in-out; }
    .checkbox label::after {
      display: inline-block;
      position: absolute;
      width: 16px;
      height: 16px;
      left: 0;
      top: 0;
      margin-left: -20px;
      padding-left: 2px;
      padding-top: 1px;
      font-size: 11px;
      color: #555555; }
  .checkbox input[type="checkbox"] {
    opacity: 0; }
    .checkbox input[type="checkbox"]:focus + label::before {
      outline: thin dotted;
      outline: 5px auto -webkit-focus-ring-color;
      outline-offset: -2px; }
    .checkbox input[type="checkbox"]:checked + label::after {
      font-family: 'FontAwesome';
      content: "\f00c"; }
    .checkbox input[type="checkbox"]:disabled + label {
      opacity: 0.65; }
      .checkbox input[type="checkbox"]:disabled + label::before {
        background-color: #eeeeee;
        cursor: not-allowed; }
  .checkbox.checkbox-circle label::before {
    border-radius: 50%; }
  .checkbox.checkbox-inline {
    margin-top: 0; }

.checkbox-primary input[type="checkbox"]:checked + label::before {
  background-color: #428bca;
  border-color: #428bca; }
.checkbox-primary input[type="checkbox"]:checked + label::after {
  color: #fff; }

.checkbox-danger input[type="checkbox"]:checked + label::before {
  background-color: #d9534f;
  border-color: #d9534f; }
.checkbox-danger input[type="checkbox"]:checked + label::after {
  color: #fff; }

.checkbox-info input[type="checkbox"]:checked + label::before {
  background-color: #5bc0de;
  border-color: #5bc0de; }
.checkbox-info input[type="checkbox"]:checked + label::after {
  color: #fff; }

.checkbox-warning input[type="checkbox"]:checked + label::before {
  background-color: #f0ad4e;
  border-color: #f0ad4e; }
.checkbox-warning input[type="checkbox"]:checked + label::after {
  color: #fff; }

.checkbox-success input[type="checkbox"]:checked + label::before {
  background-color: #5cb85c;
  border-color: #5cb85c; }
.checkbox-success input[type="checkbox"]:checked + label::after {
  color: #fff; }

    </style>
	 <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
   
  </head>
  
  <body>
    	
	<div >
	  <div class="col-md-12 panel panel-white" >
	  <div class="col-md-11" >
	  <input type="hidden" name="flag" id="flag" value="role">
	  <center>
	  	<table width="60%" border="0">
	  	<tr><td> &nbsp;</td></tr>
		<tr align="right"><th >&emsp;&emsp;&emsp;
			<div class="radio clip-radio radio-primary radio-inline">
				<input type="radio" id="radio1" name="basedon" value="role" checked="checked" onchange="basedRole()">
				<label for="radio1"> Role Based Service Allocation</label>
			</div>
			
			 </th>
			<th>
			<div class="radio clip-radio radio-primary radio-inline">
				<input type="radio" id="radio2" name="basedon" value="user" onchange="basedUser()">
				<label for="radio2"> User Based Service Allocation</label>
			</div>
		</th></tr>
		<tr><td> &nbsp;</td></tr>

		<tr><th colspan="2">
		<div class="col-md-12 panel panel-white " style="padding: 20px">
		
		
		
		<form:form action="${pageContext.request.contextPath}/MapServices/show.htm" commandName="map" method="post">
			<table style="width: 100%"  >
				
				<tbody>
					<tr id="roleClick">					
						<th class="text-center">Role Name <span class="symbol required"></span></th>
						<td>
						<form:select class="form-control selectpicker boot" data-live-search="true" 
							id="role_id" path="role_id" value='0'  >
								<option value='0'>--Select--</option>
								<form:options items="${RolesList}" />
						</form:select>
						</td>		
					</tr>
					
					<tr style="display: none" id="userClick">					
						<th class="text-center">User Name <span class="symbol required"></span></th>
						<td>
						<form:select class="form-control selectpicker boot" data-live-search="true" 
							id="user_serial_no" path="user_serial_no" value='0'  > 
							 <option value='0'>--Select--</option>
							 <form:options items="${UsersList}" />
						</form:select>
						</td>	
					</tr>
                    
				</tbody>
			</table>
			</form:form>
	</div>
		</th>
			
		</tr>
	
		
	  	</table>
			
		</center>
	  </div>
	  	
		
	  	
	  </div>	
	  <div class="col-md-12 panel hiddenDiv"style="padding: 0px; display: none;">
			<center>
			<div class="col-md-3"></div>
			<div class="col-md-6 panel panel-primary panel-white "style="padding: 5px;border-color: #d6e9c6">
				 
			      <div class="panel-heading" style="padding: 7px"><p><span class="input-icon input-icon-right">
			<input type="search" placeholder="Search Service" id="search" class="form-control">
			<i class="ti-search"></i> </span></p></div>
			      <div class="panel-body getHeight" style="padding: 0px">
					<table class="table table-bordered table-search" style="width: 100%;border: 1px solid #dff0d8; " id="listed">
					<thead><tr>
					<th style="width :5px">S.No</th><th>Service Name</th><th style="width :60px">Event</th>
					</tr></thead>
					<tbody>
					
					</tbody>
					</table>
					</div>
			   

			</div>
			
		<div class="col-md-3"></div>
		
			</center>
			</div>  
	</div>
  </body>
  <script src="resources/js/tablesearch.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.min.js"></script>
  <script>
  
  	
  		
  
  $(function() {	
	  	$('.selectpicker').on('change', function(){
	   		 var selected = $(this).find("option:selected").val();
	   		 var flag=$("#flag").val();
	   		   $('.hiddenDiv').show(); 
	   		
	   		$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/MapServices/show/'+selected+'/'+flag+'.htm',
				dataType:'json',
				beforeSend: function(){ $('#divLoading').show(); },
				complete: function(){ $('#divLoading').hide(); },
				success:function(data){
					var lst=data[0];
					$("#listed tbody").empty();
					
					var index=1;
				    $.each(lst, function(i) {				   
						  var tr = $('<tr/>');
						  tr.append("<td >" + index + "</td>");
						  tr.append("<td > <i class='"+ lst[i].ICON  +"'></i> "+ lst[i].SERVICE_NAME + "</td>");
tr.append("<td style='width :60px;' align='center'> <div class='checkbox  checkbox-success '>&nbsp;<input type='checkbox' id='checkbox"+i+"' value='1' "+lst[i].BOX+" onclick='callAjaxEvent("+lst[i].EVENT+")' ><label for='checkbox"+i+"'></label></div></td>");
						  $("#listed ").append(tr);
						  index++;
					});
					
					 
				
					$('.2SP').html(" &emsp; &ensp; ");
				  	$('.3SP').html(" &emsp; &ensp; &emsp;");
				  		
					
					}
					 
					
			  });
			 
	  	});
	  	
	});
  
  function callAjaxEvent(service,role_user,check){
  		$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/MapServices/checkEvent/'+service+'/'+role_user+'/'+check+'.htm',
				success:function(data){
					alert( data); 
				}
			});
  }
  
  	function basedUser(){
  		$('#userClick').show();
  		$('#roleClick').hide();
  		$('#flag').val("user");
  		$('.hiddenDiv').hide(); 
  	}
  	function basedRole(){
  		$('#userClick').hide();
  		$('#roleClick').show();
  		$('#flag').val("role");
  		$('.hiddenDiv').hide(); 
  	}

  </script>
</html>
