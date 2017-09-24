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
					Article Editing 
				</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> <a href="index.html">Dashboard</a>
					</li>
					<li class="active"><i class="fa fa-file"></i> Article Editing</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<div class="row-fluid">

				<div class="container" ng-controller="articlesController">
					<div class="col-lg-12 BgWhiteGri Padding_10 MarginBottom_10">
						<div ng-init="selectArticle('${selectedArticleId}')">
							<form class="form-horizontal " role="form" name="updateArticleForm"
								novalidate>
								<div class="form-group">
									<label for="title"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Title</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="text" class="form-control" id="title"
											ng-model="selectedArticle.title" name="title" placeholder="Required" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="summary"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Summary</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<div class="nopadding Padding_0 Margin_0" >
											<textarea class="Padding_0 Margin_0" style="min-width: 100%" ng-model="selectedArticle.summary" id="summary" name="summary"></textarea>
										</div>
									</div>
								</div>
								
									<!-- adding post background -->
							<div class="form-group">
								<label for="postbg"
									class="col-lg-2 col-md-2 col-sm-2 control-label">Post
									BG (1900x600)</label>
								<div class="col-lg-3 col-md-3 col-sm-3 PaddingRight_0" ng-show="visibleSelectingPosgBgInUpdate">
									<div class="nopadding Padding_0 Margin_0">
										<input ng-model="photo"
											onchange="angular.element(this).scope().file_changed(this)"
											type="file" accept="image/*" />
									</div>
									<img id="blah" class="img-responsive"  width="200" height="75" src="{{selectedPostBgBase64Str}}"/>
								</div>
								<label class="col-lg-3 col-md-3 col-sm-3"> 
									<input type="checkbox" ng-checked="chckBoxDefaultPostBgInUpdate" ng-click="checkOrUncheckInUpdate()"> Default Post Bg
								</label>
							</div>

								
								<div class="form-group">
								<label for="adSoyad"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Description</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<div id="summernote" class="nopadding Border_1">
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<label for="status"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Status</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<select name="statusSelect" id="statusSelect"
											ng-options="status.name for status in statusdata.availableStatus"
											ng-model="editingArticleStatus"></select>
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
									<label for="adSoyad"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Owner</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="text" class="form-control" id="userName" disabled="disabled"
											ng-model="selectedArticle.userName" name="userName"
											placeholder="Required" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 col-md-3 col-sm-3 control-label"></label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="submit" ng-click="updateArticle(updateArticleForm)"
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
				 $('#summernote').summernote({
					 minHeight: 200,   //set editable area's height
					  codemirror: { // codemirror options
					    theme: 'monokai'
					  }
					});
			});
		</script>
<script src="<c:url value="/resources/js/pages/articles.js" />"></script>

