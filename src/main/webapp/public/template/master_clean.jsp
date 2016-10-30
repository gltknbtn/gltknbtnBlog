<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html ng-app="gltknbtnBlogClean" ng-cloak>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Custom CSS -->
<link href="<c:url value='/resources/3css/bootstrap-theme.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/3css/bootstrap.css'/>"
	rel="stylesheet">

<link href="<c:url value='/resources/3css/clean-blog.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/resources/3css/tools_style.css'/>"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script src="<c:url value='/resources/js/3js/bootstrap.js' />"></script>

<script src="<c:url value='/resources/js/3js/clean-blog.min.js' />"></script>

 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.10/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.10/angular-route.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.10/angular-sanitize.js"></script>
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

<body style="padding-top: 0 !important;"
	ng-controller="mastercleanController">


	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-custom navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/gltknbtnBlog/mainpage">GltknBtn
					Blog</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li
						ng-class="{'active': activeURL == 'mainpage', '': activeURL != 'mainpage'}">
						<a href="#">Home</a>
					</li>
					<li
						ng-class="{'active': activeURL == 'aboutme', '': activeURL != 'aboutme'}">
						<a href="#about">About</a>
					</li>
					<li
						ng-class="{'active': activeURL == 'contactme', '': activeURL != 'contactme'}">
						<a href="#contact">Contact</a>
					</li>
					<li><a href="<c:url value="/login"/>" title=""><i
							class="glyphicon glyphicon-log-in"></i></a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	
	
	

	<div id="main">

		<!-- angular templating -->
		<!-- this is where content will be injected -->
		<div ng-view></div>

	</div>
	
	
	

	<!-- Footer -->
	<footer>
		<hr>

		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<ul class="list-inline text-center">
						<li><a href="#"> <span class="fa-stack fa-lg"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-twitter fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li><a href="#"> <span class="fa-stack fa-lg"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-facebook fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li><a href="#"> <span class="fa-stack fa-lg"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-github fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
					</ul>
					<p class="copyright text-muted">Copyright &copy; Your Website
						2014</p>
				</div>
			</div>
		</div>
	</footer>


</body>

<script src="<c:url value='/resources/js/pages/masterclean.js' />"></script>
</html>


