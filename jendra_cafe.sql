-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 24 Jul 2023 pada 04.39
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jendra_cafe`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `history`
--

CREATE TABLE `history` (
  `id_history` int(11) NOT NULL,
  `id_pelayanan` varchar(225) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `history`
--

INSERT INTO `history` (`id_history`, `id_pelayanan`, `tgl_transaksi`, `id_user`, `nama_pelanggan`) VALUES
(4, 'f5Ruf', '2023-05-21', 3, 'maska'),
(5, 'aFXS8', '2023-05-21', 3, 'hilmy'),
(6, 'qkehv', '2023-05-22', 3, 'daffa randi'),
(7, 'ewCye', '2023-05-22', 3, 'adit'),
(8, 'eEwxB', '2023-05-24', 7, 'adit'),
(9, 'DnFoU', '2023-05-24', 7, 'lano'),
(10, 'fnr4P', '2023-05-24', 7, 'lano'),
(11, 'z6fHp', '2023-05-24', 7, 'lakun'),
(12, 'awhIF', '2023-05-25', 19, 'jendra');

-- --------------------------------------------------------

--
-- Struktur dari tabel `meja`
--

CREATE TABLE `meja` (
  `id_meja` int(11) NOT NULL,
  `nomor_meja` varchar(100) NOT NULL,
  `status` enum('digunakan','kosong') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `meja`
--

INSERT INTO `meja` (`id_meja`, `nomor_meja`, `status`) VALUES
(9, '1', 'kosong'),
(10, '2', 'kosong'),
(11, '3', 'kosong'),
(12, '4', 'kosong');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `jenis` enum('makanan','minuman') NOT NULL,
  `harga` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `nama`, `jenis`, `harga`, `foto`, `deskripsi`) VALUES
(23, 'kopi tubruk', 'minuman', 10000, '1684890385.jpg', 'wkwk'),
(24, 'makanan dura', 'minuman', 20000, '1684903646.jpg', 'wqueiwq'),
(25, 'dawet', 'minuman', 13332, '1684903554.jpg', '--');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelayanan` varchar(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_menu` int(11) NOT NULL,
  `id_meja` int(11) DEFAULT NULL,
  `nama_pelanggan` varchar(225) DEFAULT NULL,
  `tanggal_pesan` date NOT NULL,
  `total_pesanan` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `status` enum('lunas','belum_lunas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelayanan`, `id_user`, `id_menu`, `id_meja`, `nama_pelanggan`, `tanggal_pesan`, `total_pesanan`, `total_harga`, `status`) VALUES
(15, 'eEwxB', 7, 23, 11, 'adit', '2023-05-24', 2, 20000, 'lunas'),
(16, 'eEwxB', 7, 23, 11, 'adit', '2023-05-24', 1, 10000, 'lunas'),
(17, 'eEwxB', 7, 23, 11, 'adit', '2023-05-24', 1, 10000, 'lunas'),
(18, 'DnFoU', 7, 24, 12, 'lano', '2023-05-24', 2, 40000, 'lunas'),
(19, 'fnr4P', 7, 23, 10, 'lano', '2023-05-24', 1, 10000, 'lunas'),
(20, 'z6fHp', 7, 23, 10, 'lakun', '2023-05-24', 3, 30000, 'lunas'),
(21, 'awhIF', 19, 24, 10, 'jendra', '2023-05-25', 2, 40000, 'lunas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `role` enum('admin','kasir','manajer') NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `role`, `gender`, `username`, `password`) VALUES
(7, 'fahmi', 'kasir', 'P', 'pamboy@gmail.com', '$2y$10$2rtAikPGBS.F9Qb8WzH1b.hoFGdNJT66OLS2kG43X5VXfO79LM1vW'),
(8, 'jendra', 'admin', 'L', 'jje@gmail.com', '$2y$10$0ZTn.21Q8P8z8L3bDmxGRuc8Gi4qFhTbqEEOLCMfBufix/0n45ZTe'),
(9, 'andrew', 'manajer', 'L', 'andrew@gmail.com', '$2y$10$Q0oKuqRVSJfYvwzIInO/pexNWcyt9abihZptfXJ3LtAP6EQ6/K40W'),
(10, 'hilmi', 'manajer', 'P', 'hilmi@gmail.com', '$2y$10$5Mxp/tVjX81JZPqzHuBZCeqjyYDPe9dJmOXR5Y58Jye8iI685SuiC'),
(11, 'jje', 'admin', 'L', 'jje24@gmail.com', '123'),
(12, 'jendra21', 'admin', 'P', 'jje1@gmail.com', '202cb962ac59075b964b07152d234b70'),
(13, 'faiz', 'admin', 'P', 'faiz@gmail.com', '202cb962ac59075b964b07152d234b70'),
(14, 'rai', 'admin', 'L', 'rai@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
(15, 'hilmiy', 'kasir', 'L', 'hilmiy@gmail.com', '202cb962ac59075b964b07152d234b70'),
(16, 'andreww', 'kasir', 'L', 'andreww@gmail.com', '$2y$10$X9gJEkBu5ao9rSIz8Aatfubp2inydLarmGcGBufXMyl3yndvBFKIC'),
(17, 'radya', 'manajer', 'P', 'radya@gmail.com', '$2y$10$K7bSUPCZ7mh5uRZSOgm1qe9KyjkSdYjSe0TNVUqjEDJOMNjpvY17O'),
(18, 'daffa', 'manajer', 'L', 'daffa@gmail.com', '$2y$10$crcJUvXDFxD3EPMgmXyY2e6Lu1URUtgic3WyVczn.qmCRDmgNL.aC'),
(19, 'kasir magang', 'kasir', 'L', 'kasir@gmail.com', '$2y$10$sDb3aMPuTg0SvYDp6iF9O.IgHHOy.omcmT2ol1PbTyw8EITXZwNxi');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_history`);

--
-- Indeks untuk tabel `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`id_meja`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`,`id_menu`,`id_meja`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `meja`
--
ALTER TABLE `meja`
  MODIFY `id_meja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
