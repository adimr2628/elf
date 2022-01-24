<?php

/**
 * Validasi
 * @param  array $data
 * @param  array $custom
 * @return array
 */
function validasi($data, $custom = array())
{
    $validasi = array(
        "nama" => "required",
    );
    $cek = validate($data, $validasi, $custom);
    return $cek;
}
/**
 * Ambil semua hak akses
 */
$app->get("/appakses/index", function ($request, $response) {
    $params = $request->getParams();
    $db     = $this->db;
    $db->select("*")
        ->from("m_roles");
    /**
     * Filter
     */
    if (isset($params["filter"])) {
        $filter = (array) json_decode($params["filter"]);
        foreach ($filter as $key => $val) {
            $db->where($key, "LIKE", $val);
        }
    }
    /**
     * Set limit dan offset
     */
    if (isset($params["limit"]) && !empty($params["limit"])) {
        $db->limit($params["limit"]);
    }
    if (isset($params["offset"]) && !empty($params["offset"])) {
        $db->offset($params["offset"]);
    }
    $models    = $db->findAll();
    $totalItem = $db->count();
    foreach ($models as $val) {
        $val->akses = json_decode($val->akses);
    }
    return successResponse($response, ["list" => $models, "totalItems" => $totalItem]);
});


/**
 * Save hak akses
 */
$app->post("/appakses/save", function ($request, $response) {
    $data     = $request->getParams();
    $db       = $this->db;
    $validasi = validasi($data);
    if ($validasi === true) {
        try {
            $data["akses"] = json_encode($data["akses"]);
            if (isset($data["id"])) {
                $model = $db->update("m_roles", $data, ["id" => $data["id"]]);
            } else {
                $model = $db->insert("m_roles", $data);
            }
            return successResponse($response, $model);
        } catch (Exception $e) {
            return unprocessResponse($response, ["terjadi masalah pada server"]);
        }
    }
    return unprocessResponse($response, $validasi);
});
/**
 * Save status akses
 */
$app->post("/appakses/saveStatus", function ($request, $response) {
    $data     = $request->getParams();
    $db       = $this->db;
    $validasi = validasi($data);
    if ($validasi === true) {
        try {
            $data["akses"] = json_encode($data["akses"]);
            $model         = $db->update("m_roles", $data, ["id" => $data["id"]]);
            return successResponse($response, $model);
        } catch (Exception $e) {
            return unprocessResponse($response, ["terjadi masalah pada server"]);
        }
    }
    return unprocessResponse($response, $validasi);
});

/**
 * dashboard
 */
$app->get('/appakses/dashboard', function ($request, $response) {
    $params = $request->getParams();
    $db     = $this->db;

    // hitung jumlah sekolah
    $db->select('*')
        ->from('m_sekolah')
        ->where('is_deleted', '=', 0);
    $jumlahsekolah = $db->count();

    // hitung jumlah ptk
    $db->select('*')
        ->from('m_ptk');
    if ($_SESSION['user']['m_roles_id'] != 1) {
        $db->where('m_ptk.id_sekolah', '=', $_SESSION['user']['id_sekolah']);
    }
    $jumlahptk = $db->count();

    // hitung ruang
    $db->select('*, m.ruang.id_sekolah')
        ->from('m_ruang_detail')
        ->join("left join", "m_ruang", "m_ruang.id = m_ruang_detail.m_ruang_id");
    if ($_SESSION['user']['m_roles_id'] != 1) {
        $db->where('m_ruang.id_sekolah', '=', $_SESSION['user']['id_sekolah']);
    }
    $jumlahruang = $db->count();

    // hitung kelas
    $db->select('*, m_peserta_didik.id_sekolah')
        ->from('m_peserta_didik_detail')
        ->join("left join", "m_peserta_didik", "m_peserta_didik.id = m_peserta_didik_detail.m_peserta_didik_id");
    if ($_SESSION['user']['m_roles_id'] != 1) {
        $db->where('m_peserta_didik.id_sekolah', '=', $_SESSION['user']['id_sekolah']);
    }
    $jumlahkelas = $db->count();

    return successResponse($response, [
        'jumlahsekolah'  => $jumlahsekolah,
        'jumlahptk' => $jumlahptk,
        'jumlahruang'    => $jumlahruang,
        'jumlahkelas'   => $jumlahkelas,
    ]);
});
