-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: video_belajar
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bahasa_pengantar`
--

DROP TABLE IF EXISTS `bahasa_pengantar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bahasa_pengantar` (
  `modul` int NOT NULL,
  `bahasa` varchar(20) NOT NULL,
  PRIMARY KEY (`modul`,`bahasa`),
  CONSTRAINT `fk_bahasa_modul` FOREIGN KEY (`modul`) REFERENCES `modul` (`id_modul`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bahasa_pengantar`
--

LOCK TABLES `bahasa_pengantar` WRITE;
/*!40000 ALTER TABLE `bahasa_pengantar` DISABLE KEYS */;
/*!40000 ALTER TABLE `bahasa_pengantar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `id_kategori` tinyint NOT NULL AUTO_INCREMENT,
  `tipe_kategori` enum('pemasaran','digital & teknologi','pengembangan diri','bisnis manajemen') NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelas_saya`
--

DROP TABLE IF EXISTS `kelas_saya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kelas_saya` (
  `id_kelas_saya` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  PRIMARY KEY (`id_kelas_saya`),
  KEY `fk_kelas_saya_user` (`user_id`),
  CONSTRAINT `fk_kelas_saya_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `cek_validasi_tanggal` CHECK ((`tanggal_selesai` >= `tanggal_mulai`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas_saya`
--

LOCK TABLES `kelas_saya` WRITE;
/*!40000 ALTER TABLE `kelas_saya` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelas_saya` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelas_saya_produk`
--

DROP TABLE IF EXISTS `kelas_saya_produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kelas_saya_produk` (
  `kelas_saya` int NOT NULL,
  `produk` int NOT NULL,
  PRIMARY KEY (`kelas_saya`,`produk`),
  KEY `fk_kelas_saya_produk_produk` (`produk`),
  CONSTRAINT `fk_kelas_saya_produk_kelas` FOREIGN KEY (`kelas_saya`) REFERENCES `kelas_saya` (`id_kelas_saya`) ON DELETE CASCADE,
  CONSTRAINT `fk_kelas_saya_produk_produk` FOREIGN KEY (`produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas_saya_produk`
--

LOCK TABLES `kelas_saya_produk` WRITE;
/*!40000 ALTER TABLE `kelas_saya_produk` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelas_saya_produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `id_material` int NOT NULL,
  `modul` int NOT NULL,
  `indeks_material` tinyint NOT NULL,
  `tipe_material` varchar(15) NOT NULL,
  `judul_material` varchar(100) DEFAULT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `durasi_materi` int DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status_selesai` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_material`),
  UNIQUE KEY `uk_modul_indeks` (`modul`,`indeks_material`),
  CONSTRAINT `fk_material_modul` FOREIGN KEY (`modul`) REFERENCES `modul` (`id_modul`) ON DELETE CASCADE,
  CONSTRAINT `cek_indeks_material` CHECK ((`indeks_material` > 0)),
  CONSTRAINT `cek_nilai_durasi` CHECK (((`durasi_materi` is null) or (`durasi_materi` > 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modul`
--

DROP TABLE IF EXISTS `modul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modul` (
  `id_modul` int NOT NULL AUTO_INCREMENT,
  `nama_modul` varchar(50) NOT NULL,
  `tutor` int NOT NULL,
  `tanggal_modul_dibuat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_modul`),
  KEY `fk_modul_tutor` (`tutor`),
  CONSTRAINT `fk_modul_tutor` FOREIGN KEY (`tutor`) REFERENCES `tutor` (`id_tutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modul`
--

LOCK TABLES `modul` WRITE;
/*!40000 ALTER TABLE `modul` DISABLE KEYS */;
/*!40000 ALTER TABLE `modul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_produk`
--

DROP TABLE IF EXISTS `order_produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_produk` (
  `no_invoice` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `produk` int NOT NULL,
  `tanggal_order` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_harga` decimal(10,2) NOT NULL,
  PRIMARY KEY (`no_invoice`),
  UNIQUE KEY `uk_user_produk` (`user_id`,`produk`),
  KEY `fk_order_produk` (`produk`),
  CONSTRAINT `fk_order_produk` FOREIGN KEY (`produk`) REFERENCES `produk` (`id_produk`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_produk`
--

LOCK TABLES `order_produk` WRITE;
/*!40000 ALTER TABLE `order_produk` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pembayaran` (
  `id_pembayaran` int NOT NULL AUTO_INCREMENT,
  `no_invoice` varchar(50) NOT NULL,
  `metode_pembayaran` varchar(20) NOT NULL,
  `waktu_pembayaran` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_pembayaran` enum('berhasil','menunggu pembayaran','gagal') DEFAULT 'menunggu pembayaran',
  `jumlah_bayar` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_pembayaran`),
  UNIQUE KEY `uk_invoice` (`no_invoice`),
  CONSTRAINT `fk_pembayaran_order` FOREIGN KEY (`no_invoice`) REFERENCES `order_produk` (`no_invoice`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran`
--

LOCK TABLES `pembayaran` WRITE;
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pertanyaan`
--

DROP TABLE IF EXISTS `pertanyaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pertanyaan` (
  `id_pertanyaan` int NOT NULL AUTO_INCREMENT,
  `id_material` int NOT NULL,
  `soal` varchar(500) NOT NULL,
  `pilihan_jawaban` json NOT NULL,
  `jawaban` varchar(300) NOT NULL,
  `tanggal_pertanyaan_dibuat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pertanyaan`),
  KEY `fk_pertanyaan_material` (`id_material`),
  CONSTRAINT `fk_pertanyaan_material` FOREIGN KEY (`id_material`) REFERENCES `material` (`id_material`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pertanyaan`
--

LOCK TABLES `pertanyaan` WRITE;
/*!40000 ALTER TABLE `pertanyaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pertanyaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produk` (
  `id_produk` int NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(255) NOT NULL,
  `kategori` tinyint NOT NULL,
  `motivasi_kelas` varchar(255) NOT NULL,
  `deskripsi` varchar(300) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `diskon` decimal(5,2) DEFAULT NULL,
  `tanggal_diskon` date DEFAULT NULL,
  `tanggal_produk_dibuat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_produk`),
  KEY `fk_produk_kategori` (`kategori`),
  CONSTRAINT `fk_produk_kategori` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id_kategori`),
  CONSTRAINT `cek_nilai_diskon` CHECK (((`diskon` is null) or ((`diskon` >= 0) and (`diskon` <= 100)))),
  CONSTRAINT `cek_nilai_harga` CHECK ((`harga` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk`
--

LOCK TABLES `produk` WRITE;
/*!40000 ALTER TABLE `produk` DISABLE KEYS */;
/*!40000 ALTER TABLE `produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produk_modul`
--

DROP TABLE IF EXISTS `produk_modul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produk_modul` (
  `produk` int NOT NULL,
  `modul` int NOT NULL,
  PRIMARY KEY (`produk`,`modul`),
  KEY `fk_produk_modul_modul` (`modul`),
  CONSTRAINT `fk_produk_modul_modul` FOREIGN KEY (`modul`) REFERENCES `modul` (`id_modul`) ON DELETE CASCADE,
  CONSTRAINT `fk_produk_modul_produk` FOREIGN KEY (`produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produk_modul`
--

LOCK TABLES `produk_modul` WRITE;
/*!40000 ALTER TABLE `produk_modul` DISABLE KEYS */;
/*!40000 ALTER TABLE `produk_modul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_tutor`
--

DROP TABLE IF EXISTS `rating_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_tutor` (
  `siswa` int NOT NULL,
  `tutor` int NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `tanggal_rating` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`siswa`,`tutor`),
  KEY `fk_rating_tutor` (`tutor`),
  CONSTRAINT `fk_rating_siswa` FOREIGN KEY (`siswa`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `fk_rating_tutor` FOREIGN KEY (`tutor`) REFERENCES `tutor` (`id_tutor`) ON DELETE CASCADE,
  CONSTRAINT `cek_nilai_rating` CHECK (((`rating` >= 1.0) and (`rating` <= 5.0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_tutor`
--

LOCK TABLES `rating_tutor` WRITE;
/*!40000 ALTER TABLE `rating_tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_produk`
--

DROP TABLE IF EXISTS `review_produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_produk` (
  `siswa` int NOT NULL,
  `produk` int NOT NULL,
  `no_batch` smallint NOT NULL,
  `review` varchar(300) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `tanggal_review` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`siswa`,`produk`),
  KEY `fk_review_produk` (`produk`),
  CONSTRAINT `fk_review_produk` FOREIGN KEY (`produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE,
  CONSTRAINT `fk_review_user` FOREIGN KEY (`siswa`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  CONSTRAINT `cek_review_rating` CHECK (((`rating` >= 1.0) and (`rating` <= 5.0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_produk`
--

LOCK TABLES `review_produk` WRITE;
/*!40000 ALTER TABLE `review_produk` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutor` (
  `id_tutor` int NOT NULL,
  `posisi_pekerjaan` varchar(50) NOT NULL,
  `nama_perusahaan` varchar(50) NOT NULL,
  `deskripsi_pekerjaan` varchar(200) NOT NULL,
  PRIMARY KEY (`id_tutor`),
  CONSTRAINT `fk_tutor_user` FOREIGN KEY (`id_tutor`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor`
--

LOCK TABLES `tutor` WRITE;
/*!40000 ALTER TABLE `tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('tutor','siswa','admin') DEFAULT 'siswa',
  `tanggal_daftar` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `uk_email` (`email`),
  UNIQUE KEY `uk_no_hp` (`no_hp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'video_belajar'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-12 18:59:38
