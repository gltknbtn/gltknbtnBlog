
function articledetailController($scope, $http, $location) {
	
	$scope.message = "article controllerdan mesaj geldii";
	
    $scope.pageToGet = 0;

    $scope.state = 'busy';

    $scope.lastAction = '';

    $scope.url = "/gltknbtnBlog/articledetail/";

    $scope.comment = {}
    
    $scope.createComment = function (newCommentForm, articleId) {
    	
    	alert("article Id: " + articleId);

        $scope.lastAction = 'create';

        var url = $scope.url + articleId;

        var config = {headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}};

        $http.post(url, $.param($scope.comment), config)
            .success(function (data) {
            	
                $scope.responseMessage = "Comment successfully created !!";
                
                alert("name: " + data.name + "\n" +
                		"mail: " + data.mail +"\n"+
                		"desc: " + data.desc);
            })
            .error(function(data, status, headers, config) {
            	alert("Error");
            	$scope.responseMessage = "Yorum Başarısız!!!"
            });
    };
    
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
