-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jan 2022 pada 07.46
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_peserta_didik`
--

CREATE TABLE `m_peserta_didik` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_peserta_didik`
--

INSERT INTO `m_peserta_didik` (`id`, `id_sekolah`, `is_deleted`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 1, 0, 1, 1635660717, 1, 1641791474),
(2, 4, 0, 1, 1640063287, 1, 1640783517),
(3, 7, 0, 1, 1640585579, 1, 1640783502),
(4, 7, 0, 1, 1640754099, 1, 1640754099),
(5, 3, 0, 1, 1640754134, 1, 1640754134),
(8, 10, 0, 1, 1641791706, 1, 1641791706),
(9, 11, 0, 1, 1641803510, 1, 1641803510);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_peserta_didik_detail`
--

CREATE TABLE `m_peserta_didik_detail` (
  `id` int(11) NOT NULL,
  `m_peserta_didik_id` int(11) NOT NULL,
  `kelas` varchar(255) NOT NULL,
  `perempuan` int(11) NOT NULL,
  `laki` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_peserta_didik_detail`
--

INSERT INTO `m_peserta_didik_detail` (`id`, `m_peserta_didik_id`, `kelas`, `perempuan`, `laki`, `total`) VALUES
(33, 3, 'Kelas 2', 100, 100, 200),
(34, 3, 'Kelas 3', 30, 30, 60),
(35, 3, 'Kelas 4', 20, 25, 45),
(43, 1, 'kelas  1', 1, 1, 2),
(44, 4, 'kelas a', 2, 12, 14),
(46, 3, 'kelas 5', 12, 24, 36),
(48, 3, 'kelas 6', 12, 12, 24),
(49, 3, 'kelas 7', 12, 15, 27),
(50, 3, 'kelas 8', 12, 12, 24),
(51, 3, 'kelas 9', 12, 16, 28),
(53, 1, 'kelas 10', 3, 5, 8),
(54, 1, 'kelas 11', 12, 2, 14),
(56, 7, 'KELAS A', 12, 12, 24),
(57, 1, 'kelas 12', 1, 1, 2),
(58, 1, 'kelas 13', 1, 1, 2),
(59, 8, 'kelas 1', 12, 12, 24),
(60, 9, 'kelas e', 12, 12, 24);

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
(1, 1, 'Elfa', '12', 'PNS', '12', 'Kepala Sekolah', 'Perempuan', '12', '2021-10-30', '12', '12', 'SD', '12', 'DPK', '12', 'APBN', '12', '12', '12', '', 0, 1, 1633784290, 1, 1640092230),
(2, 4, 'Afid', '', 'Non PNS', '', 'Kepala Sekolah', '', '', '0000-00-00', '', '', 'S1', '', '', '', '', '', '', '', '', 0, 1, 1636942134, 1, 1639460503),
(4, 4, 'asas', 'asas', 'PNS', 'asa', 'Guru', 'Perempuan', 'asa', '2021-12-28', 'as', 'asa', 'SMP', 'asa', 'DPK', 'asa', 'APBN', 'as', 'asa', 'asas', 'asa', 0, 1, 1640698027, 1, 1640698027),
(7, 10, 'fatimah', '199801072836', 'PNS', '4a', 'Kepala Sekolah', 'Perempuan', 'jombang', '2022-01-04', 'lilik', 'jombang', 'D3', 'TI', 'GTT', '1.000.000', 'APBN', '12', '12', '12', 'tingkat provinsi', 0, 1, 1641791695, 1, 1641791695);

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
(1, 'Admin', '{\"master_roles\":true,\"master_user\":true,\"master_akses\":true,\"pengguna_akses\":true,\"pengguna_user\":true,\"sekolah\":true,\"ptk\":true,\"peserta_didik\":true,\"master_tb\":true,\"master_ruang\":true,\"jumlah_sekolah\":true,\"jumlah_ptk\":true,\"jumlah_ruang\":true,\"jumlah_kelas\":true,\"app_laporan\":true}', 0),
(4, 'Sekolah', '{\"pengguna_user\":false,\"sekolah\":false,\"ptk\":true,\"peserta_didik\":true,\"master_tb\":true,\"master_ruang\":true,\"laporan_penilaian\":true,\"jumlah_ptk\":true,\"jumlah_ruang\":true,\"jumlah_kelas\":true}', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_ruang`
--

CREATE TABLE `m_ruang` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_ruang`
--

INSERT INTO `m_ruang` (`id`, `id_sekolah`, `is_deleted`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 1, 0, 1, 1636424641, 1, 1640783733),
(2, 3, 0, 1, 1639365269, 1, 1639365269),
(3, 3, 0, 1, 1639724284, 1, 1640783010),
(4, 4, 0, 1, 1640700673, 1, 1640783081),
(5, 3, 0, 1, 1640700843, 1, 1640700843),
(6, 4, 0, 1, 1640700968, 1, 1640700968),
(7, 7, 0, 1, 1640781112, 1, 1640782895),
(10, 10, 0, 1, 1641791752, 1, 1641791752),
(11, 11, 0, 1, 1641803534, 1, 1641803534);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_ruang_detail`
--

CREATE TABLE `m_ruang_detail` (
  `id` int(11) NOT NULL,
  `m_ruang_id` int(11) NOT NULL,
  `jenis_prasarana` varchar(255) NOT NULL,
  `nama_ruang` varchar(255) NOT NULL,
  `lantai` varchar(11) NOT NULL,
  `panjang` int(11) NOT NULL,
  `lebar` int(11) NOT NULL,
  `luas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_ruang_detail`
--

INSERT INTO `m_ruang_detail` (`id`, `m_ruang_id`, `jenis_prasarana`, `nama_ruang`, `lantai`, `panjang`, `lebar`, `luas`) VALUES
(3, 1, 'Ruang Kelas', 'Kelas A', '1', 10, 12, 120),
(4, 1, 'Ruang Olahraga', 'Tenis Indoor', '2', 23, 10, 230),
(5, 1, 'Ruang Ibadah', 'Masji', '1', 100, 29, 2900),
(7, 3, 'Ruang teori/kelas', 'KELAS B', '1', 12, 12, 144),
(8, 4, 'ruang kelas', 'kelas 1', '1', 12, 12, 144),
(12, 1, 'Ruang Olahraga', 'Renang Indoor', '2', 12, 20, 240),
(13, 4, 'ruang uks', 'uks 2', '1', 12, 12, 144),
(15, 7, 'ruang kelas', 'kelas 2', '1', 15, 16, 240),
(16, 7, 'ruang kelas', 'kelas 3', '1', 113, 13, 1469),
(17, 7, 'ruang kelas', 'kelas 4', '1', 12, 2, 24),
(18, 7, 'ruang kelas', 'kelas 5', '2', 12, 14, 168),
(19, 7, 'ruang kelas', 'kelas 6', '1', 12, 14, 168),
(20, 4, 'ruang olahraga', 'renang', '1', 13, 15, 195),
(21, 4, 'ruang olahraga', 'voli', '2', 14, 14, 196),
(22, 4, 'ruang olahraga', 'tenis', '2', 14, 14, 196),
(23, 1, 'Ruang Olahraga', 'basket', '1', 12, 33, 396),
(27, 10, 'ruang olahraga', 'basket', '1', 12, 12, 144),
(28, 11, 'ruang olahraga', 'voli', '1', 12, 12, 144);

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
(1, 'SDN 1', 'jombang', '123', 'SD', '12 MARET 2012 - 12 MARET 2021', 'C', 'www.sdn1.com', 'Swasta', 'beji', 'jogoroto', 0, 1, 1633756465, 1, 1640665933),
(3, 'SDN Mindi 1', 'jombang', '1234', 'TK', 'daskmdska', 'C', 'www.google.com', 'Swasta', 'kon', 'adoh', 0, 1, 1636425239, 1, 1640092039),
(4, 'TK ABADI', 'jombang', '12345', 'TK', '12 maret 2012 - 12 maret 2021', 'B', 'www.tk.com', 'Swasta', 'beji', 'jogoroto', 0, 1, 1639364008, 1, 1640092029),
(7, 'qw', 'qw', '123456789', 'TK', 'qw', 'B', 'qw', 'Negeri', 'qw', 'qw', 0, 1, 1640584754, 1, 1640584754),
(10, 'SDN 4', 'jombang', '10987653', 'SD', '12 MARET 2000-12 MARET 2021', 'A', 'www.sdn4.com', 'Negeri', 'sawiji', 'jogoroto', 0, 1, 1641791553, 1, 1641791553),
(11, 'kb5', 'jombang', '10983733', 'KB', '12 maret 2000-12maret2021', 'A', 'www.com', 'Swasta', 'jombangg', 'jombang', 0, 1, 1641803482, 1, 1641803482);

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
(1, 1, 'Tanah', '12', '12', '15', '12', '180', 'Pinjam Pakai', 0, 1, 1633787325, 1, 1640779632),
(2, 3, 'Bangunan', 'as', 'asa', '12', '12', '144', 'Milik Sendiri', 0, 1, 1640698477, 1, 1640764895),
(3, 4, 'Tanah', 'Tanah TK ABADI', '123456', '12', '12', '144', 'Milik Sendiri', 0, 1, 1640764931, 1, 1640779244),
(6, 10, 'Tanah', 'tanah sdn 4', '120987', '12', '12', '144', 'Milik Sendiri', 0, 1, 1641791726, 1, 1641791726);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_user`
--

CREATE TABLE `m_user` (
  `id` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(25) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `m_roles_id` int(5) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_user`
--

INSERT INTO `m_user` (`id`, `id_sekolah`, `nama`, `email`, `alamat`, `telepon`, `username`, `password`, `m_roles_id`, `is_deleted`) VALUES
(1, 0, 'Admin', 'elfa@gmail.com', '-', '312', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 0),
(2, 2, 'alvan', 'maulana@gmail.com', 'malang', '0123123', 'alvan', 'ce2566ee753c597c935cb9dc332a28b54589acf9', 2, 1),
(3, 1, 'Dinas Penanaman Modal Pelayanan Terpatu Satu Pintu', 'afidnh@gmail.com', 'Dsn Penanggungan Gang Mutiara Rt 04 Rw 27 No 23A Kejapanan Gempol Pasuruan', '085850329282', 'dpm', '5373eef23d39125223e4972b755a657280f9eb1c', 2, 1),
(4, 3, 'Trias Nawang', 'trias@gmail.com', 'Lamonga FC', '085850329282', 'trias', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 3, 1),
(5, 4, 'Operator sekolah TK abadi', 'tkabadi.gmail.com', 'jombang', '123', 'tkabadi', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 4, 0),
(6, 1, 'Operator Sekolah SDN 1', 'www.sdn1.com', 'jombang', '123', 'sdn1', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 4, 0),
(7, 7, 'sekolah tk tadika', 'elfa.com', 'qw', '123', 'sekolahtk', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 4, 1),
(9, 10, 'sdn4', 'www.sdn4.com', 'jombang', '123', 'sdn4', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 4, 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `m_peserta_didik`
--
ALTER TABLE `m_peserta_didik`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_peserta_didik_detail`
--
ALTER TABLE `m_peserta_didik_detail`
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
-- Indeks untuk tabel `m_ruang_detail`
--
ALTER TABLE `m_ruang_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_sekolah`
--
ALTER TABLE `m_sekolah`
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
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `m_peserta_didik`
--
ALTER TABLE `m_peserta_didik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `m_peserta_didik_detail`
--
ALTER TABLE `m_peserta_didik_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `m_ptk`
--
ALTER TABLE `m_ptk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `m_roles`
--
ALTER TABLE `m_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `m_ruang`
--
ALTER TABLE `m_ruang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `m_ruang_detail`
--
ALTER TABLE `m_ruang_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `m_sekolah`
--
ALTER TABLE `m_sekolah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `m_tanah_bangunan`
--
ALTER TABLE `m_tanah_bangunan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `m_user`
--
ALTER TABLE `m_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
