<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div>

	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="container row-fluid">
			<div class="col-lg-12 Margin_0 Padding_0">
				<h1 class="page-header">
					User Update 
				</h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> <a href="index.html">Dashboard</a>
					</li>
					<li class="active"><i class="fa fa-file"></i> User Update</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<div class="row-fluid">

				<div class="container" ng-controller="usersController">
					<div class="col-lg-12 BgWhiteGri Padding_10 MarginBottom_10">
						<div ng-init="selectUser('${selectedUserId}')">
							
								<form class="form-horizontal " role="form" name="updateUserForm"
								novalidate>
								
								<div class="form-group">
									<label for="name"
										class="col-lg-2 col-md-3 col-sm-3 control-label">User Name</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="text" class="form-control" id="name"
											ng-model="selectedUser.name" name="name" placeholder="Required" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="email"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Email</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="text" class="form-control" id="email"
											ng-model="selectedUser.email" name="email" placeholder="Required" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="enabled"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Enabled</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="text" class="form-control" id="enabled"
											ng-model="selectedUser.enabled" name="email" placeholder="Required" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="password"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Password</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="password" class="form-control" id="enabled"
											ng-model="selectedUser.password" name="password" placeholder="Required" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="repassword"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Re-Password</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="password" class="form-control" id="repassword"
											ng-model="repassword" name="repassword" placeholder="Required" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="role"
										class="col-lg-2 col-md-3 col-sm-3 control-label">Role</label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<select name="roleSelect" id="roleSelect"
											ng-options="role.name for role in roledata.availableRoles"
											ng-model="editingUserRole"></select>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 col-md-3 col-sm-3 control-label"></label>
									<div class="col-lg-9 col-md-9 col-sm-9 PaddingRight_0">
										<input type="submit" ng-click="updateUser(updateUserForm)"
											class="btn btn-default pull-right" value="Update" />
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
<script src="<c:url value="/resources/js/pages/users.js" />"></script>

