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
$app->get("/apptanahbangunan/getAll", function ($request, $response) {
    $params = $request->getParams();
    $db     = $this->db;
    $db->select("*")
        ->from("m_tanah_bangunan")
        ->where("is_deleted", "=", 0);
    if (isset($params["nama"]) && !empty($params["nama"])) {
        $db->where("nama", "LIKE", $params["nama"]);
    }
    $models = $db->findAll();
    return successResponse($response, $models);
});
/**
 * Ambil data user untuk update profil
 */
$app->get("/apptanahbangunan/view", function ($request, $response) {
    $db   = $this->db;
    $data = $db->find("select * from m_tanah_bangunan where id = '" . $_SESSION["user"]["id"] . "'");
    return successResponse($response, $data);
});

/**
 * Ambil semua list user
 */
$app->get("/apptanahbangunan/index", function ($request, $response) {
    $params = $request->getParams();
    $db = $this->db;
    $db->select("m_tanah_bangunan.*,
        m_sekolah.nama_sekolah,
        m_sekolah.alamat")
        ->from("m_tanah_bangunan")
        ->join("left join", "m_sekolah", "m_sekolah.id = m_tanah_bangunan.id_sekolah");
    if ($_SESSION['user']['m_roles_id'] != 1) {
        $db->where('m_tanah_bangunan.id_sekolah', '=', $_SESSION['user']['id_sekolah']);
    }
    // ->where('identitas_sekolah.id', '=', $_SESSION['id_sekolah']);
    $models = $db->findAll();
    /**
     * 
     * Filter
     */
    if (isset($params["filter"])) {
        $filter = (array) json_decode($params["filter"]);
        foreach ($filter as $key => $val) {
            if ($key == "nama_prasarana") {
                $db->where("m_tanah_bangunan.nama_prasarana", "LIKE", $val);
            } else if ($key == "is_deleted") {
                $db->where("m_tanah_bangunan.is_deleted", "=", $val);
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
$app->post("/apptanahbangunan/save", function ($request, $response) {
    $data = $request->getParams();
    $db   = $this->db;
    $data['id_sekolah'] = $data['id_sekolah']['id'];
    try {
        if (isset($data["jenis_prasarana"]) && isset($data["nama_prasarana"]) && isset($data["no_sertifikat"]) && isset($data["panjang"]) && isset($data["lebar"]) && isset($data["luas"]) && isset($data["kepemilikan"])) {
            if (isset($data["id"])) {
                $model = $db->update("m_tanah_bangunan", $data, ["id" => $data["id"]]);
            } else {
                $model = $db->insert("m_tanah_bangunan", $data);
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
$app->post("/apptanahbangunan/saveStatus", function ($request, $response) {
    $data = $request->getParams();
    $db   = $this->db;
    $validasi = validasi($data);
    if ($validasi === true) {
        try {
            $model = $db->update("m_tanah_bangunan", $data, ["id" => $data["id"]]);
            return successResponse($response, $model);
        } catch (Exception $e) {
            return unprocessResponse($response, ["Terjadi masalah pada server"]);
        }
    }
    return unprocessResponse($response, $validasi);
});
