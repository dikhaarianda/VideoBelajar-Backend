-- tabel user
INSERT INTO users (nama_user, email, no_hp, password, role) VALUES
('Andi Saputra', 'andi@example.com', '081234567890', 'hashedpassword1', 'siswa'),
('Budi Santoso', 'budi@example.com', '081234567891', 'hashedpassword2', 'tutor'),
('Citra Lestari', 'citra@example.com', '081234567892', 'hashedpassword3', 'admin'),
('Dewi Anggraini', 'dewi@example.com', '081234567893', 'hashedpassword4', 'siswa');

-- tabel tutor
INSERT INTO tutor (id_tutor, posisi_pekerjaan, nama_perusahaan, deskripsi_pekerjaan) VALUES
(2, 'Software Engineer', 'Tech Corp', 'Mengembangkan aplikasi web dan mobile');

-- tabel kategori
INSERT INTO kategori (tipe_kategori) VALUES
('pemasaran'),
('digital & teknologi'),
('pengembangan diri'),
('bisnis manajemen');

-- tabel produk
INSERT INTO produk (nama_produk, kategori, motivasi_kelas, deskripsi, harga, diskon, tanggal_diskon) VALUES
('Kelas Digital Marketing', 1, 'Belajar strategi pemasaran digital', 'Kelas untuk mempelajari teknik pemasaran modern', 500000, 10.00, '2025-08-20'),
('Kelas Web Development', 2, 'Jadi web developer handal', 'Belajar HTML, CSS, dan JavaScript', 750000, NULL, NULL);

-- tabel modul
INSERT INTO modul (nama_modul, tutor) VALUES
('Pengenalan Digital Marketing', 2),
('Dasar-Dasar HTML', 2);

-- tabel bahasa pengantar
INSERT INTO bahasa_pengantar (modul, bahasa) VALUES
(1, 'Indonesia'),
(2, 'English');

-- tabel produk modul
INSERT INTO produk_modul (produk, modul) VALUES
(1, 1),
(2, 2);

-- tabel meterial
INSERT INTO material (id_material, modul, indeks_material, tipe_material, judul_material, deskripsi, durasi_materi, tanggal, status_selesai) VALUES
(1, 1, 1, 'video', 'Intro Marketing', 'Pengenalan konsep marketing', 15, '2025-08-01', 0),
(2, 2, 1, 'video', 'HTML Basics', 'Belajar struktur HTML', 20, '2025-08-01', 0);

-- tabel pertanyaan
INSERT INTO pertanyaan (id_material, soal, pilihan_jawaban, jawaban) VALUES
(1, 'Apa kepanjangan dari SEO?', JSON_ARRAY('Search Engine Optimization', 'Search Email Option', 'Simple Easy Output'), 'Search Engine Optimization'),
(2, 'Tag HTML untuk heading adalah?', JSON_ARRAY('<h1>', '<p>', '<div>'), '<h1>');

-- tabel kelas saya
INSERT INTO kelas_saya (user_id, tanggal_mulai, tanggal_selesai) VALUES
(1, '2025-08-01', '2025-09-01'),
(4, '2025-08-05', '2025-09-05');

-- tabel relasi kelas saya dan produk
INSERT INTO kelas_saya_produk (kelas_saya, produk) VALUES
(1, 1),
(2, 2);

-- tabel order produk
INSERT INTO order_produk (no_invoice, user_id, produk, total_harga) VALUES
('INV-001', 1, 1, 450000.00),
('INV-002', 4, 2, 750000.00);

-- 1tabel pembayaran
INSERT INTO pembayaran (no_invoice, metode_pembayaran, status_pembayaran, jumlah_bayar) VALUES
('INV-001', 'Transfer Bank', 'berhasil', 450000.00),
('INV-002', 'E-Wallet', 'menunggu pembayaran', 750000.00);

-- tabel rating tutor
INSERT INTO rating_tutor (siswa, tutor, rating) VALUES
(1, 2, 4.5),
(4, 2, 5.0);

-- tabel review produk
INSERT INTO review_produk (siswa, produk, no_batch, review, rating) VALUES
(1, 1, 1, 'Kelasnya sangat bermanfaat', 4.5),
(4, 2, 1, 'Materi jelas dan mudah diikuti', 5.0);