CREATE DATABASE video_belajar;
USE video_belajar;

-- TABEL USER
CREATE TABLE users (
    id_user INT NOT NULL AUTO_INCREMENT,
    nama_user VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    no_hp VARCHAR(15) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('tutor', 'siswa', 'admin') DEFAULT 'siswa',
    tanggal_daftar TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id_user),
    UNIQUE KEY uk_email (email),
    UNIQUE KEY uk_no_hp (no_hp)
);

-- TABEL TUTOR
CREATE TABLE tutor (
    id_tutor INT NOT NULL,
    posisi_pekerjaan VARCHAR(50) NOT NULL,
    nama_perusahaan VARCHAR(50) NOT NULL,
    deskripsi_pekerjaan VARCHAR(200) NOT NULL,
    PRIMARY KEY(id_tutor),
    CONSTRAINT fk_tutor_user FOREIGN KEY (id_tutor) REFERENCES users(id_user)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- TABEL RATING TUTOR
CREATE TABLE rating_tutor (
    siswa INT NOT NULL,
    tutor INT NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    tanggal_rating TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (siswa, tutor),
    CONSTRAINT fk_rating_siswa FOREIGN KEY (siswa) REFERENCES users(id_user)
        ON DELETE CASCADE,
    CONSTRAINT fk_rating_tutor FOREIGN KEY (tutor) REFERENCES tutor(id_tutor)
        ON DELETE CASCADE,
    CONSTRAINT cek_nilai_rating CHECK (rating >= 1.0 AND rating <= 5.0)
);

-- TABEL KATEGORI
CREATE TABLE kategori (
    id_kategori TINYINT NOT NULL AUTO_INCREMENT,
    tipe_kategori ENUM('pemasaran', 'digital & teknologi', 'pengembangan diri', 'bisnis manajemen') NOT NULL,
    PRIMARY KEY (id_kategori)
);

-- TABEL PRODUK
CREATE TABLE produk (
    id_produk INT NOT NULL AUTO_INCREMENT,
    nama_produk VARCHAR(255) NOT NULL,
    kategori TINYINT NOT NULL,
    motivasi_kelas VARCHAR(255) NOT NULL,
    deskripsi VARCHAR(300) NOT NULL,
    harga DECIMAL(10,2) NOT NULL,
    diskon DECIMAL(5,2) NULL,
    tanggal_diskon DATE NULL,
    tanggal_produk_dibuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_produk),
    CONSTRAINT fk_produk_kategori FOREIGN KEY (kategori) REFERENCES kategori (id_kategori),
    CONSTRAINT cek_nilai_harga CHECK (harga > 0),
    CONSTRAINT cek_nilai_diskon CHECK (diskon IS NULL OR (diskon >= 0 AND diskon <= 100))
);

-- TABEL MODUL
CREATE TABLE modul (
    id_modul INT NOT NULL AUTO_INCREMENT,
    nama_modul VARCHAR(50) NOT NULL,
    tutor INT NOT NULL,
    tanggal_modul_dibuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_modul),
    CONSTRAINT fk_modul_tutor FOREIGN KEY (tutor) REFERENCES tutor (id_tutor)
);

-- TABEL BAHASA PENGANTAR
CREATE TABLE bahasa_pengantar (
    modul INT NOT NULL,
    bahasa VARCHAR(20) NOT NULL,
    PRIMARY KEY (modul, bahasa),
    CONSTRAINT fk_bahasa_modul FOREIGN KEY (modul) REFERENCES modul(id_modul)
        ON DELETE CASCADE
);

-- TABEL PRODUK-MODUL
CREATE TABLE produk_modul (
    produk INT NOT NULL,
    modul INT NOT NULL,
    PRIMARY KEY (produk, modul),
    CONSTRAINT fk_produk_modul_produk FOREIGN KEY (produk) REFERENCES produk (id_produk)
        ON DELETE CASCADE,
    CONSTRAINT fk_produk_modul_modul FOREIGN KEY (modul) REFERENCES modul (id_modul)
        ON DELETE CASCADE
);

