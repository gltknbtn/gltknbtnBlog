<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div ng-controller="articledetailController">
  <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('<c:url value="/resources/img/post-bg.jpg" />')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="post-heading">
                        <h1>${selectedArticle.title}</h1>
                        <h2 class="subheading">${selectedArticle.title} 22</h2>
                        <span class="meta">Posted by <a href="#">${selectedArticle.owner}</a> on August 24, 2014</span>
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
        </div>
    </article>

    <hr>
    
   </div>

<script src="<c:url value="/resources/js/pages/articledetail.js" />"></script>
