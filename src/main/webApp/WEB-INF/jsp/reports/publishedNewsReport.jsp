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

	 <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
   
  </head>
  
  <body>
    	
	<div >
	<form:form action="${pageContext.request.contextPath}/publishedNewsShow.htm" commandName="publish" method="post">
	  <div class="col-md-12 panel panel-white" >
	  <div class="col-md-12" style="padding: 40px;padding-left:0px;">
	 
	  <center>
	  	<table width="80%" border="0" >
					<tr >					
						<th class="text-center" >Type Of Publishing <span class="symbol required"></span></th>
						<td style="width:300px;">
						<select class="form-control selectpicker boot" data-live-search="true" 
							id="type" name="type"  >
								<option value='0'>Select a Publishing type</option>
								<option value="NEWS_LATEST">Latest News</option>
								<option value="NEWS_ENTERTAINMENT">Entertainment News </option>
								<option value="NEWS_SPORTS">Sports News </option>
								<option value="NEWS_BUSINESS">Business News </option>
								<option value="NEWS_EDU_EMP">Education/Employment News </option>
								<option value="NEWS_FAMILY">Family/Health News </option>
						</select>
						</td>	
						
						<th class="text-center">Language <span class="symbol required"></span></th>
						<td style="width:170px;">
						<select class="form-control selectpicker boot" data-live-search="true" 
							id="type" name="language" style="width:950px;" >
								
								<option value="0">Select a Language</option>
								<option value="UR">Urdu</option>
								<option value="TE">Telugu</option>
								<option value="HI">Hindi</option>
								<option value="EN">English</option>
							</select>
						</td>		
					</tr>			
	  	</table>
			
		</center>
		
		<div class="col-md-12" style="margin-top: 30px">
				
				<button style="float:right;margin-left:25px" class="btn btn-o btn-wide btn-primary" type="submit" value="Submit">
					Submit
				</button>
				<button style="float:right" class="btn btn-o btn-wide btn-default" type="button" value="Submit">
										Reset
									</button>
									
	  </div>	
	  
	  
	  </div>
		</div>
	  </form:form>
	  <c:if test="${not empty news}">
	  <br/><br/><center>
  <h4><a>${title}</a></h4></center>
  <table class="table table-bordered table-hover" id="getRows">
				<thead>
					<tr>
						
						<th>
							Article Head Line
						</th>
						<th>
							Published Date
						</th>
						<th>
							Delete
						</th>
					</tr>
				</thead>
				<tbody id="family_health_table_body">
	<c:forEach items="${news}" var="list"  varStatus="theCount" >
		<tr id="news${list.newsId}">
			
			<td ><div style="display:none" id="dived${theCount.count}" >${list.articleName}</div> 
					<span id="decoders${theCount.count}">Loading...</span></td>						
			<td>${list.date} </td>
			<td align="center">
			<button onclick="deleteNews('${list.newsId}')" class="btn btn-danger btn-xs" data-title="Delete" 
			data-toggle="modal" data-target="#delete" >
    		<span class="glyphicon glyphicon-trash"></span></button>		
			 </td>
			</tr>
			</c:forEach>
				</tbody>
			</table>
			</c:if>
  <input type="hidden" value="${dbTable}" id="dbTable" />
	</div>
	
	
<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading"><span class="blocking"></span> Delete News Article </h4>
      </div>
          <div class="modal-body bg-white">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span>
        Are you sure you want to delete ?</div>
       
       
      </div>
        <div class="modal-footer ">
        <a id="delateUrl"><button type="button" class="btn btn-success" data-dismiss="modal"><span class="glyphicon glyphicon-ok-sign"></span> Yes</button></a>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
     
  	</div>
</div>
  </body>
  <script src="resources/js/tablesearch.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.min.js"></script>
  <script>
  			
 window.onload = function() {
	  var counter = $('#getRows tr').length;
	  var decode;var result;
	  for (i=1;i < counter ;i++){
	  	 decode = $("#dived"+i).text();
	  	 result = decodeURIComponent(decode);	
	  	$('#decoders'+i).html(result.replace(/\+/g, ' ')); 
	  }	
 }
 
 
 function deleteNews(newsCode){
 	$("#delateUrl").attr("onClick", "getNewsIdDelete('"+newsCode+"')");
 }
 
 function getNewsIdDelete(newsCode) {
 	var dbT =$('#dbTable').val();
 
	var link = '${pageContext.request.contextPath}/deletePublishNewsById/' + newsCode + '/'+ dbT +'.htm';
	$.get(link, function(data) {
		$('#news'+newsCode).hide();
	})
}
  
	
  </script>
</html>
