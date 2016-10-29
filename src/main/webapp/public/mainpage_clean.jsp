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
                        <h1><spring:message code="project.name"/></h1>
                        <hr class="small">
                        <span class="subheading">Welcome to GltknBtn Blog</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

<!-- Category -->
	<div class="col-lg-2 col-lg-offset-2 col-md-4 MarginTop_20" >
		<div class="list-group">
		
			<a href="#" ng-click="getArticleListFirstPageByCategoryName('AllCategory')" class="list-group-item" ng-class="{'active': selectedCategoryName == 'AllCategory', '': selectedCategoryName != 'AllCategory'}">All Category <span class="badge">{{totalArticleSize}}</span></a> 
			<a href="#" ng-click="getArticleListFirstPageByCategoryName(category.categoryName)" class="list-group-item" ng-class="{'active': selectedCategoryName == category.categoryName, '': selectedCategoryName != category.categoryName}" ng-repeat="category in categories">{{category.categoryName}} <span class="badge">{{category.articleCount}}</span></a>
			<!-- <a href="#" class="list-group-item active">All Category <span class="badge">17</span></a> 
			<a href="#" class="list-group-item">Object Oriented Programming <span class="badge">3</span></a> 
			<a href="#" class="list-group-item">Continous Integration <span class="badge">2</span></a> 
			<a href="#" class="list-group-item">Machine Learning <span class="badge">3</span></a> 
			<a href="#" class="list-group-item">Image Processing <span class="badge">4</span></a> 
			<a href="#" class="list-group-item">Software Testing <span class="badge">2</span></a> 
			<a href="#" class="list-group-item">Life <span class="badge">1</span></a> 
			<a href="#" class="list-group-item">Fun <span class="badge">2</span></a> -->
		</div>
	</div>

    <!-- Main Content -->
    <div class="col-lg-8 col-md-8">
        <div class="row" ng-repeat="article in page.source">
            <div class="col-lg-8 col-md-10">
                <div class="post-preview">
                    <a href="<c:url value="/articledetail/{{article.id}}"/>">
                        <h2 class="post-title">
                            {{article.title}}
                        </h2>
                        <h3 class="post-subtitle">
                            {{article.summary}}
                        </h3>
                    </a>
                    <p class="post-meta">Posted by <a href="#">{{article.userName}}</a> on {{article.createdDate}}</p>
                </div>
                <hr class="Margin_0">
            </div>
        </div>
        
        <!-- Pagination -->
          <div class="text-center PaddingBottom_20">
		                <button href="#" class="btn btn-default"
		                        ng-class="{'btn btn-default': page.currentPage != 0, 'btn btn-default disabled': page.currentPage == 0}"
		                        ng-click="changePage(0, selectedCategoryName)"
		                        title='<spring:message code="pagination.first"/>'
		                        >
		                     <spring:message code="pagination.first"/>
		                </button>
		                <button href="#"
		                        class="btn btn-default"
		                        ng-class="{'btn btn-default': page.currentPage != 0, 'btn btn-default disabled': page.currentPage == 0}"
		                        ng-click="changePage(page.currentPage - 1, selectedCategoryName)"
		                        title='<spring:message code="pagination.back"/>'
		                        >&larr;</button>
		                <span>{{page.currentPage + 1}} <spring:message code="pagination.of"/> {{page.pagesCount}}</span>
		                <button href="#"
		                        class="btn btn-default"
		                        ng-class="{'btn btn-default': page.pagesCount - 1 != page.currentPage, 'btn btn-default disabled': page.pagesCount - 1 == page.currentPage}"
		                        ng-click="changePage(page.currentPage + 1, selectedCategoryName)"
		                        title='<spring:message code="pagination.next"/>'
		                        >&rarr;</button>
		                <button href="#"
		                        class="btn btn-default"
		                        ng-class="{'btn btn-default': page.pagesCount - 1 != page.currentPage, 'btn btn-default disabled': page.pagesCount - 1 == page.currentPage}"
		                        ng-click="changePage(page.pagesCount - 1, selectedCategoryName)"
		                        title='<spring:message code="pagination.last"/>'
		                        role="button"
		                        >
		                     <spring:message code="pagination.last"/>          
		                </button>
            	 </div>

	</div>

    </div>

<script src="<c:url value="/resources/js/pages/mainpage_clean.js" />"></script>
