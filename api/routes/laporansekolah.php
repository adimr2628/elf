<?php

/**
 * Ambil semua
 */
$app->get("/laporansekolah/laporan", function ($request, $response) {
    $param = $request->getParams();
    $db = $this->db;

    $tanggal = isset($param['tanggal']) ? json_decode($param['tanggal']) : null;

    date_default_timezone_set("Asia/Jakarta");

    $db->select("m_sekolah.*")
        ->from("m_sekolah")
        ->where("bentuk_pendidikan", "=", $param['bentuk_pendidikan'])
        ->where("is_deleted", "=", 0);


    $models = $db->findAll();

    // Mengelompokkan tanggal pembelian per produk
    foreach ($models as $key => $value) {
        $value->pns =  $db->select("m_ptk.*")
            ->from("m_ptk")
            ->where("id_sekolah", "=", $value->id)
            ->where("status", "=", 'PNS')->count();
        $value->no_pns =  $db->select("m_ptk.*")
            ->from("m_ptk")
            ->where("id_sekolah", "=", $value->id)
            ->where("status", "=", 'Non PNS')->count();
        $value->jml_ptk =  $db->select("m_ptk.*")
            ->from("m_ptk")
            ->where("id_sekolah", "=", $value->id)->count();
        $value->jml_ijazah =  $db->select("m_ptk.*")
            ->from("m_ptk")
            ->where("id_sekolah", "=", $value->id)->count();
        $value->jml_sd =  $db->select("m_ptk.*")
            ->from("m_ptk")
            ->where("id_sekolah", "=", $value->id)
            ->where("pendidikan_terakhir", "=", 'SD')->count();
        $value->jml_smp =  $db->select("m_ptk.*")
            ->from("m_ptk")
            ->where("id_sekolah", "=", $value->id)
            ->where("pendidikan_terakhir", "=", 'SMP')->count();
        $value->jml_sma =  $db->select("m_ptk.*")
            ->from("m_ptk")
            ->where("id_sekolah", "=", $value->id)
            ->where("pendidikan_terakhir", "=", 'SMA')->count();
        $value->jml_s1 =  $db->select("m_ptk.*")
            ->from("m_ptk")
            ->where("id_sekolah", "=", $value->id)
            ->where("pendidikan_terakhir", "=", 'S1')->count();
        $value->jml_s2 =  $db->select("m_ptk.*")
            ->from("m_ptk")
            ->where("id_sekolah", "=", $value->id)
            ->where("pendidikan_terakhir", "=", 'S2')->count();
        $value->jml_s2 =  $db->select("m_ptk.*")
            ->from("m_ptk")
            ->where("id_sekolah", "=", $value->id)
            ->where("pendidikan_terakhir", "=", 'S2')->count();
        $siswa = $db->select("SUM(m_peserta_didik_detail.total) as jml_siswa")
            ->from("m_peserta_didik")
            ->leftJoin('m_peserta_didik_detail', 'm_peserta_didik_detail.m_peserta_didik_id = m_peserta_didik.id')
            ->where("id_sekolah", "=", $value->id)->find();
        $value->siswa =  !empty($siswa->jml_siswa) ? $siswa->jml_siswa : 0;
    }

    return successResponse($response, $models);
});
