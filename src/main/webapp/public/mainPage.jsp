<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="row-fluid" ng-controller="mainpageController">
	      
	      <!-- Carousel başlangıç -->
                <!-- <div class="container">  carousel'in ortada olmasi için-->
                <div class="carousel slide" id="MySlide">
                    <ol class="carousel-indicators">
                        <li class="active" data-target="#MySlide" data-slide-to="0"></li>
                        <li data-target="#MySlide" data-slide-to="1"></li>
                        <li data-target="#MySlide" data-slide-to="2"></li>
                        <li data-target="#MySlide" data-slide-to="3"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="<c:url value="/resources/img/slide/earhtSurface2.jpg" />" alt="" title="" longdesc="" />
                            <div class="carousel-caption">
                                <h2>1 Welcome to GltknBtn Blog</h2>
                                <p>1 Welcome to GltknBtn Blog.Welcome to GltknBtn Blog.Welcome to GltknBtn Blog.Welcome to GltknBtn Blog.</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="<c:url value="/resources/img/slide/22.png" />" alt="" title="" longdesc="" />
                            <div class="carousel-caption">
                                <h2>2 Welcome to GltknBtn Blog</h2>
                                <p>2 Welcome to GltknBtn Blog.Welcome to GltknBtn Blog.Welcome to GltknBtn Blog.Welcome to GltknBtn Blog.</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="<c:url value="/resources/img/slide/33.jpg" />" alt="" title="" longdesc="" />
                            <div class="carousel-caption">
                                <h2>3 Welcome to GltknBtn Blog</h2>
                                <p>3 Welcome to GltknBtn Blog.Welcome to GltknBtn Blog.Welcome to GltknBtn Blog.Welcome to GltknBtn Blog.</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="<c:url value="/resources/img/slide/44.png" />" alt="" title="" longdesc="" />
                            <div class="carousel-caption">
                                <h2>4 Welcome to GltknBtn Blog</h2>
                                <p>4 Welcome to GltknBtn Blog.Welcome to GltknBtn Blog.Welcome to GltknBtn Blog.Welcome to GltknBtn Blog.</p>
                            </div>
                        </div>
                    </div>
                    <a class="left carousel-control" href="#MySlide" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span>
                    </a> <a class="right carousel-control" href="#MySlide" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
				<!-- Carousel bitiş -->
				
				
				<div class="container">
					<h1>
						<spring:message code='project.name' />
						{{message}}
						
					</h1>
					<p class="lead">
						<spring:message code='mainPage.description' />
					</p>
					
					<div ng-repeat="article in page.source">
	                    <div class="panel panel-default BorderHover ">
	                        <div class="panel-heading MakaleListTitle">
	                            <h3 class="panel-title">
	                                <a href="articledetail/{{article.id}}">{{article.title}}</a>
	                                <span class="MakaleEkleyenBilgi pull-right hidden-xs"><a href="" title="">12.05.2015</a> tarihinde <a href="" title="">{{article.owner}}</a> tarafından Eklendi </span>
	                            </h3>
	                        </div>
	                        <div class="panel-body FontSize_13 limitedText">
	                            <div class="col-lg-4 col-md-3 col-sm-12 hidden-xs pull-right PaddingRight_0">
	                                <a href="#" title="" class="img-thumbnail MakalelistImg"><img src="<c:url value="/resources/img/slide/44.png" />" class="img-responsive" alt=""/></a>
	                            </div>
	                            {{article.description}}
	                        </div>
	
	                        <div class="panel-footer" ng-controller="articledetailController">
	                            <ol class="breadcrumb col-lg-9 col-md-9 col-sm-8 col-xs-8 hidden-xs  Margin_0 Padding_0">
	                                <li><a href="#">Home</a></li>
	                                <li><a href="#">Library</a></li>
	                            </ol>
	                            <a href="articledetail/{{article.id}}" class="col-lg-2 col-md-3 col-sm-4 pull-right text-right"><em>Devamını oku.. </em></a>
	                            <div class="clearfix"></div>
	                        </div>
	
	                    </div>
                    </div>
                    
                    <div class="text-center PaddingBottom_20">
		                <button href="#" class="btn btn-default"
		                        ng-class="{'btn btn-default': page.currentPage != 0, 'btn btn-default disabled': page.currentPage == 0}"
		                        ng-click="changePage(0)"
		                        title='<spring:message code="pagination.first"/>'
		                        >
		                     <span class=" glyphicon glyphicon-fast-backward MarginRight_5" aria-hidden="true"></span><spring:message code="pagination.first"/>
		                </button>
		                <button href="#"
		                        class="btn btn-default glyphicon glyphicon-backward"
		                        ng-class="{'btn btn-default': page.currentPage != 0, 'btn btn-default disabled': page.currentPage == 0}"
		                        ng-click="changePage(page.currentPage - 1)"
		                        title='<spring:message code="pagination.back"/>'
		                        ></button>
		                <span>{{page.currentPage + 1}} <spring:message code="pagination.of"/> {{page.pagesCount}}</span>
		                <button href="#"
		                        class="btn btn-default glyphicon glyphicon-forward"
		                        ng-class="{'btn btn-default': page.pagesCount - 1 != page.currentPage, 'btn btn-default disabled': page.pagesCount - 1 == page.currentPage}"
		                        ng-click="changePage(page.currentPage + 1)"
		                        title='<spring:message code="pagination.next"/>'
		                        ></button>
		                <button href="#"
		                        class="btn btn-default"
		                        ng-class="{'btn btn-default': page.pagesCount - 1 != page.currentPage, 'btn btn-default disabled': page.pagesCount - 1 == page.currentPage}"
		                        ng-click="changePage(page.pagesCount - 1)"
		                        title='<spring:message code="pagination.last"/>'
		                        role="button"
		                        >
		                     <spring:message code="pagination.last"/><span class="glyphicon glyphicon-fast-forward MarginLeft_5" aria-hidden="true"></span>          
		                </button>
            	 </div>
					
			</div>
</div>

<script src="<c:url value="/resources/js/pages/mainpage.js" />"></script>
<script src="<c:url value="/resources/js/pages/articledetail.js" />"></script>
