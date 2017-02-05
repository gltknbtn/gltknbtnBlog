

// create the module and name it
var gltknbtnBlogAdmin = angular.module('gltknbtnBlogAdmin');

// create the controller and inject Angular's $scope
gltknbtnBlogAdmin.controller('LocationController', function($scope, $location, $http) {
    if($location.$$absUrl.lastIndexOf('/aboutme') > 0){
        $scope.activeURL = 'aboutme';
    }else if($location.$$absUrl.lastIndexOf('/articles') > 0){
    	$scope.activeURL = 'articles';
    } 
	else if($location.$$absUrl.lastIndexOf('/home') > 0){
		$scope.activeURL = 'home';
	} 
	else if($location.$$absUrl.lastIndexOf('/articlecreate') > 0){
		$scope.activeURL = 'articlecreate';
	} 
	else if($location.$$absUrl.lastIndexOf('/users') > 0){
		$scope.activeURL = 'users';
	} 
	else if($location.$$absUrl.lastIndexOf('/categories') > 0){
		$scope.activeURL = 'categories';
	} 
    else{
        $scope.activeURL = 'mainpage';
    }
});




