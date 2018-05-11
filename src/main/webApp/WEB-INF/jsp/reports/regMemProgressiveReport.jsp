<%@ page language="java" import="java.util.*"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		-->
		<base href="<%=basePath%>">
		<!--
		 <meta charset="UTF-8">
		-->
		<link
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
		<link
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" />
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
	
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<link
			href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css"
			rel="stylesheet" media="screen">
		<link href="vendor/select2/select2.min.css" rel="stylesheet"
			media="screen">
		<link
			href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css"
			rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css"
			rel="stylesheet" media="screen">
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
		

	</head>

	<body>
	
		<div class="table-responsive">
	<div id="link" style="float:right;margin-bottom:10px;margin-right:20px">
		</div>
			<table class="table table-bordered table-hover" id="district_table">
				<thead>
					<tr>
						<th>
							SNO
						</th>
						<th>
							DISTRICT
						</th>
						<th>
							TOTAL REGISTERED MEMBERS
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="reg" items="${list}">
						<tr>
							<td>
								${reg.sno}
							</td>
							<td>

								<a href="" onClick="getAssemblyWise('${reg.districtCode}')">
									${reg.district}</a>

							</td>
							<td>
								${reg.totalRegisteredMembers}
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="table-responsive">

			<table class="table table-bordered table-hover" id="assembly_table"
				style="display: none">

				<thead>
					<tr>
						<th>
							SNO
						</th>
						<th>
							ASSEMBLY
						</th>
						<th>
							TOTAL REGISTERED MEMBERS
						</th>
					</tr>
				</thead>
				<tbody id="assembly_table_body"></tbody>
			</table>
		</div>
		<div class="table-responsive">

			<table class="table table-bordered table-hover" id="mandal_table"
				style="display: none">
				<thead>
					<tr>
						<th>
							SNO
						</th>
						<th>
							MANDAL
						</th>
						<th>
							TOTAL REGISTERED MEMBERS
						</th>
					</tr>
				</thead>
				<tbody id="mandal_table_body"></tbody>
			</table>
		</div>
		<div class="table-responsive">
			<table class="table table-bordered table-hover" id="panchayati_table"
				style="display: none">
				<thead>
					<tr>
						<th>
							SNO
						</th>
						<th>
							PANCHAYATI
						</th>
						<th>
							TOTAL REGISTERED MEMBERS
						</th>
					</tr>
				</thead>
				<tbody id="panchayati_table_body"></tbody>
			</table>


		</div>
		<div class="table-responsive">
			<table class="table table-bordered table-hover"
				id="polingstation_table" style="display: none">
				<thead>
					<tr>
						<th>
							SNO
						</th>
						<th>
							POLINGSTATION
						</th>
						<th>
							TOTAL REGISTERED MEMBERS
						</th>
						<th>
							TOTAL REGISTERED MEMBERS
						</th>

					</tr>
				</thead>
				<tbody id="polingstation_table_body"></tbody>
			</table>


		</div>

		<div class="table-responsive">

			<table class="table table-bordered table-hover"
				id="polingstation_details_table" style="display: none">

				<thead>
					<tr>
						<th>
							SNO
						</th>
						<th>
							MEMBER NAME
						</th>
						<th>
							MOBILE NUMBER
						</th>
						<th>
							EMAIL ID
						</th>

					</tr>
				</thead>
				<tbody id="polingstation_details_table_body"></tbody>
			</table>


		</div>


	</body>

	<script type="text/javascript">

</script>
	<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
	<script src="vendor/maskedinput/jquery.maskedinput.min.js">
</script>
	<script
		src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js">
</script>
	<script src="vendor/autosize/autosize.min.js">
</script>
	<script src="vendor/selectFx/classie.js">
</script>
	<script src="vendor/selectFx/selectFx.js">
</script>
	<script src="vendor/select2/select2.min.js">
</script>
	<script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js">
</script>
	<script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js">
