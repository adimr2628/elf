app.controller('peserta_didikCtrl', function ($scope,  Data, $rootScope) {
    //init data
    var tableStateRef;
var Control_link = "m_peserta_didik";
    $scope.displayed = [];
    $scope.is_edit = false;
    $scope.is_view = false;
    $scope.is_create = false;
    $scope.detJawab = [];
   $scope.callServer = function callServer(tableState) {
        tableStateRef = tableState;
        $scope.isLoading = true;
        var offset = tableState.pagination.start || 0;
        var limit = tableState.pagination.number || 10;
        var param = {offset: offset, limit: limit};

        if (tableState.sort.predicate) {
            param['sort'] = tableState.sort.predicate;
            param['order'] = tableState.sort.reverse;
        }
        if (tableState.search.predicateObject) {
            param['filter'] = tableState.search.predicateObject;
        }

        Data.get(Control_link + '/index', param).then(function (data) {
            $scope.displayed = data.data.data;
            tableState.pagination.numberOfPages = Math.ceil(data.data.totalItems / limit);
        });

        $scope.isLoading = false;
    };

    $scope.addDetail = function () {
        var newDet = {
            kelas: '',
            perempuan: '',
            laki: '',
            total: ''
        }
        $scope.detJawab.push(newDet);
    };

    $scope.removeRow = function (paramindex, id) {
        var comArr = eval($scope.detJawab);
        if (comArr.length > 1) {
            $scope.detJawab.splice(paramindex, 1);;
        } else {
            alert("Something gone wrong");
        }
    };

    Data.get("appptk/sekolah").then(function(data) {
        $scope.listSekolah = data.data;
    });
    
    $scope.create = function (form) {
        $scope.is_create = true;
        $scope.is_edit = true;
        $scope.is_view = false;
        $scope.formtitle = "Form Tambah Data";
        $scope.form = {};
        $scope.form.type_jawaban = 'pilihan';
        $scope.detJawab = [{
            kelas: '',
            perempuan: '',
            laki: '',
            total: ''
        }];
    };
    
    $scope.hitungTotal = function(){
        $scope.form.total = 0;
        angular.forEach($scope.detJawab, function(value, key){
            value.total = value.perempuan+value.laki;
            $scope.form.total += value.total;
        });
    };
    $scope.update = function (form) {
        $scope.is_create = false;
        $scope.is_edit = true;
        $scope.is_view = false;
        $scope.formtitle = "Edit Data : " + form.nama_sekolah;
        $scope.form = form;
        $scope.detJawab = [{
            kelas: '',
            perempuan: '',
            laki: '',
            total: ''
        }];
       Data.get('m_peserta_didik/listdetail/' + form.id).then(function (data) {
                $scope.detJawab = data.data;
                // console.log(data);
            });
    };
    $scope.view = function (form) {
        $scope.is_create = true;
        $scope.is_edit = true;
        $scope.is_view = true;
        $scope.formtitle = "Lihat Data : "+ form.nama_sekolah;
        $scope.form = form;
        Data.get('m_peserta_didik/listdetail/' + form.id).then(function (data) {
                $scope.detJawab = data.data;
            });
    };

    $scope.save = function (form,detail) {
        var url = (form.id > 0) ? Control_link +'/update' : Control_link +'/create';
        var data = {
            form: form,
            detail: detail
        };
        Data.post(url, data).then(function (result) {
            if (result.status_code == 200) {
                $scope.is_edit = false;
                $scope.is_view = false;
                $scope.callServer(tableStateRef); //reload grid ulang
                $rootScope.alert("Berhasil", "Data berhasil tersimpan",'success');
            } else if(result.status_code === 422 ) {
                $rootScope.alert("Terjadi Kesalahan", result.errors, 'error');             
            } else {
                $rootScope.alert("Terjadi Kesalahan", result.errors, 'error');
            }
        });
    };
    $scope.getKode = function (data) {
        console.log(data.alamat);
        $scope.form.alamat = data.alamat;
    }
    
    $scope.cancel = function () {
        $scope.is_edit = false;
        $scope.is_view = false;
    };

    $scope.trash = function (row) {
        Swal.fire({
            title: "Peringatan ! ",
            text: "Apakah Anda Yakin Ingin Menghapus Data Ini",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Iya, di Hapus",
            cancelButtonText: "Tidak",
        }).then((result) => {
            if (result.value) {
                row.is_deleted = 1;
                Data.post('pengguna/update/' + row.id, row).then(function (result) {
                    $scope.displayed.splice($scope.displayed.indexOf(row), 1);
                    $rootScope.alert("Berhasil", "Data berhasil dihapus",'success');
                    $scope.cancel();
                });
            }
        });
    };
    $scope.restore = function (row) {
        Swal.fire({
            title: "Peringatan ! ",
            text: "Apakah Anda Yakin Ingin Menghapus Data Ini",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Iya, di Hapus",
            cancelButtonText: "Tidak",
        }).then((result) => {
            if (result.value) { 
                row.is_deleted = 0;
                Data.post('pengguna/update/' + row.id, row).then(function (result) {
                    $scope.displayed.splice($scope.displayed.indexOf(row), 1);
                    $rootScope.alert("Berhasil", "Data berhasil direstore",'success');
                    $scope.cancel();
                });
            }
        });
    };
    $scope.delete = function (row) {
        Swal.fire({
            title: "Peringatan ! ",
            text: "Apakah Anda Yakin Ingin Menghapus Data Ini",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Iya, di Hapus",
            cancelButtonText: "Tidak",
        }).then((result) => {
            if (result.value) { 
                Data.delete(Control_link+'/delete/' + row.id).then(function (result) {
                    $scope.displayed.splice($scope.displayed.indexOf(row), 1);
                    $rootScope.alert("Berhasil", "Data berhasil dihapus",'success');
                    $scope.cancel();
                });
            }
        });
    };


})
