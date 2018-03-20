<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'invalidAccess.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
 <body> 
 
<div class="container">
  
  <div class="panel panel-default" >
    <div class="panel-body" style="padding:62px;padding-left:170px;padding-right:170px;">
	
	<div class="panel panel-info" style="border: 1px solid #bce8f1">
      <div class="panel-heading"><center><h3>You Do Not Have Permission To Access This Page</h3></center></div>
      <div class="panel-body" >
		<div class="col-sm-9" style="padding:20px">
		<h4 style="padding:1px">You have no authorization to access this page.<br /><br/>
		Access allocated services from the navigation bar.<br/> If you need this service,please contact the administrator.</h4>
		</div><div class="col-sm-3">
		<center>
		<img src="assets/images/lock.png" width="90px"/></center>
		</div>

	</div>
    </div>


	</div>
	
  </div>
</div>

</body>
</html>
