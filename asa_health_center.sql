-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2025 at 05:39 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asa_health_center`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(100) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `purpose` text NOT NULL,
  `status` enum('Scheduled','Completed','Cancelled') DEFAULT 'Scheduled',
  `created_by` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `patient_id`, `appointment_date`, `purpose`, `status`, `created_by`, `created_at`) VALUES
(1, 'ASAHC00001', '2025-06-04 09:31:00', '', 'Scheduled', 5, '2025-06-03 14:28:08');

-- --------------------------------------------------------

--
-- Table structure for table `archived_drugs`
--

CREATE TABLE `archived_drugs` (
  `id` int(11) NOT NULL,
  `original_id` int(10) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `expiry_date` date NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `archived_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `archived_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `archived_drugs`
--

INSERT INTO `archived_drugs` (`id`, `original_id`, `name`, `quantity`, `expiry_date`, `manufacturer`, `archived_at`, `archived_by`) VALUES
(6, 0000000001, 'amoxicillin', 200, '2025-03-23', 'Ethio Pharmacitical Agro Industry', '2025-03-23 15:47:27', 3),
(7, 0000000005, 'Ciprox', 20000, '2025-03-29', 'Ethio Pharmacitical Industry', '2025-03-29 14:27:31', 3),
(8, 0000000006, 'Paracetamol', 2000, '2025-03-28', 'Ethio Pharmacitical Industry', '2025-03-29 19:06:51', 3),
(9, 0000000008, 'Paracetamol', 20000, '2025-03-31', 'Ethio Pharmacitical Industry', '2025-03-31 12:51:31', 3),
(10, 0000000007, 'Paracetamol', 2000, '2025-03-28', 'Ethio Pharmacitical Industry', '2025-03-31 12:51:35', 3),
(11, 0000000002, 'Ciprox', 2000, '2025-03-22', 'Ethio Pharmacitical Agro Industry', '2025-03-31 12:52:04', 3),
(12, 0000000009, 'Ciprox', 2, '2025-03-31', 'Ethio Pharmacitical Agro Industry', '2025-03-31 13:02:40', 3),
(13, 0000000001, 'Aprimol', 2, '2025-03-01', 'AMMAN PHARMACEUTICAL INDUSTRIES CO.', '2025-04-02 00:54:02', 3),
(14, 0000000004, '', 0, '0000-00-00', '', '2025-04-02 00:24:39', 3),
(15, 0000000005, '', 0, '0000-00-00', '', '2025-04-02 00:24:41', 3),
(16, 0000000006, '', 0, '0000-00-00', '', '2025-04-02 00:24:43', 3),
(17, 0000000002, 'Aprimol', 2, '2025-02-02', 'AMMAN PHARMACEUTICAL INDUSTRIES CO.', '2025-04-02 01:19:00', 3),
(18, 0000000009, 'Paracetamol', 1000, '2000-04-25', 'AMMAN PHARMACEUTICAL INDUSTRIES CO.', '2025-04-03 09:11:51', 3),
(19, 0000000003, 'Aprimol', 400, '2000-04-26', 'AMMAN PHARMACEUTICAL INDUSTRIES CO.', '2025-04-03 21:22:23', 3);

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `patient_id` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `delivery_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `delivered_by` int(11) NOT NULL,
  `notes` text,
  `prescription_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `drug_id`, `patient_id`, `quantity`, `delivery_date`, `delivered_by`, `notes`, `prescription_id`) VALUES
(1, 10, 'ASAHC00002', 21, '2025-06-03 08:25:56', 3, NULL, 9),
(2, 10, 'ASAHC00002', 21, '2025-06-03 08:25:56', 3, NULL, 9),
(3, 10, 'ASAHC00003', 33, '2025-06-03 09:41:09', 3, NULL, 8),
(4, 10, 'ASAHC00003', 33, '2025-06-03 09:42:44', 3, NULL, 8),
(5, 10, 'ASAHC00003', 33, '2025-06-03 09:45:17', 3, NULL, 8),
(6, 10, 'ASAHC00004', 10, '2025-06-06 22:29:23', 3, NULL, 12),
(7, 10, 'ASAHC00004', 10, '2025-06-06 22:29:24', 3, NULL, 12);

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(100) NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `treatment` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `diagnosis_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Inprogress','Completed','Canceled') DEFAULT 'Inprogress'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diagnosis`
--

