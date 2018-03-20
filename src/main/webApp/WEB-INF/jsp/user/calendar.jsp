<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!--[if !IE]><!-->
<html lang="en">
	<!--<![endif]-->
	<!-- start: HEAD -->
	<head>
		<title>Clip-Two - Responsive Admin Template</title>
		<!-- start: META -->
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<!-- end: META -->

		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<link href="vendor/fullcalendar/fullcalendar.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
	</head>
	<!-- end: HEAD -->
	<body>
		
						<!-- start: CALENDAR -->
						<div class="container-fluid container bg-white">
							<div class="row">
								<div class="col-sm-12 ">
								<div class="col-sm-2 pull-right"><a href="#newFullEvent" class="btn btn-primary btn-o add-event"><i class="fa fa-plus"></i> Add New Event</a>
								</div>
								<div class="col-sm-9 pull-left" style="vertical-align: bottom">
									<span class="fa fa-circle text-primary"></span> Job &ensp;
									<span class="fa fa-circle text-purple"></span> Home &ensp;
									<span class="fa fa-circle text-green"></span> Off site &emsp;&emsp;&emsp;
									
									<span class="fa fa-circle text-yellow"></span> Cancelled &ensp;
									<span class="fa fa-circle text-info"></span> Generic &ensp;
									<span class="fa fa-circle text-orange"></span> ToDo &ensp;
								
								</div>
								</div><br/><hr/>
								<div class="col-sm-12">
									<div id='full-calendar'></div>
								</div>
								
							</div>
						</div>
						<!-- end: CALENDAR -->
						<!-- start: EVENTS ASIDE -->
						<div class="modal fade modal-aside horizontal right events-modal"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog modal-sm">
								<div class="modal-content">
									
									<c:url var="addAction" value="/calendarAdd.htm" ></c:url>
    								 <form:form action="${addAction}" commandName="calendar" method="post" cssClass="form-full-event"
    								  onsubmit="return checkValidate()" id="form">
    								
										<div class="modal-body">
											<div class="form-group hidden" >
												<label>
													ID
												</label>
												<input type="text" id="event-id">
												<input type="text" id="serial-no" name="userserial" value="${sessionScope.user_Id}">
											</div>
											<div class="form-group">
												<label>
													Event Title
												</label>
												<input type="text" id="event-name" placeholder="Enter title" class="form-control underline text-large" name="eventName">
											</div>
											<div class="form-group">
												<label>
													Start
												</label>
												<span class="input-icon">
													<input type="text" id="start-date-time" class="form-control underline" name="eventStartDate"/>
													<i class="ti-calendar"></i> </span>
											</div>
											<div class="form-group">
												<label>
													End
												</label>
												<span class="input-icon">
													<input type="text" id="end-date-time" class="form-control underline" name="eventEndDate" />
													<i class="ti-calendar"></i> </span>
											</div>
											<div class="form-group">
												<label>
													Category
												</label>
												<div class="row">
													<div class="col-xs-12">
														<div class="radio clip-radio radio-primary">
															<input type="radio" id="job" name="optionsCategory" value="job" class="event-categories" checked=''>
															<label for="job">
																<span class="fa fa-circle text-primary"></span> Job
															</label>
														</div>
														<div class="radio clip-radio radio-primary">
															<input type="radio" id="home" name="optionsCategory" value="home" class="event-categories">
															<label for="home">
																<span class="fa fa-circle text-purple"></span> Home
															</label>
														</div>
														<div class="radio clip-radio radio-primary">
															<input type="radio" id="off-site-work" name="optionsCategory" value="off-site-work" class="event-categories">
															<label for="off-site-work">
																<span class="fa fa-circle text-green"></span> Off site
															</label>
														</div>
													</div>
													<div class="col-xs-6">
														<div class="radio clip-radio radio-primary">
															<input type="radio" id="cancelled" name="optionsCategory" value="cancelled" class="event-categories">
															<label for="cancelled">
																<span class="fa fa-circle text-yellow"></span> Cancelled
															</label>
														</div>
														<div class="radio clip-radio radio-primary">
															<input type="radio" id="generic" name="optionsCategory" value="generic" class="event-categories">
															<label for="generic">
																<span class="fa fa-circle text-info"></span> Generic
															</label>
														</div>
														<div class="radio clip-radio radio-primary">
															<input type="radio" id="to-do" name="optionsCategory" value="to-do" class="event-categories">
															<label for="to-do">
																<span class="fa fa-circle text-orange"></span> ToDo
															</label>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											
											<button class="btn btn-primary btn-o save-event" type="submit">
												Save
											</button>
										</div>
									</form:form>
								</div>
							</div>
						</div>
					
					<!-- end: EVENTS ASIDE -->
			
			
	
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="vendor/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
		<script src="vendor/moment/moment.min.js"></script>
		<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
		<script src="vendor/fullcalendar/fullcalendar.min.js"></script>
		<script src="vendor/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<!-- start: CLIP-TWO JAVASCRIPTS -->
	
		<!-- start: JavaScript Event Handlers for this page -->
		
		<script>

		var Calendar = function() {"use strict";
	var dateToShow, calendar, demoCalendar, eventClass, eventCategory, subViewElement, subViewContent, $eventDetail;
	var defaultRange = new Object;
	defaultRange.start = moment();
	defaultRange.end = moment().add(1, 'days');
	//Calendar
	var setFullCalendarEvents = function() {
		var date = new Date();
		dateToShow = date;
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();

		demoCalendar = <%=request.getAttribute("eventData") %>;
	};
	//function to initiate Full Calendar
	var runFullCalendar = function() {
		$(".add-event").off().on("click", function() {
			eventInputDateHandler();
			$(" #event-id").val("");
			$('.events-modal').modal();
		});
		$('.events-modal').on('hide.bs.modal', function(event) {
			$(" #event-id").val("");
			$(" #event-name").val("");
			$(" #start-date-time").val("").data("DateTimePicker").destroy();
			$(" #end-date-time").val("").data("DateTimePicker").destroy();
			$(".event-categories[value='job']").prop('checked', true);
		});

		$('#event-categories div.event-category').each(function() {
			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: $.trim($(this).text()) // use the element's text as the event title
			};
			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);
			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true, // will cause the event to go back to its
				revertDuration: 50 //  original position after the drag
			});
		});
		/* initialize the calendar
		 -----------------------------------------------------------------*/
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		var form = '';
		$('#full-calendar').fullCalendar({
			buttonIcons: {
				prev: 'fa fa-chevron-left',
				next: 'fa fa-chevron-right'
			},
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			events: demoCalendar,
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			droppable: true, // this allows things to be dropped onto the calendar !!!
			drop: function(date, allDay) {// this function is called when something is dropped

				// retrieve the dropped element's stored Event Object
				var originalEventObject = $(this).data('eventObject');

				var $category = $(this).attr('data-class');
				
				// we need to copy it, so that multiple events don't have a reference to the same object

				var newEvent = new Object;
				newEvent.title = originalEventObject.title;
				newEvent.start = new Date(date);
				newEvent.end = moment(new Date(date)).add(1, 'hours');
				newEvent.allDay = true;
				newEvent.category = $category;
				newEvent.className = 'event-' + $category;

				$('#full-calendar').fullCalendar('renderEvent', newEvent, true);

				// is the "remove after drop" checkbox checked?
				if($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
			},
			selectable: true,
			selectHelper: true,
			select: function(start, end, allDay) {
				eventInputDateHandler();
				$(" #event-id").val("");
				$(" #event-name").val("");
				$(" #start-date-time").data("DateTimePicker").date(moment(start));
				$(" #end-date-time").data("DateTimePicker").date(moment(start).add(1, 'hours'));
				$(".event-categories[value='job']").prop('checked', true);
				$('.events-modal').modal();
			},
			eventClick: function(calEvent, jsEvent, view) {
				eventInputDateHandler();
				var eventId = calEvent._id;
				for(var i = 0; i < demoCalendar.length; i++) {

					if(demoCalendar[i]._id == eventId) {
						$(" #event-id").val(eventId);
						$(" #event-name").val(demoCalendar[i].title);
						$(" #start-date-time").data("DateTimePicker").date(moment(demoCalendar[i].start));
						$(" #end-date-time").data("DateTimePicker").date(moment(demoCalendar[i].end));
						if(demoCalendar[i].category == "" || typeof demoCalendar[i].category == "undefined") {
							eventCategory = "Generic";
						} else {
							eventCategory = demoCalendar[i].category;
						}

						$(".event-categories[value='" + eventCategory + "']").prop('checked', true);

					}
				}
				$('.events-modal').modal();
			}
		});
		demoCalendar = $("#full-calendar").fullCalendar("clientEvents");
	};

	var runFullCalendarValidation = function(el) {

	};

	var eventInputDateHandler = function() {
		var startInput = $('#start-date-time');
		var endInput = $('#end-date-time');
		startInput.datetimepicker();
		endInput.datetimepicker();
		startInput.on("dp.change", function(e) {
			endInput.data("DateTimePicker").minDate(e.date);
		});
		endInput.on("dp.change", function(e) {
			startInput.data("DateTimePicker").maxDate(e.date);
		});
	};
	return {
		init: function() {
			setFullCalendarEvents();
			runFullCalendar();
			runFullCalendarValidation();
		}
	};
}();
		
		
		
			jQuery(document).ready(function() {	
				Calendar.init();
			});
			
			
		 $('#form').validate({
            errorElement: "span", // contain the error msg in a span tag
			errorClass: 'help-block',

			ignore: "",
			rules: {
				eventName: {
					minlength: 5,
					required: true
				},
				eventStartDate: {
					required: true,
					date: true
				},
				eventEndDate: {
					required: true,
					date: true
				}
			},
			messages: {
				
				eventName: {
                    required: "* Please specify the event title",
                    minlength: "Title minimum 5 characters requried"
                }

			},
			highlight: function(element) {
				$(element).closest('.help-block').removeClass('valid');
				// display OK icon
				$(element).closest('.form-group').removeClass('has-success').addClass('has-error').find('.symbol').removeClass('ok').addClass('required');
				// add the Bootstrap error class to the control group
			},
			unhighlight: function(element) {// revert the change done by hightlight
				$(element).closest('.form-group').removeClass('has-error');
				// set error class to the control group
			},
			success: function(label, element) {
				label.addClass('help-block valid');
				// mark the current input as valid and display OK icon
				$(element).closest('.form-group').removeClass('has-error').addClass('has-success').find('.symbol').removeClass('required').addClass('ok');
			},
            submitHandler: function (form) {
                successHandler1.show();
                errorHandler1.hide();
                // submit form
                $('#form').submit();
            }
        });
   	
			
			
			
		</script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
