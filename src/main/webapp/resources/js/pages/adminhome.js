
function adminhomeController($scope, $http, $location) {
	
	 $scope.pageToGet = 0;
	 $scope.state = 'busy';
	 $scope.lastAction = '';

    
    
    $scope.getUserList = function () {
    	$scope.url = "/fadlarec/protected/users/";
    	
        var url = $scope.url;
        $scope.lastAction = 'list';
        
        var params = {page: $scope.pageToGet};
        $http({
            method: 'GET',
            url: url,
            params: params
        }).success(function (data) {
            	
            	$scope.page = {source: data.users, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalUsers : data.totalUsers};
            	$scope.usersCount = $scope.page.totalUsers;
            })
            .error(function () {
                $scope.state = 'error';
                alert("error");
            });
    }
    
    $scope.getCategoryList = function () {
    	$scope.url = "/fadlarec/protected/categories/";
        var url = $scope.url;
        
        var params = {page: $scope.pageToGet};
        $http({
            method: 'GET',
            url: url,
            params: params
        }).success(function (data) {
        	 $scope.page = {source: data.categories, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalCategories : data.totalCategories};
        	 $scope.categoriesCount = $scope.page.totalCategories;
            })
            .error(function () {
                $scope.state = 'error';
                alert("error in getCategoryList");
            });
    }
    
    $scope.getUserList();
    $scope.getCategoryList();

}
