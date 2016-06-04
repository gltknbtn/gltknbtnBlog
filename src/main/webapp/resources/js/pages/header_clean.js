function LocationController($scope, $location) {
	
	var url = $location.$$absUrl;
	
	var lastIndexOfSlash = url.lastIndexOf('/');
	var lastWord = url.substr(lastIndexOfSlash+1);
	
	$scope.urlLastWord = lastWord;
	
	if (lastWord.indexOf("%")>0) {
		$scope.urlLastWord = lastWord.split("%20").join(" ");
	}
	
    if($location.$$absUrl.lastIndexOf('/aboutme') > 0){
        $scope.activeURL = 'aboutme';
    }else if($location.$$absUrl.lastIndexOf('/contactme') > 0){
    	$scope.activeURL = 'contactme';
    } 
	else if($location.$$absUrl.lastIndexOf('/home') > 0){
		$scope.activeURL = 'home';
	} 
	else if($location.$$absUrl.lastIndexOf('/AllCategory') > 0){
		$scope.activeURL = 'AllCategory';
	} 
    
    String.prototype.replaceAll = function(search, replacement) {
        var target = this;
        return target.split(search).join(replacement);
    };
}