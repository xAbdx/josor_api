-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2021 at 12:20 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

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
(87, ''),
(88, 'abd@gmail.com'),
(89, 'test@gmail.wercom');

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
(4, 'hard of hearing', '2021-03-31 06:44:35'),
(5, 'Mental Illness', '2021-03-31 06:44:35'),
(6, 'autism ', '2021-03-31 06:44:35'),
(7, 'physical disability', '2021-03-31 06:44:35'),
(8, 'Dwarfism', '2021-03-31 06:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `answer` varchar(2000) NOT NULL,
  `AddDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `answer`, `AddDate`) VALUES
(2, 'Who is Josor?', 'A website that provides you to apply for a job that is your major if you have any kind of disability.', '2021-03-24'),
(19, 'Why is Josor?', 'War. Poverty. Crime. Hunger. With all of the injustices that exist in today’s world, it can be easy to lose faith in humanity. We may ask ourselves, “Why should we care if no one else does? Nothing ever seems to change or get any better, so we might as well accept the world as it is.”\r\n\r\nAlthough it is important to acknowledge the existing injustices and view them as serious issues that need to be resolved, it is equally important for us to realize our own part in seeing those solutions become part of reality, so in this point of view we provide a safe way to get your money.', '2021-03-24'),
(20, 'What is Josor?', 'A website that provides you to apply for a job that is your major if you have any kind of disability.', '2021-03-24');

-- --------------------------------------------------------

--
-- Table structure for table `hire_me`
--

CREATE TABLE `hire_me` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `kind_of_disability` int(11) NOT NULL,
  `serviceProvider_Skills` int(11) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jobapplication`
--

CREATE TABLE `jobapplication` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `serviceProvider` int(11) NOT NULL,
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
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`Job_ID`, `Job_Title`, `Job_description`, `Skill_ID`, `price`) VALUES
(3, 'Web Developer', 'Creating new websites ', 1, 1200),
(4, 'Civil Engineer', 'Fix buildings ', 2, 10),
(10, 'Raising a small company', 'Raising a small company', 3, 12002),
(12, 'AAAsadfAAA SADFsad', 'AAdsdafADS DAF', 1, 1223),
(17, 'AAAsadfAAA SADFsad', 'AAdsdafADS DAF', 1, 1223),
(18, 'test', 'test', 2, 1223),
(25, 'sdaf', 'dsafsadf', 2, 0),
(26, 'testd', 'tedst', 1, 1223),
(27, 'sdafsadf', 'dsafsadfdsfa', 3, 0),
(28, 'sdafsadfasdfdasf', 'dsafsadfdsfaasdfafds', 3, 0),
(29, 'test', 'test', 1, 0),
(30, 'test', 'test', 57, 0),
(31, 'test1', 'test1', 57, 0),
(32, 'my', 'myself ', 2, 132),
(33, 'my', 'myself ', 2, 132),
(34, 'd', '', 0, 0),
(35, 'd', 'd', 2, 12),
(36, 'test', 'test', 1, 1);

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
(3, 'Business', 'Business'),
(57, '', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `typeofservice`
--

CREATE TABLE `typeofservice` (
  `typeOfServiceId` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
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
  `userTypeid` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `Name`, `email`, `password`, `phone`, `userTypeid`) VALUES
(1, 'test', 'test@test.com', '123', '599112312', 1),
(2, 'Subhi', 'salmohtasib@g.com', '123', '599001122', 2),
(3, 'subhi', 'SAlmohtasib@ecslimited.com', '123', '123123', 2),
(4, 'abd', 'abd@gmail.com', '123', '599987654', 2),
(5, 'aaa', 'aaa@asa.com', '123', '123123', 2),
(6, 'deleteMe', 'deleteme@s.com', '123', '123947', 2),
(7, 'deleteMe', 'deleteMe@asdf.com', '123', '123984871', 2),
(8, 'msalameh', 'sam@1223.com', '123', '', 2),
(10, 'msalameh', 'sam@12s23.com', '123d', '', 2),
(11, 'vitiyi5071', 'vitiyi5071@mailcupp.com', '123', '05999', 2),
(12, 'famawec319', 'famawec319@ummoh.com', '123', '0599999999', 2),
(13, 'famawec3319', 'famawec3139@ummoh.com', '123', '05999999992323', 2),
(14, 'Abdx', 'abd@gamail.com', '123', '0599999999', 2),
(15, 'Salameh', 'sam@12d23.com', '123', '0599999999', 2),
(16, 'vitiyi5071d', 'sam@12dd23.com', '123', '0599999999', 2),
(17, 'msalameh', 'sadm@1223.com', '', '0599999999', 2),
(19, 'msalameh', 'sadmd@1223.com', '2', '0599999999', 2),
(21, 'msalameh', 'sadmwd@1223.com', '2', '0599999999', 2),
(22, '192423', 'abd@wissa.com', '123', '0599999999', 2),
(24, 'vitiyi5071d', 'sdaf@gmail.com', '123', '0599999999', 2),
(26, 'vitiyi5071d', 'sdaf@gm2ail.com', '123', '6000000212112', 2),
(30, 'vitiyi5071d', 'sdaf@gmd2ail.com', '123', '6000000212112', 2),
(32, 'vitiyi5071d', 'sdaf@gmed2ail.com', '123', '6000000212112', 2),
(33, 'AAA', 'AAdsA@a.com', '123123', '01234567890123', 2),
(35, '', '', '', '', 2),
(36, 'asdf', 'asdfsdfa', '123', '0599999999', 2),
(37, 'dsa', 'asdf', 'ds', '', 2),
(39, 'dsa', 'asdffdas', 'ds', '', 2),
(41, 'sadffas', 'sam@122asdf3.com', '123', '0599999999', 2),
(43, 'sadffas', 'sam@122sdasdf3.com', '123', '0599999999', 2),
(45, 'sadffas', 'sam@1d22sdasdf3.com', '123', '05999999323311', 2),
(46, 'vitiyi5071we', 'sam@12weew23.com', '123', '01234567890123', 2),
(48, 'vitiyi5071we', 'sam@12wdeew23.com', '123', '01234567890123', 2),
(50, 'vitiyi5071we', 'asdfsadf', '123', '01234567890123', 2),
(52, 'vitiyi5071we', 'asdfsadfd', '123', '01234567890123', 2),
(53, 'vitiyi5071we', 'asdfsadfd@sdaf.com', '123', '01234567890123', 2),
(54, 'test1 ', 'test@gmail1.com', '123', '0599999999212', 2),
(55, 'test2 ', 'tes2t@gmail.com', '123', '05999999991231', 2),
(56, 'msalameh@!', 'dfffff@sad.com', '123', '123123123', 2),
(57, 'adsfsdaf', 'abd@wis.com', '12', '1', 2),
(58, 'famawec319', 'sdaf@adsdf.comadsss', '12312312', '05999999991221', 2),
(61, 'test12', 'test12@gmail.com', '123123123', '05999999991212', 2),
(64, 'test12', 'test12@gm2ail.com', '123123123', '05999999991212', 2),
(68, 'asd192423', 'sasfdam@1223.com', '123123123', '0599999999123', 2),
(69, 'my', 'my@my.my', '123123123', '123123123', 2);

-- --------------------------------------------------------

--
-- Table structure for table `userskills`
--

CREATE TABLE `userskills` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `skill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userskills`
--

INSERT INTO `userskills` (`id`, `user`, `skill`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `usertypeID` int(11) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `AddDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`usertypeID`, `Description`, `AddDate`) VALUES
(1, 'Admin', '2021-03-23 22:00:00'),
(2, 'Regular ', '2021-03-23 22:00:00'),
(3, 'Service Provider', '2021-03-30 21:00:00');

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hire_me`
--
ALTER TABLE `hire_me`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_hireMe_disability` (`kind_of_disability`),
  ADD KEY `FK_hireMe_skills` (`job_id`),
  ADD KEY `FK_serviceProvider_Skills` (`serviceProvider_Skills`);

--
-- Indexes for table `jobapplication`
--
ALTER TABLE `jobapplication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `serviceProviderFK` (`serviceProvider`),
  ADD KEY `job_Id_FK` (`job_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`Job_ID`),
  ADD KEY `FK_Jobs_Skills` (`Skill_ID`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `typeofservice`
--
ALTER TABLE `typeofservice`
  ADD PRIMARY KEY (`typeOfServiceId`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `disabilities`
--
ALTER TABLE `disabilities`
  MODIFY `disabilityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `Job_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `typeofservice`
--
ALTER TABLE `typeofservice`
  MODIFY `typeOfServiceId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `userskills`
--
ALTER TABLE `userskills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `FK_hireMe_skills` FOREIGN KEY (`job_id`) REFERENCES `skills` (`id`),
  ADD CONSTRAINT `FK_serviceProvider_Skills` FOREIGN KEY (`serviceProvider_Skills`) REFERENCES `skills` (`id`);

--
-- Constraints for table `jobapplication`
--
ALTER TABLE `jobapplication`
  ADD CONSTRAINT `job_Id_FK` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`Job_ID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_UserTypeId` FOREIGN KEY (`userTypeid`) REFERENCES `user_type` (`usertypeID`);

--
-- Constraints for table `userskills`
--
ALTER TABLE `userskills`
  ADD CONSTRAINT `FK_user_skill` FOREIGN KEY (`skill`) REFERENCES `skills` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
