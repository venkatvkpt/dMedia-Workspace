		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		
    
		<header class="navbar navbar-default navbar-static-top">		
				<!-- start: NAVBAR HEADER -->
					<div class="navbar-header">
						<a href="#" class="sidebar-mobile-toggler pull-left hidden-md hidden-lg" class="btn btn-navbar sidebar-toggle" data-toggle-class="app-slide-off" data-toggle-target="#app" data-toggle-click-outside="#sidebar">
							<i class="ti-align-justify"></i>
						</a>
						<a class="navbar-brand" href="welcome.htm">
							<img src="assets/images/logoo.png" alt="Site-Logo" width="120px"/>
						</a>
						<a href="#" class="sidebar-toggler pull-right visible-md visible-lg" data-toggle-class="app-sidebar-closed" data-toggle-target="#app">
							<i class="ti-align-justify"></i>
						</a>
						<a class="pull-right menu-toggler visible-xs-block" id="menu-toggler" data-toggle="collapse" href=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<i class="ti-view-grid"></i>
						</a>
					</div>
					<!-- end: NAVBAR HEADER -->
			<!-- start: NAVBAR COLLAPSE -->
					<div class="navbar-collapse collapse">
						<ul class="nav navbar-right">
							<!-- start: MESSAGES DROPDOWN -->
							<li class="dropdown">
								<a href class="dropdown-toggle" data-toggle="dropdown">
									<span id="addCount"> </span> <i class="ti-comment"></i> <span>NOTIFICATIONS</span>
								</a>
								<!--<ul class="dropdown-menu dropdown-light dropdown-messages dropdown-large">
									<li>
										<span class="dropdown-header"> You have new notifications</span>
									</li>
									<li>
										<div class="drop-down-wrapper ps-container">
											<ul>
												<li class="unread">
													<a href="javascript:;" class="unread">
														<div class="clearfix">
															<div class="thread-image">
																<img src="assets/images/avatar-2.png" alt="" width="50">
															</div>
															<div class="thread-content">
																<span class="author">New Calendar Event</span>
																<span class="preview">A new event has been added to the event calendar, So check Calendar once.</span>
																<span class="time"> Just Now</span>
															</div>
														</div>
													</a>
												</li>
												<li>
													<a href="javascript:;" class="unread">
														<div class="clearfix">
															<div class="thread-image">
																<img src="/ProfileImages/1.png" alt="" width="50">
															</div>
															<div class="thread-content">
																<span class="author">Welcome to Portal</span>
																<span class="preview">Duis mollis, est non commodo luctus, nisi erat porttitor ligula...</span>
																<span class="time">8 hrs</span>
															</div>
														</div>
													</a>
												</li>
												<li>
													<a href="javascript:;">
														<div class="clearfix">
															<div class="thread-image">
																<img src="" alt="" width="50">
															</div>
															<div class="thread-content">
																<span class="author">New Calendar Event</span>
																<span class="preview">Duis mollis, est non commodo luctus, nisi erat porttitor ligula...</span>
																<span class="time">14 hrs</span>
															</div>
														</div>
													</a>
												</li>
											</ul>
										</div>
									</li>
									<li class="view-all">
										<a href="#">
											See All
										</a>
									</li>
								</ul>-->

							</li>
							
							<!-- end: MESSAGES DROPDOWN -->
							<!-- start: ACTIVITIES DROPDOWN -->
							<li class="dropdown">
								<a href class="dropdown-toggle" data-toggle="dropdown">
									<i class="ti-check-box"></i> <span>ACTIVITIES</span>
								</a>
								<ul class="dropdown-menu dropdown-light dropdown-messages dropdown-large">
									<li>
										<span class="dropdown-header"> Your last activities</span>
									</li>
									<li >
										<div class="drop-down-wrapper ps-container" >
											<div class="list-group no-margin" >
												<div id="activity"></div>																								
											</div>
										</div>
									</li>
									<li class="view-all">
										<a href="./editProfile.htm">
											See All
										</a>
									</li>
								</ul>
							</li>
							<!-- end: ACTIVITIES DROPDOWN -->
							
							
							<!-- start: LANGUAGE SWITCHER -->
							<li class="dropdown">
						<!--<a href class="dropdown-toggle" data-toggle="dropdown">
									<i class="ti-world"></i> English
								</a>
								<ul role="menu" class="dropdown-menu dropdown-light fadeInUpShort">
									<li>
										<a href="#" class="menu-toggler">
											Deutsch
										</a>
									</li>
									<li>
										<a href="#" class="menu-toggler">
											English
										</a>
									</li>
									<li>
										<a href="#" class="menu-toggler">
											Italiano
										</a>
									</li>
								</ul>
							--></li>
							<!-- end: LANGUAGE SWITCHER -->
							
							<!-- start: USER OPTIONS DROPDOWN -->
							<li class="dropdown current-user">
								<a href class="dropdown-toggle" data-toggle="dropdown">
									<img  src="/ProfileImages/<%=request.getSession().getAttribute("user_Id") %>.png"  onerror="imgError(this);"> 
									<span class="username">
									<%=request.getSession().getAttribute("DISPLAY_NAME") %> <i class="ti-angle-down"></i></span>
								</a>
								<ul class="dropdown-menu dropdown-dark">
									<li>
										<a href="editProfile.htm">
											My Profile
										</a>
									</li>
									<li>
										<a href="calendar.htm">
											My Calendar
										</a>
									</li>
									<li>
										<a href="login_lockscreen.htm">
											Lock Screen
										</a>
									</li>
									<li>
									
											<c:url value="/logout.htm" var="logoutUrl" />
											<form action="${logoutUrl}" method="POST" id="logoutForm">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
											</form>
											<script>
												function formSubmit() {
													document.getElementById("logoutForm").submit();
												}
											</script>
										<a href="javascript:formSubmit()" > 
											Log Out
										</a>
									</li>
								</ul>
							</li>
							<!-- end: USER OPTIONS DROPDOWN -->
						</ul>
						<!-- start: MENU TOGGLER FOR MOBILE DEVICES -->
						<div class="close-handle visible-xs-block menu-toggler" data-toggle="collapse" href=".navbar-collapse">
							<div class="arrow-left"></div>
							<div class="arrow-right"></div>
						</div>
						<!-- end: MENU TOGGLER FOR MOBILE DEVICES -->
					</div>
					<a class="dropdown-off-sidebar sidebar-mobile-toggler hidden-md hidden-lg" data-toggle-class="app-offsidebar-open" data-toggle-target="#app" data-toggle-click-outside="#off-sidebar">
						&nbsp;
					</a>
					
					<a class="dropdown-off-sidebar hidden-sm hidden-xs" >
						&nbsp;
					</a>
						
					<!-- Hidding Chat room under construction
					<a class="dropdown-off-sidebar hidden-sm hidden-xs" data-toggle-class="app-offsidebar-open" data-toggle-target="#app" data-toggle-click-outside="#off-sidebar">
						&nbsp;
					</a>
					--><!-- end: NAVBAR COLLAPSE -->
				</header>
				<!-- end: TOP NAVBAR -->
		
						<script>
							var data = <%=request.getSession().getAttribute("USER_ACTIVITY") %>;
							var row='';
							for(var i=0;i<3;i++){
								row="<a class='media list-group-item' href=''><span class='media-body block no-margin'>  "+ data[i].ACTIVITY_DESCRIPTION +" <small class='block text-grey'> "+data[i].LOGDATE+" </small> </span></a>" ;
                               $("#activity").append(row);
							}
							
							var count= <%=request.getSession().getAttribute("NOTIFICATION_COUNT") %>;
							if(count !=0){
								$('#addCount').html('<span class="badge partition-red " >'+count+'</span> ');
							}
							
						
						</script>		
								    
								    
								    
				