</script>
	<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
	<!-- start: CLIP-TWO JAVASCRIPTS -->
	<script src="assets/js/main.js">
</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.min.js">
</script>
	<!-- start: JavaScript Event Handlers for this page -->
	<script src="assets/js/form-elements.js">
</script>

	<script src="resources/js/drilldownReport.js">
</script>
	<script>
function backNavigation(location) {
	alert(location);
	if (location == 1) {
		$('#district_table').show();
		$('#assembly_table').hide();
		$('#mandal_table').hide();
		$('#panchayati_table').hide();
		$('#polingstation_table').hide();
		$('#polingstation_details_table').hide();
		$('#link').html("");
	} else if (location == 2) {
	
		$('#district_table').hide();
		$('#assembly_table').show();
		$('#mandal_table').hide();
		$('#panchayati_table').hide();
		$('#polingstation_table').hide();
		$('#polingstation_details_table').hide();	
		
		var navi = "<a onclick='backNavigation(1)'>Back to District</a>";
		$('#link').html(navi);
	} else if (location == 3) {
		$('#district_table').hide();
		$('#assembly_table').hide();
		$('#mandal_table').show();
		$('#panchayati_table').hide();
		$('#polingstation_table').hide();
		$('#polingstation_details_table').hide();

		var navi = "<a onclick='backNavigation(2)'>Back to AssemblyWise</a> &nbsp; <a onclick='backNavigation(1)'>Back to District</a>";
		$('#link').html(navi);
	}else if (location == 4) {

		$('#district_table').hide();
		$('#assembly_table').hide();
		$('#mandal_table').hide();
		$('#panchayati_table').show();
		$('#polingstation_table').hide();
		$('#polingstation_details_table').hide();
		
		var navi = "<a onclick='backNavigation(3)'>Back to MandalWise</a> &nbsp; <a onclick='backNavigation(2)'>Back to AssemblyWise</a> &nbsp; <a onclick='backNavigation(1)'>Back to District</a>";
		$('#link').html(navi);
	}else if (location == 5) {
		$('#district_table').hide();
		$('#assembly_table').hide();
		$('#mandal_table').hide();
		$('#panchayati_table').hide();
		$('#polingstation_table').show();
		$('#polingstation_details_table').hide();
		
	var navi = "<a onclick='backNavigation(4)'>Back to PanchayatiWise</a> &nbsp; <a onclick='backNavigation(3)'>Back to MandalWise</a> &nbsp; <a onclick='backNavigation(2)'>Back to AssemblyWise</a> &nbsp; <a onclick='backNavigation(1)'>Back to District</a>";
	$('#link').html(navi);
	}

}
function getAssemblyWise(districtId) {

	var navi = "<a onclick='backNavigation(1)'>Back to District</a>";
	$('#link').html(navi);

	var link = '${pageContext.request.contextPath}/getAssemblyWise/' + districtId + '.htm';
		$("#assembly_table_body").empty();
	$.get(link, function(data) {
	
		$('#district_table').hide();
		$('#assembly_table').show();

		var output = JSON.parse(data);
		console.log(output);
		
		$.each(output, function(index, value) {

			var row = $("<tr><td>" + value.SRNO
					+ "</td><td onClick='getMandalWise(" + value.ASSEMBLY_CODE
					+ ")'><a>" + value.ASSEMBLY_NAME + "</a></td><td>"
					+ value.COUNTER + "</td></tr>");
					
			$("#assembly_table").append(row);
			
		});
		
	})
}

