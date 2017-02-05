function LocationController($scope, $location) {
	
    if($location.$$absUrl.lastIndexOf('/aboutme') > 0){
        $scope.activeURL = 'aboutme';
    }else if($location.$$absUrl.lastIndexOf('/contactme') > 0){
    	$scope.activeURL = 'contactme';
    } 
	else if($location.$$absUrl.lastIndexOf('/home') > 0){
		$scope.activeURL = 'home';
	} 
	else if($location.$$absUrl.lastIndexOf('/mainpage') > 0){
		$scope.activeURL = 'mainpage';
	} 
    
}