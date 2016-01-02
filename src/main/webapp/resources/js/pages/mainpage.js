	
	function mainpageController($scope, $http) {
		
		$scope.message = "mainpage controllerdan mesaj geldi";

	    $scope.articlesurl = "/gltknbtnBlog/mainpage/";
	    
	    $scope.pageToGet = 0;

	    $scope.getArticleList = function () {
	        var url = $scope.articlesurl;
	        
	        var config = {params: {page: $scope.pageToGet}};
	        $http.get(url, config)
	            .success(function (data) {
	            	$scope.articles = data.articles;
	            })
	            .error(function () {
	                $scope.state = 'error';
	                alert("getArticleList error in mainpage.js");
	            });
	    }
	    
	    $scope.getArticleList();

	}
	


