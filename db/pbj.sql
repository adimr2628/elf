-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Okt 2021 pada 05.51
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pbj`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_perusahaan`
--

CREATE TABLE `m_perusahaan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `komisaris` varchar(255) NOT NULL,
  `direktur` varchar(255) NOT NULL,
  `notelp` varchar(50) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_at` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_perusahaan`
--

INSERT INTO `m_perusahaan` (`id`, `nama`, `komisaris`, `direktur`, `notelp`, `npwp`, `alamat`, `is_deleted`, `created_at`, `created_by`, `modified_at`, `modified_by`) VALUES
(1, 'CV. NEOSOFT MEDIA', 'Nurul Huda', 'Afid Nurul Huda', '085850329282', '085850329282', 'Taman Candiloka C-3 No.1 RT. 07/05 Ngampelsari, Candi, Sidoarjo', 0, 1621252895, 1, 1621253171, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_peserta_didik`
--

CREATE TABLE `m_peserta_didik` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `nama_rombel` varchar(225) NOT NULL,
  `l` varchar(225) NOT NULL,
  `p` varchar(225) NOT NULL,
  `jumlah` varchar(225) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_ptk`
--

CREATE TABLE `m_ptk` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `nama_ptk` varchar(225) NOT NULL,
  `nip_nuptk` varchar(225) NOT NULL,
  `status` varchar(225) NOT NULL,
  `pangkat_golongan` varchar(225) NOT NULL,
  `jabatan` varchar(225) NOT NULL,
  `jk` varchar(225) NOT NULL,
  `tempat_lahir` varchar(225) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `nama_ibu_kandung` varchar(225) NOT NULL,
  `alamat_ptk` varchar(225) NOT NULL,
  `pendidikan_terakhir` varchar(225) NOT NULL,
  `jurusan` varchar(225) NOT NULL,
  `sk` varchar(225) NOT NULL,
  `gaji` varchar(225) NOT NULL,
  `sumber_gaji` varchar(225) NOT NULL,
  `tmt` varchar(225) NOT NULL,
  `masa_kerja` varchar(225) NOT NULL,
  `jumlah_hadir` varchar(225) NOT NULL,
  `keterangan_pelatihan` varchar(225) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_ptk`
--

INSERT INTO `m_ptk` (`id`, `id_sekolah`, `nama_ptk`, `nip_nuptk`, `status`, `pangkat_golongan`, `jabatan`, `jk`, `tempat_lahir`, `tgl_lahir`, `nama_ibu_kandung`, `alamat_ptk`, `pendidikan_terakhir`, `jurusan`, `sk`, `gaji`, `sumber_gaji`, `tmt`, `masa_kerja`, `jumlah_hadir`, `keterangan_pelatihan`, `is_deleted`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 1, '12', '12', 'PNS', '12', 'Kepala Sekolah', 'Perempuan', '12', '2021-10-20', '12', '12', 'SD', '12', 'DPK', '12', 'APBN', '12', '12', '12', '', 0, 1, 1633784290, 1, 1633784290);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_roles`
--

CREATE TABLE `m_roles` (
  `id` int(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `akses` text NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `m_roles`
--

INSERT INTO `m_roles` (`id`, `nama`, `akses`, `is_deleted`) VALUES
(1, 'Super Admin', '{\"master_roles\":true,\"master_user\":true,\"master_akses\":true,\"pengguna_akses\":true,\"pengguna_user\":true,\"app_transaksi1\":true,\"laporan_laporan1\":true,\"coba\":true,\"siswa\":true,\"kol\":true,\"kategori\":true,\"audit\":true,\"register\":true,\"daftar\":false,\"histori\":true,\"master_barang\":true,\"master_satuan\":true,\"master_kategori\":true,\"master_suplier\":true,\"master_costomer\":true,\"tahunan_pembelian\":true,\"tahunan_penjualan\":true,\"transaksi_pembelian\":true,\"transaksi_penjualan\":true,\"laporan_pembelian\":true,\"laporan_penjualan\":true,\"laporan_rekap\":true,\"kategori_arsip\":true,\"pengarsipan\":true,\"tanda_tangan\":true,\"teknis\":true,\"surat\":true,\"master_soal\":true,\"transaksi_tander\":true,\"transaksi_penilaian\":true,\"laporan_vendor\":true,\"laporan_penilaian\":true,\"sekolah\":true,\"ptk\":true,\"peserta_didik\":true,\"master_tb\":true,\"master_ruang\":true}', 0),
(2, 'DINAS', '{\"transaksi_tander\":false,\"transaksi_penilaian\":true}', 0),
(3, 'Admin', '{\"pengguna_user\":true,\"master_soal\":true,\"master_costomer\":true,\"transaksi_tander\":true,\"laporan_vendor\":true,\"laporan_penilaian\":true,\"sekolah\":true,\"ptk\":true,\"peserta_didik\":true,\"master_tb\":true,\"master_ruang\":true}', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_ruang`
--

