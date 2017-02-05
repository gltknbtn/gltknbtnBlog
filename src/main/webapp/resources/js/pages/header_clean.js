
//create the module and name it
var gltknbtnBlogClean = angular.module('gltknbtnBlogClean');

// create the controller and inject Angular's $scope
gltknbtnBlogClean.controller('LocationController', function($scope, $location,
		$http) {

	if ($location.$$absUrl.lastIndexOf('/aboutme') > 0) {
		$scope.activeURL = 'aboutme';
	} else if ($location.$$absUrl.lastIndexOf('/contactme') > 0) {
		$scope.activeURL = 'contactme';
	} else if ($location.$$absUrl.lastIndexOf('/home') > 0) {
		$scope.activeURL = 'home';
	} else if ($location.$$absUrl.lastIndexOf('/mainpage') > 0) {
		$scope.activeURL = 'mainpage';
	}

});
