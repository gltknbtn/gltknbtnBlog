
// create the module and name it
var gltknbtnBlogAdmin = angular.module('gltknbtnBlogAdmin', ['ngRoute']);

// create the controller and inject Angular's $scope
gltknbtnBlogAdmin.controller('loginController', function($scope, $location, $http) {
	// create a message to display in our view
	$scope.message = 'Everyone come and see how good I look!';
	

    var url = "" + $location.$$absUrl;
    $scope.displayLoginError = (url.indexOf("error") >= 0);

});






