
function articledetailController($scope, $http, $location) {
	
	$scope.pageToGet = 0;
	
	  $scope.init = function(selectedArticleId)
	  {
		  $scope.selectedArtclId = selectedArticleId;
	   var urlComments = "/gltknbtnBlog/articledetail/comments/" + selectedArticleId ;
	   
	   var config = {params: {page: $scope.pageToGet}};
	    $http.get(urlComments, config)
        .success(function (data) {
        	$scope.commentList = data;
        	$scope.page = {source: data.comments, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalArticleComments : data.totalComments};
        	
        	if($scope.page.pagesCount <= $scope.page.currentPage){
                $scope.pageToGet = $scope.page.pagesCount - 1;
                $scope.page.currentPage = $scope.page.pagesCount - 1;
            }
        })
        .error(function () {
            $scope.state = 'error';
            alert("init error in articledetail.js");
        });
	    
	  };
	  
	    $scope.changePage = function (page) {
	        $scope.pageToGet = page;
	        $scope.init($scope.selectedArtclId);
	    };
	  
	
    $scope.pageToGet = 0;

    $scope.state = 'busy';
    
    $scope.lastAction = '';

    $scope.url = "/gltknbtnBlog/articledetail/";

    $scope.comment = {}
    
    $scope.createComment = function (newCommentForm, articleId) {
    	

        $scope.lastAction = 'create';

        var url = $scope.url + articleId;

        var config = {headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}};

        $http.post(url, $.param($scope.comment), config)
            .success(function (data) {
            	
            	
                $scope.responseMessage = "Comment successfully created !!";
                $scope.pageToGet = 0;
                $scope.init(articleId);
                
                $scope.resetCommentInputs();
                alert("Your comment sent successfully will be showed after check");
                
            })
            .error(function(data, status, headers, config) {
            	alert("Error");
            	$scope.responseMessage = "Yorum Başarısız!!!"
            });
    };
    
    $scope.resetCommentInputs = function(){
    	$scope.comment.name = "";
    	$scope.comment.mail = "";
    	$scope.comment.commentDesc = "";
    }
    
    
//    $scope.changeLocation = function(url, forceReload) {
//    	  $scope = $scope || angular.element(document).scope();
//    	  if(forceReload || $scope.$$phase) {
//    	    window.location = url;
//    	  }
//    	  else {
//    	    //only use this if you want to replace the history stack
//    	    //$location.path(url).replace();
//
//    	    //this this if you want to change the URL and add it to the history stack
//    	    $location.path(url);
//    	    $scope.$apply();
//    	  }
//    	};
//    
//    $scope.getSelectedArticle = function (selectedArticleId) {
//        var url = $scope.url+selectedArticleId;
//
//        $http.get(url)
//            .success(function (data) {
//            	//$scope.changeLocation('/gltknbtnBlog/articledetail/');
//            	
//            	$scope.selectedArticle = data;
//            	alert($scope.selectedArticle.title);
//            	
//            	
//            })
//            .error(function () {
//              alert("Error occured while fetching selected article: " + selectedArticleId);
//            });
//    }
//    
//    
//    $scope.getArticleDetail = function(id){
//    	alert("id: " + id);
//    	$scope.getSelectedArticle(id);
//    }

}
