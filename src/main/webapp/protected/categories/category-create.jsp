<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div >

	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="container row-fluid">
			<div class="col-lg-12 Margin_0 Padding_0">
				<h1 class="page-header">
					Category Creating 
				</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> <a href="index.html">Dashboard</a>
					</li>
					<li class="active"><i class="fa fa-file"></i> Category Creating</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<div class="row-fluid">

				<div class="container" ng-controller="categoriesController">
					<div class="col-lg-12 BgWhiteGri Padding_10 MarginBottom_10">
						<div>
							<form class="form-horizontal " role="form" name="newCategoryForm"
								novalidate>
								
								<div class="form-group">
									<label for="name"
										class="col-lg-2 col-md-2 col-sm-2 control-label">Category Name</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="text" class="form-control" id="categoryName" required="required"
											ng-model="category.categoryName" name="categoryName" placeholder="Required" />
									</div>
								<div class="MarginTop_5">
									 <span class="alert alert-danger Padding_5" 
										ng-show="displayValidationError && newCategoryForm.categoryName.$error.required">
											<spring:message code="required" />
									</span>
								</div>
							</div>
								
								

							<div class="form-group">
								<label class="col-lg-2 col-md-3 col-sm-3 control-label"></label>
								<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
									<input type="submit" ng-click="createCategory(newCategoryForm)"
										class="btn btn-default pull-right" value="Create" />
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
<script src="<c:url value="/resources/js/pages/categories.js" />"></script>