-- TABEL MATERIAL
CREATE TABLE material (
    id_material INT NOT NULL,
    modul INT NOT NULL,
    indeks_material TINYINT NOT NULL,
    tipe_material VARCHAR(15) NOT NULL,
    judul_material VARCHAR(100),
    deskripsi VARCHAR(200) NOT NULL,
    durasi_materi INT,
    tanggal DATE,
    status_selesai BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_material),
    UNIQUE KEY uk_modul_indeks (modul, indeks_material),
    CONSTRAINT fk_material_modul FOREIGN KEY (modul) REFERENCES modul (id_modul)
        ON DELETE CASCADE,
    CONSTRAINT cek_indeks_material CHECK (indeks_material > 0),
    CONSTRAINT cek_nilai_durasi CHECK (durasi_materi IS NULL OR durasi_materi > 0)
);

-- TABEL PERTANYAAN
CREATE TABLE pertanyaan (
    id_pertanyaan INT NOT NULL AUTO_INCREMENT,
    id_material INT NOT NULL,
    soal VARCHAR(500) NOT NULL,
    pilihan_jawaban JSON NOT NULL,
    jawaban VARCHAR(300) NOT NULL,
    tanggal_pertanyaan_dibuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_pertanyaan),
    CONSTRAINT fk_pertanyaan_material FOREIGN KEY (id_material) REFERENCES material (id_material)
        ON DELETE CASCADE
);

-- TABEL REVIEW PRODUK
CREATE TABLE review_produk (
    siswa INT NOT NULL,
    produk INT NOT NULL,
    no_batch SMALLINT NOT NULL,
    review VARCHAR(300) NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    tanggal_review TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (siswa, produk),
    CONSTRAINT fk_review_user FOREIGN KEY (siswa) REFERENCES users (id_user)
        ON DELETE CASCADE,
    CONSTRAINT fk_review_produk FOREIGN KEY (produk) REFERENCES produk (id_produk)
        ON DELETE CASCADE,
    CONSTRAINT cek_review_rating CHECK (rating >= 1.0 AND rating <= 5.0)
);

-- TABEL KELAS SAYA
CREATE TABLE kelas_saya (
    id_kelas_saya INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    tanggal_mulai DATE NOT NULL,
    tanggal_selesai DATE NOT NULL,
    PRIMARY KEY (id_kelas_saya),
    CONSTRAINT fk_kelas_saya_user FOREIGN KEY (user_id) REFERENCES users (id_user)
        ON DELETE CASCADE,
    CONSTRAINT cek_validasi_tanggal CHECK (tanggal_selesai >= tanggal_mulai)
);

-- TABEL KELAS SAYA - PRODUK
CREATE TABLE kelas_saya_produk (
    kelas_saya INT NOT NULL,
    produk INT NOT NULL,
    PRIMARY KEY (kelas_saya, produk),
    CONSTRAINT fk_kelas_saya_produk_kelas FOREIGN KEY (kelas_saya) REFERENCES kelas_saya (id_kelas_saya)
        ON DELETE CASCADE,
    CONSTRAINT fk_kelas_saya_produk_produk FOREIGN KEY (produk) REFERENCES produk (id_produk)
        ON DELETE CASCADE
);

-- TABEL ORDER PRODUK
CREATE TABLE order_produk (
    no_invoice VARCHAR(50) NOT NULL,
    user_id INT NOT NULL,
    produk INT NOT NULL,
    tanggal_order TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_harga DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (no_invoice),
    UNIQUE KEY uk_user_produk (user_id, produk),
    CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES users (id_user),
    CONSTRAINT fk_order_produk FOREIGN KEY (produk) REFERENCES produk (id_produk)
);

-- TABEL PEMBAYARAN
CREATE TABLE pembayaran (
    id_pembayaran INT NOT NULL AUTO_INCREMENT,
    no_invoice VARCHAR(50) NOT NULL,
    metode_pembayaran VARCHAR(20) NOT NULL,
    waktu_pembayaran TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_pembayaran ENUM('berhasil', 'menunggu pembayaran', 'gagal') DEFAULT 'menunggu pembayaran',
    jumlah_bayar DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(id_pembayaran),
    UNIQUE KEY uk_invoice (no_invoice),
    CONSTRAINT fk_pembayaran_order FOREIGN KEY (no_invoice) REFERENCES order_produk (no_invoice)
        ON DELETE CASCADE
);