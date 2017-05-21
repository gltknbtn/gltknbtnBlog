<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html ng-app="gltknbtnBlogAdmin" ng-cloak>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>GltknBtn Blog Admin</title>
		
		<link href="<c:url value='/resources/3css/style.css'/>"rel="stylesheet" />
		<link href="<c:url value='/resources/3css/tools_style.css'/>"rel="stylesheet" />
		<link href="<c:url value='/resources/3css/jquery.lightbox-0.5.css'/>"rel="stylesheet" />
		<link href="<c:url value='/resources/3css/bootstrap.css'/>"rel="stylesheet" />
		<link href="<c:url value='/resources/3css/bootstrap-theme.css'/>"rel="stylesheet" />
		<link href="<c:url value='/resources/3css/sb-admin.css'/>"rel="stylesheet" />
		<link href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>"rel="stylesheet" />
		
		
		<script src="<c:url value='/resources/js/jquery-1.11.3.min.js' />"></script>
		<script src="<c:url value='/resources/js/3js/bootstrap.js' />"></script>
		
		
		<script src="<c:url value='/resources/js/3js/jquery.lightbox-0.5.js' />"></script>
		<script src="<c:url value='/resources/js/angular.min.js' />"></script>
		<script src="<c:url value='/resources/js/angular-route.min.js' />"></script>
		
			<link href="<c:url value='/resources/3css/editor.css'/>"rel="stylesheet" />
		<script src="<c:url value='/resources/js/3js/editor.js' />"></script>
		
		   <!-- Morris Charts JavaScript -->
		<script src="<c:url value='/resources/js/3js/plugins/morris/raphael.min.js' />"></script>
		<script src="<c:url value='/resources/js/3js/plugins/morris/morris.min.js' />"></script>
		

    <!-- Morris Charts CSS -->
    <link href="<c:url value='/resources/3css/morris.css'/>"rel="stylesheet" />
    
  
		<!--[if lt IE 9]>
		                                <script src="js/html5shiv.js"></script>
		                                <script src="js/respond.min.js"></script>
		                        <![endif]-->
		</head>
		
	<body style="padding-top: 0!important;">
	
		<div id="wrapper">
			<tiles:insertAttribute name="header-admin" />
       		<tiles:insertAttribute name="body-admin" />
		</div>
        
        <tiles:insertAttribute name="footer-admin" />
	
	</body>
</html>

