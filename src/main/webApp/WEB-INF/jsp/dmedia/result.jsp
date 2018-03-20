<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<link
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
		<link
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" />
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>

	</head>
	
	<body>
	Hello
		<c:choose>
  <c:when test="${!empty lst}">
    <table border="1" bgcolor="cyan">
      <tr style="color:red"><th>STATE_CODE</th><th>STATE_NAME</th></tr>
      <c:forEach var="dto"  items="${lst}">
        <tr style="color:blue">
         <td>${dto.STATE_CODE}</td>
         <td>${dto.STATE_NAME}</td>
       
        </tr>
      </c:forEach>
    </table>
  </c:when>
  <c:otherwise>
    Records not found..
  </c:otherwise>
</c:choose>   


	</body>

	<script type="text/javascript">

</script>
</html>
