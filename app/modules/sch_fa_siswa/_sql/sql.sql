SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `{prefix}sch_kesis_score_group` (
  `id_sch_kesis_score_group` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `{prefix}sch_kesis_score_group` (`id_sch_kesis_score_group`, `group_name`) VALUES
(1, 'Kelakuan'),
(2, 'Kerajinan'),
(3, 'Kerapian'),
(4, 'Penghargaan Akademik'),
(5, 'Penghargaan Non Akademik'),
(6, 'Penghargaan Kepengurusan');

CREATE TABLE IF NOT EXISTS `{prefix}sch_kesis_score_point` (
  `id_sch_kesis_score_point` int(11) NOT NULL,
  `id_sch_kesis_score_group` int(11) NOT NULL,
  `score_name` varchar(255) NOT NULL,
  `point` int(11) NOT NULL,
  `show` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;

INSERT INTO `{prefix}sch_kesis_score_point` (`id_sch_kesis_score_point`, `id_sch_kesis_score_group`, `score_name`, `point`, `show`) VALUES
(1, 1, 'Melepaskan sepatu pada saat jam pelajaran', -1, 0),
(2, 1, 'Duduk dengan kaki diatas bangku/meja', -2, 0),
(3, 1, 'Duduk diatas bangku/meja', -2, 0),
(4, 1, 'Siswa putra memakai gelang/kalung/anting-anting, aksesoris lainnya', -3, 0),
(5, 1, 'Siswa ditatto atau ditindik', -5, 0),
(6, 1, 'Siswa putri ditindik pada kedua telinga lebih dari sepasang', -5, 0),
(7, 1, 'Siswa memakai perhiasan atau "make-up" berlebihan', -3, 0),
(8, 1, 'Makan, minum, menghisap kembang gula pada waktu pembelajaran berlangsung', -3, 0),
(9, 1, 'Mengendarai mobil ke sekolah pada jam efektif', -5, 0),
(10, 1, 'Menyakiti perasaan sesama siswa dan atau melakukan tindakan yang tidak sopan', -25, 0),
(11, 1, 'Melakukan pelecehan seksual', -75, 0),
(12, 1, 'Menggunakan walkman/HP/MP3player/gadget dan alat permainan/alat komunikasi lainnya yang tidak ada hubungannya dengan pembelajaran saat KBM atau upacara berlangsung', -5, 0),
(13, 1, 'Meminjamkan HP dan alat komunikasi lainnya kepada teman saat KBM/Upacara', -5, 0),
(14, 1, 'Menyimpan dan atau membawa dan atau melihat gambar porno pada media elektronika maupun non-elektronik', -50, 0),
(15, 1, 'Penyalahgunaan jam pembelajaran untuk makan minum di kantin atau untuk bermain', -5, 0),
(16, 1, 'Penyalahgunaan fasilitas sekolah yang tidak sesuai dengan peruntukannya', -5, 0),
(17, 1, 'Menyontek/memberi dan atau menerima bantuan pada saat ulangan atau uji kompetensi', -20, 0),
(18, 1, 'Membuat kegaduhan di dalam kelas dan lingkungan sekolah pada waktu pembelajaran', -10, 0),
(19, 1, 'Mengotori, mencoret-coret, merusak fasilitas milik sekolah atau pihak lain', -10, 0),
(20, 1, 'Memindahkan fasilitas milik sekolah atau pihak lain', -30, 0),
(21, 1, 'Membuang sampah sembarangan', -5, 0),
(22, 1, 'Membawa, menghisap rokok di lingkungan sekolah', -25, 0),
(23, 1, 'Mengancam/mengintimidasi/bermusuhan sesama siswa secara individu didalam atau diluar sekolah', -25, 0),
(24, 1, 'Mengancam/mengintimidasi/bermusuhan sesama siswa secara berkemlompok didalam atau diluar sekolah', -50, 0),
(25, 1, 'membawa dan menjualbelikan buku, majalah, stensil, kaset, CD, foto dan film porno, alat kontrasepsi dan sejenisnya di lingkungan sekolah', -50, 0),
(26, 1, 'Mengancam kepala sekolah, guru dan karyawan', -101, 0),
(27, 1, 'Menjadi provokator perkelahian', -50, 0),
(28, 1, 'Melakukan pacaran di sekolah', -50, 0),
(29, 1, 'Mencuri', -101, 0),
(30, 1, 'Mengompas, memalsu tanda tangan, melakukan tindakan perjudian dalam bentuk apapun', -60, 0),
(31, 1, 'Menjual dan atau membeli bocoran soal', -75, 0),
(32, 1, 'Membawa senjata tajam tanpa ijin', -75, 0),
(33, 1, 'Berkelahi antar siswa dalam satu sekolah secara individu', -75, 0),
(34, 1, 'Berkelahi antar siswa dalam satu sekolah secara kelompok', -75, 0),
(35, 1, 'Berkelahi antar siswa dalam satu sekolah dengan melibatkan pihak luar secara individu', -75, 0),
(36, 1, 'Berkelahi antar siswa dalam satu sekolah dengan melibatkan pihak luar secara berkelompok', -101, 0),
(37, 1, 'Berkelahi dengan siswa sekolah lain', -101, 0),
(38, 1, 'Berkelahi melawan siswa sekolah lain yang menyeram', -25, 0),
(39, 1, 'Menggunakan senjata tajam atau senjata api untuk mengancam, melukai orang lain', -101, 0),
(40, 1, 'Membawa, mengkonsumsi dan mengeroyok kepala sekolah, guru dan karyawan', -101, 0),
(41, 1, 'Menganiaya dan atau mengeroyok kepala sekolah, guru dan karyawan', -101, 0),
(42, 1, 'Siswa berpacaran sampai hamil', -101, 0),
(43, 1, 'Siswa putra berpacaran sampai pacarnya hamil', -101, 0),
(44, 1, 'Mencuri barang yang bernilai', -75, 0),
(45, 2, 'Terlambat masuk jam pertama kurang dari sepuluh menit', -2, 0),
(46, 2, 'Terlambat masuk jam pertama lebih dari sepuluh menit setelah bel berbunyi', -3, 0),
(47, 2, 'Terlambat masuk ketika pergantian jam pelajaran', -3, 0),
(48, 2, 'Tidak melaksanakan piket kelas', -3, 0),
(49, 2, 'Terlambat masuk setelah jam istirahat', -4, 0),
(50, 2, 'Tidak berangkat extrakurikuler wajib/pilihan tanpa keterangan', -4, 0),
(51, 2, 'Tidak masuk tanpa keterangan', -5, 0),
(52, 2, 'Membolos/tidak ikut pelajaran dan atau kegiatan sekolah', -10, 0),
(53, 2, 'Tidak masuk dengan keterangan palsu', -20, 0),
(54, 2, 'Terlambat mengikuti upacara/apel', -10, 0),
(55, 2, 'Tidak mengikuti upacara/apel', -20, 0),
(56, 2, 'Tidak masuk selama tiga hari berturut-turut tanpa keterangan', -20, 0),
(57, 3, 'Baju lengan panjang dilipat', -2, 0),
(58, 3, 'Kancing baju/lengan tidak dikancingkan', -2, 0),
(59, 3, 'Tidak memakai bedge/attribute', -2, 0),
(60, 3, 'Bedge/attribute sekolah diberi warna-warni', -2, 0),
(61, 3, 'Tidak memakai kaos kaki putih pada hari senin dan upacara bendera/apel', -2, 0),
(62, 3, 'Berkuku panjang dan atau dicat', -2, 0),
(63, 3, 'Celana/rok sekolah yang ujungnya melebihi panjang kaki', -2, 0),
(64, 3, 'Celana/rok sekolah yang ujungnya tidak dijahit', -2, 0),
(65, 3, 'Baju/rok ketat dan atau penjangnya tidak sesuai dengan ketentuan sekolah', -2, 0),
(66, 3, 'Warna jilbab tidak polos atau sesuai dengan ketentuan sekolah atau ujung jilbab tidak dipanjangkan', -2, 0),
(67, 3, 'Rambut siswa putri keluar dari jilbab', -2, 0),
(68, 3, 'Siswa putra/putri tidak memakai ikat pinggang', -2, 0),
(69, 3, 'Ikat pinggang tidak berwana hitam', -2, 0),
(70, 3, 'Memakai seragam yang tidak sesuai ketentuan', -3, 0),
(71, 3, 'Mengenakan model seragam sendiri atau menggunakan bahan dan atau warna yang tidak sesuai dengan ketentuan sekolah', -5, 0),
(72, 3, 'Memasang hansaplast dan sejenisnya pada baju/celana seragam sekolah', -5, 0),
(73, 3, 'Memakai sepatu sandal', -5, 0),
(74, 3, 'Tas ada grafiti "seronol"', -5, 0),
(75, 3, 'Tidak memakai seragam olahraga sekolah', -5, 0),
(76, 3, 'Baju siswa tidak dimasukkan', -2, 0),
(77, 3, 'Celana/rok baju seragam sekolah ada grafiti/gambar/tulisan, kumal, sobek', -5, 0),
(78, 3, 'Rambut panjang (putra) dan atau dicat dan atau potongan tidak rapi', -5, 0),
(79, 3, 'Memakai sepatu selain warna hitam pada hari senin dan upacara bendera', -5, 0),
(80, 3, 'Siswa mengoperasikan dan mengaktifkan phone cell saat jam pembelajaran efektif berlangsung', -25, 0),
(81, 4, 'Juara I paralel di kelas', 20, 1),
(82, 4, 'Juara II paralel di kelas', 15, 1),
(83, 4, 'Juara III paralel di kelas', 10, 1),
(84, 4, 'Juara I lomba antar sekolah tingkat kota', 20, 1),
(85, 4, 'Juara II lomba antar sekolah tingkat kota', 15, 1),
(86, 4, 'Juara III lomba antar sekolah tingkat kota', 10, 1),
(87, 4, 'Juara I lomba antar sekolah tingkat propinsi', 30, 1),
(88, 4, 'Juara II lomba antar sekolah tingkat propinsi', 25, 1),
(89, 4, 'Juara III lomba antar sekolah tingkat propinsi', 20, 1),
(90, 4, 'Juara I lomba antar sekolah tingkat regional', 40, 1),
(91, 4, 'Juara II lomba antar sekolah tingkat regional', 30, 1),
(92, 4, 'Juara III lomba antar sekolah tingkat regional', 25, 1),
(93, 4, 'Juara I lomba antar sekolah tingkat nasional', 50, 1),
(94, 4, 'Juara II lomba antar sekolah tingkat nasional', 40, 1),
(95, 4, 'Juara III lomba antar sekolah tingkat nasional', 30, 1),
(96, 4, 'Juara I Internasional', 80, 1),
(97, 4, 'Juara II Internasional', 70, 1),
(98, 4, 'Juara III Internasional', 60, 1),
(99, 4, 'Siswa yang mewakili sekolah walaupun tidak mendapat juara tingkat kota', 5, 0),
(100, 4, 'Siswa yang mewakili sekolah walaupun tidak mendapat juara tingkat propinsi', 7, 0),
(101, 4, 'Siswa yang mewakili sekolah walaupun tidak mendapat juara tingkat regional', 9, 0),
(102, 4, 'Siswa yang mewakili sekolah walaupun tidak mendapat juara tingkat nasional', 10, 0),
(103, 5, 'Juara I kelompok lomba antar sekolah tingkat kota', 20, 1),
(104, 5, 'Juara II kelompok lomba antar sekolah tingkat kota', 15, 1),
(105, 5, 'Juara III kelompok lomba antar sekolah tingkat kota', 10, 1),
(106, 5, 'Juara I perorangan lomba antar sekolah tingkat kota', 20, 1),
(107, 5, 'Juara II perorangan lomba antar sekolah tingkat kota', 15, 1),
(108, 5, 'Juara III perorangan lomba antar sekolah tingkat kota', 10, 1),
(109, 5, 'Juara I lomba antar sekolah tingkat propinsi', 30, 1),
(110, 5, 'Juara II lomba antar sekolah tingkat propinsi', 20, 1),
(111, 5, 'Juara III lomba antar sekolah tingkat propinsi', 10, 1),
(112, 5, 'Juara I lomba antar sekolah tingkat regional', 50, 1),
(113, 5, 'Juara II lomba antar sekolah tingkat regional', 40, 1),
(114, 5, 'Juara III lomba antar sekolah tingkat regional', 30, 1),
(115, 5, 'Juara I lomba antar sekolah tingkat nasional', 60, 1),
(116, 5, 'Juara II lomba antar sekolah tingkat nasional', 50, 1),
(117, 5, 'Juara III lomba antar sekolah tingkat nasional', 40, 1),
(118, 5, 'Siswa yang mewakili sekolah walaupun tidak juara tingkat kota', 5, 0),
(119, 5, 'Siswa yang mewakili sekolah walaupun tidak juara tingkat propinsi', 10, 0),
(120, 5, 'Siswa yang mewakili sekolah walaupun tidak juara tingkat nasional', 15, 0),
(121, 5, 'Khotib Jum''at atau pengajian atau berceramah kegiatan keagamaan lainnya di sekolah', 5, 0),
(122, 5, 'Berpartisipasi aktif dalam pengabdian masyarakat/social worker', 5, 0),
(123, 6, 'Ketua Umum/Ketua MPK (dalam OSIS)', 10, 0),
(124, 6, 'Wakil Ketua, Bendahara, Sekretaris (dalam OSIS)', 7, 0),
(125, 6, 'Koordinator Seksi (dalam OSIS)', 5, 0),
(126, 6, 'Anggota (dalam OSIS)', 3, 0),
(127, 6, 'Ketua Panitia Kegiatan OS/S', 7, 0),
(128, 6, 'Wakil Ketua, Bendahara, Sekretaris Kegiatan OS/S', 5, 0),
(129, 6, 'Koordinator Seksi Kegiatan OS/S', 4, 0),
(130, 6, 'Anggota Kegiatan OS/S', 3, 0),
(131, 6, 'Ketua Kelas', 5, 0),
(132, 6, 'Wakil Ketua, Bendahara, Sekretaris Kelas', 3, 0),
(133, 6, 'Koordinator 7K', 2, 0),
(134, 6, 'Menciptakan hasil karya bagi sekolah', 40, 0);

CREATE TABLE IF NOT EXISTS `{prefix}sch_kesis_score_result` (
  `id_sch_kesis_score_result` int(11) NOT NULL,
  `id_sch_kesis_score_result_group` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `huruf` varchar(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `{prefix}sch_kesis_score_result` (`id_sch_kesis_score_result`, `id_sch_kesis_score_result_group`, `keterangan`, `huruf`) VALUES
(1, 5, 'Cukup', 'C'),
(2, 6, 'Baik', 'B'),
(3, 7, 'Sangat Baik', 'A'),
(4, 1, 'Sangat Baik', 'A'),
(5, 2, 'Baik', 'B'),
(6, 3, 'Cukup', 'C'),
(8, 4, 'Kurang', 'D');

CREATE TABLE IF NOT EXISTS `{prefix}sch_kesis_score_result_group` (
  `id_sch_kesis_score_result_group` int(11) NOT NULL,
  `point` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `{prefix}sch_kesis_score_result_group` (`id_sch_kesis_score_result_group`, `point`) VALUES
(1, -20),
(2, -50),
(3, -75),
(4, -100),
(5, 29),
(6, 59),
(7, 1000);

CREATE TABLE IF NOT EXISTS `{prefix}sch_kesis_tindakan_group` (
  `id_sch_kesis_tindakan_group` int(11) NOT NULL,
  `to_point` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

INSERT INTO `{prefix}sch_kesis_tindakan_group` (`id_sch_kesis_tindakan_group`, `to_point`) VALUES
(1, -15),
(2, -30),
(3, -60),
(4, -80),
(5, -100),
(6, -1000);

CREATE TABLE IF NOT EXISTS `{prefix}sch_kesis_tindakan_point` (
  `id_sch_kesis_tindakan_point` int(11) NOT NULL,
  `id_sch_kesis_tindakan_group` int(11) NOT NULL,
  `tindakan` text
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO `{prefix}sch_kesis_tindakan_point` (`id_sch_kesis_tindakan_point`, `id_sch_kesis_tindakan_group`, `tindakan`) VALUES
(1, 1, 'Pembinaan langsung oleh guru'),
(2, 2, 'Pembinaan langsung oleh guru dan wali kelas'),
(3, 3, 'Pembinaan oleh wali kelas dan BK'),
(4, 3, 'Surat pernyataan secara tertulis'),
(5, 4, 'Orang tua dipanggil / Home visit'),
(6, 4, 'Skoring selama 2 hari dan pernyataan tertulis diatas kertas bermaterai'),
(7, 5, 'Orang tua dipanggil'),
(8, 5, 'Skoring selama 6 hari'),
(9, 5, 'Pernyataan tertulis diatas kertas bermaterai'),
(10, 6, 'Dirapatkan dengan manajemen sekolah');

CREATE TABLE IF NOT EXISTS `{prefix}sch_kesis_tindakan_siswa` (
  `id_sch_kesis_tindakan_siswa` int(11) NOT NULL,
  `id_sch_siswa` int(11) NOT NULL,
  `id_users` int(11) DEFAULT NULL,
  `id_sch_pegawai` int(11) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `id_sch_set_ta` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kesis_tindakan_siswa_list` (
  `id_sch_kesis_tindakan_siswa_list` int(11) NOT NULL,
  `id_sch_kesis_tindakan_siswa` int(11) NOT NULL,
  `id_sch_kesis_score_point` int(11) DEFAULT NULL,
  `point` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `{prefix}sch_kesis_score_group`
  ADD PRIMARY KEY (`id_sch_kesis_score_group`);

ALTER TABLE `{prefix}sch_kesis_score_point`
  ADD PRIMARY KEY (`id_sch_kesis_score_point`),
  ADD KEY `sch_kesis_score_point_sch_kesis_score_group` (`id_sch_kesis_score_group`);

ALTER TABLE `{prefix}sch_kesis_score_result`
  ADD PRIMARY KEY (`id_sch_kesis_score_result`),
  ADD KEY `sch_kesis_score_result_sch_kesis_score_result_group` (`id_sch_kesis_score_result_group`);

ALTER TABLE `{prefix}sch_kesis_score_result_group`
  ADD PRIMARY KEY (`id_sch_kesis_score_result_group`);

ALTER TABLE `{prefix}sch_kesis_tindakan_group`
  ADD PRIMARY KEY (`id_sch_kesis_tindakan_group`);

ALTER TABLE `{prefix}sch_kesis_tindakan_point`
  ADD PRIMARY KEY (`id_sch_kesis_tindakan_point`),
  ADD KEY `sch_kesis_tindakan_point_sch_kesis_tindakan_group` (`id_sch_kesis_tindakan_group`);

ALTER TABLE `{prefix}sch_kesis_tindakan_siswa`
  ADD PRIMARY KEY (`id_sch_kesis_tindakan_siswa`),
  ADD KEY `sch_kesis_tindakan_siswa_sch_pegawai` (`id_sch_pegawai`),
  ADD KEY `sch_kesis_tindakan_siswa_sch_siswa` (`id_sch_siswa`),
  ADD KEY `sch_kesis_tindakan_siswa_users` (`id_users`),
  ADD KEY `sch_kesis_tindakan_siswa_sch_set_ta` (`id_sch_set_ta`);

ALTER TABLE `{prefix}sch_kesis_tindakan_siswa_list`
  ADD PRIMARY KEY (`id_sch_kesis_tindakan_siswa_list`),
  ADD KEY `sch_kesis_tindakan_siswa_list_sch_kesis_score_point` (`id_sch_kesis_score_point`),
  ADD KEY `sch_kesis_tindakan_siswa_list_sch_kesis_tindakan_siswa` (`id_sch_kesis_tindakan_siswa`);


ALTER TABLE `{prefix}sch_kesis_score_group`
  MODIFY `id_sch_kesis_score_group` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
ALTER TABLE `{prefix}sch_kesis_score_point`
  MODIFY `id_sch_kesis_score_point` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=135;
ALTER TABLE `{prefix}sch_kesis_score_result`
  MODIFY `id_sch_kesis_score_result` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
ALTER TABLE `{prefix}sch_kesis_score_result_group`
  MODIFY `id_sch_kesis_score_result_group` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
ALTER TABLE `{prefix}sch_kesis_tindakan_group`
  MODIFY `id_sch_kesis_tindakan_group` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
ALTER TABLE `{prefix}sch_kesis_tindakan_point`
  MODIFY `id_sch_kesis_tindakan_point` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
ALTER TABLE `{prefix}sch_kesis_tindakan_siswa`
  MODIFY `id_sch_kesis_tindakan_siswa` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `{prefix}sch_kesis_tindakan_siswa_list`
  MODIFY `id_sch_kesis_tindakan_siswa_list` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `{prefix}sch_kesis_score_point`
  ADD CONSTRAINT `sch_kesis_score_point_sch_kesis_score_group` FOREIGN KEY (`id_sch_kesis_score_group`) REFERENCES `{prefix}sch_kesis_score_group` (`id_sch_kesis_score_group`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kesis_score_result`
  ADD CONSTRAINT `sch_kesis_score_result_sch_kesis_score_result_group` FOREIGN KEY (`id_sch_kesis_score_result_group`) REFERENCES `{prefix}sch_kesis_score_result_group` (`id_sch_kesis_score_result_group`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kesis_tindakan_point`
  ADD CONSTRAINT `sch_kesis_tindakan_point_sch_kesis_tindakan_group` FOREIGN KEY (`id_sch_kesis_tindakan_group`) REFERENCES `{prefix}sch_kesis_tindakan_group` (`id_sch_kesis_tindakan_group`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kesis_tindakan_siswa`
  ADD CONSTRAINT `sch_kesis_tindakan_siswa_sch_pegawai` FOREIGN KEY (`id_sch_pegawai`) REFERENCES `{prefix}sch_pegawai` (`id_sch_pegawai`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kesis_tindakan_siswa_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kesis_tindakan_siswa_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa` (`id_sch_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kesis_tindakan_siswa_users` FOREIGN KEY (`id_users`) REFERENCES `{prefix}users` (`id_users`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kesis_tindakan_siswa_list`
  ADD CONSTRAINT `sch_kesis_tindakan_siswa_list_sch_kesis_score_point` FOREIGN KEY (`id_sch_kesis_score_point`) REFERENCES `{prefix}sch_kesis_score_point` (`id_sch_kesis_score_point`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kesis_tindakan_siswa_list_sch_kesis_tindakan_siswa` FOREIGN KEY (`id_sch_kesis_tindakan_siswa`) REFERENCES `{prefix}sch_kesis_tindakan_siswa` (`id_sch_kesis_tindakan_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

SET FOREIGN_KEY_CHECKS=1;

