<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="row-fluid" ng-controller="mainpageController">
	      
	       <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('<c:url value="/resources/img/home-bg.jpg" />')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h1>GltknBtn Blog</h1>
                        <hr class="small">
                        <span class="subheading">Welcome to GltknBtn Blog</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row" ng-repeat="article in page.source">
            <div class="col-lg-10 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="post-preview">
                    <a href="articledetail/{{article.id}}">
                        <h2 class="post-title">
                            {{article.title}}
                        </h2>
                        <h3 class="post-subtitle">
                            {{article.description}}
                        </h3>
                    </a>
                    <p class="post-meta">Posted by <a href="#">{{article.owner}}</a> on September 24, 2014</p>
                </div>
                <hr>
            </div>
        </div>
        
          <div class="text-center PaddingBottom_20">
		                <button href="#" class="btn btn-default"
		                        ng-class="{'btn btn-default': page.currentPage != 0, 'btn btn-default disabled': page.currentPage == 0}"
		                        ng-click="changePage(0)"
		                        title='<spring:message code="pagination.first"/>'
		                        >
		                     <spring:message code="pagination.first"/>
		                </button>
		                <button href="#"
		                        class="btn btn-default"
		                        ng-class="{'btn btn-default': page.currentPage != 0, 'btn btn-default disabled': page.currentPage == 0}"
		                        ng-click="changePage(page.currentPage - 1)"
		                        title='<spring:message code="pagination.back"/>'
		                        >&larr;</button>
		                <span>{{page.currentPage + 1}} <spring:message code="pagination.of"/> {{page.pagesCount}}</span>
		                <button href="#"
		                        class="btn btn-default"
		                        ng-class="{'btn btn-default': page.pagesCount - 1 != page.currentPage, 'btn btn-default disabled': page.pagesCount - 1 == page.currentPage}"
		                        ng-click="changePage(page.currentPage + 1)"
		                        title='<spring:message code="pagination.next"/>'
		                        >&rarr;</button>
		                <button href="#"
		                        class="btn btn-default"
		                        ng-class="{'btn btn-default': page.pagesCount - 1 != page.currentPage, 'btn btn-default disabled': page.pagesCount - 1 == page.currentPage}"
		                        ng-click="changePage(page.pagesCount - 1)"
		                        title='<spring:message code="pagination.last"/>'
		                        role="button"
		                        >
		                     <spring:message code="pagination.last"/>          
		                </button>
            	 </div>
    </div>

    <hr>
    </div>

<script src="<c:url value="/resources/js/pages/mainpage.js" />"></script>
<script src="<c:url value="/resources/js/pages/articledetail.js" />"></script>
