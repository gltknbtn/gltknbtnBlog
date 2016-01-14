<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div >

	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12 Margin_0 Padding_0">
				<h1 class="page-header">
					Article Creating 
				</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> <a href="index.html">Dashboard</a>
					</li>
					<li class="active"><i class="fa fa-file"></i> Article Creating</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<div class="row-fluid">

			<div class="container">

				<div class="container" ng-controller="articlesController">
					<div class="col-lg-12 BgWhiteGri Padding_10 MarginBottom_10">
						<div>
							<form class="form-horizontal " role="form" name="newArticleForm"
								novalidate>
								{{test}}fdf
								<div ng-class="{'hidden': dataActionMessageCreateArticle == '', 'form-group': dataActionMessageCreateArticle != ''}">
									<label for="title"
										class="col-lg-2 col-md-3 col-sm-3 control-label"></label>
									<div class="alert alert-success col-lg-9 col-md-9 col-sm-9">
										<a href="#" class="close" data-dismiss="alert"
												aria-label="close">&times;</a> <strong>{{dataActionMessageCreateArticle}}</strong>
											
									</div>
								</div>
								<div class="form-group">
									<label for="title"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Title</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="text" class="form-control" id="title"
											ng-model="article.title" name="title" placeholder="Required" />
									</div>
								</div>

								
								<div class="form-group">
								<label for="adSoyad"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Description</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<div class="nopadding Border_1" >
											<textarea id="txtEditor" name="txtEditor"></textarea>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label for="adSoyad"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Owner</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="text" class="form-control" id="tel"
											ng-model="article.owner" name="owner"
											placeholder="Required" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 col-md-3 col-sm-3 control-label"></label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="submit" ng-click="createArticle(newArticleForm)"
											class="btn btn-default pull-right" value="Gönder" />
									</div>
								</div>

							</form>
						</div>

						<div class="clearfix"></div>
					</div>
				</div>
				
				
		

			</div>
		</div>


	</div>
	<!-- /.container-fluid -->

</div>
 	<script>
			$(document).ready(function() {
				$("#txtEditor").Editor();
			});
		</script>
<script src="<c:url value="/resources/js/pages/articles.js" />"></script>

