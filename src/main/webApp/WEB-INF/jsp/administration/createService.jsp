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
	<style type="text/css">
	 .ti{
	 	display: inline-block;
    font-size: 14px;
    margin-right: 10px;
    text-align: right;
    width: 32px;
    color: #007AFF;
	 }
	
	
	</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.min.css">
  </head>
  
  <body >
  <p> <button class="btn btn-success btn-info btn-scroll btn-scroll-left ti-layers-alt" type="button" id="showbutton"
   		onclick="newCreate();"> <span>Create New Service</span></button></p>
  		  		  		
  <div class="row margin-left-30" id="tableHide">
		
       
        <div class="col-md-11 panel panel-white" >
         
        <div class="table-responsive margin-top-30 margin-bottom-30">

                <div class="input-group col-md-12">
			<p><span class="input-icon input-icon-right">
			<input type="search" placeholder="Search" id="search" class="form-control">
			<i class="ti-search"></i> </span></p>
			</div>
              <table id="mytable" class="table table-bordred table-striped table-search">
                   
                   <thead>
                   <th>S.No</th>                                    
                    <th>Service Name</th>          
                     <th>Service Link</th>
                     <th>Parent Name</th>
                     <th>Display Order</th>
                      <th>Edit</th>                     
                       <th>Delete</th>
                   </thead>
    <tbody>
    
	<c:forEach items="${listServices}" var="service"  varStatus="status">
		<tr>
			<td >${status.count}</td>
			<td>${service.service_name}</td>			
			<td>${service.service_link}</td>
			<td>${service.parent_id}</td>
			<td>${service.display_order}</td>

			<td><button class="btn btn-primary btn-xs" 
			onclick="callEditAjaxRequest(${service.service_id});">
    <span class="glyphicon glyphicon-pencil"></span></button></td>
    <td><button onclick="callDelateRequest(${service.service_id})" class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
    <span class="glyphicon glyphicon-trash"></span></button></td>
		</tr>
		
	</c:forEach>
   
  
    
    </tbody>
        
