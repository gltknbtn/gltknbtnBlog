<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html id="ng-app" ng-app="" ng-cloak>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		
			  <!-- Custom CSS -->
	    <link href="<c:url value='/resources/3css/bootstrap-theme.css'/>"rel="stylesheet" />
	    <link href="<c:url value='/resources/3css/bootstrap.css'/>" rel="stylesheet">
	    
	    <link href="<c:url value='/resources/3css/clean-blog.min.css'/>" rel="stylesheet">
	    <link href="<c:url value='/resources/3css/tools_style.css'/>" rel="stylesheet">
	    
	    <!-- Custom Fonts -->
	    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	    <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
		
		<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		
		<script src="<c:url value='/resources/js/3js/bootstrap.js' />"></script>
		
		<script src="<c:url value='/resources/js/3js/clean-blog.min.js' />"></script>
		
		<script src="<c:url value='/resources/js/angular.min.js' />"></script>
		
		<!--[if lt IE 9]>
		                                <script src="js/html5shiv.js"></script>
		                                <script src="js/respond.min.js"></script>
		                        <![endif]-->
		                        
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
		</head>
		
	<body style="padding-top: 0!important;">
	
		<tiles:insertAttribute name="header_clean" />
        
        <tiles:insertAttribute name="body_clean" />
        
        <tiles:insertAttribute name="footer_clean" />
	
	</body>
</html>

