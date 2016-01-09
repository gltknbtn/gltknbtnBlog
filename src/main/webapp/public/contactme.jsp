<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="row-fluid">
    
	      
				<div class="container">
					<h1>
						<spring:message code='project.name' />
					</h1>
					<p class="lead">
						<spring:message code='contactme.description' />
					</p>
					
					  <!--Jumbotron başladı -->
                        <div class="container MarginTop_10">
                            <div class="jumbotron PaddingTop_20 PaddingBottom_20 MarginBottom_10">
                                <div class="page-header MarginTop_0 MarginBottom_0 PaddingTop_0 PaddingBottom_0">
                                    <h2 class="MarginTop_0 MarginBottom_0">
                                        İletişim <small>Subtext for header</small>
                                    </h2>
                                </div>
                            </div>
                        </div>
                        <!--Jumbotron bitti-->

                        <div class="container" ng-controller="contactFormController">
                            <div class="col-lg-12 BgWhiteGri Padding_10 MarginBottom_10">

                                <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12">
                                    <h3 class="page-header MarginTop_0 Color_1">İletişim  Bilgileri</h3>
                                    <div class="list-group">
                                        <div class="list-group-item  Border_0">
                                            <i class="glyphicon glyphicon-earphone"></i> <strong><abbr title="Telefon">Tel:</abbr></strong> 0222 222 22 22
                                        </div>
                                        <div class="list-group-item  Border_0">
                                            <i class="glyphicon glyphicon-phone"></i> <strong><abbr title="Cep Telefon">Mobil: </abbr></strong> 0555 555 55 55
                                        </div>
                                        <div class="list-group-item  Border_0">
                                            <i class="glyphicon glyphicon-envelope"></i> <strong><abbr title="Telefon">Email: </abbr></strong> <a href="mailto:info@info.com" title="">info@info.com</a>
                                        </div>
                                        <div class="list-group-item  Border_0">
                                            <i class="glyphicon glyphicon-map-marker"></i> <strong><abbr title="Telefon">Adres: </abbr></strong> Adress bla bla bla  bla  bla  bla  bla  bla  bla  bla bla..
                                        </div>
                                        <div class="list-group-item PaddingLeft_0 Border_0"></div>
                                    </div>
                                </div>
                                <div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
                                     <form class="form-horizontal " role="form" name="newContactForm" novalidate>
                                        <h3 class="page-header MarginTop_0 Color_1">İletişim  Formu</h3>

                                        <div class="form-group">
                                            <label for="adSoyad" class="col-lg-2 col-md-3 col-sm-3 control-label">Ad ve Soyad</label>
                                            <div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
                                                <input type="text" class="form-control" id="adSoyad" ng-model="contactForm.name" name="name" name="adSoyad" placeholder="Gerekli alan"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="adSoyad" class="col-lg-2 col-md-3 col-sm-3 control-label">Email</label>
                                            <div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
                                                <input type="text" class="form-control" id="email" ng-model="contactForm.email" name="email" placeholder="Gerekli alan"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="adSoyad" class="col-lg-2 col-md-3 col-sm-3 control-label">Telefon</label>
                                            <div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
                                                <input type="text" class="form-control" id="tel" ng-model="contactForm.phone" name="phone" placeholder="Gerekli alan"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="adSoyad" class="col-lg-2 col-md-3 col-sm-3 control-label">Konu</label>
                                            <div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
                                                <input type="text" class="form-control" id="konu" ng-model="contactForm.title" name="title" placeholder="Opsiyonel alan"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="adSoyad" class="col-lg-2 col-md-3 col-sm-3 control-label">Mesaj</label>
                                            <div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
                                                <textarea class="form-control" ng-model="contactForm.message" placeholder="Gerekli alan"></textarea>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 col-md-3 col-sm-3 control-label"></label>
                                            <div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
                                                <input type="submit" ng-click="createContactForm()" class="btn btn-default pull-right" value="Gönder"/>
                                            </div>
                                        </div>

                                    </form>
                                </div>

                                <div class="clearfix"></div>
                            </div>
							<div class="col-lg-12 Padding_0">
		                            <iframe class="Border_0" style="width: 100%; max-height: 450px; min-height: 300px" src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d2965.0824050173574!2d-93.63905729999999!3d41.998507000000004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sWebFilings%2C+University+Boulevard%2C+Ames%2C+IA!5e0!3m2!1sen!2sus!4v1390839289319"></iframe>
		                    </div>
                        </div>
					
					
				
				</div>
</div>

<script src="<c:url value="/resources/js/pages/contactForm.js" />"></script>