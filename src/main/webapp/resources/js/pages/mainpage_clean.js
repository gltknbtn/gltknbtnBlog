
//create the module and name it
var gltknbtnBlogClean = angular.module('gltknbtnBlogClean', ['ngRoute']);

//create the controller and inject Angular's $scope
gltknbtnBlogClean.controller('mainpageController', function($scope, $location, $http) {
	

    $scope.articlesurl = "/gltknbtnBlog/mainpage/";
    $scope.url = "/gltknbtnBlog/articledetail/";
    $scope.selectedCategoryName = "AllCategory";
    
    $scope.pageToGet = 0;

    $scope.getArticleList = function (categoryName) {
    	
    	$scope.selectedCategoryName = categoryName;
    	
        var url = $scope.articlesurl+categoryName;
        
        var config = {params: {page: $scope.pageToGet}};
        $http.get(url, config)
            .success(function (data) {
            	$scope.page = {source: data.articles, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalArticles : data.totalArticles};
            	if($scope.page.pagesCount <= $scope.page.currentPage){
                    $scope.pageToGet = $scope.page.pagesCount - 1;
                    $scope.page.currentPage = $scope.page.pagesCount - 1;
                }
            	
            	if (categoryName == "AllCategory") {
            		$scope.totalArticleSize =  data.totalArticles;
				}
            	
            })
            .error(function () {
                $scope.state = 'error';
                alert("getArticleList error in mainpage.js");
            });
    }
    
    $scope.getArticleListFirstPageByCategoryName = function (categoryName) {
    	
    	$scope.selectedCategoryName = categoryName;
    	$scope.pageToGet = 0;
    	
    	var url = $scope.articlesurl+categoryName;
    	
    	var config = {params: {page: $scope.pageToGet}};
    	$http.get(url, config)
    	.success(function (data) {
    		$scope.page = {source: data.articles, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalArticles : data.totalArticles};
    		
    		if (categoryName == "AllCategory") {
    			$scope.totalArticleSize =  data.totalArticles;
    		}
    		
    	})
    	.error(function () {
    		$scope.state = 'error';
    		alert("getArticleList error in mainpage.js");
    	});
    }
    
    
    $scope.getCategoryList = function () {
    	var url = "/gltknbtnBlog/mainpage/categories/";
    	
    	var config = {params: {page: $scope.pageToGet}};
    	$http.get(url, config)
    	.success(function (data) {
    		$scope.categories = data;
    		
    	})
    	.error(function (b) {
    		alert("error in getCategoryList : "+ b);
    	});
    }
    
    $scope.changePage = function (page, categoryName) {
    	$scope.pageToGet = page;
        $scope.getArticleList(categoryName);
        scroll(0,0);
    };
    
    
    $scope.getCategoryList();
    $scope.getArticleList("AllCategory");

});


	


