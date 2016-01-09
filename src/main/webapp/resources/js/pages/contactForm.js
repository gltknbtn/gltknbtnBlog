
function contactFormController($scope, $http, $location) {

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
    
    

}