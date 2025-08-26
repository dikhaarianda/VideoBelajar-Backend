CREATE DATABASE IF NOT EXISTS `educourse_db`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE `educourse_db`;

DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `courses`;

CREATE TABLE `users` (
  `id` CHAR(36) NOT NULL,
  `fullname` VARCHAR(100) NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(120) NOT NULL,
  `verification_token` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_users_username` (`username`),
  UNIQUE KEY `uq_users_email` (`email`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `courses` (
  `id` CHAR(36) NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `description` TEXT,
  `topic` VARCHAR(100) DEFAULT NULL,
  `instructor` VARCHAR(120) DEFAULT NULL,
  `price` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_courses_topic` (`topic`),
  KEY `idx_courses_price` (`price`),
  KEY `idx_courses_created_at` (`created_at`),
  KEY `idx_courses_title` (`title`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;