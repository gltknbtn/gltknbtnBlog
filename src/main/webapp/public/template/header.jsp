<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="masthead">
	<div class="navbar navbar-default navbar-inverse navbar-static-top">
		<div class="navbar-inner">
			<div class="container">
			
				<ul class="nav">
						<li>
							 <a href="<c:url value="/"/>" title='<spring:message code="header.home"/>'>
								<p class="navbar-text navbarcolortext"> <spring:message code="header.logo" /></p>
							</a>
						</li>
				</ul>
			
					<ul class="nav pull-right" ng-controller="LocationController">
						<li ng-class="{'gray': activeURL == 'home', '': activeURL != 'home'}">
							<a href="<c:url value="/"/>" title='<spring:message code="header.home"/>'>
								<p class="navbar-text navbarcolortext"> <spring:message code="header.home" /></p>
							</a>
						</li>
						<li ng-class="{'gray': activeURL == 'contacts', '': activeURL != 'contacts'}">
							<a title='<spring:message code="header.contacts"/>' href="<c:url value='/protected/contacts'/>">
								<p class="navbar-text navbarcolortext"> <spring:message code="header.contacts" /></p>
							</a>
						</li>
						<li ng-class="{'gray': activeURL == 'articles', '': activeURL != 'articles'}">
							<a title='<spring:message code="header.articles"/>' href="<c:url value='/protected/articles'/>">
								<p class="navbar-text navbarcolortext"> <spring:message code="header.articles" /></p>
							</a>
						</li>
						<li ng-class="{'gray': activeURL == 'mainpage', '': activeURL != 'mainpage'}">
							<a title='<spring:message code="mainpage.url"/>' href="<c:url value='/mainpage'/>">
								<p class="navbar-text navbarcolortext"> <spring:message code="mainpage.url" /></p>
							</a>
						</li>
						<li><a href="<c:url value='/logout' />" title='<spring:message code="header.logout"/>'>
								<p class="navbar-text navbarcolortext displayInLine"> <spring:message code="header.logout" /> &nbsp;(${user.name})</p>
							</a>
						</li>
				</ul>
			</div>
		</div>
	</div>
</div>
