function LocationController($scope, $location) {
    if($location.$$absUrl.lastIndexOf('/contacts') > 0){
        $scope.activeURL = 'contacts';
    }else if($location.$$absUrl.lastIndexOf('/articles') > 0){
    	$scope.activeURL = 'articles';
    } 
    else{
        $scope.activeURL = 'home';
    }
}