-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2025 at 02:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barangay_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `created_by`, `created_at`) VALUES
(1, 'Barangay Clean-up Drive', 'Join us this Saturday for the barangay clean-up activity.', 2, '2025-09-14 07:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `disclosures`
--

CREATE TABLE `disclosures` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `url` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `disclosures`
--

INSERT INTO `disclosures` (`id`, `filename`, `url`, `created_by`, `uploaded_at`) VALUES
(1, 'Barangay Ordinance 2025.pdf', '/uploads/ordinance2025.pdf', 2, '2025-09-14 07:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `max_quantity` int(11) NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `item_name`, `description`, `created_at`, `max_quantity`) VALUES
(1, 'Projector', 'LCD projector for community use', '2025-09-14 07:06:55', 5),
(2, 'Sound System', 'Speakers and microphone set', '2025-09-14 07:06:55', 2),
(3, 'Chairs', 'Plastic chairs for events', '2025-09-14 07:06:55', 50);

-- --------------------------------------------------------

--
-- Table structure for table `residents`
--

CREATE TABLE `residents` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `residents`
--

INSERT INTO `residents` (`id`, `username`, `password`, `created_at`) VALUES
(15, 'jj', '$2b$10$XCaJHEL6jrex6iW7AZZ7HOlq/LhvanVbYo5nI4.4BhUibwhTn3Rla', '2025-09-23 08:00:45'),
(16, 'aa', '$2b$10$.bWtsl8pCPCXKCoYVkBgH.NKh30Ejgcp7jLuj0t3dLtYR5i7JxNGK', '2025-09-23 08:34:05'),
(17, 'kk', '$2b$10$DV3WYx8ae/YHV/mAQ0dXjOvBxT/y5bzhBV6pYRW3zhb.oVfZiT7lW', '2025-09-24 06:50:51');

-- --------------------------------------------------------

--
-- Table structure for table `resident_files`
--

CREATE TABLE `resident_files` (
  `id` int(11) NOT NULL,
  `resident_id` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resident_requests`
--

CREATE TABLE `resident_requests` (
  `id` int(11) NOT NULL,
  `resident_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_needed` date NOT NULL,
  `page_count` int(11) DEFAULT 0,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `released_by` int(11) DEFAULT NULL,
  `released_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resident_requests`
--

INSERT INTO `resident_requests` (`id`, `resident_id`, `filename`, `status`, `created_at`, `date_needed`, `page_count`, `approved_by`, `approved_at`, `released_by`, `released_at`) VALUES
(52, 1, '1758524030530-BUSANALY-FINALS.pdf', 'approved', '2025-09-22 06:53:50', '2025-09-25', 10, 4, '2025-09-22 15:06:50', NULL, NULL),
(53, 2, '1758525814861-BUSANALY-FINALS.pdf', 'approved', '2025-09-22 07:23:34', '2025-09-26', 10, 4, '2025-09-23 15:28:19', NULL, NULL),
(54, 2, '1758525910912-BUSANALY-FINALS.pdf', 'approved', '2025-09-22 07:25:10', '2025-09-24', 10, 4, '2025-09-23 15:27:47', NULL, NULL),
(55, 9, '1758530138874-BUSANALY-FINALS.pdf', 'approved', '2025-09-22 08:35:38', '2025-09-23', 10, 1, '2025-09-22 16:38:59', NULL, NULL),
(56, 1, '1758530298348-BUSANALY-FINALS.pdf', 'approved', '2025-09-22 08:38:18', '2025-09-26', 10, 1, '2025-09-22 16:38:45', NULL, NULL),
(57, 13, '1758541247141-BUSANALY-FINALS.pdf', 'pending', '2025-09-22 11:40:47', '2025-10-01', 10, NULL, NULL, NULL, NULL),
(58, 14, '1758613528139-BUSANALY-FINALS.pdf', 'pending', '2025-09-23 07:45:28', '2025-09-30', 10, NULL, NULL, NULL, NULL),
(59, 16, '1758616591105-BUSANALY-FINALS.pdf', 'approved', '2025-09-23 08:36:31', '2025-10-02', 10, 4, '2025-09-23 16:37:03', NULL, NULL),
(60, 15, '1758618794026-BUSANALY-FINALS.pdf', 'approved', '2025-09-23 09:13:14', '2025-09-27', 10, 4, '2025-09-23 17:23:27', NULL, NULL),
(61, 15, '1758622145597-BUSANALY-FINALS.pdf', 'approved', '2025-09-23 10:09:05', '2025-10-03', 10, 4, '2025-09-23 19:02:22', NULL, NULL),
(62, 17, '1758699531503-BUSANALY-FINALS.pdf', 'approved', '2025-09-24 07:38:51', '2025-09-28', 10, 4, '2025-09-24 15:39:10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resident_schedules`
--

CREATE TABLE `resident_schedules` (
  `id` int(11) NOT NULL,
  `resident_id` int(11) NOT NULL,
  `item` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` datetime DEFAULT current_timestamp(),
  `approved_at` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `returned_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `user_id`, `item`, `quantity`, `date_from`, `date_to`, `time_from`, `time_to`, `status`, `created_at`, `updated_at`, `approved_by`, `approved_at`, `returned_at`) VALUES
(17, 17, 'Table', 5, '2025-09-25', '2025-09-26', '10:00:00', '22:00:00', 'Approved', '2025-09-24 06:51:26', '2025-09-24 07:38:11', 4, '2025-09-24 15:38:11', NULL),
(18, 15, 'Projector', 2, '2025-09-25', '2025-09-26', '10:00:00', '10:00:00', 'Approved', '2025-09-24 07:22:57', '2025-09-24 07:38:14', 4, '2025-09-24 15:38:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'allenkalbo', '$2b$10$4sM2NBnb2B4nz.AVDkcUeOngwDD7RLfGT9PGxzdweDILWvObCjBE.', '2025-09-15 08:00:58'),
(4, 'allen', '$2b$10$ROHonPCWaKao0Ubjy0oXVOY4/pThqilY45gb1t38lv30Fw2XSreoC', '2025-09-21 09:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_files`
--

CREATE TABLE `uploaded_files` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `url` varchar(500) NOT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `upload_limits`
--

CREATE TABLE `upload_limits` (
  `id` int(11) NOT NULL,
  `type` enum('resident','global') NOT NULL,
  `value` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `upload_limits`
--

INSERT INTO `upload_limits` (`id`, `type`, `value`, `updated_by`, `updated_at`) VALUES
(1, 'resident', 10, NULL, '2025-09-21 04:20:13'),
(2, 'global', 100, NULL, '2025-09-21 04:20:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('resident','staff','admin') NOT NULL DEFAULT 'resident',
  `address` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT 'male',
  `contact` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `password`, `role`, `address`, `age`, `gender`, `contact`, `created_at`) VALUES
(1, 'System Admin', 'admin', 'admin123', 'admin', 'Barangay Hall', 35, 'male', '09170000000', '2025-09-14 07:06:55'),
(2, 'Staff User', 'staff', 'staff123', 'staff', 'Barangay Office', 28, 'female', '09171111111', '2025-09-14 07:06:55'),
(3, 'Juan Dela Cruz', 'juan', 'juan123', 'resident', 'Purok 1', 22, 'male', '09172222222', '2025-09-14 07:06:55'),
(4, 'Maria Santos', 'maria', 'maria123', 'resident', 'Purok 2', 25, 'female', '09173333333', '2025-09-14 07:06:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `disclosures`
--
ALTER TABLE `disclosures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `residents`
--
ALTER TABLE `residents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `resident_files`
--
ALTER TABLE `resident_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`);

--
-- Indexes for table `resident_requests`
--
ALTER TABLE `resident_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resident_schedules`
--
ALTER TABLE `resident_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resident_id` (`resident_id`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `upload_limits`
--
ALTER TABLE `upload_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `disclosures`
--
ALTER TABLE `disclosures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `residents`
--
ALTER TABLE `residents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `resident_files`
--
ALTER TABLE `resident_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resident_requests`
--
ALTER TABLE `resident_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `resident_schedules`
--
ALTER TABLE `resident_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upload_limits`
--
ALTER TABLE `upload_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `disclosures`
--
ALTER TABLE `disclosures`
  ADD CONSTRAINT `disclosures_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `resident_files`
--
ALTER TABLE `resident_files`
  ADD CONSTRAINT `resident_files_ibfk_1` FOREIGN KEY (`resident_id`) REFERENCES `residents` (`id`);

--
-- Constraints for table `resident_schedules`
--
ALTER TABLE `resident_schedules`
  ADD CONSTRAINT `resident_schedules_ibfk_1` FOREIGN KEY (`resident_id`) REFERENCES `residents` (`id`),
  ADD CONSTRAINT `resident_schedules_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `staff` (`id`);

--
-- Constraints for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  ADD CONSTRAINT `uploaded_files_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
