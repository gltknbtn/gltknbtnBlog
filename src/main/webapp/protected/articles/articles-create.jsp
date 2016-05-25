<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div >

	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="row-fluid container">
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

				<div class="container" ng-controller="articlesController">
					<div class="col-lg-12 BgWhiteGri Padding_10 MarginBottom_10">
						<div>
							<form class="form-horizontal " role="form" name="newArticleForm"
								novalidate>
								
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
									<label for="summary"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Summary</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<div class="nopadding Padding_0 Margin_0" >
											<textarea class="Padding_0 Margin_0" style="min-width: 100%" ng-model="article.summary" id="summary" name="summary"></textarea>
										</div>
									</div>
								</div>
								
								<div class="form-group">
								<label for="description"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Description</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<div class="nopadding Border_1" >
											<textarea id="txtEditor" name="txtEditor"></textarea>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<label for="status"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Status</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<select name="statusSelect" id="statusSelect"
											ng-init="selectedStatus = statusdata.availableStatus[0]"
											ng-options="status.name for status in statusdata.availableStatus"
											ng-model="selectedStatus"></select>
									</div>
								</div>
								
								<div class="form-group">
									<label for="status"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Category</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<select name="category" id="category"
											ng-options="category as category.categoryName for category in categories"
											ng-model="selectedArticleCategory"></select>
									</div>
								</div>

								<div class="form-group">
									<label for="author"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Author</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="text" class="form-control" id="author" disabled="disabled"
											value="${userName}" name="author"
											placeholder="Required" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 col-md-3 col-sm-3 control-label"></label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="submit" ng-click="createArticle(newArticleForm)"
											class="btn btn-default pull-right" value="Submit" />
									</div>
								</div>

							</form>
						</div>

						<div class="clearfix"></div>
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

