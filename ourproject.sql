-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2021 at 11:26 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ourproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `email`) VALUES
(1, 'abd@abc.com'),
(2, 'abd1@abc.com'),
(3, 'abd2@abc.com'),
(4, 'abd4@abc.com'),
(5, 'abd5@abc.com'),
(55, 'abd3@abc.com'),
(56, ''),
(57, ''),
(58, ''),
(59, ''),
(60, ''),
(61, ''),
(62, 'abd'),
(63, 'abd@gmail.com'),
(64, ''),
(65, ''),
(66, 'dads'),
(67, 'abd@wis.com'),
(68, 'dd@as.com'),
(69, 'famawec319@ummoh.com'),
(70, 'famawec319@ummoh.com');

-- --------------------------------------------------------

--
-- Table structure for table `disabilities`
--

CREATE TABLE `disabilities` (
  `disabilityID` int(11) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `AddDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `disabilities`
--

INSERT INTO `disabilities` (`disabilityID`, `Name`, `AddDate`) VALUES
(1, 'Handicap ', '2021-03-31 06:44:25'),
(2, 'Deaf', '2021-03-31 06:44:35'),
(3, 'Blind', '2021-03-31 06:44:41');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `FAQ_ID` int(11) NOT NULL,
  `Question` varchar(1000) NOT NULL,
  `Answer` varchar(2000) NOT NULL,
  `AddDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`FAQ_ID`, `Question`, `Answer`, `AddDate`) VALUES
(1, 'Who we are?', 'Josor team', '2021-03-24'),
(2, 'What is Josor?', 'It is a long established fact that a reader will be distracted by the  a page when looking at its layout It is a long established fact that a reader will be distracted by the  a page when looking at its layout It is a long established fact that a reader will be distracted by the  a page when looking at its layout', '2021-03-24'),
(3, 'What is Josor2?', 'It is a long established fact that a reader will be distracted by the  a page when looking at its layout It is a long established fact that a reader will be distracted by the  a page when looking at its layout It is a long established fact that a reader will be distracted by the  a page when looking at its layout', '2021-03-24');

-- --------------------------------------------------------

--
-- Table structure for table `hire_me`
--

CREATE TABLE `hire_me` (
  `id` int(11) NOT NULL,
  `skills` int(11) NOT NULL,
  `location` int(11) NOT NULL,
  `kind_of_disability` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hire_me`
--

INSERT INTO `hire_me` (`id`, `skills`, `location`, `kind_of_disability`) VALUES
(1, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jobapplication`
--

CREATE TABLE `jobapplication` (
  `id` int(11) NOT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `serviceProviderUserId` int(11) NOT NULL,
  `deliveryData` date NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `Job_ID` int(11) NOT NULL,
  `Job_Title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Job_description` varchar(800) COLLATE utf8_unicode_ci NOT NULL,
  `Skill_ID` int(11) NOT NULL,
  `price` decimal(11,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`Job_ID`, `Job_Title`, `Job_description`, `Skill_ID`, `price`) VALUES
(3, 'Web Developer', 'Creating new websites ', 1, '1200'),
(4, 'Civil Engineer', 'Fix buildings ', 2, '10');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_ID` int(11) NOT NULL,
  `location_name` varchar(100) NOT NULL,
  `addDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_ID`, `location_name`, `addDate`) VALUES
(1, 'Hebron', '2021-04-10'),
(2, 'Jerusalem ', '2021-04-11'),
(3, 'Jericho', '2021-04-10'),
(4, 'Nablus', '2021-04-10');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `rate` int(5) NOT NULL,
  `ordered` int(11) NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviewsforserviceprovider`
--

CREATE TABLE `reviewsforserviceprovider` (
  `id` int(11) NOT NULL,
  `serviceProviderUserId` int(11) NOT NULL,
  `reviewerName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `reviewDescription` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `category` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `category`, `name`) VALUES
(1, 'Technology ', 'Technology '),
(2, 'Engineering', 'Engineering'),
(3, 'Business', 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `typeofservice`
--

CREATE TABLE `typeofservice` (
  `typeOfServiceId` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `addDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `userTypeid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `Name`, `email`, `password`, `phone`, `userTypeid`) VALUES
(1234567736, 'subhi', 'SAlmohtasib@ecslimited.com', '123', '1234556', 2),
(1234567737, 'abd', 'abd@test.com', '123', '0599123123', 2);

-- --------------------------------------------------------

--
-- Table structure for table `userskills`
--

CREATE TABLE `userskills` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `skill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `usertypeID` int(11) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `AddDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`usertypeID`, `Description`, `AddDate`) VALUES
(1, 'Admin', '2021-03-24'),
(2, 'Regular ', '2021-03-24'),
(3, 'Service Provider', '2021-03-31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disabilities`
--
ALTER TABLE `disabilities`
  ADD PRIMARY KEY (`disabilityID`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`FAQ_ID`);

--
-- Indexes for table `hire_me`
--
ALTER TABLE `hire_me`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_hireMe_disability` (`kind_of_disability`),
  ADD KEY `FK_hireMe_skills` (`skills`),
  ADD KEY `FK_hireMe_locations` (`location`);

--
-- Indexes for table `jobapplication`
--
ALTER TABLE `jobapplication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `providerId` (`serviceProviderUserId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`Job_ID`),
  ADD KEY `FK_Jobs_Skills` (`Skill_ID`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_ID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderId` (`ordered`);

--
-- Indexes for table `reviewsforserviceprovider`
--
ALTER TABLE `reviewsforserviceprovider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serviceProviderUserId` (`serviceProviderUserId`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `FK_User_UserType` (`userTypeid`);

--
-- Indexes for table `userskills`
--
ALTER TABLE `userskills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`),
  ADD UNIQUE KEY `skill` (`skill`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`usertypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `disabilities`
--
ALTER TABLE `disabilities`
  MODIFY `disabilityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `FAQ_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hire_me`
--
ALTER TABLE `hire_me`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobapplication`
--
ALTER TABLE `jobapplication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `Job_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviewsforserviceprovider`
--
ALTER TABLE `reviewsforserviceprovider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1234567738;

--
-- AUTO_INCREMENT for table `userskills`
--
ALTER TABLE `userskills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `usertypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hire_me`
--
ALTER TABLE `hire_me`
  ADD CONSTRAINT `FK_hireMe_disability` FOREIGN KEY (`kind_of_disability`) REFERENCES `disabilities` (`disabilityID`),
  ADD CONSTRAINT `FK_hireMe_locations` FOREIGN KEY (`location`) REFERENCES `locations` (`location_ID`),
  ADD CONSTRAINT `FK_hireMe_skills` FOREIGN KEY (`skills`) REFERENCES `skills` (`id`);

--
-- Constraints for table `jobapplication`
--
ALTER TABLE `jobapplication`
  ADD CONSTRAINT `providerId` FOREIGN KEY (`serviceProviderUserId`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `FK_Jobs_Skills` FOREIGN KEY (`Skill_ID`) REFERENCES `skills` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `orderId` FOREIGN KEY (`ordered`) REFERENCES `jobapplication` (`id`);

--
-- Constraints for table `reviewsforserviceprovider`
--
ALTER TABLE `reviewsforserviceprovider`
  ADD CONSTRAINT `reviewsforserviceprovider_ibfk_1` FOREIGN KEY (`serviceProviderUserId`) REFERENCES `user` (`serviceProviderUserId`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_User_UserType` FOREIGN KEY (`userTypeid`) REFERENCES `user_type` (`usertypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
