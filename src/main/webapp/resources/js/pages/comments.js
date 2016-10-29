
// create the module and name it
var gltknbtnBlogAdmin = angular.module('gltknbtnBlogAdmin', ['ngRoute']);

// create the controller and inject Angular's $scope
gltknbtnBlogAdmin.controller('commentsController', function($scope, $location, $http) {
	
	 $scope.pageToGet = 0;
	 $scope.state = 'busy';
	 $scope.lastAction = '';

   $scope.url = "/gltknbtnBlog/protected/comments/";

   $scope.selectComment = function (selectedCommentId) {
   	
       var urlGetCommentById = "/gltknbtnBlog/protected/comments/findById/"+ selectedCommentId;
       
       $http.get(urlGetCommentById)
           .success(function (data) {
           	$scope.selectedComment = data;
           	
           })
           .error(function () {
               alert("error while getting selected comment");
           });
   }
   
   $scope.rejectComment = function () {
   	var urlRejectCommentById = "/gltknbtnBlog/protected/comments/editstatus/"+ $scope.selectedComment.id;
   	$scope.status = "2";
   	
   	var params = {status: $scope.status};
   	
   	$http({
           method: 'PUT',
           url: urlRejectCommentById,
           params: params
       })
   	.success(function (data) {
   		$scope.selectedComment = data;
   		$scope.getNewCommentList();
   		$("#rejectCommentModal").modal('hide');
   		
   	})
   	.error(function () {
   		alert("error while getting selected comment");
   	});
   }
   
   $scope.acceptComment = function () {
   	var urlRejectCommentById = "/gltknbtnBlog/protected/comments/editstatus/"+ $scope.selectedComment.id;
   	$scope.status = "1";
   	
   	var params = {status: $scope.status};
   	
   	$http({
   		method: 'PUT',
   		url: urlRejectCommentById,
   		params: params
   	})
   	.success(function (data) {
   		$scope.selectedComment = data;
   		$scope.getNewCommentList();
   		$("#acceptCommentModal").modal('hide');
   		
   	})
   	.error(function () {
   		alert("error while getting selected comment");
   	});
   }
   
   
   
   $scope.getNewCommentList = function () {
       var url = $scope.url;
       $scope.lastAction = 'list';
       var config = {params: {page: $scope.pageToGet}};
       $http.get(url, config)
           .success(function (data) {
           	
               $scope.finishAjaxCallOnSuccess(data, null, false);
           })
           .error(function (b) {
           	alert(b);
               $scope.state = 'error';
               alert("error");
           });
   }
   
  $scope.finishAjaxCallOnSuccess = function (data, modalId, isPagination) {
       $scope.populateTable(data);
   }
  

  $scope.populateTable = function (data) {
      if (data.pagesCount > 0) {
          $scope.state = 'list';
          $scope.page = {source: data.comments, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalComments : data.totalComments};
          if($scope.page.pagesCount <= $scope.page.currentPage){
              $scope.pageToGet = $scope.page.pagesCount - 1;
              $scope.page.currentPage = $scope.page.pagesCount - 1;
          }

      } else {
          $scope.state = 'noresult';
          $scope.page = {source: data.comments, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalComments : data.totalComments};
      }
  }
  

  $scope.changePage = function (page) {
      $scope.pageToGet = page;

      if($scope.searchFor){
          $scope.searchArticle($scope.searchFor, true);
      } else{
          $scope.getNewCommentList();
      }
  };
   
   $scope.getNewCommentList();

});




