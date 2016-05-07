<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div ng-controller="articledetailController">
  <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('<c:url value="/resources/img/post-bg.jpg" />'); margin: 0; padding :0;">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="post-heading">
                        <h1>${selectedArticle.title}</h1>
                        <h2 class="subheading">${selectedArticle.title} 22</h2>
                    <span class="meta">Posted by <a href="#">${selectedArticle.user.name}</a> on August 24, 2014</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

 <!-- Post Content -->
    <article>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <p>
						${selectedArticle.description}
                    </p>

                    <a href="#">
                        <img class="img-responsive" src="<c:url value="/resources/img/post-sample-image.jpg" />" alt="">
                    </a>
                    
                </div>
            </div>
             
             <hr/>
            
            <div class="row" ng-init="init('${selectedArticle.id}')">
            	    <!-- Blog Post Content Column -->
	            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
	                <!-- Comments Form -->
	                <div class="well">
	                    <h4>Leave a Comment:</h4>
	                    <form role="form" name="newCommentForm" novalidate>
	                    
	                    	<div class="form-group">
								<input type="text" class="form-control" required ng-model="comment.name" name="name" placeholder="Name"/>
						    </div>
                            <div class="form-group">
                            	<input type="text" class="form-control" required ng-model="comment.mail" name="mail" placeholder="<spring:message code='sample.email'/> "/>
                            </div>
	                        <div class="form-group">
	                            <textarea class="form-control" required ng-model="comment.commentDesc" name="commentDesc" rows="3"></textarea>
	                        </div>
	                        <button type="submit" class="btn btn-primary" ng-click="createComment(newCommentForm,'${selectedArticle.id}');">Submit</button>
	                    </form>
	                </div>
	
	                <hr>
	
	                <!-- Posted Comments -->
	
	                <!-- Comment -->
	                <div class="media" ng-repeat="comment in page.source" >
	                    <a class="pull-left" href="#">
	                        <img class="media-object" src="<c:url value="/resources/img/img1.png" />" alt="">
	                    </a>
	                    <div class="media-body">
	                        <h4 class="media-heading">{{comment.name}}
	                            <small>{{comment.createdDate}}</small>
	                        </h4>
	                        {{comment.commentDesc}}
	                    </div>
	                </div>
	                <hr/>
	                <!-- pagination starting -->

								<div class="pull-right MarginTop_5" ng-class="{'hidden': page.pagesCount <= 1}"> 
									<button href="#" class="btn btn-default"
										ng-class="{'btn btn-default btn-xs': page.currentPage != 0, 'btn btn-default btn-xs disabled': page.currentPage == 0}"
										ng-click="changePage(0)"
										title='<spring:message code="pagination.first"/>'>
										<spring:message code="pagination.first"/>
									</button>
									<button href="#"
										class="btn btn-default"
										ng-class="{'btn btn-default btn-xs': page.currentPage != 0, 'btn btn-default btn-xs disabled': page.currentPage == 0}"
										ng-click="changePage(page.currentPage - 1)"
										title='<spring:message code="pagination.back"/>'>&larr;</button>
									<span>{{page.currentPage + 1}} <spring:message code="pagination.of" /> {{page.pagesCount}}</span>
									<button href="#"
										class="btn btn-default"
										ng-class="{'btn btn-default btn-xs': page.pagesCount - 1 != page.currentPage, 'btn btn-default btn-xs disabled': page.pagesCount - 1 == page.currentPage}"
										ng-click="changePage(page.currentPage + 1)"
										title='<spring:message code="pagination.next"/>'>&rarr;</button>
									<button href="#" class="btn btn-default"
										ng-class="{'btn btn-default btn-xs': page.pagesCount - 1 != page.currentPage, 'btn btn-default btn-xs disabled': page.pagesCount - 1 == page.currentPage}"
										ng-click="changePage(page.pagesCount - 1)"
										title='<spring:message code="pagination.last"/>' role="button">
										<spring:message code="pagination.last"/>
									</button>
								</div>
									<div class="clearfix"></div>

								<!-- pagination ending-->
	                
	            </div>
            </div>
            
        </div>
    </article>

    <hr>
    
   </div>

<script src="<c:url value="/resources/js/pages/articledetail.js" />"></script>
