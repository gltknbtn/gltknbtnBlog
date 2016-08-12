<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html id="ng-app" ng-app="" ng-cloak>


<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>Freelancer - Start Bootstrap Theme</title>
	
	<!-- Bootstrap Core CSS -->
	<link
		href="<c:url value='/resources/vendor_fadlarec/bootstrap/css/bootstrap.min.css'/>"
		rel="stylesheet" />
	
	<!-- Theme CSS -->
	<link href="<c:url value='/resources/css_fadlarec/freelancer.min.css'/>"
		rel="stylesheet" />
	
	<!-- Custom Fonts -->
	<link
		href="<c:url value='/resources/vendor_fadlarec/font-awesome/css/font-awesome.min.css'/>"
		rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
		rel="stylesheet" type="text/css">
	<link
		href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
		rel="stylesheet" type="text/css">
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
				        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
				        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
				    <![endif]-->

</head>

<body style="padding-top: 0 !important;">

	<tiles:insertAttribute name="header_fadlarec" />

	<tiles:insertAttribute name="body_fadlarec" />

	<tiles:insertAttribute name="footer_fadlarec" />
	
	
	<!-- jQuery -->
	<script	src="<c:url value='/resources/vendor_fadlarec/jquery/jquery.min.js' />"></script>
	
	<!-- Bootstrap Core JavaScript -->
	<script src="<c:url value='/resources/vendor_fadlarec/bootstrap/js/bootstrap.min.js' />"></script>
	
	<!-- Plugin JavaScript -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	
	<!-- Contact Form JavaScript -->
	<script src="<c:url value='/resources/js_fadlarec/jqBootstrapValidation.js' />"></script>
	
	<script src="<c:url value='/resources/js_fadlarec/contact_me.js' />"></script>
	
	<!-- Theme JavaScript -->
	<script src="<c:url value='/resources/js_fadlarec/freelancer.min.js' />"></script>

</body>
</html>