INSERT INTO `diagnosis` (`id`, `patient_id`, `diagnosis`, `treatment`, `created_by`, `diagnosis_date`, `status`) VALUES
(1, 'ASAHC00002', 'Common Cold and Amoeba.', 'he has taken a malaria laboratory checking.', 5, '2025-05-31 21:38:50', 'Inprogress'),
(2, 'ASAHC00003', 'Diphtheria Pertussis Tetanus', 'I have seen about the following life saving, and preventive care that addresses the most previously', 5, '2025-06-02 12:07:14', 'Inprogress'),
(3, 'ASAHC00004', 'Common cold', 'Has Too high temperature and heavy body weight ', 5, '2025-06-06 22:16:53', 'Inprogress'),
(4, 'ASAHC00005', 'Amoeba', 'The patient is infected with amoeba and he has very high fever and head ache', 5, '2025-06-06 23:41:10', 'Inprogress');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `expiry_date` date NOT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `registered_by` int(11) DEFAULT NULL,
  `dosage_form` varchar(255) NOT NULL,
  `strength` varchar(255) DEFAULT NULL,
  `batch_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id`, `name`, `quantity`, `expiry_date`, `manufacturer`, `created_at`, `registered_by`, `dosage_form`, `strength`, `batch_number`) VALUES
(7, 'Aprimol', 9000, '2027-04-30', 'AMMAN PHARMACEUTICAL INDUSTRIES CO.', '2025-04-02 00:27:01', 3, 'Ointment', '4g', 'EB247'),
(8, 'Amoxicillin', 20000, '2029-04-18', 'AMMAN PHARMACEUTICAL INDUSTRIES CO.', '2025-04-02 01:09:01', 3, 'Ointment', '5g', 'E748787D'),
(10, 'Paracetamol', 839, '2027-04-07', 'AMMAN PHARMACEUTICAL INDUSTRIES CO.', '2025-04-03 08:58:49', 3, 'Tablet', '500mg', 'E748787D'),
(11, 'Ciprox', 186, '2026-06-27', 'Ethio Pharmaceticular', '2025-05-28 14:18:27', 3, 'Tablet', '500mg', '32324243243234'),
(12, 'Lisinopril', 2000, '2025-06-20', 'Ethio Pharmaceticular', '2025-06-03 08:19:37', 3, 'Injection', '10mg', 'BKJDKFJKDJFKJDKFJKDJ'),
(13, 'Ciprox', 12, '2022-06-20', 'Ethio Pharmaceticular', '2025-06-03 08:23:57', 3, 'Capsule', '50mcg/puff', 'BKJDKFJKDJFKJDKFJKDJ'),
(14, 'Ibuprofen', 32, '2025-06-21', 'Ethio Pharmaceticular', '2025-06-03 09:31:37', 3, 'Capsule', '75mg/3ml', 'BKJDKFJKDJFKJDKFJKDJ'),
(15, 'Lisinopril', 32, '2025-06-21', 'Ethio Pharmaceticular', '2025-06-03 09:34:03', 3, 'Capsule', '75mg/3ml', 'BKJDKFJKDJFKJDKFJKDJ'),
(16, 'Digoxin', 2000, '2027-06-27', 'Ethio Pharmaceticular', '2025-06-04 17:35:03', 3, 'Tablet', '250mg', 'BKJDKFJKDJFKJDKFJKDJ'),
(17, 'Paracetamol', 2000, '2027-06-27', 'Ethio Pharmaceticular', '2025-06-04 17:35:03', 3, 'Tablet', '250mg', 'BKJDKFJKDJFKJDKFJKDJ');

-- --------------------------------------------------------

--
-- Table structure for table `lab_reports`
--

CREATE TABLE `lab_reports` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(100) NOT NULL,
  `technician_id` int(11) NOT NULL,
  `report_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Pending','Completed','Canced') DEFAULT 'Pending',
  `findings` text NOT NULL,
  `conclusion` text NOT NULL,
  `lab_req_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab_reports`
--

INSERT INTO `lab_reports` (`id`, `patient_id`, `technician_id`, `report_date`, `status`, `findings`, `conclusion`, `lab_req_id`) VALUES
(1, 'ASAHC00002', 2, '2025-05-31 22:08:33', 'Completed', 'Nothing found for this patient', 'Nothing found for this patient', 4);

-- --------------------------------------------------------

--
-- Table structure for table `lab_requests`
--

CREATE TABLE `lab_requests` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(100) NOT NULL,
  `test_name` varchar(255) NOT NULL,
  `test_type` varchar(100) NOT NULL,
  `priority` enum('Low','Medium','High') NOT NULL,
  `requested_by` int(11) NOT NULL,
  `request_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `notes` text,
  `status` enum('Pending','Completed','Canceled') DEFAULT 'Pending',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `viewed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab_requests`
