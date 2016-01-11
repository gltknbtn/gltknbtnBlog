function LocationController($scope, $location) {
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
    else{
        $scope.activeURL = 'mainpage';
    }
}