function articledetailController($scope, $http) {
	
	$scope.message = "controllerdan mesaj geldii";
	
    $scope.pageToGet = 0;

    $scope.state = 'busy';

    $scope.lastAction = '';

    $scope.url = "/gltknbtnBlog/articledetail/";

    $scope.comment = {}

    $scope.createComment = function (newCommentForm) {

        $scope.lastAction = 'create';

        var url = $scope.url;

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

}