--

INSERT INTO `lab_requests` (`id`, `patient_id`, `test_name`, `test_type`, `priority`, `requested_by`, `request_date`, `notes`, `status`, `created_at`, `viewed`) VALUES
(4, 'ASAHC00002', 'Hematology', 'Homo-Parasite', 'High', 5, '2025-05-31 20:41:52', 'The patient should be treated as much as possible.', 'Completed', '2025-05-31 21:41:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `medical_history`
--

CREATE TABLE `medical_history` (
  `history_id` int(11) NOT NULL,
  `patient_id` varchar(100) NOT NULL,
  `prescription_id` int(11) DEFAULT NULL,
  `diagnosis` text NOT NULL,
  `treatment` text NOT NULL,
  `notes` text,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medical_history`
--

INSERT INTO `medical_history` (`history_id`, `patient_id`, `prescription_id`, `diagnosis`, `treatment`, `notes`, `created_by`, `created_at`) VALUES
(1, 'ASAHC00002', 10, 'Common Cold and Amoeba.', 'he has taken a malaria laboratory checking.', NULL, 5, '2025-06-06 19:13:54'),
(2, 'ASAHC00002', 11, 'Common Cold and Amoeba.', 'he has taken a malaria laboratory checking.', NULL, 5, '2025-06-06 19:13:54'),
(3, 'ASAHC00004', 12, 'Common cold', 'Has Too high temperature and heavy body weight ', NULL, 5, '2025-06-06 19:18:13'),
(4, 'ASAHC00004', 13, 'Common cold', 'Has Too high temperature and heavy body weight ', NULL, 5, '2025-06-06 19:18:13'),
(5, 'ASAHC00005', 14, 'Amoeba', 'The patient is infected with amoeba and he has very high fever and head ache', NULL, 5, '2025-06-06 20:42:12'),
(6, 'ASAHC00005', 15, 'Amoeba', 'The patient is infected with amoeba and he has very high fever and head ache', NULL, 5, '2025-06-06 20:42:12'),
(7, 'ASAHC00002', 16, 'Common Cold and Amoeba.', 'he has taken a malaria laboratory checking.', NULL, 5, '2025-06-06 23:36:47');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(100) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `dob` date NOT NULL,
  `medical_status` enum('Completed','Pending','Inprogress') NOT NULL DEFAULT 'Pending',
  `phone` varchar(20) NOT NULL,
  `region` varchar(255) NOT NULL,
  `zone` varchar(255) NOT NULL,
  `woreda` varchar(255) NOT NULL,
  `kebele` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `current_facility` varchar(255) DEFAULT 'Atse Seyfe Ared Health Center',
  `weight` float DEFAULT NULL,
  `patient_type` enum('Inpatient','Outpatient','Stare','Refill') NOT NULL DEFAULT 'Outpatient'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `patient_id`, `first_name`, `middle_name`, `last_name`, `gender`, `dob`, `medical_status`, `phone`, `region`, `zone`, `woreda`, `kebele`, `created_at`, `current_facility`, `weight`, `patient_type`) VALUES
(1, 'ASAHC00001', 'Alemu', 'Taye', 'Wuletaw', 'Female', '2025-05-13', 'Inprogress', '0998989898', 'Amhara', 'South Gondar', 'Debre Tabor', '03', '2025-05-31 20:36:49', 'Atse Seyfe Ared Health Center', NULL, 'Outpatient'),
(2, 'ASAHC00002', 'Belete', 'Destaw', 'Ayele', 'Female', '2025-05-23', 'Completed', '0998989893', 'Amhara', 'South Gondar', 'Debre Tabor', '03', '2025-05-31 20:38:33', 'Atse Seyfe Ared Health Center', NULL, 'Outpatient'),
(3, 'ASAHC00003', 'Abebe', 'Destaw', 'Ayele', 'Male', '2025-05-08', 'Completed', '0998989894', 'Amhara', 'South Gondar', 'Debre Tabor', '03', '2025-05-31 20:55:37', 'Atse Seyfe Ared Health Center', NULL, 'Outpatient'),
(4, 'ASAHC00004', 'Behaylu', 'Abebe', 'Samuel', 'Male', '1990-06-28', 'Completed', '0998989892', 'Amhara', 'South Gondar', 'Debre Tabor', '03', '2025-06-03 12:12:51', 'Atse Seyfe Ared Health Center', NULL, 'Outpatient'),
(5, 'ASAHC00005', 'Alemayehu', 'Habtu', 'Hailu', 'Male', '1980-01-02', 'Completed', '0998989895', 'Amhara', 'South Gondar', 'Debre Tabor', '03', '2025-06-04 20:13:52', 'Atse Seyfe Ared Health Center', NULL, 'Outpatient');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(11) NOT NULL,
  `patient_id` varchar(100) NOT NULL,
  `diagnosis_id` int(11) NOT NULL,
  `medication` varchar(100) NOT NULL,
  `dosage_form` varchar(50) NOT NULL,
  `strength` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `instructions` text,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `refills` int(11) DEFAULT '0',
  `prescribed_by` int(11) NOT NULL,
  `prescription_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Pending','Completed','Cancelled') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `patient_id`, `diagnosis_id`, `medication`, `dosage_form`, `strength`, `quantity`, `instructions`, `start_date`, `end_date`, `refills`, `prescribed_by`, `prescription_date`, `status`) VALUES
(6, 'ASAHC00002', 1, 'Ciprox', 'Tablet', '500mg', 6, 'A. For Adults (12 years and older, typically over 50kg body weight):  Tablets/Capsules (e.g., 500mg strength):  Dose: Take 1 or 2 tablets (500mg to 1000mg) per dose. Frequency: Repeat dose every 4 to 6 hours as needed. Maximum: Do NOT take more than 8 tablets (4000mg or 4g) in any 24-hour period. How to take: Swallow tablets/capsules whole with water, with or without food. For Oral Suspensions/Syrups (if available for adults, check strength):  Measure the exact dose using the provided measuring spoon or oral syringe. Do NOT use a kitchen spoon.', '2025-06-19', '2025-07-08', 1, 5, '2025-06-01 16:10:26', 'Completed'),
(8, 'ASAHC00003', 2, 'Paracetamol', 'Injection', '500mg', 33, 'A. For Adults (12 years and older, typically over 50kg body weight):  Tablets/Capsules (e.g., 500mg strength):  Dose: Take 1 or 2 tablets (500mg to 1000mg) per dose. Frequency: Repeat dose every 4 to 6 hours as needed. Maximum: Do NOT take more than 8 tablets (4000mg or 4g) in any 24-hour period. How to take: Swallow tablets/capsules whole with water, with or without food. For Oral Suspensions/Syrups (if available for adults, check strength):  Measure the exact dose using the provided measuring spoon or oral syringe. Do NOT use a kitchen spoon.', '2025-06-27', '2025-06-27', 1, 5, '2025-06-02 12:21:50', 'Completed'),
(9, 'ASAHC00002', 1, 'Paracetamol', 'Tablet', '500mg', 21, 'Take it when the is head ache', '2025-06-12', '2025-06-19', 1, 5, '2025-06-03 05:54:30', 'Completed'),
(10, 'ASAHC00002', 1, 'Paracetamol', 'Tablet', '500mg', 20, 'Take one at the morning', '2025-06-21', '2025-06-28', 1, 5, '2025-06-06 22:13:53', 'Pending'),
(12, 'ASAHC00004', 3, 'Paracetamol', 'Tablet', '250mg', 10, 'take one at the time of heavy head ache.', '2025-06-21', '2025-06-28', 1, 5, '2025-06-06 22:18:12', 'Completed'),
(14, 'ASAHC00005', 4, 'Paracetamol', 'Tablet', '500mg', 10, 'take one when there is very high head ache', '2025-06-06', '2025-06-14', 1, 5, '2025-06-06 23:42:12', 'Pending'),
(15, 'ASAHC00005', 4, 'Paracetamol', 'Tablet', '500mg', 10, 'take one when there is very high head ache', '2025-06-06', '2025-06-14', 1, 5, '2025-06-06 23:42:12', 'Pending'),
(16, 'ASAHC00002', 1, 'Paracetamol', 'Tablet', '250mg', 12, 'take 1 if there is a head ache ', '2025-06-14', '2025-06-19', 1, 5, '2025-06-07 02:36:46', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('Admin','Doctor','Nurse','Lab Technician','Pharmacist','Clerk') NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `phone` varchar(10) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `address` varchar(100) NOT NULL,
  `dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `username`, `password_hash`, `role`, `is_active`, `phone`, `gender`, `created_at`, `address`, `dob`) VALUES
(1, 'Yenework', 'Fekadie', 'Demewoz', 'admin@asahc', '$2y$10$xeHDdwVreYrxGtLQZYJmaOGdEmHR0Y8E11VDIQQVpFk1bnahEIQAe', 'Admin', 1, '0989098765', 'Male', '2025-03-21 18:50:29', 'Debre Tabor, Ethiopia', '1997-03-13'),
(2, 'Selomon', 'Dawit', 'Desalegn', 'lab@asahc', '$2y$10$8O6bB.B5th6XKiBO2YuvBuD2pay6De0VjV8LwLomQFFfhXHjPiEM6', 'Lab Technician', 1, '0989998767', 'Male', '2025-03-21 18:51:13', 'Debre Tabor, Ethiopia', '1999-03-13'),
(3, 'Rahel', 'Tesfaw', 'Esrael', 'pharmacist@asahc', '$2y$10$RgmTFOdh3.h5kW8Ia.BZ0OU6VytHXn1RuxFdu.hojwmq6hIUdwBAW', 'Pharmacist', 1, '0978878900', 'Female', '2025-03-23 13:13:19', 'Debre Tabor, Ethiopia', '1997-05-22'),
(5, 'Abebe', 'Alem', 'Sirawork', 'nurse@asahc', '$2y$10$DL9hfutFJNhyrRF1hPcMp.XoN6RVYgPgp/0pdV1yCULIGQa4EuTBa', 'Nurse', 1, '0989988767', 'Male', '2025-03-21 18:52:00', 'Debre Tabor, Ethiopia', '1999-03-13'),
(6, 'Tadele', 'Tsega', 'Misganaw', 'tadele@asahc', '$2y$10$bmACR7kTkkqSjdzpa0n6geVJwTUPe3I0ryICpNw3Azw8KIMmEB.8O', 'Clerk', 1, '0980808080', 'Male', '2025-05-31 16:23:12', 'Debre Tabor', '1995-06-30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `archived_drugs`
--
ALTER TABLE `archived_drugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `archived_by` (`archived_by`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `delivered_by` (`delivered_by`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `prescription_id` (`prescription_id`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registered_by` (`registered_by`);

--
-- Indexes for table `lab_reports`
--
ALTER TABLE `lab_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `lab_reports_ibfk_2` (`technician_id`),
  ADD KEY `lab_req_id` (`lab_req_id`);

--
-- Indexes for table `lab_requests`
--
ALTER TABLE `lab_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `requested_by` (`requested_by`);

--
-- Indexes for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `prescription_id` (`prescription_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `patient_id` (`patient_id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `prescribed_by` (`prescribed_by`),
  ADD KEY `dignosis_id` (`diagnosis_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `archived_drugs`
--
ALTER TABLE `archived_drugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `lab_reports`
--
ALTER TABLE `lab_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lab_requests`
--
ALTER TABLE `lab_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `medical_history`
--
ALTER TABLE `medical_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);

--
-- Constraints for table `archived_drugs`
--
ALTER TABLE `archived_drugs`
  ADD CONSTRAINT `archived_drugs_ibfk_1` FOREIGN KEY (`archived_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_3` FOREIGN KEY (`delivered_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `deliveries_ibfk_4` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  ADD CONSTRAINT `deliveries_ibfk_5` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `deliveries_ibfk_6` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`);

--
-- Constraints for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD CONSTRAINT `diagnosis_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `diagnosis_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);

--
-- Constraints for table `drugs`
--
ALTER TABLE `drugs`
  ADD CONSTRAINT `drugs_ibfk_1` FOREIGN KEY (`registered_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `lab_reports`
--
ALTER TABLE `lab_reports`
  ADD CONSTRAINT `lab_reports_ibfk_2` FOREIGN KEY (`technician_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `lab_reports_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `lab_reports_ibfk_4` FOREIGN KEY (`lab_req_id`) REFERENCES `lab_requests` (`id`);

--
-- Constraints for table `lab_requests`
--
ALTER TABLE `lab_requests`
  ADD CONSTRAINT `lab_requests_ibfk_2` FOREIGN KEY (`requested_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `lab_requests_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);

--
-- Constraints for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD CONSTRAINT `medical_history_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  ADD CONSTRAINT `prescriptions_ibfk_3` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis` (`id`),
  ADD CONSTRAINT `prescriptions_ibfk_4` FOREIGN KEY (`prescribed_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