CREATE TABLE `m_ruang` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `jenis_prasarana` varchar(225) NOT NULL,
  `nama_ruang` varchar(225) NOT NULL,
  `lantai_ke` varchar(225) NOT NULL,
  `panjang` varchar(225) NOT NULL,
  `lebar` varchar(225) NOT NULL,
  `luas` varchar(225) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_sekolah`
--

CREATE TABLE `m_sekolah` (
  `id` int(11) NOT NULL,
  `nama_sekolah` varchar(225) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `npsn` varchar(225) NOT NULL,
  `bentuk_pendidikan` varchar(225) NOT NULL,
  `izin_operasional` varchar(225) NOT NULL,
  `status_akreditasi` varchar(225) NOT NULL,
  `website` varchar(225) NOT NULL,
  `status_sekolah` varchar(225) NOT NULL,
  `desa_kelurahan` varchar(225) NOT NULL,
  `kecamatan` varchar(225) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_sekolah`
--

INSERT INTO `m_sekolah` (`id`, `nama_sekolah`, `alamat`, `npsn`, `bentuk_pendidikan`, `izin_operasional`, `status_akreditasi`, `website`, `status_sekolah`, `desa_kelurahan`, `kecamatan`, `is_deleted`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, '12', '12', '12', 'SD', '12', 'B', '12', 'Swasta', '12', '12', 0, 1, 1633756465, 1, 1633782805);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_soal`
--

CREATE TABLE `m_soal` (
  `id` int(11) NOT NULL,
  `pertanyaan` varchar(255) NOT NULL,
  `type_jawaban` varchar(255) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_soal`
--

INSERT INTO `m_soal` (`id`, `pertanyaan`, `type_jawaban`, `is_deleted`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 'Kemampuan Keuangan', 'pilihan', 0, 1, 1621830545, 1, 1621830545),
(2, 'SDM', 'pilihan', 0, 1, 1621830584, 1, 1621830584),
(3, 'Sarana Prasana', 'pilihan', 0, 1, 1621830603, 1, 1621830603),
(4, 'Hasil Kerja', 'isian', 0, 1, 1621830619, 1, 1621830619),
(5, 'Saran/Rekomendasi', 'isian', 0, 1, 1621830640, 1, 1621830640);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_soal_detail`
--

CREATE TABLE `m_soal_detail` (
  `id` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `jawaban` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_soal_detail`
--

