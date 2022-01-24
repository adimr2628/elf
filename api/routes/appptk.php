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
        "nama"       => "required",
        "notelp"       => "required",
        "alamat"       => "required"
    );
    GUMP::set_field_name("m_roles_id", "Hak Akses");
    $cek = validate($data, $validasi, $custom);
    return $cek;
}
/**
 * Ambil semua user aktif tanpa pagination
 */
$app->get("/appptk/getAll", function ($request, $response) {
    $params = $request->getParams();
    $db     = $this->db;
    $db->select("*")
        ->from("m_ptk")
        ->where("is_deleted", "=", 0);
    if (isset($params["nama"]) && !empty($params["nama"])) {
        $db->where("nama", "LIKE", $params["nama"]);
    }
    $models = $db->findAll();
    return successResponse($response, $models);
});
$app->get("/appptk/sekolah", function ($request, $response) {
    $params = $request->getParams();
    $db     = $this->db;
    $db->select("*")
        ->from("m_sekolah")
        ->where("is_deleted", "=", 0);

    $models = $db->findAll();
    return successResponse($response, $models);
});
/**
 * Ambil data user untuk update profil
 */
$app->get("/appptk/view", function ($request, $response) {
    $db   = $this->db;
    $data = $db->find("select * from m_ptk where id = '" . $_SESSION["user"]["id"] . "'");
    return successResponse($response, $data);
});
/**
 * Ambil semua list user
 */
$app->get("/appptk/index", function ($request, $response) {
    $params = $request->getParams();
    $db = $this->db;
    $db->select("m_ptk.*,
        m_sekolah.nama_sekolah,
        m_sekolah.alamat")
        ->from("m_ptk")
        ->join("left join", "m_sekolah", "m_sekolah.id = m_ptk.id_sekolah");
    if ($_SESSION['user']['m_roles_id'] != 1) {
        $db->where('m_ptk.id_sekolah', '=', $_SESSION['user']['id_sekolah']);
    }
    $models = $db->findAll();
    /**
     * Filter
     */
    if (isset($params["filter"])) {
        $filter = (array) json_decode($params["filter"]);
        foreach ($filter as $key => $val) {
            if ($key == "nama_ptk") {
                $db->where("m_ptk.nama_ptk", "LIKE", $val);
            } else if ($key == "is_deleted") {
                $db->where("m_ptk.is_deleted", "=", $val);
            } else {
                $db->where($key, "LIKE", $val);
            }
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
    foreach ($models as $key => $val) {
        $val->id_sekolah = $db->select('*')->from('m_sekolah')->where("id", "=", $val->id_sekolah)->find();
    }
    return successResponse($response, ["list" => $models, "totalItems" => $totalItem]);
});
/**
 * save user
 */
$app->post("/appptk/save", function ($request, $response) {
    $data = $request->getParams();
    $db   = $this->db;
    $data['id_sekolah'] = $data['id_sekolah']['id'];
    try {
        if (isset($data["nama_ptk"]) && isset($data["nip_nuptk"]) && isset($data["status"]) && isset($data["pangkat_golongan"]) && isset($data["jabatan"]) && isset($data["jk"]) && isset($data["tempat_lahir"]) && isset($data["tgl_lahir"]) && isset($data["nama_ibu_kandung"]) && isset($data["alamat_ptk"]) && isset($data["pendidikan_terakhir"]) && isset($data["jurusan"]) && isset($data["sk"]) && isset($data["gaji"]) && isset($data["sumber_gaji"]) && isset($data["tmt"]) && isset($data["masa_kerja"]) && isset($data["jumlah_hadir"]) && isset($data["keterangan_pelatihan"])) {
            if (isset($data["id"])) {
                $model = $db->update("m_ptk", $data, ["id" => $data["id"]]);
            } else {
                $model = $db->insert("m_ptk", $data);
            }
            return successResponse($response, $model);
        } else {
            return unprocessResponse($response, ["Isi form dengan lengkap"]);
        }
    } catch (Exception $e) {
        return unprocessResponse($response, ["Terjadi masalah pada server"]);
    }
});
/**
 * save status user
 */
$app->post("/appptk/saveStatus", function ($request, $response) {
    $data = $request->getParams();
    $db   = $this->db;
    try {
        $model = $db->update("m_ptk", $data, ["id" => $data["id"]]);
        return successResponse($response, $model);
    } catch (Exception $e) {
        return unprocessResponse($response, ["Terjadi masalah pada server"]);
    }
});
