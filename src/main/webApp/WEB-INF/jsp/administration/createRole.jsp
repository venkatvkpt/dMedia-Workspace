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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.min.css">
  </head>
  
  <body >
  <p> <button class="btn btn-success btn-info btn-scroll btn-scroll-left fa-users" 
   id="showbutton" onclick="newCreate()">
  <span>Create New Role</span></button></p>
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
                   <th>Role Id</th>
                    <th>Role Name</th>                             
                     <th>Post Name</th>
                      <th>Edit</th>                     
                       <th>Delete</th>
                   </thead>
    <tbody>
    
	<c:forEach items="${listRoles}" var="role"  varStatus="status">
		<tr>
			<td >${role.role_id}</td>
			<td>${role.role_name}</td>						
			<td>${role.posts_list}</td>

			<td><button class="btn btn-primary btn-xs" 
			onclick="callEditRequest(${role.role_id});">
    <span class="glyphicon glyphicon-pencil"></span></button></td>
    <td><button onclick="callDelateRequest(${role.role_id})" class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
    <span class="glyphicon glyphicon-trash"></span></button></td>
		</tr>
		
	</c:forEach>
   
  
    
    </tbody>
        
</table>
                
            </div>
            
        </div>
	</div>

	<div id="createNew" style="display: none" class="Ajaxcalls">
	 <input type="hidden"  id="editlength" value='1' />
		<c:url var="addAction" value="/roles/add.htm" ></c:url>
    	 <form:form action="${addAction}" commandName="services" method="post">
    	 <input type="hidden" name="length" id="length" value='0'/>
    	  <input type="hidden" name="changer" id="changer" value='0'/>
    	  <input type="hidden" name="post_id" value='${post_id}' />
	  <div class="col-md-12 panel panel-white" >
	  <div class="col-md-11" >
	  <center>
	  	<table width="60%">
	  	<tr><td> &nbsp;</td></tr>
			<tr><th>Role ID </th>
			<td><input type="text" readonly value="<c:out value='${role_id}'/>"
				class="form-control" id="role_id" name="role_id">
			<input type="hidden" id="t_role_id" value='${role_id}' ></td>
		</tr>
		<tr><td> &nbsp;</td></tr>
		<tr><th>Role Name <span class="symbol required"></span></th>
			<td><input type="text" placeholder="Enter Name Of Role" class="form-control only-letters" 
			 id="role_name" name="role_name" required maxlength="25"></td>
		</tr>
		
		<tr><td> &nbsp;</td></tr>
		<tr><th colspan="2">
		<div class="col-md-12 panel panel-white " style="padding: 20px">
			<table class="table  table-hover" id="tab_logic" >
				
				<tbody>
					<tr id='addr0'>
						<td>1</td>
						<th class="text-center">Post Name <span class="symbol required"></span></th>
						<td><input type="text" name="beans['postname0']" id="post_name0" placeholder='Enter Name of Post' maxlength="25" class="form-control only-letters" required/></td>
						
					</tr>
                    <tr id='addr1'></tr>
				</tbody>
			</table>
			<div id="newrow"><a id="add_row" class="btn btn-default pull-left only-letters">Add Row</a><a id='delete_row' class="pull-right btn btn-default ">Delete Row</a></div>
			<div id="editrow" style="display: none"><a id="eadd_row" class="btn btn-default pull-left only-letters">Add Row</a><a id='edelete_row' class="pull-right btn btn-default">Delete Row</a></div>
		</div>
		</th>
			
		</tr>
	
		
	  	</table></center>
	  </div>
	  <div class="col-md-9 margin-bottom-15">
	  <button class="btn  btn-wide btn-azure pull-right margin-top-20 margin-left-20 " type="button" onclick="cancleCreate()">
													Cancel <i class="glyphicon glyphicon-remove"></i>
											</button>
       <button class="btn  btn-wide btn-success pull-right margin-top-20 nameChange" type="submit" id="">
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
        <h4 class="modal-title custom_align" id="Heading">Delete this role</h4>
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
		
		function newCreate(){
			$('#createNew').show();
			$('#tableHide,#showbutton').hide();
			$('#editrow').hide();
			$('#newrow').show();
			$('.nameChange').html("Register <i class='fa fa-arrow-circle-right'></i>").removeClass("btn-warning").addClass("btn-primary");
		}
	
		function cancleCreate(){
			/*$('#createNew ').hide();
			$('#tableHide,#showbutton').show();
			$("#tab_logic").find("tr:gt(0)").remove();
			$('#tab_logic').append('<tr id="addr1"></tr>');*/
			location.reload();
		}
    function callEditRequest(roleId){
    	$('#changer').val("1");
  	  	var k=1;var id;var name;
		var post = new Object();
		$("#tab_logic").find("tr:gt(0)").remove();
		$('#tab_logic').append('<tr id="addr1"></tr>');	 
		$('#editrow').show();
		$('#newrow').hide();
			
    	$.ajax({
			type:'GET',
			url:'${pageContext.request.contextPath}/ajaxController/editRoles/'+roleId+'.htm',
			dataType: 'json',
			beforeSend: function(){ $('#divLoading').show();  document.getElementsByClassName("Ajaxcalls")[0].style.filter = "blur(3px)";},
			complete: function(){ $('#divLoading').hide();  document.getElementsByClassName("Ajaxcalls")[0].style.filter = "blur(0px)";},
			success:function(response){
					var len = response.length;					
		            for(var i=0; i<len; i++){
		                id = response[i].role_id;
		                name = response[i].role_name;
		               	post = response[i].posts;
		             }
					 $('#role_id').val(id);
		             $('#role_name').val(name);
		             $('#post_name0').val(post.post_name0);
		             var postlen =Object.keys(post).length; 
		             $('#editlength').val(postlen);	
		             $('#length').val(postlen);
			       	 for(k=1; k<postlen; k++){
			       		$('#addr'+k).html("<td>"+ (k+1) +"</td><th class='text-center'>Post Name <span class='symbol required'></span></th><td><input  name=\"beans['postname"+k+"']\" type='text' id='postname"+k+"' placeholder='Enter Name of Post'  class='form-control  input-md only-letters' required></td>");		
		      			$('#tab_logic').append('<tr id="addr'+(k+1)+'"></tr>');
		      			$('#postname'+k).val(post['post_name'+k]);		      				
			       	}
			       	$('#createNew').show();
					$('#tableHide,#showbutton').hide();
					$('.nameChange').html("Update <i class='fa fa-arrow-circle-right'></i>").addClass("btn-warning");
			 }		   
		});	
	
		$("#eadd_row").click(function(){
			var v=parseInt($('#editlength').val());
			$('#addr'+v).html("<td>"+ (v+1) +"</td><th class='text-center'>Post Name <span class='symbol required'></span></th><td><input  name=\"beans['postname"+v+"']\" type='text' placeholder='Enter Name of Post'  class='form-control input-md only-letters' required></td>");		
			$('#tab_logic').append('<tr id="addr'+(v+1)+'"></tr>');   
			$('#editlength').val(v+1);
			$('#length').val(v+1);	      
	  	});
	  	
	     $("#edelete_row").click(function(){
		     var v=parseInt($('#editlength').val());
		     if(v>1){
				 $("#addr"+(v-1)).html('');		
				 $('#editlength').val(v-1);
				 $('#length').val(v-1);
			 }
		 });
    }
	
	
	
	function callDelateRequest(id){
		$("#delateUrl").attr("href", "role/remove/"+id+".htm");
	}
	
    $(document).ready(function(){
   		var i=1;   			    
	    $("#add_row").click(function(){	   
			$('#addr'+i).html("<td>"+ (i+1) +"</td><th class='text-center'>Post Name <span class='symbol required'></span></th><td><input  name=\"beans['postname"+i+"']\" type='text' placeholder='Enter Name of Post'  class='form-control input-md only-letters' required></td>");		
			$('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
			$('#length').val(i);   
			i++; 
	  	});
	  	
	     $("#delete_row").click(function(){
		     if(i>1){
				 $("#addr"+(i-1)).html('');		
				 i--;
				 $('#length').val(i-1);
			 }
		 });		 
	});

		</script>

</html>
