app.controller("LSekolahCtrl", function ($scope, Data, $rootScope) {
    /**
     * Inialisasi
     */
    var tableStateRef;
    $scope.formtittle = "";
    $scope.displayed = [];
    $scope.form = {};
    $scope.is_edit = false;
    $scope.is_view = false;
    $scope.is_create = false;
    $scope.loading = false;

    $scope.pivot = function (form) {
        // moment(form.tanggal).format('YYYY-MM-DD');
        $scope.is_laporan = true;

        Data.get("laporansekolah/laporan", form).then(function (response) {
          $scope.data           = response.data;
          $scope.is_Excel       = true;
        });
    };

    $scope.clear = function () {
        $scope.form.tanggal = '';
    };

    $scope.dataExcel = function dataExcel() {
        $scope.is_Excel = false;
    };
    $scope.printDiv = function (divName) {
        var printContents = document.getElementById(divName).innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }

    $scope.export = function (jenisReport) {
        console.log(jenisReport);

        var blob = new Blob([document.getElementById('print-area' + jenisReport).innerHTML], {
            type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8"
        });
        saveAs(blob, "Laporan-Personal-Commission.xls");
    }


});
