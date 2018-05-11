
<!DOCTYPE html>
<html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<head>
    <title></title>
    <!-- Styles -->
<style>
#chartdiv {
	width		: 100%;
	height		: 500px;
	font-size	: 11px;
}							
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<!-- Chart code -->
<script>
var chart = AmCharts.makeChart( "chartdiv", {
  "type": "pie",
  "theme": "light",
  "dataProvider": [ {
    "title": "New",
    "value": 4852
  }, {
    "title": "Returning",
    "value": 9899
  } ],
  "titleField": "title",
  "valueField": "value",
  "labelRadius": 5,

  "radius": "42%",
  "innerRadius": "60%",
  "labelText": "[[title]]",
  "export": {
    "enabled": true
  }
} );
</script>
</head>
<body  >
 
 
 
 <div class="container-fluid container-fullw bg-white">
							<div class="row">
								<div class="col-sm-8">
									<div class="panel panel-white no-radius">
										<div class="panel-body">
											<div class="partition-light-grey padding-15 text-center margin-bottom-20">
												<h4 class="no-margin">Monthly Statistics</h4>
												<span class="text-light">based on the news views in app</span>
											</div>
											<div id="accordion" class="panel-group accordion accordion-white no-margin">
												<div class="panel no-radius">
													<div class="panel-heading">
														<h4 class="panel-title">
														<a href="#collapseOne" data-parent="#accordion" data-toggle="collapse" class="accordion-toggle padding-15">
															<i class="icon-arrow"></i>
															This Month <span class="label label-danger pull-right"></span>
														</a></h4>
													</div>
													<div class="panel-collapse collapse in" id="collapseOne">
														<div class="panel-body no-padding partition-light-grey">
															<table class="table">
																<tbody>
																<c:forEach items="${viewsDataThisMo}" var="list"  varStatus="theCount" >
																	<tr>
																		<td class="center">${theCount.count}</td>
																		<td>${list.NEWS_TYPE}</td>
																		<td class="center">${list.NO_OF_VIEWS}</td>
																		<td><i class="fa ${list.STATUS_ARROW}"></i></td>
																	</tr>
																	</c:forEach>
																	
																</tbody>
															</table>
														</div>
													</div>
												</div>
												<div class="panel no-radius">
													<div class="panel-heading">
														<h4 class="panel-title">
														<a href="#collapseTwo" data-parent="#accordion" data-toggle="collapse" class="accordion-toggle padding-15 collapsed">
															<i class="icon-arrow"></i>
															Last Month
														</a></h4>
													</div>
													<div class="panel-collapse collapse" id="collapseTwo">
														<div class="panel-body no-padding partition-light-grey">
															<table class="table">
																<tbody>
																	<c:forEach items="${viewsDataLastMo}" var="list"  varStatus="theCount" >
																	<tr>
																		<td class="center">${theCount.count}</td>
																		<td>${list.NEWS_TYPE}</td>
																		<td class="center">${list.NO_OF_VIEWS}</td>
																		<td><i class="fa ${list.STATUS_ARROW}"></i></td>
																	</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-4">
								
									<div class="panel panel-white no-radius">
										<div class="panel-heading border-bottom">
											<h4 class="panel-title">Registered Members</h4>
										</div>
										<div class="panel-body">
											<div class="text-center">
											<br/><br/>
												  <h1><strong>${memberCount}</strong></h1> 
											<br/>	
											</div>
											
										</div>
										<div class="panel-footer" style="height: 262px">
											<div class="clearfix padding-5 space5">
												<div style='overflow:auto; width:295px;height:235px;'>
												<center>
												<table width="90%" class="table">
												<c:forEach items="${dstPercent}" var="list"  varStatus="theCount" >
												<tr>
												<th><a>${list.DISTRICT_NAME}</a></th>
												<th>${list.PERCENT}</th>
												</tr>
												</c:forEach>
												</table>
												</center>
												</div>
												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
    
        
</body>
</html>