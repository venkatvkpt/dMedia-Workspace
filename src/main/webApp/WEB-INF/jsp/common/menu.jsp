<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div  ng-controller="servicesController">
	<!-- sidebar -->
			<div class="sidebar app-aside" id="sidebar">
				<div class="sidebar-container perfect-scrollbar">
					<nav>
						<!-- start: SEARCH FORM -->
						<div class="search-form">
							<a class="s-open" href="#">
								<i class="ti-search"></i>
							</a>
							<form class="navbar-form" role="search">
								<a class="s-remove" href="#" target=".navbar-form">
									<i class="ti-close"></i>
								</a>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Search...">
									<button class="btn search-button" type="submit">
										<i class="ti-search"></i>
									</button>
								</div>
							</form>
						</div>
						<!-- end: SEARCH FORM -->
						<!-- start: MAIN NAVIGATION MENU -->
						<div class="navbar-title">
							<span>Main Navigation</span>
						</div>
						<ul class="main-navigation-menu">
							<li class="active open">
								<a href="welcome.htm">
									<div class="item-content">
										<div class="item-media">
											<i class="">&emsp;&emsp;&emsp;</i>
										</div>
										<div class="item-inner">
											<span class="title"> Dashboard </span>
										</div>
									</div>
								</a>
							</li>
						
						<li>
								<a href="javascript:void(0)">
									<div class="item-content">
										<div class="item-media">
											<i class="ti-user"></i>
										</div>
										<div class="item-inner">
											<span class="title"> User Profile </span><i class="icon-arrow"></i>
										</div>
									</div>
								</a>
								<ul class="sub-menu">
									<li>
										<a href="editProfile.htm">
											<span class="title"> Edit Profile </span>
										</a>
									</li>
								</ul>
							</li>
<!--Only Admin -->
<% Object name = request.getSession().getAttribute("DISPLAY_NAME"); 
boolean check= name.equals("Developer");%>
<c:if test="<%=check%>">
							<li>
								<a href="javascript:void(0)">
									<div class="item-content">
										<div class="item-media">
											<i class="ti-settings"></i>
										</div>
										<div class="item-inner">
											<span class="title"> Administration </span><i class="icon-arrow"></i>
										</div>
									</div>
								</a>
								<ul class="sub-menu">
									<li>
										<a href="createUser.htm">
											<span class="title"> Create User </span>
										</a>
									</li>
									<li>
										<a href="createRole.htm">
											<span class="title"> Create Role </span>
										</a>
									</li>
									<li>
										<a href="createService.htm">
											<span class="title"> Create Service </span>
										</a>
									</li>
									<li>
										<a href="mapServices.htm">
											<span class="title"> Map Services </span>
										</a>
									</li>
									
								</ul>
							</li>

