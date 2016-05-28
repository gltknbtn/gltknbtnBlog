<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

 <!-- Navigation -->
    <nav class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container-fluid" ng-controller="LocationController">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/gltknbtnBlog/mainpage">GltknBtn Blog</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li ng-class="{'active': activeURL == 'mainpage', '': activeURL != 'mainpage'}">
                        <a href="<c:url value="/mainpage"/>">Home</a>
                    </li>
                    <li ng-class="{'active': activeURL == 'aboutme', '': activeURL != 'aboutme'}">
                        <a href="<c:url value="/aboutme"/>">About</a>
                    </li>
                    <li ng-class="{'active': activeURL == 'contactme', '': activeURL != 'contactme'}">
                        <a href="<c:url value="/contactme"/>">Contact</a>
                    </li>
                    <li><a href="<c:url value="/login"/>" title=""><i class="glyphicon glyphicon-log-in"></i></a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
