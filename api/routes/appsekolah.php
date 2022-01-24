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
$app->get("/appsekolah/getAll", function ($request, $response) {
    $params = $request->getParams();
    $db     = $this->db;
    $db->select("*")
        ->from("m_sekolah")
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
$app->get("/appsekolah/view", function ($request, $response) {
    $db   = $this->db;
    $data = $db->find("select * from m_sekolah where id = '" . $_SESSION["user"]["id"] . "'");
    return successResponse($response, $data);
});
/**
 * Ambil semua list user
 */
$app->get("/appsekolah/index", function ($request, $response) {
    $params = $request->getParams();
    $db     = $this->db;
    $db->select("*")
        ->from("m_sekolah")
        ->where("is_deleted", "=", 0);
    if ($_SESSION['user']['m_roles_id'] != 1) {
        $db->where('m_sekolah.id', '=', $_SESSION['user']['id_sekolah']);
    }
    $models = $db->findAll();
    /**
     * Filter
     *  index, save, delete
     */
    if (isset($params["filter"])) {
        $filter = (array) json_decode($params["filter"]);
        foreach ($filter as $key => $val) {
            if ($key == "nama_sekolah") {
                $db->where("m_sekolah.nama_sekolah", "LIKE", $val);
            } else if ($key == "is_deleted") {
                $db->where("m_sekolah.is_deleted", "=", $val);
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
        // $val->m_roles_id = (string) $val->m_roles_id;
    }
    return successResponse($response, ["list" => $models, "totalItems" => $totalItem]);
});
/**
 * save user
 */
$app->post("/appsekolah/save", function ($request, $response) {
    $data = $request->getParams();
    $db   = $this->db;

    try {
        if (isset($data["nama_sekolah"]) && isset($data["alamat"]) && isset($data["npsn"]) && isset($data["bentuk_pendidikan"]) && isset($data["izin_operasional"]) && isset($data["status_akreditasi"]) && isset($data["website"]) && isset($data["status_sekolah"]) && isset($data["desa_kelurahan"]) && isset($data["kecamatan"])) {
            if (isset($data["id"])) {
                $model = $db->update("m_sekolah", $data, ["id" => $data["id"]]);
            } else {
                $cek = $db->select("*")->from("m_sekolah")->where("npsn", "=", $data["npsn"])->where("is_deleted", "=", 0)->find();

                if (!empty($cek)) {
                    return unprocessResponse($response, ["NPSN sudah ada"]);
                } else {
                    $model = $db->insert("m_sekolah", $data);
                }
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
$app->post("/appsekolah/saveStatus", function ($request, $response) {
    $data = $request->getParams();
    $db   = $this->db;
    try {
        $model = $db->update("m_sekolah", $data, ["id" => $data["id"]]);
        return successResponse($response, $model);
    } catch (Exception $e) {
        return unprocessResponse($response, ["Terjadi masalah pada server"]);
    }
});
