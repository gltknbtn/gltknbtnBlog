	

function mainpageController($scope, $http) {
		

	    $scope.articlesurl = "/gltknbtnBlog/mainpage/";
	    $scope.url = "/gltknbtnBlog/articledetail/";
	    
	    $scope.pageToGet = 0;

	    $scope.getArticleList = function () {
	        var url = $scope.articlesurl;
	        
	        var config = {params: {page: $scope.pageToGet}};
	        $http.get(url, config)
	            .success(function (data) {
	            	$scope.page = {source: data.articles, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalArticles : data.totalArticles};
	            	if($scope.page.pagesCount <= $scope.page.currentPage){
	                    $scope.pageToGet = $scope.page.pagesCount - 1;
	                    $scope.page.currentPage = $scope.page.pagesCount - 1;
	                }
	            })
	            .error(function () {
	                $scope.state = 'error';
	                alert("getArticleList error in mainpage.js");
	            });
	    }
	    
	    
	    $scope.changePage = function (page) {
	        $scope.pageToGet = page;
	        $scope.getArticleList();
	        scroll(0,0);
	    };
	    
	    $scope.getCategoryList = function () {
	    	var url = "/gltknbtnBlog/mainpage/categories/";
	    	
	    	var config = {params: {page: $scope.pageToGet}};
	    	$http.post(url, config)
	    	.success(function (data) {
	    		$scope.categories = data;
	    		
	    	})
	    	.error(function (b) {
	    		alert("error in getCategoryList : "+ b);
	    	});
	    }
	    
	    $scope.getArticleList();
	    $scope.getCategoryList();
  

	}
	


