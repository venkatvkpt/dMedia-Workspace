<%@ page language="java" import="java.util.*"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Bootstrap Poll Example </title>
    <!-- BOOTSTRAP STYLE SHEET -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- CUSTOM STYLES -->
    <style>
        body {
            padding-top: 30px; /*Required FOR FIXED TOP NAVBAR*/
            background-color: #E4E4E4;
        }

        /*  REQUIRED POLL DIV STYLES */

        .user-poll-section .progress {
            height: 5px;
        }

        .user-poll-section .panel {
            border-radius: 0px;
            -webkit-border-radius: 0px;
            -moz-border-radius: 0px;
        }
    </style>
</head>

	
<body>

    <!-- NAVBAR CODE END -->
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <h2>13/4/2018 Survey</h2>
                <h6>Crafted by  <a href="#">dMedia</a> </h6>
                <br />
            </div>
        </div>
        <div class="row ">
            <div class="col-md-4 col-md-offset-4">
                <div class="user-poll-section">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <strong>Question : </strong>Which is the best responsive framework to start web designing ?

                        </div>
                        <div class="panel-body">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="group-poll">
                                    <strong>A.  </strong>Bootstrap Framework
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="group-poll">
                                    <strong>B.  </strong>Foundation
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="group-poll">
                                    <strong>C.  </strong>Kube Framework
                                </label>
                            </div>
                            <hr />
                            <h5 class="text-danger">Result Of User Votes :</h5>
                            <hr />
                            Bootstrap (60%) :
                               <div class="progress progress-striped active">
                                   <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                       <span class="sr-only">60% Complete (success)</span>
                                   </div>
                               </div>
                            Foundation (30%) :
                               <div class="progress progress-striped active">
                                   <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
                                       <span class="sr-only">30% Complete (success)</span>
                                   </div>
                               </div>
                            Kube (10%) :
                               <div class="progress progress-striped active">
                                   <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 10%">
                                       <span class="sr-only">10% Complete (success)</span>
                                   </div>
                               </div>
                        </div>
                        <div class="panel-footer">
                            <a href="#" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-bell"></span> Mark Your Vote</a>
                        </div>
                    </div>

                </div>
                <!-- POLL DIV END-->
            </div>
        </div>
    </div>
    <!-- CONATINER END -->
    <!-- REQUIRED SCRIPTS FILES -->
    <!-- CORE JQUERY FILE -->
    <script src="assets/js/jquery-1.11.1.js"></script>
    <!-- REQUIRED BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.js"></script>

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

</html>
