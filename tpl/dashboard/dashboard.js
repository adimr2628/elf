angular.module('app').controller('dashboardCtrl', function($scope, Data, $state, UserService, $location) {

    /**
     * Inialisasi
     */
    var user = UserService.getUser();
    if (user === null) {
        $location.path('/login');
    }
	// initialization
    $scope.jumlahsekolah;
    $scope.jumlahptk;
    $scope.jumlahruang;
	$scope.jumlahkelas;

    Data.get('appakses/dashboard').then(function (response) {
    	if (response.status_code == 200) {
    		$scope.jumlahsekolah = response.data.jumlahsekolah;
    		$scope.jumlahptk = response.data.jumlahptk;
    		$scope.jumlahruang = response.data.jumlahruang;
            $scope.jumlahkelas = response.data.jumlahkelas;
    	}
    });
    
});