</table>
                
            </div>
            
        </div>
	</div>




	
	<div id="createNew" style="display: none" class="Ajaxcalls ">
	 <input type="hidden"  id="editlength" value='1' />
		<c:url var="addAction" value="/service/add.htm" ></c:url>
    	 <form:form action="${addAction}" commandName="services" method="post" id="customValidations" onsubmit="return customValidations()">
    	 <input type="hidden" id="changer" name="changer">
    	 <input type="hidden" id="bootIcon" name="icon_bootstrop" value="2SP">
    	 
	  <div class="col-md-12 panel panel-white" >
	  <div class="col-md-11" ><BR/><BR/>
	  <center>
	  <table width="60%" >
								<tr><td> &nbsp;</td></tr>
							<tr><th>Service ID </th>
							<td><input type="text" readonly value="<c:out value='${service_id}'/>"
								class="form-control" id="service_id" name="service_id" >
								<input type="hidden" id="t-service_id" value='${service_id}' ></td>
						</tr>
						<tr><td> &nbsp;</td></tr>
						<tr><th>Service Name <span class="symbol required"></span></th>
							<td><input type="text" placeholder="Enter Name Of Service" class="form-control only-letters" 
							 id="service_name" name="service_name" maxlength="25"></td>
						</tr>
						<tr><td> &nbsp;</td></tr>
						<tr><th>Service Link <span class="symbol required"></span></th>
							<td><input type="text" placeholder="Enter Service Link" class="form-control" id="service_link" name="service_link" required></td>
						</tr>
						<tr><td> &nbsp;</td></tr>
						<tr><th>Parent Name<span class="symbol required"></span></th>
							<td>
								<form:select cssClass="form-control selectpicker boot valid-requried" data-live-search="true" id="parent_id" path="parent_id" value='S' >
										 <option value='S'>--Select--</option>
											 <form:options items="${ParentsList}" />
								</form:select></td>
						</tr>					
						<tr><td> &nbsp;</td></tr>
						<tr  id="faIcon" style="display: none">
						<th>Navigation Bar Icon<span class="symbol required"></span></th><td>
							<div>
								<center>
								<table class="table table-bordered" id="tblMain" style="cursor: pointer;width: 100%" align="center" >
									<tr>
										<th title="Server ">
										<p style="display: none">ti-server</p><i class="ti-server ti"></th>
										<th title="Layers ">
										<p style="display: none">ti-ti-layers-alt</p><i class="ti-layers-alt ti"></th>	
										<th title="Star ">
										<p style="display: none">ti-star</p><i class="ti-star ti"></th>
										<th title="Truck ">
										<p style="display: none">ti-truck</p><i class="ti-truck ti"></th>
										<th title="Grid ">
										<p style="display: none">ti-layout-grid2</p><i class="ti-layout-grid2 ti"></th>	
										<th title="Information">
										<p style="display: none"> ti-info</p><i class=" ti-info ti"></th>
										<th title="Plug-In ">
										<p style="display: none">ti-plug</p><i class="ti-plug ti"></th>
															
									</tr>
									<tr>
										<th title="Folder ">
										<p style="display: none">ti-folder</p><i class=" ti-folder ti"></th>
										<th title="Package ">
										<p style="display: none">ti-package</p><i class="ti-package ti"></th>
										<th title="N/A ">
										<p style="display: none">ti-na</p><i class=" ti-na ti"></th>
										<th title="Layout ">
										<p style="display: none">ti-layout-width-full</p><i class="ti-layout-width-full ti"></th>
										<th title="Receipt ">
										<p style="display: none">ti-receipt</p><i class="ti-receipt ti"></th>
										<th title="Downloads ">
										<p style="display: none">ti-download</p><i class=" ti-download ti"></th>
										<th title="Location ">
										<p style="display: none">ti-location-arrow</p><i class=" ti-location-arrow ti"></th>										
																		
									</tr>
									<tr>
										<th title="Harddrive ">
										<p style="display: none">ti-harddrives</p><i class="ti-harddrives ti"></th>
										<th title="List Menu ">
										<p style="display: none">ti-menu-alt</p><i class="ti-menu-alt ti"></th>
										<th title="Shield ">
										<p style="display: none">ti-shield</p><i class=" ti-shield ti"></th>
										<th title="Email ">
										<p style="display: none">ti-email</p><i class=" ti-email ti"></th>
										<th title="Ticket ">
										<p style="display: none">ti-ticket</p><i class="ti-ticket ti"></th>
										<th title="Stats ">
										<p style="display: none">ti-stats-up</p><i class="ti-stats-up ti"></th>
										<th title="Gallery ">
										<p style="display: none">ti-gallery</p><i class="ti-gallery ti"></th>									
									</tr>

							</table></center>

											</div>
						
						</td></tr>
						<tr><th>
							Display Order <span class="symbol required"></span></th>
							<td><input type="text"  class="form-control only-numbers" id="display_order" name="display_order"></td>
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
        <h4 class="modal-title custom_align" id="Heading">Delete this Service</h4>
      </div>
          <div class="modal-body bg-white">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
       
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
</body>

		
		<!-- end: JavaScript Event Handlers for this page -->
		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		
		<script src="resources/js/tablesearch.js"></script>
		 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.min.js"></script>
		<script>
    function callEditAjaxRequest(serviceId){
     $('.Ajaxcalls').addClass("ajaxblur");
    $('#changer').val("1");
    	$.ajax({
			type:'GET',
			url:'${pageContext.request.contextPath}/ajaxController/editServices/'+serviceId+'.htm',
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
					 	$('#service_id').val(op.SERVICE_ID);
					 	$('#service_name').val(op.SERVICE_NAME);
					 	$('#service_link').val(op.SERVICE_LINK);
					 	$('#parent_id').val(op.PARENT_ID);
					 	$('#display_order').val(op.DISPLAY_ORDER);
					 	$('.nameChange').html("Update <i class='fa fa-arrow-circle-right'></i>").addClass("btn-warning");
					 	$('#parent_id').selectpicker('refresh');
			        });				
				}
		});	
		$('#createNew').show();
			$('#tableHide,#showbutton').hide();
			$('.nameChange').html("Update <i class='fa fa-arrow-circle-right'></i>").addClass("btn-warning");	
    }
	
	function newCreate(){
			$('#createNew').show();			
			$('#tableHide,#showbutton').hide();			
			$('#parent_id').val('S');								 	
			$('.nameChange').html("Register <i class='fa fa-arrow-circle-right'></i>").removeClass("btn-warning").addClass("btn-primary");			
			$('#parent_id').selectpicker('refresh');
	}
	
	function callDelateRequest(id){
		$("#delateUrl").attr("href", "service/remove/"+id+".htm");
	}
	
	$(function() {	
	  	$('#parent_id').on('change', function(){
	   		 var selected = $(this).find("option:selected").val();   
	   		 
		    $.ajax({
					type:'GET',
					url:'${pageContext.request.contextPath}/ajaxController/displayOrder/'+selected+'.htm',
					 beforeSend: function(){ $('#divLoading').show(); },
			 						
						success:function(data){
							 	$('#display_order').val(data);
						},
						 complete: function(){ $('#divLoading').hide(); }
			});	
	  	});
	});
  
  	function cancleCreate(){
		location.reload();
	}

		</script>
		<script type="text/javascript">
		$('#tblMain').find('th').click(function(){
		   var boot =($(this).text());
		   $('#bootIcon').val(boot);
		   $("#faIcon").hide();
		});
		
$(document).ready(function(){
    $("select.boot").change(function(){
        var data = $(".boot option:selected").val();
        if(data === "0"){
        	$("#faIcon").show();
        }else{
        	$("#faIcon").hide();

        }
    });
});
</script>

</html>
