<?php

$app->get('/m_peserta_didik/sekolah', function ($request, $response) {

    $db = $this->db;
    $models = $db->select("*")->from("m_sekolah")->findAll();

    return successResponse($response, $models);
});

$app->get('/m_peserta_didik/index', function ($request, $response) {


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
    $db->select("m_peserta_didik.id AS id,m_sekolah.id AS id_sekolah,m_sekolah.nama_sekolah,
        m_sekolah.alamat")
        ->from('m_peserta_didik')
        ->join("left join", "m_sekolah", "m_sekolah.id = m_peserta_didik.id_sekolah")
        // ->where("=", "roles_id", 1)
        ->limit($limit)
        ->orderBy($sort)
        ->groupBy('m_peserta_didik.id_sekolah')
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
        $db->orderBy("m_peserta_didik.id DESC");
    }
    //filter
    if (isset($params['filter'])) {
        $filter = (array) json_decode($params['filter']);
        foreach ($filter as $key => $val) {
            if ($key == 'is_deleted') {
                $db->andWhere('m_peserta_didik.is_deleted', '=', $val);
            } else {
                $db->andWhere($key, 'LIKE', $val);
            }
        }
    }
    if ($_SESSION['user']['m_roles_id'] != 1) {
        $db->where('m_peserta_didik.id_sekolah', '=', $_SESSION['user']['id_sekolah']);
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

$app->post('/m_peserta_didik/create', function ($request, $response) {

    $params = $request->getParams();
    $data = $params;
    $db = $this->db;
    $data['form']['id_sekolah'] = $data['form']['id_sekolah']['id'];
    $model = $db->insert('m_peserta_didik', $data['form']);
    if ($model) {
        foreach ($data['detail'] as $key => $value) {
            $detail[$key] = $value;
            $detail[$key]['m_peserta_didik_id'] = $model->id;
            $detail[$key]['kelas'] = $value['kelas'];
            $detail[$key]['perempuan'] = $value['perempuan'];
            $detail[$key]['laki'] = $value['laki'];
            $detail[$key]['total'] = $value['total'];
            $model_detail = $db->insert("m_peserta_didik_detail", $detail[$key]);
        }
        return successResponse($response, $model);
    } else {
        return unprocessResponse($response, ["Terjadi masalah pada server"]);
    }
});


$app->post('/m_peserta_didik/update', function ($request, $response) {

    $params = $request->getParams();
    $data = $params;
    $db = $this->db;
    $data['form']['id_sekolah'] = $data['form']['id_sekolah']['id'];
    $model = $db->update('m_peserta_didik', $data['form'], array('id' => $data['form']['id']));
    $model_delete = $db->delete('m_peserta_didik_detail', array('m_peserta_didik_id' => $model->id));
    if ($model) {
        $err = 1;
        $sameval = 1;
        foreach ($data['detail'] as $key => $value) {
            $detail[$key] = $value;
            if (!empty($detail[$key]["kelas"]) && !empty($detail[$key]["perempuan"]) && !empty($detail[$key]["laki"]) && !empty($value["total"])) {
                $detail[$key]['m_peserta_didik_id'] = $model->id;
                $detail[$key]['kelas'] = $value['kelas'];
                $detail[$key]['perempuan'] = $value['perempuan'];
                $detail[$key]['laki'] = $value['laki'];
                $detail[$key]['total'] = $value['total'];

                $cek = $db->select("*")->from("m_peserta_didik_detail")->where("kelas", "=", $detail[$key]["kelas"])->find();
                if (empty($cek)) {
                    $db->insert("m_peserta_didik_detail", $detail[$key]);
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
            return unprocessResponse($response, "Ada kelas yang sama");
        } else {
            return successResponse($response, $model);
        }
    } else {
        return unprocessResponse($response, ["Gagal Disimpan"]);
    }
});

$app->get('/m_peserta_didik/listdetail/{id}', function ($request, $response) {
    $db = $this->db;
    $id = $request->getAttribute('id');
    $list = $db->select("*")
        ->from('m_peserta_didik_detail')
        ->where("m_peserta_didik_id", "=", $id);

    $models = $list->findAll();
    return successResponse($response, $models);
});

$app->delete('/m_peserta_didik/deleteDetail/{id}', function ($request, $response) {
    $db = $this->db;
    $id = $request->getAttribute('id');
    $db->delete('m_peserta_didik_detail', array('id' => $id));
    return successResponse($response, ['Berhasil Menghapus Data']);
});

$app->delete('/m_peserta_didik/delete/{id}', function ($request, $response) {
    $db = $this->db;
    $id = $request->getAttribute('id');
    $model = $db->delete('m_peserta_didik', array('id' => $id));
    return successResponse($response, $model);
});
