-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2024 at 06:43 AM
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
-- Database: `fast_csd`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_code`, `course_name`) VALUES
(1, 'BSIS', 'BACHELOR OF SCIENCE IN INFORMATION SYSTEMS'),
(2, 'BSCS', 'BACHELOR OF SCIENCE IN COMPUTER SCIENCE'),
(3, 'BSIT', 'BACHELOR OF SCIENCE IN INFORMATION TECHNOLOGY'),
(4, 'BSIT-ANIM', 'BACHELOR OF SCIENCE IN INFORMATION TECHNOLOGY (ANIMATION MAJOR)');

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `faculty_id` int(30) NOT NULL,
  `names` varchar(100) NOT NULL,
  `contact_no` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `coordinator` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `image` varchar(55) NOT NULL DEFAULT 'default.jpg',
  `type` char(1) NOT NULL DEFAULT 'p'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`faculty_id`, `names`, `contact_no`, `email`, `password`, `coordinator`, `address`, `image`, `type`) VALUES
(1, 'professor1', '09123456789', 'professor1@gmail.com', 'password1', 'DEPARTMENT HEAD', 'Polangui, Albay', 'prof12.png', 'p'),
(2, 'professor2', '09321457699', 'professor2@gmail.com', 'password2', 'COLLEGE RESEARCH & EXTENSION COORDINATOR/BSIT PROGRAM COORDINATOR', 'Polangui, Albay', 'prof8.png', 'p'),
(3, 'professor3', '09875635281', 'professor3@gmail.com', 'password3', 'BSCS PROGRAM COORDINATOR', 'Polangui, Albay', 'prof5.png', 'p'),
(4, 'professor4', '09213457689', 'professor4@gmail.com', 'password4', 'BSIT-ANIMATION PROGRAM COORDINATOR', 'Polangui, Albay', 'prof10.png', 'p'),
(5, 'professor5', '09121234567', 'professor5@gmail.com', 'password5', 'BSIS PROGRAM COORDINATOR', 'Polangui, Albay', 'prof9.png', 'p'),
(6, 'professor6', '', 'professor6@gmail.com', '', '', '', 'default.jpg', 'p');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_name`) VALUES
(1, 'ECB 201'),
(2, 'ECB 202'),
(3, 'ECB 203'),
(4, 'ECB 204'),
(5, 'ECB 205'),
(6, 'CL 1'),
(7, 'CL 2'),
(8, 'CL 3'),
(9, 'CL 4'),
(10, 'CL 5');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `sched_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `yr_and_block` varchar(55) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `day_of_week` varchar(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `from_month` varchar(20) NOT NULL,
  `to_month` varchar(20) NOT NULL,
  `year` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`sched_id`, `faculty_id`, `course_id`, `yr_and_block`, `start_time`, `end_time`, `day_of_week`, `subject`, `from_month`, `to_month`, `year`, `room_id`) VALUES
(1, 3, 1, '2A', '09:00:00', '10:00:00', 'Monday', 'System Analysis, Design and Development', 'January', 'May', 2024, 4),
(2, 3, 1, '2B', '09:00:00', '10:30:00', 'Monday', 'System Analysis, Design and Development', 'January', 'May', 2024, 4),
(3, 3, 1, '2A', '09:00:00', '12:00:00', 'Wednesday', 'System Analysis, Design and Development', 'January', 'May', 2024, 9),
(4, 6, 1, '2A', '13:00:00', '14:30:00', 'Thursday', 'Organization Development', 'January', 'May', 2024, 2),
(5, 6, 1, '2B', '14:30:00', '16:00:00', 'Sunday', 'Organization Development', 'January', 'May', 2024, 2),
(9, 3, 2, '2A', '13:00:00', '14:30:00', 'Tuesday', 'System Analysis, Design and Development', 'January', 'May', 2024, 2),
(10, 3, 2, '2B', '14:30:00', '16:00:00', 'Tuesday', 'System Analysis, Design and Development', 'January', 'May', 2024, 2),
(11, 3, 2, '3B', '07:30:00', '09:00:00', 'Sunday', 'System Analysis, Design and Development', 'January', 'May', 2024, 4),
(12, 3, 1, '2B', '13:00:00', '15:00:00', 'Wednesday', 'System Analysis, Design and Development', 'January', 'May', 2024, 9),
(13, 3, 4, '2A', '02:36:00', '05:36:00', 'Sunday', 'System Analysis, Design and Development', 'January', 'May', 2024, 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `names` varchar(55) NOT NULL,
  `email` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  `user_type` char(1) NOT NULL DEFAULT 'u' COMMENT 'a - admin\r\nu - user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `names`, `email`, `password`, `user_type`) VALUES
(1, 'Test One', 'test1@gmail.com', 'testing', 'u'),
(2, 'Student1', 'student1@gmail.com', 'student1', 'u'),
(5, 'Student2', 'student2@gmail.com', 'student2', 'u'),
(6, 'Admin', 'admin@gmail.com', '1234', 'a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`sched_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `faculty_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `sched_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
