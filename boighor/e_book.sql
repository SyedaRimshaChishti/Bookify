-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2024 at 05:20 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_book`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`) VALUES
(1, 'admin', 'loginadmin');

-- --------------------------------------------------------

--
-- Table structure for table `book_details`
--

CREATE TABLE `book_details` (
  `book_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publication_date` varchar(19) DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_details`
--

INSERT INTO `book_details` (`book_id`, `title`, `author`, `publication_date`, `genre`, `price`, `description`, `image_path`) VALUES
(1, 'rimsah new book', 'hello its me', '22-10-2024', 'comedy', '200.00', 'hello its new description', '7.jpg'),
(3, 'Mystery of the Old Mansion', 'John Doe', '2018-05-21', 'Mystery', '25.00', NULL, '8.jpg'),
(4, 'The Last Adventure', 'Jane Smith', '2019-11-15', 'Adventure', '22.50', NULL, '9.jpg'),
(6, 'Romance in Paris', 'Michael Brown', '2022-01-18', 'Romance', '32.00', NULL, '10.jpg'),
(7, 'Cookbook for Beginners', 'Linda Johnson', '2020-03-12', 'Cookbook', '18.75', NULL, '11.jpg\r\n'),
(8, 'Historical Legends', 'Chris Lee', '2017-09-09', 'Historical', '27.50', NULL, '12.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `competition_user`
--

CREATE TABLE `competition_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gmail` varchar(100) NOT NULL,
  `story_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `competition_user`
--

INSERT INTO `competition_user` (`id`, `user_id`, `gmail`, `story_name`) VALUES
(1, 1, 'syedarimshachishti3@gmail.com', 'The castle');

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE `email` (
  `email_id` int(11) NOT NULL,
  `email_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email`
--

INSERT INTO `email` (`email_id`, `email_address`) VALUES
(1, 'john.doe@workmail.com'),
(2, 'jane.smith@personalmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `feedback_text` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `user_id`, `feedback_text`, `rating`) VALUES
(1, 1, 'Amazing book, a must-read!', 5),
(2, 2, 'Very insightful and thought-provoking.', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `address`, `user_name`, `user_email`, `user_id`, `book_id`, `order_date`, `quantity`, `total_price`) VALUES
(1, 'ABC road chimp', 'john_doe', 'john.doe@example.com', 1, 1, '2024-09-08 18:38:03', 1, '10.99');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `manager_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`shop_id`, `shop_name`, `location`, `contact_number`, `manager_name`, `email`, `description`, `image_path`) VALUES
(3, 'Book Haven', '123 Main St, Springfield', '123-456-7890', 'Alice Johnson', 'alice@bookhaven.com', 'A cozy bookstore offering a curated selection of novels, non-fiction, and children\'s books. Enjoy our reading nooks and a warm cup of coffee while you browse.', '1.jpg'),
(4, 'Readers Paradise', '456 Elm St, Springfield', '234-567-8901', 'Bob Smith', 'bob@readersparadise.com', 'Your go-to destination for the latest bestsellers and classic literature. We host weekly book clubs and author signing events to engage with our community.', '2.jpg'),
(5, 'The Book Nook', '789 Maple St, Springfield', '345-678-9012', 'Charlie Brown', 'charlie@thebooknook.com', 'A charming little shop filled with rare finds and hidden gems. We specialize in vintage books and offer personalized recommendations from our knowledgeable staff.', '3.jpg'),
(6, 'Literary Lounge', '321 Oak St, Springfield', '456-789-0123', 'Diana Prince', 'diana@literarylounge.com', 'A stylish and modern space designed for book lovers to read, relax, and socialize. We provide comfy seating and host monthly poetry readings and open mic nights.', '4.jpg'),
(7, 'Epic Reads', '654 Pine St, Springfield', '567-890-1234', 'Edward Elric', 'edward@epicreads.com', 'A large bookstore featuring a vast selection of comics, graphic novels, and popular series. We pride ourselves on being a hub for local artists and enthusiasts.', '5.jpg'),
(9, 'hello world', 'karachi', '049837983567429', 'zainab', 'syedarimshachishti3@gmail.com', 'hwllo ', '13.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_deatail`
--

CREATE TABLE `user_deatail` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `re_password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_deatail`
--

INSERT INTO `user_deatail` (`user_id`, `username`, `password`, `re_password`, `email`, `phone`) VALUES
(1, 'john_doe', 'password123', '', 'john.doe@example.com', ''),
(2, 'jane_smith', 'password456', '', 'jane.smith@example.com', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `book_details`
--
ALTER TABLE `book_details`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `competition_user`
--
ALTER TABLE `competition_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gmail` (`gmail`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_email` (`user_email`),
  ADD KEY `user_name` (`user_name`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `user_deatail`
--
ALTER TABLE `user_deatail`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `book_details`
--
ALTER TABLE `book_details`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `competition_user`
--
ALTER TABLE `competition_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
  MODIFY `email_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `shop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_deatail`
--
ALTER TABLE `user_deatail`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `competition_user`
--
ALTER TABLE `competition_user`
  ADD CONSTRAINT `competition_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_deatail` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_deatail` (`user_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_deatail` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book_details` (`book_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`user_email`) REFERENCES `user_deatail` (`email`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`user_name`) REFERENCES `user_deatail` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
