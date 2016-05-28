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
					User Creating 
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

				<div class="container" ng-controller="usersController">
					<div class="col-lg-12 BgWhiteGri Padding_10 MarginBottom_10">
						<div>
							<form class="form-horizontal " role="form" name="newUserForm"
								novalidate>
								
								<div class="form-group">
									<label for="name"
										class="col-lg-2 col-md-2 col-sm-2 control-label">User Name</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="text" class="form-control" id="name" required="required"
											ng-model="user.name" name="name" placeholder="Required" />
									</div>
								<div class="MarginTop_5">
									 <span class="alert alert-danger Padding_5" 
										ng-show="displayValidationError && newUserForm.name.$error.required">
											<spring:message code="required" />
									</span>
								</div>
							</div>
								
								<div class="form-group">
									<label for="email"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Email</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="text" class="form-control" id="email"
											ng-model="user.email" name="email" required="required" placeholder="Required" />
									</div>
									<div class="MarginTop_5">
										 <span class="alert alert-danger Padding_5" 
											ng-show="displayValidationError && newUserForm.email.$error.required">
												<spring:message code="required" />
										</span>
									</div>
								</div>
								
								<div class="form-group">
									<label for="enabled"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Enabled</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<select name="statusSelect" id="statusSelect"
											ng-init="selectedStatus = statusdata.availableStatus[0]"
											ng-options="status.name for status in statusdata.availableStatus"
											ng-model="selectedStatus"></select>
									</div>
									
								</div>
								
								<div class="form-group">
									<label for="password"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Password</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="password" class="form-control" id="password"
											ng-model="user.password" name="password" required="required" placeholder="Required" />
									</div>
									<div class="MarginTop_5">
										 <span class="alert alert-danger Padding_5" 
											ng-show="displayValidationError && newUserForm.password.$error.required">
												<spring:message code="required" />
										</span>
									</div>
								</div>
								
								<div class="form-group">
									<label for="repassword"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Re-Password</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="password" class="form-control" id="repassword"
											ng-model="user.repassword" name="repassword" required="required" placeholder="Required" />
									</div>
									<div class="MarginTop_5">
										 <span class="alert alert-danger Padding_5" 
											ng-show="displayValidationError && newUserForm.repassword.$error.required">
												<spring:message code="required" />
										</span>
									</div>
								</div>
								
								<div class="form-group">
									<label for="role"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Role</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<select name="roleSelect" id="roleSelect"
											ng-init="selectedRole = roledata.availableRoles[0]"
											ng-options="role.name for role in roledata.availableRoles"
											ng-model="selectedRole"></select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 col-md-3 col-sm-3 control-label"></label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="submit" ng-click="createUser(newUserForm)"
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
<script src="<c:url value="/resources/js/pages/users.js" />"></script>

