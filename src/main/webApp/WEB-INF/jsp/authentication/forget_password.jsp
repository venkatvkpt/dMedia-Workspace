

<!DOCTYPE html>
<html >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
  <meta charset="UTF-8">
  <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
 
  <title>Request Password | Portal</title>
  
  
    <link rel="stylesheet" href="https://static.parastorage.com/services/third-party/fonts/Helvetica/fontFace.css">
  <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
   
    <link rel="stylesheet" href="assets/css/forgotStyle.css">
	<link href="vendor/sweetalert/sweet-alert.css" rel="stylesheet" media="screen">
	
	
	<style type="text/css">
	.password{
	
	background-color: #FFFFFF !important;
    background-image: none !important;
    border: 1px solid #c8c7cc !important;
    border-radius: 0 0 0 0 !important;
    color: #5b5b60 !important;
    font-family: inherit !important;
    font-size: 14px !important;
    line-height: 1.2 !important;
    padding: 5px 4px !important;
    transition-duration: 0.1s !important;
    box-shadow: none !important;
    width:80%;
	}
	.btn{
	width:38%;
	}
	
	.btn {
      display: inline-block;
    min-width: 100px;
    padding: 4px 12px 4px 12px;
    margin-top: 4px;
    margin-bottom: 4px;
    position: relative;
    max-width: 100%;
    text-align: center;
    white-space: nowrap;
    overflow: hidden;
    vertical-align: middle;
    text-overflow: ellipsis;
    touch-action: manipulation;
    color: #fff;
    border-style: solid;
    border-width: 2px;
    border-color: transparent;
    background-color: #005da6;
    border-radius: 0px;
}

.btn:hover {
  background: #0067b8;
  text-decoration: none;
  color: #fff;
}
	
	</style>
	
  <script>
  window.console = window.console || function(t) {};
</script>

  
  
  <script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>

</head>

<body translate="no" >
<br><br>
<div>&ensp;&ensp;<img src="assets/images/logo.png" alt="Logo"></div>

<c:choose> 

  <c:when test="${msg == 'sucess'}">
    	<div class="sweet-alert showSweetAlert visible"  style="display: block; margin-top: -222px;">
    	
    	<div class="sa-icon sa-success animate" style="display: block;"> <span class="sa-line sa-tip animateSuccessTip"></span> 
    	<span class="sa-line sa-long animateSuccessLong"></span> <div class="sa-placeholder"></div> <div class="sa-fix"></div>
    	 </div> <div class="sa-icon sa-custom" style="display: none;"></div> <h2>Check your email</h2>
    	 <p style="display: block;">We've sent your password reset URL to <b>${email}</b></p><br/>
    	  <form action="forgetEmailCheck.htm" method="POST" id="myform">
    	  <input type="hidden"  name="forget_email" value="${email}">
    	 <a onclick="document.getElementById('myform').submit();" style="cursor: pointer" type="submit">I don't receive mail send me again.</a>
    	 </form>
    	 </div>
 
  </c:when>
  
  <c:otherwise>
   
    <div class="container">
  <c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
  <h2>Forgot Password?<small><br>
  <p>Enter your registered email address & we'll send you a link to reset your password.</p></small></h2>
  
  <form action="forgetEmailCheck.htm" method="POST">
    
   
      
    <div class="group">      
      <input type="email" required width="500px" name="forget_email">
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>e.g., youremail@domain.com</label>
    </div>
    
   <div class="pull-right">
  <a href="login.htm" style="text-decoration: none;"><button type="button" class="back-btn pass-button is-button-outline ">Back</button></a>
   <button type="submit" class="send-btn pass-button ">Submit</button>
   </div>

  </form>
      
  
</div>
   
  </c:otherwise>
</c:choose>

 
  
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  
  
  

</body>
</html>
 