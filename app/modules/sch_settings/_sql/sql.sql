SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_ajar` (
  `id_sch_kur_ajar` int(11) NOT NULL AUTO_INCREMENT,
  `kode_ajar` varchar(8) NOT NULL,
  `id_sch_pegawai` int(11) NOT NULL,
  `id_sch_kur_mapel` int(11) NOT NULL,
  PRIMARY KEY (`id_sch_kur_ajar`),
  UNIQUE KEY `kode_ajar` (`kode_ajar`),
  UNIQUE KEY `id_sch_pegawai` (`id_sch_pegawai`,`id_sch_kur_mapel`),
  KEY `sch_kur_ajar_sch_kur_mapel` (`id_sch_kur_mapel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_ekskul` (
  `id_sch_kur_ekskul` int(11) NOT NULL AUTO_INCREMENT,
  `ekskul_nama` varchar(255) NOT NULL,
  `id_sch_pegawai` int(11) NOT NULL,
  PRIMARY KEY (`id_sch_kur_ekskul`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_ekskul_narasi` (
  `id_sch_set_ta` int(11) NOT NULL,
  `id_sch_kur_ekskul` int(11) NOT NULL,
  `index` int(11) NOT NULL,
  `narasi` text,
  UNIQUE KEY `id_sch_set_ta` (`id_sch_set_ta`,`index`,`id_sch_kur_ekskul`),
  KEY `sch_kur_ekskul_narasi_sch_kur_ekskul` (`id_sch_kur_ekskul`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_ekskul_siswa` (
  `id_sch_set_ta` int(11) NOT NULL,
  `id_sch_kur_ekskul` int(11) NOT NULL,
  `id_sch_siswa` int(11) NOT NULL,
  UNIQUE KEY `id_sch_set_ta` (`id_sch_set_ta`,`id_sch_kur_ekskul`,`id_sch_siswa`),
  KEY `sch_kur_ekskul_siswa_sch_kur_ekskul` (`id_sch_kur_ekskul`),
  KEY `sch_kur_ekskul_siswa_sch_siswa` (`id_sch_siswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_hadir` (
  `id_sch_set_ta` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `id_sch_siswa` int(11) NOT NULL,
  `sakit` int(11) DEFAULT NULL,
  `ijin` int(11) DEFAULT NULL,
  `tanpa` int(11) DEFAULT NULL,
  UNIQUE KEY `id_sch_set_ta` (`id_sch_set_ta`,`semester`,`id_sch_siswa`),
  KEY `sch_kur_hadir_sch_siswa` (`id_sch_siswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_mapel` (
  `id_sch_kur_mapel` int(11) NOT NULL AUTO_INCREMENT,
  `id_sch_kur_mapel_group` int(11) DEFAULT NULL,
  `kode` varchar(255) NOT NULL,
  `mapel_nama` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id_sch_kur_mapel`),
  UNIQUE KEY `kode` (`kode`),
  KEY `sch_kur_mapel_sch_kur_mapel_group` (`id_sch_kur_mapel_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_mapel_group` (
  `id_sch_kur_mapel_group` int(11) NOT NULL AUTO_INCREMENT,
  `group_nama` varchar(255) NOT NULL,
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id_sch_kur_mapel_group`),
  UNIQUE KEY `group_nama` (`group_nama`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_mapel_jamkelas` (
  `id_sch_set_ta` int(11) NOT NULL,
  `semester` int(11) DEFAULT NULL,
  `id_sch_kur_ajar` int(11) NOT NULL,
  `id_sch_set_kelas` int(11) NOT NULL,
  `jam` int(11) DEFAULT NULL,
  UNIQUE KEY `id_sch_kur_ajar` (`id_sch_kur_ajar`,`id_sch_set_kelas`,`id_sch_set_ta`,`semester`),
  KEY `sch_kur_mapel_jamkelas_sch_set_kelas` (`id_sch_set_kelas`),
  KEY `sch_kur_mapel_jamkelas_sch_set_ta` (`id_sch_set_ta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_mapel_kkm` (
  `id_sch_kur_mapel_kkm` int(11) NOT NULL AUTO_INCREMENT,
  `id_sch_set_ta` int(11) NOT NULL,
  `id_sch_kur_mapel` int(11) NOT NULL,
  `kkm` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_sch_kur_mapel_kkm`),
  UNIQUE KEY `id_sch_set_ta` (`id_sch_set_ta`,`id_sch_kur_mapel`),
  KEY `sch_kur_mapel_kkm_sch_kur_mapel` (`id_sch_kur_mapel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_mapel_narasi` (
  `id_sch_set_ta` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `kelas` int(11) NOT NULL,
  `id_sch_set_jurusan` int(11) NOT NULL,
  `id_sch_kur_mapel` int(11) NOT NULL,
  `id_sch_set_unsurnilai` int(11) NOT NULL,
  `index` int(11) NOT NULL,
  `narasi` text,
  UNIQUE KEY `id_sch_set_ta` (`id_sch_set_ta`,`id_sch_kur_mapel`,`id_sch_set_unsurnilai`,`index`,`semester`,`kelas`,`id_sch_set_jurusan`),
  KEY `sch_kur_mapel_narasi_sch_kur_mapel` (`id_sch_kur_mapel`),
  KEY `sch_kur_mapel_narasi_sch_set_unsurnilai` (`id_sch_set_unsurnilai`),
  KEY `sch_kur_mapel_narasi_sch_set_jurusan` (`id_sch_set_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_nilai_ekskul` (
  `id_sch_set_ta` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `id_sch_siswa` int(11) NOT NULL,
  `id_sch_kur_ekskul` int(11) NOT NULL,
  `nilai` int(11) DEFAULT NULL,
  UNIQUE KEY `id_sch_set_ta` (`id_sch_set_ta`,`semester`,`id_sch_siswa`,`id_sch_kur_ekskul`),
  KEY `sch_kur_nilai_ekskul_sch_siswa` (`id_sch_siswa`),
  KEY `sch_kur_nilai_ekskul_sch_kur_ekskul` (`id_sch_kur_ekskul`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_nilai_uas` (
  `id_sch_set_ta` int(11) NOT NULL AUTO_INCREMENT,
  `semester` int(11) NOT NULL,
  `id_sch_siswa` int(11) NOT NULL,
  `id_sch_kur_mapel` int(11) NOT NULL,
  `id_sch_set_unsurnilai` int(11) NOT NULL,
  `nilai` decimal(5,2) DEFAULT NULL,
  UNIQUE KEY `id_sch_set_ta` (`id_sch_set_ta`,`semester`,`id_sch_siswa`,`id_sch_kur_mapel`,`id_sch_set_unsurnilai`),
  KEY `sch_kur_nilai_uas_sch_siswa` (`id_sch_siswa`),
  KEY `sch_kur_nilai_uas_sch_kur_mapel` (`id_sch_kur_mapel`),
  KEY `sch_kur_nilai_uas_sch_set_unsurnilai` (`id_sch_set_unsurnilai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_nilai_uh` (
  `id_sch_set_ta` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `id_sch_siswa` int(11) NOT NULL,
  `id_sch_kur_mapel` int(11) NOT NULL,
  `ke` int(11) NOT NULL,
  `id_sch_set_unsurnilai` INT NOT NULL,
  `nilai` decimal(5,1) DEFAULT NULL,
  UNIQUE KEY `id_sch_set_ta` (`id_sch_set_ta`, `semester`, `id_sch_siswa`, `id_sch_kur_mapel`, `ke`, `id_sch_set_unsurnilai`),
  KEY `sch_kur_nilai_uh_sch_siswa` (`id_sch_siswa`),
  KEY `sch_kur_nilai_uh_sch_kur_mapel` (`id_sch_kur_mapel`),
  KEY `sch_kur_nilai_uh_sch_set_unsurnilai` (`id_sch_set_unsurnilai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_nilai_uts` (
  `id_sch_set_ta` int(11) NOT NULL AUTO_INCREMENT,
  `semester` int(11) NOT NULL,
  `id_sch_siswa` int(11) NOT NULL,
  `id_sch_kur_mapel` int(11) NOT NULL,
  `id_sch_set_unsurnilai` int(11) NOT NULL,
  `nilai` decimal(5,2) DEFAULT NULL,
  UNIQUE KEY `id_sch_set_ta` (`id_sch_set_ta`,`semester`,`id_sch_siswa`,`id_sch_kur_mapel`,`id_sch_set_unsurnilai`),
  KEY `sch_kur_nilai_uts_sch_siswa` (`id_sch_siswa`),
  KEY `sch_kur_nilai_uts_sch_kur_mapel` (`id_sch_kur_mapel`),
  KEY `sch_kur_nilai_uts_sch_set_unsurnilai` (`id_sch_set_unsurnilai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_raport_date` (
  `id_sch_set_ta` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `type` enum('mid','semester') NOT NULL DEFAULT 'semester',
  `date` date DEFAULT NULL,
  UNIQUE KEY `id_sch_set_ta` (`id_sch_set_ta`,`semester`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_raport_note` (
  `id_sch_set_ta` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `id_sch_siswa` int(11) NOT NULL,
  `note` text,
  `kenaikan` enum('lulus','naik','tinggal') DEFAULT NULL,
  UNIQUE KEY `id_sch_set_ta` (`id_sch_set_ta`,`semester`,`id_sch_siswa`),
  KEY `sch_kur_raport_note_sch_siswa` (`id_sch_siswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_pegawai` (
  `id_sch_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `pegawai_type` enum('guru','karyawan') DEFAULT 'guru',
  `nip` varchar(25) DEFAULT NULL,
  `pegawai_nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `kelurahan` varchar(50) NOT NULL,
  `kecamatan` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `kode_pos` varchar(10) NOT NULL,
  `telp` varchar(20) DEFAULT NULL COMMENT 'telepon rumah',
  `phone` varchar(20) DEFAULT NULL COMMENT 'telepon mobile',
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `agama` varchar(20) DEFAULT 'islam',
  `status` enum('aktif','pindah','pensiun','keluar') DEFAULT 'aktif',
  PRIMARY KEY (`id_sch_pegawai`),
  UNIQUE KEY `nip` (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_set_jurusan` (
  `id_sch_set_jurusan` int(11) NOT NULL AUTO_INCREMENT,
  `jurusan_kode` varchar(5) DEFAULT NULL,
  `jurusan_nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id_sch_set_jurusan`),
  UNIQUE KEY `jurusan_nama` (`jurusan_nama`),
  UNIQUE KEY `jurusan_kode` (`jurusan_kode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_set_kelas` (
  `id_sch_set_kelas` int(11) NOT NULL AUTO_INCREMENT,
  `id_sch_set_jurusan` int(11) DEFAULT NULL,
  `kelas` int(2) NOT NULL,
  `kelas_nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id_sch_set_kelas`),
  UNIQUE KEY `kelas_nama` (`kelas_nama`),
  KEY `sch_set_kelas_sch_set_jurusan` (`id_sch_set_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_set_kelas_wali` (
  `id_sch_set_kelas_wali` int(11) NOT NULL AUTO_INCREMENT,
  `id_sch_set_ta` int(11) NOT NULL,
  `id_sch_set_kelas` int(11) NOT NULL,
  `id_sch_pegawai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sch_set_kelas_wali`),
  UNIQUE KEY `id_sch_set_ta_id_sch_set_kelas` (`id_sch_set_ta`,`id_sch_set_kelas`),
  KEY `sch_set_kelas_wali_sch_set_kelas` (`id_sch_set_kelas`),
  KEY `sch_set_kelas_wali_sch_pegawai` (`id_sch_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_set_org` (
  `id_sch_set_org` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id_sch_set_org`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_set_org_data` (
  `id_sch_set_org_data` int(11) NOT NULL AUTO_INCREMENT,
  `id_sch_set_org` int(11) NOT NULL,
  `id_sch_pegawai` int(11) NOT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL,
  PRIMARY KEY (`id_sch_set_org_data`),
  KEY `sch_set_org_data_sch_pegawai` (`id_sch_pegawai`),
  KEY `sch_set_org_data_sch_set_org` (`id_sch_set_org`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_set_ta` (
  `id_sch_set_ta` int(11) NOT NULL AUTO_INCREMENT,
  `start` year(4) NOT NULL,
  `finish` year(4) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_sch_set_ta`),
  UNIQUE KEY `start` (`start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_set_unsurnilai` (
  `id_sch_set_unsurnilai` int(11) NOT NULL AUTO_INCREMENT,
  `unsur_nama` varchar(30) NOT NULL,
  `is_num` tinyint(1) DEFAULT '1',
  `active` tinyint(1) DEFAULT '0',
  `order` int(11) DEFAULT '0',
  PRIMARY KEY (`id_sch_set_unsurnilai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_siswa` (
  `id_sch_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `nis` varchar(25) DEFAULT NULL,
  `nisn` varchar(25) DEFAULT NULL,
  `siswa_nama` varchar(50) NOT NULL,
  `kelamin` enum('L','P') DEFAULT 'L',
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `agama` varchar(20) DEFAULT 'islam',
  `alamat` text NOT NULL,
  `telp` varchar(20) DEFAULT NULL COMMENT 'telepon rumah',
  `phone` varchar(20) DEFAULT NULL COMMENT 'telepon mobile',
  `ayah_nama` varchar(50) NOT NULL,
  `ibu_nama` varchar(50) NOT NULL,
  `wali_nama` varchar(50) DEFAULT NULL,
  `who_ttd` enum('1','2','3') DEFAULT '1' COMMENT '1: ayah   2: ibu   3: wali',
  `status` enum('aktif','lulus','pindah','keluar') DEFAULT 'aktif',
  PRIMARY KEY (`id_sch_siswa`),
  UNIQUE KEY `nis` (`nis`),
  UNIQUE KEY `nisn` (`nisn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_siswa_kelas` (
  `id_sch_set_ta` int(11) NOT NULL,
  `id_sch_set_kelas` int(11) NOT NULL,
  `id_sch_siswa` int(11) NOT NULL,
  UNIQUE KEY `id_sch_set_ta_id_sch_siswa` (`id_sch_set_ta`,`id_sch_siswa`),
  KEY `sch_siswa_kelas_history_sch_set_kelas` (`id_sch_set_kelas`),
  KEY `sch_siswa_kelas_history_sch_siswa` (`id_sch_siswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `{prefix}sch_siswa_kelas_dist` (
  `id_sch_set_kelas` int(11) NOT NULL,
  `id_sch_siswa` int(11) NOT NULL,
  UNIQUE KEY `id_sch_siswa` (`id_sch_siswa`),
  KEY `sch_siswa_kelas_sch_set_kelas` (`id_sch_set_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE `{prefix}sch_kur_ajar`
  ADD CONSTRAINT `sch_kur_ajar_sch_kur_mapel` FOREIGN KEY (`id_sch_kur_mapel`) REFERENCES `{prefix}sch_kur_mapel` (`id_sch_kur_mapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_ajar_sch_pegawai` FOREIGN KEY (`id_sch_pegawai`) REFERENCES `{prefix}sch_pegawai` (`id_sch_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kur_ekskul_narasi`
  ADD CONSTRAINT `sch_kur_ekskul_narasi_sch_kur_ekskul` FOREIGN KEY (`id_sch_kur_ekskul`) REFERENCES `{prefix}sch_kur_ekskul` (`id_sch_kur_ekskul`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_ekskul_narasi_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kur_ekskul_siswa`
  ADD CONSTRAINT `sch_kur_ekskul_siswa_sch_kur_ekskul` FOREIGN KEY (`id_sch_kur_ekskul`) REFERENCES `{prefix}sch_kur_ekskul` (`id_sch_kur_ekskul`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_ekskul_siswa_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_ekskul_siswa_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa` (`id_sch_siswa`) ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kur_hadir`
  ADD CONSTRAINT `sch_kur_hadir_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_hadir_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa` (`id_sch_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kur_mapel`
  ADD CONSTRAINT `sch_kur_mapel_sch_kur_mapel_group` FOREIGN KEY (`id_sch_kur_mapel_group`) REFERENCES `{prefix}sch_kur_mapel_group` (`id_sch_kur_mapel_group`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kur_mapel_jamkelas`
  ADD CONSTRAINT `sch_kur_mapel_jamkelas_sch_kur_ajar` FOREIGN KEY (`id_sch_kur_ajar`) REFERENCES `{prefix}sch_kur_ajar` (`id_sch_kur_ajar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_mapel_jamkelas_sch_set_kelas` FOREIGN KEY (`id_sch_set_kelas`) REFERENCES `{prefix}sch_set_kelas` (`id_sch_set_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_mapel_jamkelas_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kur_mapel_kkm`
  ADD CONSTRAINT `sch_kur_mapel_kkm_sch_kur_mapel` FOREIGN KEY (`id_sch_kur_mapel`) REFERENCES `{prefix}sch_kur_mapel` (`id_sch_kur_mapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_mapel_kkm_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kur_mapel_narasi`
  ADD CONSTRAINT `sch_kur_mapel_narasi_sch_kur_mapel` FOREIGN KEY (`id_sch_kur_mapel`) REFERENCES `{prefix}sch_kur_mapel` (`id_sch_kur_mapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_mapel_narasi_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_mapel_narasi_sch_set_unsurnilai` FOREIGN KEY (`id_sch_set_unsurnilai`) REFERENCES `{prefix}sch_set_unsurnilai` (`id_sch_set_unsurnilai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_mapel_narasi_sch_set_jurusan` FOREIGN KEY (`id_sch_set_jurusan`) REFERENCES `{prefix}sch_set_jurusan` (`id_sch_set_jurusan`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kur_nilai_ekskul`
  ADD CONSTRAINT `sch_kur_nilai_ekskul_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_nilai_ekskul_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa` (`id_sch_siswa`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_nilai_ekskul_sch_kur_ekskul` FOREIGN KEY (`id_sch_kur_ekskul`) REFERENCES `{prefix}sch_kur_ekskul` (`id_sch_kur_ekskul`) ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kur_nilai_uas`
  ADD CONSTRAINT `sch_kur_nilai_uas_sch_kur_mapel` FOREIGN KEY (`id_sch_kur_mapel`) REFERENCES `{prefix}sch_kur_mapel` (`id_sch_kur_mapel`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_nilai_uas_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_nilai_uas_sch_set_unsurnilai` FOREIGN KEY (`id_sch_set_unsurnilai`) REFERENCES `{prefix}sch_set_unsurnilai` (`id_sch_set_unsurnilai`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_nilai_uas_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa` (`id_sch_siswa`) ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kur_nilai_uh`
  ADD CONSTRAINT `sch_kur_nilai_uh_sch_kur_mapel` FOREIGN KEY (`id_sch_kur_mapel`) REFERENCES `{prefix}sch_kur_mapel` (`id_sch_kur_mapel`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_nilai_uh_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_nilai_uh_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa` (`id_sch_siswa`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_nilai_uh_sch_set_unsurnilai` FOREIGN KEY (`id_sch_set_unsurnilai`) REFERENCES `{prefix}sch_set_unsurnilai` (`id_sch_set_unsurnilai`) ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kur_nilai_uts`
  ADD CONSTRAINT `sch_kur_nilai_uts_sch_kur_mapel` FOREIGN KEY (`id_sch_kur_mapel`) REFERENCES `{prefix}sch_kur_mapel` (`id_sch_kur_mapel`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_nilai_uts_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_nilai_uts_sch_set_unsurnilai` FOREIGN KEY (`id_sch_set_unsurnilai`) REFERENCES `{prefix}sch_set_unsurnilai` (`id_sch_set_unsurnilai`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_nilai_uts_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa` (`id_sch_siswa`) ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kur_raport_date`
  ADD CONSTRAINT `sch_kur_raport_date_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kur_raport_note`
  ADD CONSTRAINT `sch_kur_raport_note_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_kur_raport_note_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa` (`id_sch_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_set_kelas`
  ADD CONSTRAINT `sch_set_kelas_sch_set_jurusan` FOREIGN KEY (`id_sch_set_jurusan`) REFERENCES `{prefix}sch_set_jurusan` (`id_sch_set_jurusan`) ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_set_kelas_wali`
  ADD CONSTRAINT `sch_set_kelas_wali_sch_pegawai` FOREIGN KEY (`id_sch_pegawai`) REFERENCES `{prefix}sch_pegawai` (`id_sch_pegawai`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_set_kelas_wali_sch_set_kelas` FOREIGN KEY (`id_sch_set_kelas`) REFERENCES `{prefix}sch_set_kelas` (`id_sch_set_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_set_kelas_wali_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_set_org_data`
  ADD CONSTRAINT `sch_set_org_data_sch_pegawai` FOREIGN KEY (`id_sch_pegawai`) REFERENCES `{prefix}sch_pegawai` (`id_sch_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_set_org_data_sch_set_org` FOREIGN KEY (`id_sch_set_org`) REFERENCES `{prefix}sch_set_org` (`id_sch_set_org`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_siswa_kelas`
  ADD CONSTRAINT `sch_siswa_kelas_history_sch_set_kelas` FOREIGN KEY (`id_sch_set_kelas`) REFERENCES `{prefix}sch_set_kelas` (`id_sch_set_kelas`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_siswa_kelas_history_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_siswa_kelas_history_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa` (`id_sch_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_siswa_kelas_dist`
  ADD CONSTRAINT `sch_siswa_kelas_sch_set_kelas` FOREIGN KEY (`id_sch_set_kelas`) REFERENCES `{prefix}sch_set_kelas` (`id_sch_set_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sch_siswa_kelas_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa` (`id_sch_siswa`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `{prefix}sch_kur_nilai_uts`   
  CHANGE `nilai` `nilai` DECIMAL(5,1) NULL;
ALTER TABLE `{prefix}sch_kur_nilai_uas`   
  CHANGE `nilai` `nilai` DECIMAL(5,1) NULL;


ALTER TABLE `{prefix}sch_pegawai`   
  ADD COLUMN `nuptk` VARCHAR(8) NULL AFTER `nip`, 
  ADD UNIQUE INDEX (`nuptk`);
ALTER TABLE `{prefix}sch_kur_ajar`   
  CHANGE `kode_ajar` `kode_ajar` VARCHAR(255) CHARSET latin1 COLLATE latin1_swedish_ci NOT NULL;

REPLACE INTO `{prefix}sch_set_org`(`id_sch_set_org`,`nama`,`order`) VALUES
('1','Kepala Sekolah','0'),
('2','Kepala Tata Usaha','0'),
('3','Kurikulum','0'),
('4','Kesiswaan','0'),
('5','Sarana Prasarana','0'),
('6','Humas','0');



DROP TABLE IF EXISTS `{prefix}sch_set_conv_pul2sat`;
CREATE TABLE IF NOT EXISTS `{prefix}sch_set_conv_pul2sat` (
  `id_sch_set_pul2sat` int(11) NOT NULL AUTO_INCREMENT,
  `puluhan` int(11) NOT NULL COMMENT 'puluhan >= ?',
  `satuan` decimal(3,2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  KEY `id_sch_set_pul2sat` (`id_sch_set_pul2sat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

INSERT INTO `{prefix}sch_set_conv_pul2sat` (`id_sch_set_pul2sat`, `puluhan`, `satuan`, `active`) VALUES
(1, 96, '4.00', 1),
(2, 91, '3.67', 1),
(3, 86, '3.33', 1),
(4, 81, '3.00', 1),
(5, 75, '2.67', 1),
(6, 70, '2.33', 1),
(7, 65, '2.00', 1),
(8, 60, '1.66', 1),
(9, 55, '1.33', 1),
(10, 1, '1.00', 1);

DROP TABLE IF EXISTS `{prefix}sch_set_conv_sat2index`;
CREATE TABLE IF NOT EXISTS `{prefix}sch_set_conv_sat2index` (
  `id_sch_set_conv_sat2index` int(11) NOT NULL AUTO_INCREMENT,
  `satuan` decimal(3,2) NOT NULL COMMENT 'satuan >= ?',
  `index` int(1) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_sch_set_conv_sat2index`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

INSERT INTO `{prefix}sch_set_conv_sat2index` (`id_sch_set_conv_sat2index`, `satuan`, `index`, `active`) VALUES
(1, '3.66', 5, 1),
(2, '2.66', 4, 1),
(3, '1.66', 3, 1),
(4, '1.00', 2, 1);

DROP TABLE IF EXISTS `{prefix}sch_set_conv_sat2pred`;
CREATE TABLE IF NOT EXISTS `{prefix}sch_set_conv_sat2pred` (
  `id_sch_set_sat2pred` int(11) NOT NULL AUTO_INCREMENT,
  `satuan` decimal(3,2) NOT NULL COMMENT 'satuan >= ?',
  `predikat` varchar(2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_sch_set_sat2pred`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

INSERT INTO `{prefix}sch_set_conv_sat2pred` (`id_sch_set_sat2pred`, `satuan`, `predikat`, `active`) VALUES
(1, '4.00', 'A', 1),
(2, '3.66', 'A-', 1),
(3, '3.33', 'B+', 1),
(4, '3.00', 'B', 1),
(5, '2.66', 'B-', 1),
(6, '2.33', 'C+', 1),
(7, '2.00', 'C', 1),
(8, '1.66', 'C-', 1),
(9, '1.33', 'D+', 1),
(10, '1.00', 'D', 1);

ALTER TABLE `{prefix}sch_kur_mapel`   
  CHANGE `kode` `kode` VARCHAR(255) CHARSET latin1 COLLATE latin1_swedish_ci NULL;
ALTER TABLE `{prefix}sch_kur_mapel`   
  ADD COLUMN `hide` BOOLEAN DEFAULT FALSE  NULL AFTER `order`;
ALTER TABLE `{prefix}sch_kur_mapel`   
  ADD UNIQUE INDEX (`mapel_nama`);


ALTER TABLE `{prefix}sch_set_unsurnilai`   
  CHANGE `unsur_nama` `unsur_nama` VARCHAR(50) CHARSET latin1 COLLATE latin1_swedish_ci NOT NULL;

CREATE TABLE `{prefix}sch_kur_mapel_materi`(  
  `id_sch_kur_mapel_materi` INT NOT NULL AUTO_INCREMENT,
  `id_sch_kur_mapel` INT NOT NULL,
  `materi_nama` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_sch_kur_mapel_materi`),
  CONSTRAINT `sch_kur_mapel_materi_sch_kur_mapel` FOREIGN KEY (`id_sch_kur_mapel`) REFERENCES `{prefix}sch_kur_mapel`(`id_sch_kur_mapel`) ON UPDATE CASCADE ON DELETE CASCADE
);

ALTER TABLE `{prefix}sch_kur_mapel_materi`   
  ADD COLUMN `format_desc` VARCHAR(255) NULL AFTER `materi_nama`;

ALTER TABLE `{prefix}sch_kur_mapel_materi`   
  ADD COLUMN `id_sch_set_unsurnilai` INT NULL AFTER `id_sch_kur_mapel`,
  ADD CONSTRAINT `sch_kur_mapel_materi_sch_set_unsurnilai` FOREIGN KEY (`id_sch_set_unsurnilai`) REFERENCES `{prefix}sch_set_unsurnilai`(`id_sch_set_unsurnilai`) ON UPDATE CASCADE ON DELETE SET NULL;

CREATE TABLE `{prefix}sch_kur_mapel_materi_kelas`(  
  `id_sch_set_ta` INT NOT NULL,
  `semester` INT,
  `id_sch_kur_ajar` int NOT NULL,
  `id_sch_set_kelas` INT NOT NULL, 
  `id_sch_kur_mapel_materi` INT NOT NULL,
  UNIQUE INDEX `UNIQUE` (`id_sch_set_ta`, `semester`, `id_sch_kur_ajar`, `id_sch_set_kelas`, `id_sch_kur_mapel_materi`),
  CONSTRAINT `sch_kur_mapel_materi_kelas_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta`(`id_sch_set_ta`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `sch_kur_mapel_materi_kelas_sch_kur_ajar` FOREIGN KEY (`id_sch_kur_ajar`) REFERENCES `{prefix}sch_kur_ajar` (`id_sch_kur_ajar`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sch_kur_mapel_materi_kelas_sch_set_kelas` FOREIGN KEY (`id_sch_set_kelas`) REFERENCES `{prefix}sch_set_kelas`(`id_sch_set_kelas`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `sch_kur_mapel_materi_kelas_sch_kur_mapel_materi` FOREIGN KEY (`id_sch_kur_mapel_materi`) REFERENCES `{prefix}sch_kur_mapel_materi`(`id_sch_kur_mapel_materi`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `{prefix}sch_kur_nilai_materi_uas` (
  `id_sch_set_ta` int(11) NOT NULL AUTO_INCREMENT,
  `semester` int(11) NOT NULL,
  `id_sch_siswa` int(11) NOT NULL,
  `id_sch_kur_mapel_materi` int(11) NOT NULL,
  `nilai` decimal(5,1) DEFAULT NULL,
  UNIQUE KEY `id_sch_set_ta` (`id_sch_set_ta`,`semester`,`id_sch_siswa`,`id_sch_kur_mapel_materi`),
  KEY `sch_kur_nilai_materi_uas_sch_siswa` (`id_sch_siswa`),
  KEY `sch_kur_nilai_materi_uas_sch_kur_mapel_materi` (`id_sch_kur_mapel_materi`),
  CONSTRAINT `sch_kur_nilai_materi_uas_sch_kur_mapel_materi` FOREIGN KEY (`id_sch_kur_mapel_materi`) REFERENCES `{prefix}sch_kur_mapel_materi` (`id_sch_kur_mapel_materi`) ON UPDATE CASCADE,
  CONSTRAINT `sch_kur_nilai_materi_uas_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON UPDATE CASCADE,
  CONSTRAINT `sch_kur_nilai_materi_uas_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa` (`id_sch_siswa`) ON UPDATE CASCADE
);

CREATE TABLE `{prefix}sch_kur_doc`(  
  `id_sch_kur_doc` INT NOT NULL AUTO_INCREMENT,
  `created` DATETIME NULL,
  `filename` VARCHAR(255) NOT NULL,
  `type` ENUM('rpp','rkm','rkh') DEFAULT 'rpp',
  `id_sch_set_ta` INT NULL,
  `semester` INT NULL,
  `id_sch_kur_mapel` INT NOT NULL,
  PRIMARY KEY (`id_sch_kur_doc`),
  CONSTRAINT `sch_kur_doc_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta`(`id_sch_set_ta`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `sch_kur_doc_sch_kur_mapel` FOREIGN KEY (`id_sch_kur_mapel`) REFERENCES `{prefix}sch_kur_mapel`(`id_sch_kur_mapel`) ON UPDATE CASCADE ON DELETE CASCADE
);

ALTER TABLE `{prefix}sch_kur_nilai_uas`   
  CHANGE `nilai` `nilai` DECIMAL(6,2) NULL;
ALTER TABLE `{prefix}sch_kur_nilai_uh`   
  CHANGE `nilai` `nilai` DECIMAL(6,2) NULL;
ALTER TABLE `{prefix}sch_kur_nilai_uts` 
  CHANGE `nilai` `nilai` DECIMAL(6,2) NULL;


CREATE TABLE `{prefix}sch_set_conv_group`(  
  `id_sch_set_conv_group` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `active` BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`id_sch_set_conv_group`)
);

CREATE TABLE `{prefix}sch_set_conv_ta_group`(  
  `id_sch_set_ta` INT NOT NULL,
  `semester` INT NOT NULL,
  `id_sch_set_conv_group` INT NOT NULL,
  UNIQUE INDEX (`id_sch_set_ta`, `semester`),
  CONSTRAINT `sch_set_conv_ta_group_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta`(`id_sch_set_ta`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `sch_set_conv_ta_group_sch_set_conv_group` FOREIGN KEY (`id_sch_set_conv_group`) REFERENCES `{prefix}sch_set_conv_group`(`id_sch_set_conv_group`) ON UPDATE CASCADE ON DELETE RESTRICT
);

ALTER TABLE `{prefix}sch_set_conv_pul2sat`   
  CHANGE `active` `id_sch_set_conv_group` INT NOT NULL,
  ADD CONSTRAINT `sch_set_conv_pul2sat_sch_set_conv_group` FOREIGN KEY (`id_sch_set_conv_group`) REFERENCES `{prefix}sch_set_conv_group`(`id_sch_set_conv_group`) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `{prefix}sch_set_conv_sat2index`   
  CHANGE `active` `id_sch_set_conv_group` INT NOT NULL,
  ADD CONSTRAINT `sch_set_conv_sat2index_sch_set_conv_group` FOREIGN KEY (`id_sch_set_conv_group`) REFERENCES `{prefix}sch_set_conv_group`(`id_sch_set_conv_group`) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `{prefix}sch_set_conv_sat2pred`   
  CHANGE `active` `id_sch_set_conv_group` INT NOT NULL,
  ADD CONSTRAINT `sch_set_conv_sat2pred_sch_set_conv_group` FOREIGN KEY (`id_sch_set_conv_group`) REFERENCES `{prefix}sch_set_conv_group`(`id_sch_set_conv_group`) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE `{prefix}sch_set_conv_pul2sat` CHANGE `puluhan` `puluhan` DECIMAL(9,2) NOT NULL  COMMENT 'puluhan >= ?';
ALTER TABLE `{prefix}sch_set_conv_pul2sat` ADD PRIMARY KEY(`id_sch_set_pul2sat`);
REPLACE INTO `{prefix}sch_set_conv_sat2index` (`id_sch_set_conv_sat2index`, `satuan`, `index`, `id_sch_set_conv_group`) VALUES
(5, '3.51', 5, 2),
(6, '2.51', 4, 2),
(7, '1.51', 3, 2),
(8, '1.00', 2, 2);

ALTER TABLE `{prefix}sch_siswa`   
  ADD COLUMN `warga_negara` ENUM('WNI','WNA') DEFAULT 'WNI'  NULL AFTER `agama`,
  ADD COLUMN `anak_ke` INT NULL AFTER `warga_negara`,
  ADD COLUMN `saudara` INT NULL AFTER `anak_ke`,
  ADD COLUMN `saudara_tiri` INT NULL AFTER `saudara`,
  ADD COLUMN `saudara_angkat` INT NULL AFTER `saudara_tiri`,
  ADD COLUMN `status_anak` VARCHAR(20) NULL AFTER `saudara_angkat`,
  ADD COLUMN `bahasa` VARCHAR(50) NULL AFTER `status_anak`,
  CHANGE `alamat` `alamat` TEXT CHARSET latin1 COLLATE latin1_swedish_ci NOT NULL  AFTER `bahasa`,
  ADD COLUMN `kampung` VARCHAR(50) NULL AFTER `alamat`,
  ADD COLUMN `norumah` VARCHAR(10) NULL AFTER `kampung`,
  ADD COLUMN `alamat_rt` VARCHAR(10) NULL AFTER `norumah`,
  ADD COLUMN `alamat_rw` VARCHAR(10) NULL AFTER `alamat_rt`,
  ADD COLUMN `alamat_desa` VARCHAR(50) NULL AFTER `alamat_rw`,
  ADD COLUMN `alamat_kelurahan` VARCHAR(50) NULL AFTER `alamat_desa`,
  ADD COLUMN `alamat_kecamatan` VARCHAR(50) NULL AFTER `alamat_kelurahan`,
  ADD COLUMN `tinggal_dengan` VARCHAR(20) NULL AFTER `phone`,
  ADD COLUMN `jarak` DECIMAL(3,1) NULL AFTER `tinggal_dengan`,
  ADD COLUMN `gol_darah` ENUM('A','B','AB','O') NULL AFTER `jarak`,
  ADD COLUMN `pernah_sakit` TEXT NULL AFTER `gol_darah`,
  ADD COLUMN `kelainan` VARCHAR(100) NULL AFTER `pernah_sakit`,
  ADD COLUMN `tinggi_badan` DECIMAL(3,1) NULL AFTER `kelainan`,
  ADD COLUMN `berat_badan` DECIMAL(4,1) NULL AFTER `tinggi_badan`,
  ADD COLUMN `lulusan` VARCHAR(50) NULL AFTER `berat_badan`,
  ADD COLUMN `tgl_lulus` DATE NULL AFTER `lulusan`,
  ADD COLUMN `no_ijazah` VARCHAR(50) NULL AFTER `tgl_lulus`,
  ADD COLUMN `lama_belajar` INT NULL AFTER `no_ijazah`,
  ADD COLUMN `ayah_kelahiran` VARCHAR(50) NULL AFTER `ayah_nama`,
  ADD COLUMN `ayah_kelahiran_tgl` DATE NULL AFTER `ayah_kelahiran`,
  ADD COLUMN `ayah_agama` VARCHAR(20) NULL AFTER `ayah_kelahiran_tgl`,
  ADD COLUMN `ayah_negara` ENUM('WNI','WNA') DEFAULT 'WNI'  NULL AFTER `ayah_agama`,
  ADD COLUMN `ayah_pend` ENUM('S3','S2','S1','SA','SP','SD') NULL AFTER `ayah_negara`,
  ADD COLUMN `ayah_pendidikan` VARCHAR(50) NULL AFTER `ayah_pend`,
  ADD COLUMN `ayah_pekerjaan` VARCHAR(50) NULL AFTER `ayah_pendidikan`,
  ADD COLUMN `ayah_penghasilan` VARCHAR(50) NULL AFTER `ayah_pekerjaan`,
  ADD COLUMN `ayah_alamat` TEXT NULL AFTER `ayah_penghasilan`,
  ADD COLUMN `ayah_telp` VARCHAR(25) NULL AFTER `ayah_alamat`,
  ADD COLUMN `ayah_hidup` BOOLEAN DEFAULT TRUE  NULL AFTER `ayah_telp`,
  ADD COLUMN `ibu_kelahiran` VARCHAR(50) NULL AFTER `ibu_nama`,
  ADD COLUMN `ibu_kelahiran_tgl` DATE NULL AFTER `ibu_kelahiran`,
  ADD COLUMN `ibu_agama` VARCHAR(20) NULL AFTER `ibu_kelahiran_tgl`,
  ADD COLUMN `ibu_negara` ENUM('WNI','WNA') DEFAULT 'WNI'  NULL AFTER `ibu_agama`,
  ADD COLUMN `ibu_pend` ENUM('S3','S2','S1','SA','SP','SD') NULL AFTER `ibu_negara`,
  ADD COLUMN `ibu_pendidikan` VARCHAR(50) NULL AFTER `ibu_pend`,
  ADD COLUMN `ibu_pekerjaan` VARCHAR(50) NULL AFTER `ibu_pendidikan`,
  ADD COLUMN `ibu_penghasilan` VARCHAR(50) NULL AFTER `ibu_pekerjaan`,
  ADD COLUMN `ibu_alamat` TEXT NULL AFTER `ibu_penghasilan`,
  ADD COLUMN `ibu_telp` VARCHAR(25) NULL AFTER `ibu_alamat`,
  ADD COLUMN `ibu_hidup` BOOLEAN DEFAULT TRUE  NULL AFTER `ibu_telp`,
  ADD COLUMN `wali_kelahiran` VARCHAR(50) NULL AFTER `wali_nama`,
  ADD COLUMN `wali_kelahiran_tgl` DATE NULL AFTER `wali_kelahiran`,
  ADD COLUMN `wali_agama` VARCHAR(20) NULL AFTER `wali_kelahiran_tgl`,
  ADD COLUMN `wali_negara` ENUM('WNI','WNA') DEFAULT 'WNI'  NULL AFTER `wali_agama`,
  ADD COLUMN `wali_pend` ENUM('S3','S2','S1','SA','SP','SD') NULL AFTER `wali_negara`,
  ADD COLUMN `wali_pendidikan` VARCHAR(50) NULL AFTER `wali_pend`,
  ADD COLUMN `wali_pekerjaan` VARCHAR(50) NULL AFTER `wali_pendidikan`,
  ADD COLUMN `wali_penghasilan` VARCHAR(50) NULL AFTER `wali_pekerjaan`,
  ADD COLUMN `wali_alamat` TEXT NULL AFTER `wali_penghasilan`,
  ADD COLUMN `wali_telp` VARCHAR(25) NULL AFTER `wali_alamat`,
  ADD COLUMN `kesenian` TEXT NULL AFTER `wali_telp`,
  ADD COLUMN `olahraga` TEXT NULL AFTER `kesenian`,
  ADD COLUMN `organisasi` TEXT NULL AFTER `olahraga`;

ALTER TABLE `{prefix}sch_set_ta`   
  ADD COLUMN `type` VARCHAR(6) NULL   COMMENT 'KTSP, K13' AFTER `active`;
UPDATE {prefix}sch_set_ta SET `type`='K13' WHERE `type` IS NULL OR `type`='';

ALTER TABLE `{prefix}sch_set_unsurnilai`   
  ADD COLUMN `type` VARCHAR(6) NULL   COMMENT 'KTSP, K13' AFTER `order`;
UPDATE {prefix}sch_set_unsurnilai SET `type`='K13' WHERE `type` IS NULL OR `type`='';

ALTER TABLE `{prefix}sch_set_ta`   
  CHANGE `type` `type` VARCHAR(6) CHARSET latin1 COLLATE latin1_swedish_ci NULL   COMMENT 'KTSP, K13, KURNAS';
ALTER TABLE `{prefix}sch_kur_raport_note`   
  ADD COLUMN `attitude` TEXT NULL AFTER `kenaikan`;

ALTER TABLE `{prefix}sch_kur_mapel_kkm`   
  ADD COLUMN `kelas` INT NULL AFTER `id_sch_kur_mapel`,
  ADD COLUMN `id_sch_set_jurusan` INT NULL AFTER `kelas`, 
  DROP INDEX `id_sch_set_ta`,
  ADD  UNIQUE INDEX `id_sch_set_ta` (`id_sch_set_ta`, `id_sch_kur_mapel`, `kelas`, `id_sch_set_jurusan`),
  ADD CONSTRAINT `sch_kur_mapel_kkm_sch_set_jurusan` FOREIGN KEY (`id_sch_set_jurusan`) REFERENCES `{prefix}sch_set_jurusan`(`id_sch_set_jurusan`) ON UPDATE CASCADE ON DELETE CASCADE;

CREATE TABLE `{prefix}sch_set_ta_rumusna`(  
  `id_sch_set_ta` INT NOT NULL,
  `rumus` VARCHAR(255),
  UNIQUE INDEX `UNIQUE` (`id_sch_set_ta`),
  CONSTRAINT `sch_set_ta_rumusna_sch_set_ta_` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta`(`id_sch_set_ta`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `{prefix}sch_kur_nilai_kp`(  
  `id_sch_kur_nilai_kp` INT NOT NULL AUTO_INCREMENT,
  `id_sch_siswa` INT NOT NULL,
  `id_sch_set_ta` INT NOT NULL,
  `semester` INT NOT NULL,
  `ke` INT NOT NULL,
  `nilai` INT,
  `mitra` VARCHAR(255),
  `instansi` VARCHAR(255),
  `lama` INT COMMENT 'bulan',
  `id_sch_pegawai` INT,
  `keterangan` TEXT,
  PRIMARY KEY (`id_sch_kur_nilai_kp`),
  UNIQUE INDEX `UNIQUE` (`id_sch_siswa`, `id_sch_set_ta`, `semester`, `ke`),
  CONSTRAINT `sch_kur_nilai_kp_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa`(`id_sch_siswa`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `sch_kur_nilai_kp_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta`(`id_sch_set_ta`) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE `{prefix}sch_kur_nilai_narasi`(  
  `id_sch_set_ta` INT NOT NULL,
  `semester` INT NOT NULL,
  `id_sch_kur_mapel` INT NOT NULL,
  `id_sch_siswa` INT NOT NULL,
  `narasi` TEXT,
  UNIQUE INDEX `UNIQUE` (`id_sch_set_ta`, `semester`, `id_sch_kur_mapel`, `id_sch_siswa`),
  CONSTRAINT `sch_kur_nilai_narasi_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta`(`id_sch_set_ta`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `sch_kur_nilai_narasi_sch_kur_mapel` FOREIGN KEY (`id_sch_kur_mapel`) REFERENCES `{prefix}sch_kur_mapel`(`id_sch_kur_mapel`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `sch_kur_nilai_narasi_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa`(`id_sch_siswa`) ON UPDATE CASCADE ON DELETE CASCADE
);
ALTER TABLE `{prefix}sch_kur_nilai_narasi` ADD `id_sch_set_unsurnilai` INT NOT NULL AFTER `id_sch_siswa`;
ALTER TABLE `{prefix}sch_kur_nilai_narasi`  
  ADD CONSTRAINT `sch_kur_nilai_narasi_sch_set_unsurnilai` FOREIGN KEY (`id_sch_set_unsurnilai`) REFERENCES `{prefix}sch_set_unsurnilai`(`id_sch_set_unsurnilai`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `{prefix}sch_kur_nilai_narasi` DROP FOREIGN KEY `sch_kur_nilai_narasi_sch_siswa`;
ALTER TABLE `{prefix}sch_kur_nilai_narasi` ADD CONSTRAINT `sch_kur_nilai_narasi_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa`(`id_sch_siswa`) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE `{prefix}sch_kur_nilai_narasi`   
  CHANGE `id_sch_siswa` `id_sch_siswa` INT(11) NOT NULL  AFTER `semester`;
ALTER TABLE `{prefix}sch_kur_nilai_narasi`   
  CHANGE `narasi` `nilai` TEXT CHARSET latin1 COLLATE latin1_swedish_ci NULL;
ALTER TABLE `{prefix}sch_kur_nilai_narasi`   
  DROP INDEX `UNIQUE`,
  ADD  UNIQUE INDEX `UNIQUE` (`id_sch_set_ta`, `semester`, `id_sch_kur_mapel`, `id_sch_siswa`, `id_sch_set_unsurnilai`);

ALTER TABLE `{prefix}sch_kur_nilai_uas`   
  ADD COLUMN `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP  NOT NULL;
ALTER TABLE `{prefix}sch_kur_nilai_uh`   
  ADD COLUMN `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP  NOT NULL;
ALTER TABLE `{prefix}sch_kur_nilai_uts`   
  ADD COLUMN `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP  NOT NULL;

ALTER TABLE `{prefix}sch_kur_raport_note`   
  ADD COLUMN `attitude2` TEXT NULL AFTER `attitude`;

CREATE TABLE if not exists `{prefix}sch_set_kelas_kurikulum`(  
  `id_sch_set_kelas` INT,
  `id_sch_set_ta` INT,
  `type` VARCHAR(10),
  UNIQUE INDEX `UNIQUE` (`id_sch_set_kelas`, `id_sch_set_ta`),
  CONSTRAINT `sch_set_kelas_kurikulum_sch_set_kelas` FOREIGN KEY (`id_sch_set_kelas`) REFERENCES `{prefix}sch_set_kelas`(`id_sch_set_kelas`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `sch_set_kelas_kurikulum_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta`(`id_sch_set_ta`) ON UPDATE CASCADE ON DELETE CASCADE
);
ALTER TABLE `{prefix}sch_set_ta`   
  CHANGE `type` `type` VARCHAR(10) CHARSET latin1 COLLATE latin1_swedish_ci NULL   COMMENT 'KTSP, K13, KURNAS';
ALTER TABLE `{prefix}sch_set_unsurnilai`   
  CHANGE `type` `type` VARCHAR(10) CHARSET latin1 COLLATE latin1_swedish_ci NULL   COMMENT 'KTSP, K13, KURNAS';
ALTER TABLE `{prefix}sch_set_ta`   
  DROP COLUMN `type`;
CREATE TABLE if not exists `{prefix}sch_kur_nilai_rumusna`(  
  `id_sch_set_ta` INT,
  `semester` INT,
  `id_sch_set_kelas` INT,
  `id_sch_kur_mapel` INT,
  `rumus` VARCHAR(255),
  UNIQUE INDEX `UNIQUE` (`id_sch_set_ta`, `semester`, `id_sch_set_kelas`, `id_sch_kur_mapel`),
  CONSTRAINT `sch_kur_nilai_rumusna_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta`(`id_sch_set_ta`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `sch_kur_nilai_rumusna_sch_set_kelas` FOREIGN KEY (`id_sch_set_kelas`) REFERENCES `{prefix}sch_set_kelas`(`id_sch_set_kelas`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `sch_kur_nilai_rumusna_sch_kur_mapel` FOREIGN KEY (`id_sch_kur_mapel`) REFERENCES `{prefix}sch_kur_mapel`(`id_sch_kur_mapel`) ON UPDATE CASCADE ON DELETE CASCADE
);
ALTER TABLE `{prefix}sch_kur_nilai_rumusna`   
  ADD COLUMN `id_sch_set_unsurnilai` INT NULL AFTER `id_sch_kur_mapel`, 
  DROP INDEX `UNIQUE`,
  ADD  UNIQUE INDEX `UNIQUE` (`id_sch_set_ta`, `semester`, `id_sch_set_kelas`, `id_sch_kur_mapel`, `id_sch_set_unsurnilai`),
  ADD CONSTRAINT `sch_kur_nilai_rumusna_sch_set_unsurnilai` FOREIGN KEY (`id_sch_set_unsurnilai`) REFERENCES `{prefix}sch_set_unsurnilai`(`id_sch_set_unsurnilai`) ON UPDATE CASCADE ON DELETE CASCADE;

/*
 * tidak jadi
CREATE TABLE IF NOT EXISTS `{prefix}sch_kur_nilai_rpt` (
  `id_sch_set_ta` INT(11) NOT NULL AUTO_INCREMENT,
  `semester` INT(11) NOT NULL,
  `id_sch_siswa` INT(11) NOT NULL,
  `id_sch_kur_mapel` INT(11) NOT NULL,
  `id_sch_set_unsurnilai` INT(11) NOT NULL,
  `nilai` DECIMAL(6,2) DEFAULT NULL,
  `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id_sch_set_ta` (`id_sch_set_ta`,`semester`,`id_sch_siswa`,`id_sch_kur_mapel`,`id_sch_set_unsurnilai`),
  KEY `sch_kur_nilai_rpt_sch_siswa` (`id_sch_siswa`),
  KEY `sch_kur_nilai_rpt_sch_kur_mapel` (`id_sch_kur_mapel`),
  KEY `sch_kur_nilai_rpt_sch_set_unsurnilai` (`id_sch_set_unsurnilai`),
  CONSTRAINT `sch_kur_nilai_rpt_sch_kur_mapel` FOREIGN KEY (`id_sch_kur_mapel`) REFERENCES `{prefix}sch_kur_mapel` (`id_sch_kur_mapel`) ON UPDATE CASCADE,
  CONSTRAINT `sch_kur_nilai_rpt_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta` (`id_sch_set_ta`) ON UPDATE CASCADE,
  CONSTRAINT `sch_kur_nilai_rpt_sch_set_unsurnilai` FOREIGN KEY (`id_sch_set_unsurnilai`) REFERENCES `{prefix}sch_set_unsurnilai` (`id_sch_set_unsurnilai`) ON UPDATE CASCADE,
  CONSTRAINT `sch_kur_nilai_rpt_sch_siswa` FOREIGN KEY (`id_sch_siswa`) REFERENCES `{prefix}sch_siswa` (`id_sch_siswa`) ON UPDATE CASCADE
);
*/

CREATE TABLE if not exists `{prefix}sch_kur_nilai_rank`(  
  `id_sch_set_ta` INT,
  `semester` INT,
  `id_sch_sis_siswa` INT,
  `nilai` DECIMAL(6,2) COMMENT 'nilai akhir / nilai rapot',
  `kelas` INT COMMENT 'rangking kelas',
  `jml_sekelas` INT COMMENT 'jumlah siswa sekelas',
  `jurusan` INT COMMENT 'rangking sejurusan / paralel',
  `jml_sejurusan` INT COMMENT 'jumlah siswa sejurusan',
  UNIQUE INDEX `UNIQUE` (`id_sch_set_ta`, `semester`, `id_sch_sis_siswa`),
  CONSTRAINT `sch_kur_nilai_rank_sch_set_ta` FOREIGN KEY (`id_sch_set_ta`) REFERENCES `{prefix}sch_set_ta`(`id_sch_set_ta`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `sch_kur_nilai_rank_sch_sis_siswa` FOREIGN KEY (`id_sch_sis_siswa`) REFERENCES `{prefix}sch_siswa`(`id_sch_siswa`) ON UPDATE CASCADE ON DELETE RESTRICT
);
ALTER TABLE `{prefix}sch_kur_nilai_rank` CHANGE `id_sch_sis_siswa` `id_sch_siswa` INT(11) NULL;
ALTER TABLE `{prefix}sch_kur_nilai_rank`   
  CHANGE `nilai` `nilai` DECIMAL(6,2) NULL   COMMENT 'total nilai akhir dari semua mapel';

ALTER TABLE `{prefix}sch_set_unsurnilai`   
  ADD COLUMN `is_science` BOOLEAN DEFAULT FALSE  NULL   COMMENT 'is science : for rank only 1 for kurikulum' AFTER `is_num`;

REPLACE INTO `{prefix}sch_set_unsurnilai` (`id_sch_set_unsurnilai`, `unsur_nama`, `is_num`, `is_science`, `active`, `order`, `type`) VALUES
(1, 'Pengetahuan', 1, 1, 1, 0, 'K13'),
(2, 'Keterampilan', 1, 0, 1, 0, 'K13'),
(3, 'Sikap Spiritual dan Sosial', 0, 0, 1, 0, 'K13'),
(4, 'Nilai', 1, 1, 1, 0, 'KTSP'),
(5, 'Pengetahuan', 1, 1, 1, 0, 'KURNAS'),
(6, 'Keterampilan', 1, 0, 1, 0, 'KURNAS');

REPLACE INTO `{prefix}sch_set_conv_group` (`id_sch_set_conv_group`, `name`, `active`) VALUES
(1, 'K13', 0),
(2, 'K13v2', 0),
(3, 'KURNAS', 1);

REPLACE INTO `{prefix}sch_set_conv_pul2sat` (`id_sch_set_pul2sat`, `puluhan`, `satuan`, `id_sch_set_conv_group`) VALUES
(1, '96.00', '4.00', 1),
(2, '91.00', '3.67', 1),
(3, '86.00', '3.33', 1),
(4, '81.00', '3.00', 1),
(5, '75.00', '2.67', 1),
(6, '70.00', '2.33', 1),
(7, '65.00', '2.00', 1),
(8, '60.00', '1.66', 1),
(9, '55.00', '1.33', 1),
(10, '1.00', '1.00', 1),
(11, '3.85', '3.85', 2),
(12, '3.51', '3.84', 2),
(13, '3.18', '3.18', 2),
(14, '2.85', '2.85', 2),
(15, '2.51', '2.51', 2),
(16, '2.18', '2.18', 2),
(17, '1.85', '1.85', 2),
(18, '1.51', '1.51', 2),
(19, '1.18', '1.18', 2),
(20, '1.00', '1.00', 2),
(21, '86.00', '4.00', 3),
(22, '71.00', '3.00', 3),
(23, '56.00', '2.00', 3),
(24, '10.00', '1.00', 3);

REPLACE INTO `{prefix}sch_set_conv_sat2index` (`id_sch_set_conv_sat2index`, `satuan`, `index`, `id_sch_set_conv_group`) VALUES
(1, '3.66', 5, 1),
(2, '2.66', 4, 1),
(3, '1.66', 3, 1),
(4, '1.00', 2, 1),
(5, '3.51', 5, 2),
(6, '2.51', 4, 2),
(7, '1.51', 3, 2),
(8, '1.00', 2, 2),
(9, '4.00', 5, 3),
(10, '3.00', 4, 3),
(11, '2.00', 3, 3),
(12, '1.00', 2, 3);

REPLACE INTO `{prefix}sch_set_conv_sat2pred` (`id_sch_set_sat2pred`, `satuan`, `predikat`, `id_sch_set_conv_group`) VALUES
(1, '4.00', 'A', 1),
(2, '3.66', 'A-', 1),
(3, '3.33', 'B+', 1),
(4, '3.00', 'B', 1),
(5, '2.66', 'B-', 1),
(6, '2.33', 'C+', 1),
(7, '2.00', 'C', 1),
(8, '1.66', 'C-', 1),
(9, '1.33', 'D+', 1),
(10, '1.00', 'D', 1),
(11, '3.85', 'A', 2),
(12, '3.51', 'A-', 2),
(13, '3.18', 'B+', 2),
(14, '2.85', 'B', 2),
(15, '2.51', 'B-', 2),
(16, '2.18', 'C+', 2),
(17, '1.85', 'C', 2),
(18, '1.51', 'C-', 2),
(19, '1.18', 'D+', 2),
(20, '1.00', 'D', 2),
(21, '4.00', 'A', 3),
(22, '3.00', 'B', 3),
(23, '2.00', 'C', 3),
(24, '1.00', 'D', 3);

SET FOREIGN_KEY_CHECKS=1;
