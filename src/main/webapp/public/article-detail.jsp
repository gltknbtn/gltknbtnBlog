<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<head>
	      <script type="text/javascript">
            $(document).ready(function () {
                $(".tooltipAc").tooltip();
                $(".popoverAc").popover();
                $('a.galeriAc').lightBox();
                $('.collapseList').collapse();
            }
            );

        </script>
</head>

<div class="row-fluid">
	      
				<div class="container">
					<h1>
						<spring:message code='project.name' />
					</h1>
					<p class="lead">
						<spring:message code='article.detail.description' />
					</p>
					
				</div>
				
				<!--Jumbotron başladı -->
        <div class="container MarginTop_10">
            <div class="jumbotron PaddingTop_20 PaddingBottom_20 MarginBottom_10">
                <div class="page-header MarginTop_0 MarginBottom_0 PaddingTop_0 PaddingBottom_0">
                    <ol class="breadcrumb Margin_0 Padding_0 FontSize_16" style="background: none;">
                        <li><a href="makaleler.html">Makaleler</a></li>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Library</a></li>
                        <li><a href="#" class="Aktif FontSize_20">Makale Detay</a></li>
                    </ol>
                </div>
            </div>
        </div>
        <!--Jumbotron bitti-->

        <div class="container MarginTop_0" ng-controller="articledetailController">
        
       for what:  {{message}}
            <div class="col-lg-12 BgWhiteGri Padding_10 MarginBottom_10">
                <div class="Padding_0">
                    <a href="<c:url value="/resources/img/slide/1.jpg" />" title="" class="Blok img-thumbnail galeriAc">
                        <img src="<c:url value="/resources/img/slide/11.jpg" />" class="img-responsive BlokMaxHeight_250" alt="" title="" longdesc=""/>
                    </a>

                    <p class="text-left MarginTop_10">
                        <span class="tooltipAc" style="color: #265a88;" data-toggle="tooltip" title="Java import is importante">Java Import İşlemi</span> Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import
                        İşlemiJava Import İşlemi Java Import İşlemi Java Import ava Import ava Import ava Import ava Import ava Import 
                        ava Import ava Import ava Import ava Import ava Import ava Import ava Import java Import ava Import ava Import 
                        ava Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi.
                    </p>
                    <p class="text-left MarginTop_10">
                        <span class="tooltipAc" style="color: #265a88;" data-toggle="tooltip" title="Java import is importante">Java Import İşlemi</span> Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import
                        İşlemiJava Import İşlemi Java Import İşlemi Java Import ava Import ava Import ava Import ava Import ava Import 
                        ava Import ava Import ava Import ava Import ava Import ava Import ava Import java Import ava Import ava Import 
                        ava Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi.
                    </p>

                    <div class="panel-group " id="accordion">
                        <div class="panel panel-default Margin_0">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Yorumlar</a>
                                    <a class="pull-right tooltipAc text-center" data-toggle="tooltip" title="Dersler 1" href="#"></a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="list-group collapseList in Padding_10">
                                <div class="media list-group-item BorderBottom_0">
                                    <div class="media-left">
                                        <a href="#">
                                            <img class="media-object" src="<c:url value="/resources/img/img1.png" />" alt="...">
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">GltknBtn <span class="pull-right">09.12.2015</span></h4>
                                        Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemiJava Import İşlemi Java Import İşlemi 
                                        <div  class="media">
                                            <div class="media-left">
                                                <a href="#">
                                                    <img class="media-object" src="<c:url value="/resources/img/img1.png" />" alt="...">
                                                </a>
                                            </div>
                                            <div class="media-body">
                                                <h4 class="media-heading">Media Heading 2</h4>
                                                MJava Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemiJava Import İşlemi Java Import İşlemi 
                                                ...
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="media list-group-item BorderBottom_0">
                                    <div class="media-left">
                                        <a href="#">
                                            <img class="media-object" src="<c:url value="/resources/img/img1.png" />" alt="...">
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="media-heading">Media Heading</h4>
                                        Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemiJava Import İşlemi Java Import İşlemi 
                                        <div  class="media bg-warning">
                                            <div class="media-left">
                                                <a href="#">
                                                    <img class="media-object" src="<c:url value="/resources/img/img1.png" />" alt="...">
                                                </a>
                                            </div>
                                            <div class="media-body">
                                                <h4 class="media-heading">Media Heading 2</h4>
                                                MJava Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemi Java Import İşlemiJava Import İşlemi Java Import İşlemi 
                                                ...
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="panel panel-default Margin_0">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#addArticleDetailComment">Yorum Yaz</a>
                                    <a class="pull-right tooltipAc text-center" data-toggle="tooltip" title="Dersler 1" href="#"></a>
                                </h4>
                            </div>
                            <div id="addArticleDetailComment" class="list-group collapseList  Padding_10">
                                <form role="form" name="newCommentForm" novalidate>

                                    <div class="col-lg-12 hidden-xs Padding_10">
                                        <div class="col-lg-3 col-md-3 col-sm-4">Yorum Türü Seçiniz</div>
                                        <div class="col-lg-2 col-md-2 col-sm-2"><img class="img-responsive img-circle" style="width: 100%" src="<c:url value="/resources/img/img1.png" />" alt="" title=""/></div>
                                        <div class="col-lg-2 col-md-2 col-sm-2"><img class="img-responsive img-circle" style="width: 100%" src="<c:url value="/resources/img/img1.png" />" alt="" title=""/></div>
                                        <div class="col-lg-2 col-md-2 col-sm-2"><img class="img-responsive img-circle" style="width: 100%" src="<c:url value="/resources/img/img1.png" />" alt="" title=""/></div>
                                        <div class="clearfix"></div>
                                    </div>

                                    <div class="form-group visible-xs">
                                        <select class="form-control">
                                            <option selected>Yorum Türü Seçiniz</option>
                                            <option>+ Teşekkür/Tavsiye</option>
                                            <option>? Soru</option>
                                            <option>! Şikayet</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" required autofocus ng-model="comment.name" name="name" placeholder="Ad giriniz"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" required ng-model="comment.mail" name="mail" placeholder="<spring:message code='sample.email'/> "/>
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" required ng-model="comment.commentDesc" name="commentDesc" placeholder="Açıklama giriniz"></textarea>
                                    </div>
                                    <input type="submit" class="btn btn-default" ng-click="createComment(newCommentForm);" value='<spring:message code="create"/>'/>
                                    {{responseMessage}}
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="visible-xs col-xs-12 MarginBottom_10">
                    <select class="form-control">
                        <option selected>Benzer Makaleler...</option>
                        <option>+ Teşekkür/Tavsiye</option>
                        <option>? Soru</option>
                        <option>! Şikayet</option>
                    </select>
                </div>


                <div class="clearfix"></div>
            </div>
</div>
        
        <br/>
        <br/>
        <br/>
        
</div>

<script src="<c:url value="/resources/js/pages/articledetail.js" />"></script>