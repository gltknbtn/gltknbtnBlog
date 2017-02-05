
// create the module and name it
var gltknbtnBlogAdmin = angular.module('gltknbtnBlogAdmin', ['ngRoute']);

// create the controller and inject Angular's $scope
gltknbtnBlogAdmin.controller('usersController', function($scope, $location, $http, $window) {
	
    $scope.pageToGet = 0;

    $scope.state = 'busy';
    
    $scope.lastAction = '';

    $scope.url = "/gltknbtnBlog/protected/users/";

    $scope.errorOnSubmit = false;
    $scope.errorIllegalAccess = false;
    $scope.displayMessageToUser = false;
    $scope.displayValidationError = false;
    $scope.displaySearchMessage = false;
    $scope.displaySearchButton = false;
    $scope.displayCreateUserButton = false;
    
    $scope.dataActionMessageCreateUser ="";
    $scope.dataActionMessageUpdateUser ="";

    $scope.user = {}

    $scope.searchFor = ""
    
    $scope.getUserList = function () {
        var url = $scope.url;
        $scope.lastAction = 'list';
        
        var config = {params: {page: $scope.pageToGet}};
        $http.get(url, config)
            .success(function (data) {
            	
                $scope.finishAjaxCallOnSuccess(data, null, false);
            })
            .error(function () {
                $scope.state = 'error';
                alert("error");
                $scope.displayCreateUserButton = false;
            });
    }

    $scope.populateTable = function (data) {
        if (data.pagesCount > 0) {
            $scope.state = 'list';

            $scope.page = {source: data.users, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalUsers : data.totalUsers};

            if($scope.page.pagesCount <= $scope.page.currentPage){
                $scope.pageToGet = $scope.page.pagesCount - 1;
                $scope.page.currentPage = $scope.page.pagesCount - 1;
            }

            $scope.displayCreateUserButton = true;
            $scope.displaySearchButton = true;
        } else {
            $scope.state = 'noresult';
            $scope.displayCreateUserButton = true;

            if(!$scope.searchFor){
                $scope.displaySearchButton = false;
            }
        }

        if (data.actionMessage || data.searchMessage) {
            $scope.displayMessageToUser = $scope.lastAction != 'search';

            $scope.page.actionMessage = data.actionMessage;
            $scope.page.searchMessage = data.searchMessage;
        } else {
            $scope.displayMessageToUser = false;
        }
    }

    $scope.changePage = function (page) {
        $scope.pageToGet = page;

        if($scope.searchFor){
            $scope.searchUser($scope.searchFor, true);
        } else{
            $scope.getUserList();
        }
    };

    $scope.exit = function (modalId) {
        $(modalId).modal('hide');

        $scope.selectedUser = {};
        $scope.errorOnSubmit = false;
        $scope.errorIllegalAccess = false;
        $scope.displayValidationError = false;
    }

    $scope.finishAjaxCallOnSuccess = function (data, modalId, isPagination) {
    	
        $scope.populateTable(data);
        
        if(!isPagination){
            if(modalId){
                $scope.exit(modalId);
            }
        }

        $scope.lastAction = '';
    }


    $scope.handleErrorInDialogs = function (status) {
        $("#loadingModal").modal('hide');
        $scope.state = $scope.previousState;

        // illegal access
        if(status == 403){
            $scope.errorIllegalAccess = true;
            return;
        }

        $scope.errorOnSubmit = true;
        $scope.lastAction = '';
    }

    $scope.resetUser = function(){
        $scope.user = {};
    };

    $scope.createUser = function (newUserForm) {
    	
    	var password = $scope.user.password;
    	var repassword = $scope.user.repassword;
    	
    	 if (!newUserForm.$valid) {
             $scope.displayValidationError = true;
             return;
         }else if (password != repassword) {
        	 alert("Password and Repassword not matched");
        	 return;
		}
    	 
    	
    	$scope.user.enabled = $scope.selectedStatus.id;
    	 
    	$scope.user.role = $scope.selectedRole.id;
    	
        var url = $scope.url+"usercreate";

        var config = {headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}};

        $http.post(url, $.param($scope.user), config)
            .success(function (data) {
            	alert(data.actionMessage);
            	$window.location.href = '/gltknbtnBlog/protected/users/';
            })
            .error(function(data, status, headers, config) {
            	alert("error status: " + status);
            });
    };
    
    $scope.statusdata = {
    	    availableStatus: [
    	      {id: '1', name: 'True'},
    	      {id: '0', name: 'False'}
    	    ]
    	    };
    
    $scope.roledata = {
    	    availableRoles: [
    	      {id: 'ROLE_ADMIN', name: 'Admin'},
    	      {id: 'ROLE_USER', name: 'User'}
    	    ]
    	    };
    
    $scope.selectUser = function (selectedUserId) {
    	
        var urlGetUser = "/gltknbtnBlog/protected/users/findById/"+ selectedUserId;
        
        $http.get(urlGetUser)
            .success(function (data) {
            	
            	$scope.selectedUser = data;
            	
            	if ($scope.selectedUser.role == "ROLE_USER") {
            		$scope.editingUserRole= $scope.roledata.availableRoles[1];
				}else if($scope.selectedUser.role == "ROLE_ADMIN"){
					$scope.editingUserRole= $scope.roledata.availableRoles[0];
				}
            	
            	if ($scope.selectedUser.enabled == "1") {
            		$scope.editingUserStatus= $scope.statusdata.availableStatus[0];
				}else if($scope.selectedUser.enabled == "0"){
					$scope.editingUserStatus= $scope.statusdata.availableStatus[1];
				}
            	
            })
            .error(function () {
                alert("error");
            });
    }

    $scope.updateUser = function (updateUserForm) {
    	
    	
    	var password = $scope.selectedUser.password;
    	var repassword = $scope.repassword;
    	
    	 if (!updateUserForm.$valid) {
             $scope.displayValidationError = true;
             return;
         }else if (password != repassword) {
        	 alert("Password and Repassword not matched");
        	 return;
		}
    	 
    	$scope.selectedUser.enabled = $scope.editingUserStatus.id;
    	$scope.selectedUser.role = $scope.editingUserRole.id;

        var url = $scope.url +"useredit/"+ $scope.selectedUser.id;
        
        var config = {params: {repassword: $scope.repassword}};
        
        $http.put(url, $scope.selectedUser, config)
            .success(function (data) {
            	alert(data.actionMessage +" : " + $scope.selectedUser.name);
            	$window.location.href = '/gltknbtnBlog/protected/users/';
            })
            .error(function(data, status, headers, config) {
            	alert("error update user");
            });
    };
    
    $scope.resetMessage = function () {
    	
    	alert("resetMessage");
    	$scope.dataActionMessageUpdateUser = "";
    	
    };

    $scope.searchUser = function (searchUserForm, isPagination) {
        if (!($scope.searchFor) && (!searchUserForm.$valid)) {
            $scope.displayValidationError = true;
            return;
        }

        $scope.lastAction = 'search';

        var url = $scope.url +  $scope.searchFor;

        $scope.startDialogAjaxRequest();

        var config = {};

        $http.get(url, config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, "#searchUsersModal", isPagination);
                $scope.displaySearchMessage = true;
            })
            .error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.deleteUser = function () {
        $scope.lastAction = 'delete';

        var url = $scope.url + $scope.selectedUser.id;

        var params = {searchFor: $scope.searchFor, page: $scope.pageToGet};

        $http({
            method: 'DELETE',
            url: url,
            params: params
        }).success(function (data) {
                $scope.resetUser();
                $scope.finishAjaxCallOnSuccess(data, "#deleteUsersModal", false);
            }).error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.resetSearch = function(){
        $scope.searchFor = "";
        $scope.pageToGet = 0;
        $scope.getUserList();
        $scope.displaySearchMessage = false;
    }

    $scope.getUserList();
});



