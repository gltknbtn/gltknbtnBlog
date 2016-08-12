
function categoriesController($scope, $http) {
	
    $scope.pageToGet = 0;

    $scope.state = 'busy';
    
    $scope.lastAction = '';

    $scope.url = "/fadlarec/protected/categories/";

    $scope.errorOnSubmit = false;
    $scope.errorIllegalAccess = false;
    $scope.displayMessageToUser = false;
    $scope.displayValidationError = false;
    $scope.displaySearchMessage = false;
    $scope.displaySearchButton = false;
    $scope.displayCreateCategoryButton = false;
    
    $scope.dataActionMessageCreateCategory ="";
    $scope.dataActionMessageUpdateCategory ="";

    $scope.category = {}

    $scope.searchFor = ""
    
    $scope.getCategoryList = function () {
        var url = $scope.url;
        $scope.lastAction = 'list';
        
        var config = {params: {page: $scope.pageToGet}};
        $http.get(url, config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, null, false);
            })
            .error(function () {
                $scope.state = 'error';
                alert("error");
                $scope.displayCreateCategoryButton = false;
            });
    }

    $scope.populateTable = function (data) {
        if (data.pagesCount > 0) {
            $scope.state = 'list';

            $scope.page = {source: data.categories, currentPage: $scope.pageToGet, pagesCount: data.pagesCount, totalCategories : data.totalCategories};

            if($scope.page.pagesCount <= $scope.page.currentPage){
                $scope.pageToGet = $scope.page.pagesCount - 1;
                $scope.page.currentPage = $scope.page.pagesCount - 1;
            }

            $scope.displayCreateCategoryButton = true;
            $scope.displaySearchButton = true;
        } else {
            $scope.state = 'noresult';
            $scope.displayCreateCategoryButton = true;

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
            $scope.searchCategory($scope.searchFor, true);
        } else{
            $scope.getCategoryList();
        }
    };

    $scope.exit = function (modalId) {
        $(modalId).modal('hide');

        $scope.selectedCategory = {};
        $scope.errorOnSubmit = false;
        $scope.errorIllegalAccess = false;
        $scope.displayValidationError = false;
    }

    $scope.finishAjaxCallOnSuccess = function (data, modalId, isPagination) {
    	
        $scope.populateTable(data);
        
        if(!isPagination){
            if(modalId){
                $scope.exit(modalId);
            }
        }

        $scope.lastAction = '';
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

    $scope.resetCategory = function(){
        $scope.category = {};
    };

    $scope.createCategory = function (newCategoryForm) {
    	
    	 if (!newCategoryForm.$valid) {
             $scope.displayValidationError = true;
             return;
         }
    	
        var url = $scope.url+"categorycreate";

        var config = {headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}};

        $http.post(url, $.param($scope.category), config)
            .success(function (data) {
            	alert(data.actionMessage);
            })
            .error(function(data, status, headers, config) {
            	alert("error status: " + status);
            });
    };
    
    
    
    $scope.selectCategory = function (selectedCategoryId) {
    	
        var urlGetCategory = "/fadlarec/protected/categories/findCategoryById/"+ selectedCategoryId;
        
        $http.get(urlGetCategory)
            .success(function (data) {
            	
            	$scope.selectedCategory = data;
            	
            })
            .error(function () {
                alert("error");
            });
    }

    $scope.updateCategory = function (updateCategorForm) {
    	 if (!$scope.updateCategoryForm.$valid) {
             $scope.displayValidationError = true;
             return;
         }

        var url = $scope.url +"categoryedit/"+ $scope.selectedCategory.id;
        
        $http.put(url, $scope.selectedCategory)
            .success(function (data) {
            	alert(data.actionMessage +" : " + $scope.selectedCategory.categoryName);
            })
            .error(function(data, status, headers) {
            	alert("error update category");
            });
    };
    
    $scope.resetMessage = function () {
    	
    	alert("resetMessage");
    	$scope.dataActionMessageUpdateCategory = "";
    	
    };

    $scope.searchCategory = function (searchCategoryForm, isPagination) {
        if (!($scope.searchFor) && (!searchCategoryForm.$valid)) {
            $scope.displayValidationError = true;
            return;
        }

        $scope.lastAction = 'search';

        var url = $scope.url +  $scope.searchFor;

        var config = {};

        $http.get(url, config)
            .success(function (data) {
                $scope.finishAjaxCallOnSuccess(data, "#searchCategoriesModal", isPagination);
                $scope.displaySearchMessage = true;
            })
            .error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.deleteCategory = function () {
        $scope.lastAction = 'delete';

        var url = $scope.url + $scope.selectedCategory.id;

        var params = {searchFor: $scope.searchFor, page: $scope.pageToGet};

        $http({
            method: 'DELETE',
            url: url,
            params: params
        }).success(function (data) {
                $scope.resetCategory();
                $scope.finishAjaxCallOnSuccess(data, "#deleteCategoriesModal", false);
            }).error(function(data, status, headers, config) {
                $scope.handleErrorInDialogs(status);
            });
    };

    $scope.resetSearch = function(){
        $scope.searchFor = "";
        $scope.pageToGet = 0;
        $scope.getCategoryList();
        $scope.displaySearchMessage = false;
    }

    $scope.getCategoryList();
}
