<?php

$app->get('/m_ruang/sekolah', function ($request, $response) {

    $db = $this->db;
    $models = $db->select("*")->from("m_sekolah")->findAll();

    return successResponse($response, $models);
});
$app->get('/m_ruang/index', function ($request, $response) {


    //init variable
    $params = $_REQUEST;
    $filter = array();
    $sort = "id DESC";
    $offset = 0;
    $limit = 10;

    //limit & offset pagination
    if (isset($params['limit']))
        $limit = $params['limit'];
    if (isset($params['offset']))
        $offset = $params['offset'];


    $db = $this->db;
    $db->select("*,m_sekolah.nama_sekolah,
        m_sekolah.alamat")
        ->from('m_ruang')
        ->join("inner join", "m_sekolah", "m_sekolah.id = m_ruang.id_sekolah")
        // ->where("=", "roles_id", 1)
        ->groupby('m_ruang.id_sekolah')
        ->limit($limit)
        ->orderBy($sort)
        ->offset($offset);
    /**
     * Set Sort
     */
    if (isset($params['sort'])) {
        $sort = $params['sort'];
        if (isset($params['order'])) {
            if ($params['order'] == "false") {
                $sort .= " ASC";
            } else {
                $sort .= " DESC";
            }
        }
        $db->orderBy($sort);
    } else {
        $db->orderBy("m_ruang.id DESC");
    }
    //filter
    if (isset($params['filter'])) {
        $filter = (array) json_decode($params['filter']);
        foreach ($filter as $key => $val) {
            if ($key == 'is_deleted') {
                $db->andWhere('m_ruang.is_deleted', '=', $val);
            } else {
                $db->andWhere($key, 'LIKE', $val);
            }
        }
    }
    if ($_SESSION['user']['m_roles_id'] != 1) {
        $db->where('m_ruang.id_sekolah', '=', $_SESSION['user']['id_sekolah']);
    }
    //    $db->log();
    // function filterLembagaSekolah($tabel, $sekolah = false)
    // $db->customWhere(filterLembagaSekolah('m_peserta_didik', true), 'AND');
    $models = $db->findAll();
    $totalItem = $db->count();
    foreach ($models as $key => $val) {
        $val->id_sekolah = $db->select('*')->from('m_sekolah')->where("id", "=", $val->id_sekolah)->find();
    }
    return successResponse($response, array('data' => (array) $models, 'totalItems' => $totalItem));
});
$app->post('/m_ruang/create', function ($request, $response) {

    $params = $request->getParams();
    $data = $params;
    $db = $this->db;
    $data['form']['id_sekolah'] = $data['form']['id_sekolah']['id'];
    $model = $db->insert('m_ruang', $data['form']);
    if ($model) {
        foreach ($data['detail'] as $key => $value) {
            $detail[$key] = $value;
            $detail[$key]['m_ruang_id'] = $model->id;
            $detail[$key]['jenis_prasarana'] = $value['jenis_prasarana'];
            $detail[$key]['nama_ruang'] = $value['nama_ruang'];
            $detail[$key]['lantai'] = $value['lantai'];
            $detail[$key]['panjang'] = $value['panjang'];
            $detail[$key]['lebar'] = $value['lebar'];
            $detail[$key]['luas'] = $value['luas'];
            $model_detail = $db->insert("m_ruang_detail", $detail[$key]);
        }
        return successResponse($response, $model);
    } else {
        return unprocessResponse($response, ["Terjadi masalah pada server"]);
    }
});

$app->post('/m_ruang/update', function ($request, $response) {

    $params = $request->getParams();
    $data = $params;
    $cek = $params;
    $db = $this->db;
    $data['form']['id_sekolah'] = $data['form']['id_sekolah']['id'];
    $model = $db->update('m_ruang', $data['form'], array('id' => $data['form']['id']));
    $model_delete = $db->delete('m_ruang_detail', array('m_ruang_id' => $model->id));

    if ($model) {
        $err = 1;
        $sameval = 1;
        foreach ($data['detail'] as $key => $value) {
            $detail[$key] = $value;
            if (!empty($detail[$key]["jenis_prasarana"]) && !empty($detail[$key]["nama_ruang"]) && !empty($detail[$key]["lantai"]) && !empty($value["panjang"]) && !empty($value["lebar"]) && !empty($value["luas"])) {
                $detail[$key]['m_ruang_id'] = $model->id;
                $detail[$key]['jenis_prasarana'] = $value['jenis_prasarana'];
                $detail[$key]['nama_ruang'] = $value['nama_ruang'];
                $detail[$key]['lantai'] = $value['lantai'];
                $detail[$key]['panjang'] = $value['panjang'];
                $detail[$key]['lebar'] = $value['lebar'];
                $detail[$key]['luas'] = $value['luas'];
                // $model_detail = $db->insert("m_ruang_detail", $detail[$key]);
                $cek = $db->select("*")->from("m_ruang_detail")->where("nama_ruang", "=", $detail[$key]["nama_ruang"])->find();
                if (empty($cek)) {
                    $db->insert("m_ruang_detail", $detail[$key]);
                } else {
                    $sameval = $sameval + 1;
                }
            } else {
                $err = $err + 1;
            }
        }
        if ($err > 1) {
            return unprocessResponse($response, "Isi form dengan lengkap");
        } else if ($sameval > 1) {
            return unprocessResponse($response, "Ada ruang yang sama");
        } else {
            return successResponse($response, $model);
        }
    } else {
        return unprocessResponse($response, ["Gagal Disimpan"]);
    }
});

$app->get('/m_ruang/listdetail/{id}', function ($request, $response) {
    $db = $this->db;
    $id = $request->getAttribute('id');
    $list = $db->select("*")
        ->from('m_ruang_detail')
        ->where("m_ruang_id", "=", $id);
    $models = $list->findAll();
    return successResponse($response, $models);
});

$app->delete('/m_ruang/deleteDetail/{id}', function ($request, $response) {
    $db = $this->db;
    $id = $request->getAttribute('id');
    $db->delete('m_ruang_detail', array('id' => $id));
    return successResponse($response, ['Berhasil Menghapus Data']);
});

$app->delete('/m_ruang/delete/{id}', function ($request, $response) {
    $db = $this->db;
    $id = $request->getAttribute('id');
    $model = $db->delete('m_ruang', array('id' => $id));
    return successResponse($response, $model);
});
