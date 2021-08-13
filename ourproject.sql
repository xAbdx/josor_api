-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2021 at 11:41 PM
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
(55, 'abd3@abc.com'),
(63, 'abd@gmail.com'),
(67, 'abd@wis.com'),
(68, 'dd@as.com'),
(69, 'famawec319@ummoh.com'),
(70, 'famawec319@ummoh.com'),
(71, 'dawnzabel@hotmail.com'),
(72, 'dawnzabel@hotmail.com'),
(73, 'sal@test.cpo');

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
(1, 'Handicap ', '2021-05-31 13:05:04'),
(2, 'Deaf\r\n', '2021-05-31 13:05:04'),
(3, 'hard of hearing\r\n', '2021-05-31 13:05:16'),
(4, 'Mental Illness\r\n', '2021-05-31 13:05:16'),
(5, 'autism ', '2021-05-31 13:05:28'),
(6, 'physical disability\r\n', '2021-05-31 13:05:28'),
(7, 'Dwarfism', '2021-05-31 13:05:36');

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
(2, 'What is Josor?', 'It is a website that provides you to apply for a job that is your major if you have any kind of disability.', '2021-03-24'),
(3, 'Why is Josor2?', 'War. Poverty. Crime. Hunger. With all of the injustices that exist in today’s world, it can be easy to lose faith in humanity. We may ask ourselves, “Why should we care if no one else does? Nothing ever seems to change or get any better, so we might as well accept the world as it is. it is important to acknowledge the existing injustices and view them as serious issues that need to be resolved, it is equally important for us to realize our own part in seeing those solutions become part of reality, so in this point of view we provide a safe way to get your money.', '2021-03-24'),
(4, 'What is Josor3?', 'It is a long established fact that a reader will be distracted by the  a page when looking at its layout It is a long established fact that a reader will be distracted by the  a page when looking at its layout It is a long established fact that a reader will be distracted by the  a page when looking at its layout', '2021-03-24'),
(10, 'What is Josor4?', 'It is a long established fact that a reader will be distracted by the  a page when looking at its layout It is a long established fact that a reader will be distracted by the  a page when looking at its layout It is a long established fact that a reader will be distracted by the  a page when looking at its layout', '2021-03-24');

-- --------------------------------------------------------

--
-- Table structure for table `hire_me`
--

CREATE TABLE `hire_me` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `skills` int(11) NOT NULL,
  `kind_of_disability` int(11) NOT NULL,
  `imagePath` text NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hire_me`
--

INSERT INTO `hire_me` (`id`, `email`, `skills`, `kind_of_disability`, `imagePath`, `userID`) VALUES
(18, 'xxxx@xxx.com', 3, 2, 'uploads/537506-986430-????????????-??????????????.jpg', 1234567736);

-- --------------------------------------------------------

--
-- Table structure for table `jobapplication`
--

CREATE TABLE `jobapplication` (
  `id` int(11) NOT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `clientId` int(11) NOT NULL,
  `serviceProviderId` int(11) NOT NULL,
  `deliveryDate` date NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobapplication`
--

INSERT INTO `jobapplication` (`id`, `status`, `clientId`, `serviceProviderId`, `deliveryDate`, `price`) VALUES
(2, 'on', 0, 0, '0000-00-00', 0),
(20, 'on', 0, 1234567738, '2021-08-13', 1196),
(21, 'on', 0, 1234567737, '2021-07-31', 123);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `Job_ID` int(11) NOT NULL,
  `Job_Title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Job_description` varchar(800) COLLATE utf8_unicode_ci NOT NULL,
  `Skill_ID` int(11) NOT NULL,
  `price` decimal(11,0) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`Job_ID`, `Job_Title`, `Job_description`, `Skill_ID`, `price`, `userID`) VALUES
(15, 'Software Engineer ', 'I need a very good developer to develop my website along with a mobile application. The job will start on September 1st 2021. Please contact me ASAP ', 1, '1196', 1234567736),
(16, 'Math Teacher ', 'TEST TEST TEST ', 6, '200', 1234567736),
(17, 'Flutter Developer', 'I need a flutter developer ', 1, '1197', 1234567736),
(18, 'test', 'test', 6, '1200', 0),
(19, 'test', 'test', 4, '12', 0),
(20, 'test2', 'test2', 4, '123', 0);

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
(1, '', 'Technology'),
(2, '', 'Engineering'),
(3, '', 'Business'),
(4, '', 'Agriculture'),
(5, '', 'Data scientist'),
(6, '', 'Mathematics');

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
  `userTypeid` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `Name`, `email`, `password`, `phone`, `userTypeid`) VALUES
(1234567736, 'subhi', 'SAlmohtasib@ecslimited.com', '123', '1234556', 2),
(1234567737, 'abd', 'abd@test.com', '123', '0599123123', 2),
(1234567738, 'test', 'test@test.com', '123', '0599123123', 1),
(1234567741, 'test3', 'test3@abc.com', '123', '0599323123', 2),
(1234567755, 'test22', 'tes22t@gmail.com', '123123123', '05999999993231', 2),
(1234567756, 'asfd', 'asdf@sdaf.comds', '123123123', '12312312312312', 2),
(1234567757, 'test121212', 'test12122@gmial.com', '1.1111111111111E+26', '1.111111111111', 2),
(1234567758, 'basma', 'basma@test.com', '123123123', '05912937221', 2),
(1234567759, 'oroob', 'oroob@m.com', '123123123', '123123123123', 3),
(1234567760, 'AbdxSalameh', 'abd1@g1mail.com', '123123123', '05992999999222', 2),
(1234567761, 'basma', 'basmat@test.com', '123456789', '0599999999', 2),
(1234567762, 'uroob', 'uroob@gmail.com', '12345678', '0599436565', 3),
(1234567763, 'my', 'my@my.com', '123', '123', 3);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hire_me`
--
ALTER TABLE `hire_me`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_hireMe_disability` (`kind_of_disability`),
  ADD KEY `FK_hireMe_skills` (`skills`);

--
-- Indexes for table `jobapplication`
--
ALTER TABLE `jobapplication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `providerId` (`serviceProviderId`),
  ADD KEY `userId` (`clientId`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `disabilities`
--
ALTER TABLE `disabilities`
  MODIFY `disabilityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `hire_me`
--
ALTER TABLE `hire_me`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `jobapplication`
--
ALTER TABLE `jobapplication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `Job_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1234567764;

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
  ADD CONSTRAINT `FK_hireMe_disability` FOREIGN KEY (`kind_of_disability`) REFERENCES `disabilities` (`disabilityID`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `FK_Jobs_Skills` FOREIGN KEY (`Skill_ID`) REFERENCES `skills` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_UserTypeId` FOREIGN KEY (`userTypeid`) REFERENCES `user_type` (`usertypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
