//create the module and name it
var gltknbtnBlogClean = angular.module('gltknbtnBlogClean', [ 'ngRoute', 'ngSanitize']);

// configure our routes
gltknbtnBlogClean.config(function($routeProvider) {
	$routeProvider
	
	// route for the main page
	.when('/', {
		templateUrl : 'public/mainpage_clean.jsp',
		controller  : 'mainpageController'
	})

	// route for the about page
	.when('/about', {
		templateUrl : 'public/aboutme_clean.jsp',
		controller  : 'aboutmeController'
	})

	// route for the contact page
	.when('/contact', {
		templateUrl : 'public/contactme_clean.jsp',
		controller : 'contactFormController'
	})
	// route for the article detail page
	.when('/articledetail', {
		templateUrl : 'public/article-detail-clean.jsp',
		controller : 'mainpageController'
	});
});


//create the controller and inject Angular's $scope
gltknbtnBlogClean.controller('articledetailController', function($scope, $location, $http, $window, $rootScope) {
	
    $scope.fetchArticle = function (articleId) {
    	
    	var url = "/gltknbtnBlog/articledetail/"+$window.sessionStorage.selectedId;
    	
    	$http.get(url)
    	.success(function (data) {
    		$scope.fetchedArticle = data;
    		
    	})
    	.error(function (b) {
    		alert("error in fetchArticle : "+ b);
    	});
    };
    
    // to load page again after refresh
    if ($window.sessionStorage.selectedId > 0) {
    	$scope.fetchArticle($window.sessionStorage.selectedId);
    	$rootScope.activeURL = '';
	}
	
	
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
          alert("init error in init");
      });
	    
	  };
	  
	   if ($window.sessionStorage.selectedId > 0) {
	    	$scope.init($window.sessionStorage.selectedId);
		}
	  
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
  
	
});



//create the controller and inject Angular's $scope
gltknbtnBlogClean.controller('aboutmeController', function($scope, $location, $http, $rootScope) {
	
	$rootScope.activeURL = 'aboutme';
	
});

//create the controller and inject Angular's $scope
gltknbtnBlogClean.controller('contactFormController', function($scope, $location, $http, $rootScope) {
	
	$rootScope.activeURL = 'contactme';

    $scope.url = "/gltknbtnBlog/contactme/";

    $scope.contactForm = {}
    
    $scope.createContactForm = function (newContactForm) {

        var url = $scope.url;
        
        var config = {headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}};

        $http.post(url, $.param($scope.contactForm), config)
            .success(function (data) {
            	
            	alert(data);
            	
                $scope.resetContactFormInputs();
                
            })
            .error(function(data, status, headers, config) {
            	alert("Error");
            	$scope.responseMessage = "contactFormController form Başarısız!!!"
            });
    };
    
    $scope.resetContactFormInputs = function(){
    	$scope.contactForm.name = "";
    	$scope.contactForm.email = "";
    	$scope.contactForm.phone = "";
    	$scope.contactForm.title = "";
    	$scope.contactForm.message = "";
    }
    
    

});

//create the controller and inject Angular's $scope
gltknbtnBlogClean.controller('mainpageController', function($scope, $location, $http, $rootScope, $window) {
	
	$rootScope.activeURL = 'mainpage';

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
    
    
    $scope.fetchArticleId = function (articleId) {
    	
    	$window.sessionStorage.selectedId = articleId;
    	
    };
    
    
    $scope.getCategoryList();
    $scope.getArticleList("AllCategory");
    
    

});

// create the controller and inject Angular's $scope
gltknbtnBlogClean.controller('mastercleanController', function($scope,
		$location, $http, $rootScope) {
	
	if ($location.$$absUrl.lastIndexOf('/aboutme') > 0) {
		$rootScope.activeURL = 'aboutme';
	} else if ($location.$$absUrl.lastIndexOf('/contactme') > 0) {
		$rootScope.activeURL = 'contactme';
	} else if ($location.$$absUrl.lastIndexOf('/home') > 0) {
		$rootScope.activeURL = 'home';
	} else if ($location.$$absUrl.lastIndexOf('/mainpage') > 0) {
		$rootScope.activeURL = 'mainpage';
	}

});