<!--end only Admin -->
</c:if>
							<li>
								<a href="javascript:void(0)">
									<div class="item-content">
										<div class="item-media">
											<i class="ti-write"></i>
										</div>
										<div class="item-inner">
											<span class="title"> News </span><i class="icon-arrow"></i>
										</div>
									</div>
								</a>
								<ul class="sub-menu">
									<li>
										<a href="latestnews.htm">
											<span class="title">Latest News</span>
										</a>
									</li>								
									<li>
										<a href="entertainment.htm">
											<span class="title">Entertainment</span>
										</a>
									</li>
									<li>
										<a href="sports.htm">
											<span class="title">Sports</span>
										</a>
									</li>
									<li>
										<a href="business.htm">
											<span class="title">Business</span>
										</a>
									</li>
									<li>
										<a href="eduemp.htm">
											<span class="title">Education/Employment</span>
										</a>
									</li>
									<li>
										<a href="family.htm">
											<span class="title">Family/Health</span>
										</a>
									</li>
								</ul>
							</li>
							
							<li>
								<a href="javascript:void(0)">
									<div class="item-content">
										<div class="item-media">
											<i class="ti-video-camera"></i>
										</div>
										<div class="item-inner">
											<span class="title"> Videos </span><i class="icon-arrow"></i>
										</div>
									</div>
								</a>
								<ul class="sub-menu">
									<li>
										<a href="videos.htm">
											<span class="title">Videos Data</span>
										</a>
									</li>
									
								</ul>
							</li>
							<li>
								<a href="javascript:void(0)">
									<div class="item-content">
										<div class="item-media">
											<i class="ti-layers-alt"></i>
										</div>
										<div class="item-inner">
											<span class="title"> Politician Profiles </span><i class="icon-arrow"></i>
										</div>
									</div>
								</a>
								<ul class="sub-menu">
									<li>
										<a href="mla.htm">
											<span class="title">MLA</span>
										</a>
									</li>
									<li>
										<a href="mp.htm">
											<span class="title">MP</span>
										</a>
									</li>
									<li>
										<a href="mlc.htm">
											<span class="title">MLC</span>
										</a>
									</li>
									<li>
										<a href="zptc.htm">
											<span class="title">ZPTC</span>
										</a>
									</li>
									<li>
										<a href="corporation.htm">
											<span class="title">Corporation</span>
										</a>
									</li>
									<li>
										<a href="dccb.htm">
											<span class="title">DCCB</span>
										</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="javascript:void(0)">
									<div class="item-content">
										<div class="item-media">
											<i class="ti-package"></i>
										</div>
										<div class="item-inner">
											<span class="title"> Party Committees </span><i class="icon-arrow"></i>
										</div>
									</div>
								</a>
								
										<ul class="sub-menu">
											<li>
										<a href="pcc.htm">
											<span class="title">PCC Committee</span>
										</a>
									</li>
									<li>
										<a href="womens.htm">
											<span class="title">Womens Committee</span>
										</a>
									</li>
									<li>
										<a href="youth.htm">
											<span class="title">Youth Committee</span>
										</a>
									</li>
									<li>
										<a href="nsui.htm">
											<span class="title">NSUI</span>
										</a>
									</li>
								</ul>
							</li>

							<li>
								<a href="javascript:void(0)">
									<div class="item-content">
										<div class="item-media">
											<i class="ti-files"></i>
										</div>
										<div class="item-inner">
											<span class="title"> Reports</span><i class="icon-arrow"></i>
										</div>
									</div>
								</a>
								
										<ul class="sub-menu">
											<li>
										<a href="regMemProgressiveReport.htm">
											<span class="title">Registered Members Progressive Report</span>
										</a>
									</li>
									<li>
							<a href="publishedNewsReport.htm"> <span class="title">Published News 
									 </span> </a>
						</li>
								</ul>
							</li>
					
							<!--<li>
								<a href="survey.htm">
									<div class="item-content">
										<div class="item-media">
											<i class="ti-info-alt"></i>
										</div>
										<div class="item-inner">
											<span class="title"> Survey </span>
										</div>
									</div>
								</a>
							</li>
							<li>
								<a href="classifieds.htm">
									<div class="item-content">
										<div class="item-media">
											<i class="ti-pie-chart"></i>
										</div>
										<div class="item-inner">
											<span class="title"> Classifieds </span>
										</div>
									</div>
								</a>
							</li>-->
						</ul>
						<!-- end: MAIN NAVIGATION MENU -->
						<!-- start: CORE FEATURES -->
					<div class="navbar-title">
				<span>Other Features</span>
			</div>
			<ul class="folders">
				<li>
					<a href="advertisement.htm">
						<div class="item-content">
							<div class="item-media">
								<span class="fa-stack"> 
								<i class="fa fa-square fa-stack-2x"></i><!-- 
								<i class="fa  fa-rss fa-stack-1x fa-inverse"></i> 
								-->
								<i class="fa fa-bullhorn fa-stack-1x fa-inverse" aria-hidden="true"></i>
								
								</span>
							</div>
							<div class="item-inner">
								<span class="title"> Advertisement </span>
							</div>
						</div> </a>
				</li>
				<li>
					<a href="survey.htm">
						<div class="item-content">
							<div class="item-media">
								<span class="fa-stack"> <i
									class="fa fa-square fa-stack-2x"></i> <i
									class="fa  fa-rss fa-stack-1x fa-inverse"></i> </span>
							</div>
							<div class="item-inner">
								<span class="title"> Survey </span>
							</div>
						</div> </a>
				</li>
				<li>
					<a href="classifieds.htm" target="_blank">
						<div class="item-content">
							<div class="item-media">
								<span class="fa-stack"> <i
									class="fa fa-square fa-stack-2x"></i> <i
									class="fa fa-newspaper-o fa-stack-1x fa-inverse"></i> </span>
							</div>
							<div class="item-inner">
								<span class="title"> Classifieds </span>
							</div>
						</div> </a>
				</li>

			</ul>
						<!-- end: CORE FEATURES -->
						<!-- start: DOCUMENTATION BUTTON  -->
						<div class="wrapper">
							<a href="statistics.htm" class="button-o">
								<i class="ti-stats-up"></i>
								<span> Statistics</span>
							</a>
						</div>
						<!--  end: DOCUMENTATION BUTTON -->
					</nav>
				</div>
			</div>
			<!-- / sidebar -->
</div>
<script>
	var app = angular.module('mainApp', []);
		app.controller('servicesController', function ($scope) {
					
					 $scope.services = <%=request.getSession().getAttribute("services") %>;	
					 	            
		}); 
		

									

		function getMenu(id) {
			var parent_Id= id.getAttribute("data-filterListId");
			if ( $('#'+parent_Id+'  li').size() > 0 ) {

			}else{
			var role_Id=<%=request.getSession().getAttribute("role_Id") %>;
			$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/ajaxController/menu/'+parent_Id+'/'+role_Id+'.htm',
				dataType:'json',
				success:function(data){
					$('#'+parent_Id).html( data); 
				}
			
			});
			
			}
		}

	function getSubMenu(parent_Id, role_Id) {
	if ( $('#'+parent_Id+'  li').size() > 0 ) {
			}else{
		$.ajax({
				type:'GET',
				url:'${pageContext.request.contextPath}/ajaxController/subMenu/'+parent_Id+'/'+role_Id+'.htm',
				dataType:'json',
				success:function(data){
					$('#'+parent_Id).html( data); 
				}
			});
			}
	}
</script>
<!-- start: JavaScript Event Handlers for this page -->
		<!--<script src="assets/js/index.js"></script>
		--><script>
			jQuery(document).ready(function() {
				Main.init();
				
			});
		</script>

		<!-- end: JavaScript Event Handlers for this page -->