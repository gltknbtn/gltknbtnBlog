
function adminhomeController($scope, $http, $location) {
	
	 $scope.pageToGet = 0;
	 $scope.state = 'busy';
	 $scope.lastAction = '';

    $scope.url = "/gltknbtnBlog/protected/comments/";

    
    $scope.getNewCommentList = function () {
        var url = $scope.url;
        $scope.lastAction = 'list';
        var config = {params: {page: $scope.pageToGet}};
        $http.get(url, config)
            .success(function (data) {
            	
            	$scope.page = {source: data.comments, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalComments : data.totalComments};
            	 $scope.newCommentCount = $scope.page.totalComments;
            	
            })
            .error(function (b) {
            	alert(b);
                $scope.state = 'error';
                alert("error");
                return 0;
            });
    }
    
    $scope.getNewCommentList();

}
