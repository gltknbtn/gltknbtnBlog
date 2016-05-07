
function articlesController($scope, $http) {
	
    $scope.pageToGet = 0;

    $scope.state = 'busy';

    $scope.lastAction = '';

    $scope.url = "/gltknbtnBlog/protected/articles/";

    $scope.errorOnSubmit = false;
    $scope.errorIllegalAccess = false;
    $scope.displayMessageToUser = false;
    $scope.displayValidationError = false;
    $scope.displaySearchMessage = false;
    $scope.displaySearchButton = false;
    $scope.displayCreateArticleButton = false;
    
    $scope.dataActionMessageCreateArticle ="";
    $scope.dataActionMessageUpdateArticle ="";

    $scope.article = {}

    $scope.searchFor = ""

    $scope.getArticleList = function () {
        var url = $scope.url;
        $scope.lastAction = 'list';
        $scope.startDialogAjaxRequest();

        var config = {params: {page: $scope.pageToGet}};
        $http.get(url, config)
            .success(function (data) {
            	
                $scope.finishAjaxCallOnSuccess(data, null, false);
            })
            .error(function (b) {
            	alert(b);
                $scope.state = 'error';
                alert("error");
                $scope.displayCreateArticleButton = false;
            });
    }

    $scope.populateTable = function (data) {
        if (data.pagesCount > 0) {
            $scope.state = 'list';
            $scope.page = {source: data.articles, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalArticles : data.totalArticles};
            
            if($scope.page.pagesCount <= $scope.page.currentPage){
                $scope.pageToGet = $scope.page.pagesCount - 1;
                $scope.page.currentPage = $scope.page.pagesCount - 1;
            }

            $scope.displayCreateArticleButton = true;
            $scope.displaySearchButton = true;
        } else {
            $scope.state = 'noresult';
            $scope.displayCreateArticleButton = true;

            if(!$scope.searchFor){
                $scope.displaySearchButton = false;
            }
        }

        if (data.actionMessage || data.searchMessage) {
            $scope.displayMessageToUser = $scope.lastAction != 'search';

            $scope.page.actionMessage = data.actionMessage;
            $scope.page.searchMessage = data.searchMessage;
        } else {
            $scope.displayMessageToUser = false;
        }
    }

    $scope.changePage = function (page) {
        $scope.pageToGet = page;

        if($scope.searchFor){
            $scope.searchArticle($scope.searchFor, true);
        } else{
            $scope.getArticleList();
        }
    };

    $scope.exit = function (modalId) {
        $(modalId).modal('hide');

        $scope.selectedArticle = {};
        $scope.errorOnSubmit = false;
        $scope.errorIllegalAccess = false;
        $scope.displayValidationError = false;
    }

    $scope.finishAjaxCallOnSuccess = function (data, modalId, isPagination) {
    	
        $scope.populateTable(data);
        $("#loadingModal").modal('hide');

        if(!isPagination){
            if(modalId){
                $scope.exit(modalId);
            }
        }

        $scope.lastAction = '';
    }

    $scope.startDialogAjaxRequest = function () {
        $scope.displayValidationError = false;
        $("#loadingModal").modal('show');
        $scope.previousState = $scope.state;
        $scope.state = 'busy';
    }

    $scope.handleErrorInDialogs = function (status) {
        $("#loadingModal").modal('hide');
        $scope.state = $scope.previousState;

        // illegal access
        if(status == 403){
            $scope.errorIllegalAccess = true;
            return;
        }

        $scope.errorOnSubmit = true;
        $scope.lastAction = '';
    }

    $scope.addSearchParametersIfNeeded = function(config, isPagination) {
        if(!config.params){
            config.params = {};
        }

        config.params.page = $scope.pageToGet;

        if($scope.searchFor){
            config.params.searchFor = $scope.searchFor;
        }
    }

    $scope.resetArticle = function(){
        $scope.article = {};
    };

    $scope.createArticle = function (newArticleForm) {
    	
    	$scope.article.description = $("#txtEditor").Editor("getText");
    	$scope.article.owner = $("#owner").val();
    	
        if (!newArticleForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }

        $scope.lastAction = 'create';

        var url = $scope.url;

        var config = {headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}};

        $scope.addSearchParametersIfNeeded(config, false);

        $http.post(url, $.param($scope.article), config)
            .success(function (data) {
            	$scope.dataActionMessageCreateArticle = data.actionMessage +" : " + $scope.article.title;
            	alert(data.actionMessage +" : " + $scope.article.title);
            })
            .error(function(data, status, headers, config) {
            	alert("error status: " + status);
            });
    };

    $scope.selectArticle = function (selectedArticleId) {
    	
        var urlGetArticle = "/gltknbtnBlog/protected/articles/findById/"+ selectedArticleId;
        
        $http.get(urlGetArticle)
            .success(function (data) {
            	
            	$scope.selectedArticle = data;
            	$("#txtEditor").Editor("setText", $scope.selectedArticle.description);
            	
            })
            .error(function () {
                alert("error");
            });
    }

    $scope.updateArticle = function (updateArticleForm) {

        var url = $scope.url +"articleedit/"+ $scope.selectedArticle.id;
        
        $scope.selectedArticle.description = $("#txtEditor").Editor("getText");

        var config = {}

        $http.put(url, $scope.selectedArticle, config)
            .success(function (data) {
            	$scope.dataActionMessageUpdateArticle = data.actionMessage +" : " + $scope.selectedArticle.title;
            	alert($scope.dataActionMessageUpdateArticle);
            })
            .error(function(data, status, headers, config) {
            	alert("error update article");
            });
    };
    
    $scope.resetMessage = function () {
    	
    	alert("resetMessage");
    	$scope.dataActionMessageUpdateArticle = "";
    	
    };

    $scope.searchArticle = function (searchArticleForm, isPagination) {
        if (!($scope.searchFor) && (!searchArticleForm.$valid)) {
            $scope.displayValidationError = true;
            return;
        }

        $scope.lastAction = 'search';

        var url = $scope.url +  $scope.searchFor;

        $scope.startDialogAjaxRequest();

        var config = {};

        if($scope.searchFor){
            $scope.addSearchParametersIfNeeded(config, isPagination);
        }

        $http.get(url, config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, "#searchArticlesModal", isPagination);
                $scope.displaySearchMessage = true;
            })
            .error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.deleteArticle = function () {
        $scope.lastAction = 'delete';

        var url = $scope.url + $scope.selectedArticle.id;

        var params = {searchFor: $scope.searchFor, page: $scope.pageToGet};

        $http({
            method: 'DELETE',
            url: url,
            params: params
        }).success(function (data) {
                $scope.resetArticle();
                $scope.finishAjaxCallOnSuccess(data, "#deleteArticlesModal", false);
            }).error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.resetSearch = function(){
        $scope.searchFor = "";
        $scope.pageToGet = 0;
        $scope.getArticleList();
        $scope.displaySearchMessage = false;
    }

    $scope.getArticleList();
}