INSERT INTO `m_soal_detail` (`id`, `id_soal`, `jawaban`) VALUES
(1, 1, 'Mampu'),
(2, 1, 'Tidak Mampu'),
(3, 2, 'Sesuai'),
(4, 2, 'Tidak Sesuai'),
(5, 3, 'Sesuai'),
(6, 3, 'Tidak Sesuai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_tanah_bangunan`
--

CREATE TABLE `m_tanah_bangunan` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `jenis_prasarana` varchar(225) NOT NULL,
  `nama_prasarana` varchar(225) NOT NULL,
  `no_sertifikat` varchar(225) NOT NULL,
  `panjang` varchar(225) NOT NULL,
  `lebar` varchar(225) NOT NULL,
  `luas` varchar(225) NOT NULL,
  `kepemilikan` varchar(225) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_tanah_bangunan`
--

INSERT INTO `m_tanah_bangunan` (`id`, `id_sekolah`, `jenis_prasarana`, `nama_prasarana`, `no_sertifikat`, `panjang`, `lebar`, `luas`, `kepemilikan`, `is_deleted`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 1, 'Tanah', '12', '12', '12', '12', '12', 'Pinjam Pakai', 0, 1, 1633787325, 1, 1633788298);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_user`
--

CREATE TABLE `m_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(25) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `m_roles_id` int(5) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_user`
--

INSERT INTO `m_user` (`id`, `nama`, `email`, `alamat`, `telepon`, `username`, `password`, `m_roles_id`, `is_deleted`) VALUES
(1, 'Admin Simandor', 'afidnh@gmail.com', '-', '312', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 0),
(2, 'alvan', 'maulana@gmail.com', 'malang', '0123123', 'alvan', 'ce2566ee753c597c935cb9dc332a28b54589acf9', 1, 1),
(3, 'Dinas Penanaman Modal Pelayanan Terpatu Satu Pintu', 'afidnh@gmail.com', 'Dsn Penanggungan Gang Mutiara Rt 04 Rw 27 No 23A Kejapanan Gempol Pasuruan', '085850329282', 'dpm', '5373eef23d39125223e4972b755a657280f9eb1c', 2, 0),
(4, 'Trias Nawang', 'trias@gmail.com', 'Lamonga FC', '085850329282', 'trias', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 3, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_tander`
--

CREATE TABLE `t_tander` (
  `id` int(11) NOT NULL,
  `perusahaan_id` int(11) NOT NULL,
  `dinas_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tipe` tinyint(4) NOT NULL,
  `tanggal` date NOT NULL,
  `link` text NOT NULL,
  `created_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modifed_at` int(11) NOT NULL,
  `modifed_by` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `is_nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_tander`
--

INSERT INTO `t_tander` (`id`, `perusahaan_id`, `dinas_id`, `nama`, `tipe`, `tanggal`, `link`, `created_at`, `created_by`, `modifed_at`, `modifed_by`, `is_deleted`, `is_nilai`) VALUES
(1, 1, 3, 'Belanja Persediaan untuk Diserahkan-Persediaan untuk Diserahkankepada Masyarakat - Belanja Perlengkapan Siswa (Kain Seragam SMP 02.28)', 1, '2021-05-22', 'https://lpse.mojokertokota.go.id/eproc4/lelang/3498324/pengumumanlelang', 1621686341, 1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_tander_detail`
--

CREATE TABLE `t_tander_detail` (
  `id` int(11) NOT NULL,
  `tander_id` int(11) NOT NULL,
  `pertanyaan` varchar(255) NOT NULL,
  `jawaban` varchar(255) NOT NULL,
  `type_jawaban` varchar(255) NOT NULL,
  `created_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_tander_detail`
--

INSERT INTO `t_tander_detail` (`id`, `tander_id`, `pertanyaan`, `jawaban`, `type_jawaban`, `created_at`, `created_by`) VALUES
(21, 1, 'Kemampuan Keuangan', 'Mampu', 'pilihan', 1621830545, 1),
(22, 1, 'SDM', 'Sesuai', 'pilihan', 1621830584, 1),
(23, 1, 'Sarana Prasana', 'Sesuai', 'pilihan', 1621830603, 1),
(24, 1, 'Hasil Kerja', 'BAIK', 'isian', 1621830619, 1),
(25, 1, 'Saran/Rekomendasi', 'TINGKATKAN', 'isian', 1621830640, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `m_perusahaan`
--
ALTER TABLE `m_perusahaan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_peserta_didik`
--
ALTER TABLE `m_peserta_didik`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_ptk`
--
ALTER TABLE `m_ptk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_roles`
--
ALTER TABLE `m_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_ruang`
--
ALTER TABLE `m_ruang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_sekolah`
--
ALTER TABLE `m_sekolah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_soal`
--
ALTER TABLE `m_soal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_soal_detail`
--
ALTER TABLE `m_soal_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_tanah_bangunan`
--
ALTER TABLE `m_tanah_bangunan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_tander`
--
ALTER TABLE `t_tander`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_tander_detail`
--
ALTER TABLE `t_tander_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `m_perusahaan`
--
ALTER TABLE `m_perusahaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `m_peserta_didik`
--
ALTER TABLE `m_peserta_didik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `m_ptk`
--
ALTER TABLE `m_ptk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `m_roles`
--
ALTER TABLE `m_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `m_ruang`
--
ALTER TABLE `m_ruang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `m_sekolah`
--
ALTER TABLE `m_sekolah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `m_soal`
--
ALTER TABLE `m_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `m_soal_detail`
--
ALTER TABLE `m_soal_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `m_tanah_bangunan`
--
ALTER TABLE `m_tanah_bangunan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `m_user`
--
ALTER TABLE `m_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `t_tander`
--
ALTER TABLE `t_tander`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `t_tander_detail`
--
ALTER TABLE `t_tander_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