function getMandalWise(assemblyId) {
	var navi = "<a onclick='backNavigation(2)'>Back to AssemblyWise</a> &nbsp; <a onclick='backNavigation(1)'>Back to District</a>";
	$('#link').html(navi);
	
	var link = '${pageContext.request.contextPath}/getMandalWise/' + assemblyId + '.htm';
$("#mandal_table_body").empty();
	$.get(link, function(data) {
		$('#assembly_table').hide();
		$('#mandal_table').show();
		var output = JSON.parse(data);
		console.log(output);
		$.each(output, function(index, value) {

			var row = $("<tr><td>" + value.SRNO
					+ "</td><td onClick='getPanchayatiWise("
					+ value.MANDAL_CODE + ")'><a  >" + value.MANDAL_NAME
					+ "</a></td><td>" + value.COUNTER + "</td></tr>");
			$("#mandal_table").append(row);
		});
	})

}

function getPanchayatiWise(mandalId) {
	var navi = "<a onclick='backNavigation(3)'>Back to MandalWise</a> &nbsp; <a onclick='backNavigation(2)'>Back to AssemblyWise</a> &nbsp; <a onclick='backNavigation(1)'>Back to District</a>";
	$('#link').html(navi);

	var link = '${pageContext.request.contextPath}/getPanchayatiWise/' + mandalId + '.htm';
	$("#panchayati_table_body").empty();
	
	$.get(link, function(data) {

		$('#mandal_table').hide();
		$('#panchayati_table').show();

		var output = JSON.parse(data);
		console.log(output);
		$.each(output, function(index, value) {

			var row = $("<tr><td>" + value.SRNO
					+ "</td><td onClick='getPolingStationWise("
					+ value.PANCHAYATI_CODE + ")'><a  >"
					+ value.PANCHAYATI_NAME + "</a></td><td>" + value.COUNTER
					+ "</td></tr>");
			$("#panchayati_table").append(row);
		});
	})

}

function getPolingStationWise(panchayatiId) {
	var navi = "<a onclick='backNavigation(4)'>Back to PanchayatiWise</a> &nbsp; <a onclick='backNavigation(3)'>Back to MandalWise</a> &nbsp; <a onclick='backNavigation(2)'>Back to AssemblyWise</a> &nbsp; <a onclick='backNavigation(1)'>Back to District</a>";
	$('#link').html(navi);

	var link = '${pageContext.request.contextPath}/getPolingStationWise/' + panchayatiId + '.htm';
	$("#polingstation_table_body").empty();
	
	$.get(link, function(data) {

		$('#panchayati_table').hide();
		$('#polingstation_table').show();

		var output = JSON.parse(data);
		console.log(output);
		$.each(output, function(index, value) {

			var row = $("<tr><td>" + value.SRNO + "</td><td onClick=''>"
					+ value.POLINGSTATION_NAME + "</td><td>" + value.COUNTER
					+ "</td><td onClick='getPolingStationWiseDetails("
					+ value.POLINGSTATION_CODE + ")'><a>View</a></td></tr>");
			$("#polingstation_table").append(row);
		});

	})

}

function getPolingStationWiseDetails(polingStationId) {
	var navi = "<a onclick='backNavigation(5)'>Back to PolingStationWise</a> &nbsp; <a onclick='backNavigation(4)'>Back to PanchayatiWise</a> &nbsp; <a onclick='backNavigation(3)'>Back to MandalWise</a> &nbsp; <a onclick='backNavigation(2)'>Back to AssemblyWise</a> &nbsp; <a onclick='backNavigation(1)'>Back to District</a>";
	$('#link').html(navi);
	
	var link = '${pageContext.request.contextPath}/getPolingStationWiseDetails/' + polingStationId + '.htm';
	$("#polingstation_details_table_body").empty();
	
	$.get(link, function(data) {

		$('#polingstation_table').hide();
		$('#polingstation_details_table').show();

		var output = JSON.parse(data);
		console.log(output);
		$.each(output, function(index, value) {

			var row = $("<tr><td>" + value.SRNO + "</td><td>"
					+ value.MEMBER_NAME + "</td><td>" + value.MOBILE_NUMBER
					+ "</td><td>" + value.EMAIL_ID + "</td></tr>");
			$("#polingstation_details_table").append(row);
		});

	})

}
</script>

</html>
