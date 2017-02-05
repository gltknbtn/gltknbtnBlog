
function adminhomeController($scope, $http, $location) {
	
	 $scope.pageToGet = 0;
	 $scope.state = 'busy';
	 $scope.lastAction = '';

    $scope.getNewCommentList = function () {
    	$scope.url = "/gltknbtnBlog/protected/comments/";
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
    
    $scope.getArticleList = function () {
    	$scope.url = "/gltknbtnBlog/protected/articles/";
        var url = $scope.url;

        var config = {params: {page: $scope.pageToGet}};
        $http.get(url, config)
            .success(function (data) {
            	
            	$scope.page = {source: data.articles, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalArticles : data.totalArticles};
            	$scope.articleCount = $scope.page.totalArticles;
                
            })
            .error(function (b) {
                $scope.state = 'error';
                alert("error in getArticleList");
            });
    }
    
    $scope.getUserList = function () {
    	$scope.url = "/gltknbtnBlog/protected/users/";
    	
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
    	$scope.url = "/gltknbtnBlog/protected/categories/";
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
    
    $scope.getNewCommentList();
    $scope.getArticleList();
    $scope.getUserList();
    $scope.getCategoryList();

}
