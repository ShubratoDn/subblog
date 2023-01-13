-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 13, 2023 at 02:42 PM
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
-- Database: `sdn_subblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `img` varchar(300) NOT NULL,
  `upload_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`blog_id`, `author`, `cat_id`, `title`, `content`, `img`, `upload_time`) VALUES
(3, 5, 3, 'Java, a secure programming language', 'Java is the most popular object-oriented programming language. It provides a variety of salient features that are preferred by the developers. It is the reason that a billion of devices runs on Java. In this section, we are going to discuss why Java is secure.\r\n\r\nJava is secure due to the following reasons:\r\n\r\nJava programs run inside a virtual machine which is known as a sandbox.\r\nJava does not support explicit pointer.\r\nByte-code verifier checks the code fragments for illegal code that can violate access right to object.\r\nIt provides java.security package implements explicit security.\r\nIt provides library level safety.\r\nRun-time security check takes place when we load new code.\r\nJava provides some other features that make Java more secure.', '5_3_cb88-java-logo-001.jpg', '2022-12-22 18:56:29'),
(4, 5, 4, 'What is HTML?', 'HTML stands for Hyper Text Markup Language\r\nHTML is the standard markup language for creating Web pages\r\nHTML describes the structure of a Web page\r\nHTML consists of a series of elements\r\nHTML elements tell the browser how to display the content\r\nHTML elements label pieces of content such as \"this is a heading\", \"this is a paragraph\", \"this is a link\", etc.', '5_4_download.jpg', '2022-12-22 18:59:35'),
(7, 8, 5, 'What is Web Design?', 'Web design refers to the design of websites that are displayed on the internet. It usually refers to the user experience aspects of website development rather than software development. Web design used to be focused on designing websites for desktop browsers; however, since the mid-2010s, design for mobile and tablet browsers has become ever-increasingly important.\r\n\r\nA web designer works on the appearance, layout, and, in some cases, content of a website. Appearance, for instance, relates to the colors, font, and images used. Layout refers to how information is structured and categorized. A good web design is easy to use, aesthetically pleasing, and suits the user group and brand of the website. Many webpages are designed with a focus on simplicity, so that no extraneous information and functionality that might distract or confuse users appears. As the keystone of a web designer’s output is a site that wins and fosters the trust of the target audience, removing as many potential points of user frustration as possible is a critical consideration.\r\n\r\nTwo of the most common methods for designing websites that work well both on desktop and mobile are responsive and adaptive design. In responsive design, content moves dynamically depending on screen size; in adaptive design, the website content is fixed in layout sizes that match common screen sizes. Preserving a layout that is as consistent as possible between devices is crucial to maintaining user trust and engagement. As responsive design can present difficulties in this regard, designers must be careful in relinquishing control of how their work will appear. If they are responsible for the content as well, while they may need to broaden their skillset, they will enjoy having the advantage of full control of the finished product.', '8_5_download.jpg', '2022-12-23 08:43:26'),
(9, 1, 7, 'What is JavaScript?', 'A high-level definition\r\nJavaScript is a scripting or programming language that allows you to implement complex features on web pages — every time a web page does more than just sit there and display static information for you to look at — displaying timely content updates, interactive maps, animated 2D/3D graphics, scrolling video jukeboxes, etc. — you can bet that JavaScript is probably involved. It is the third layer of the layer cake of standard web technologies, two of which (HTML and CSS) we have covered in much more detail in other parts of the Learning Area.', '1_7_What-is-JavaScript-1.jpg', '2022-12-23 17:02:22'),
(10, 1, 6, 'Web Developement!!', 'Web development is the work involved in developing a website for the Internet (World Wide Web) or an intranet (a private network).[1] Web development can range from developing a simple single static page of plain text to complex web applications, electronic businesses, and social network services. A more comprehensive list of tasks to which Web development commonly refers, may include Web engineering, Web design, Web content development, client liaison, client-side/server-side scripting, Web server and network security configuration, and e-commerce development.\r\n\r\nAmong Web professionals, \"Web development\" usually refers to the main non-design aspects of building Web sites: writing markup and coding.[2] Web development may use content management systems (CMS) to make content changes easier and available with basic technical skills.', '1_6_0_M4bxiCIjcTK-2Xr6.jpeg', '2022-12-23 17:03:47'),
(11, 8, 10, 'Android software development', 'Android software development is the process by which applications are created for devices running the Android operating system. Google states that[3] \"Android apps can be written using Kotlin, Java, and C++ languages\" using the Android software development kit (SDK), while using other languages is also possible. All non-Java virtual machine (JVM) languages, such as Go, JavaScript, C, C++ or assembly, need the help of JVM language code, that may be supplied by tools, likely with restricted API support. Some programming languages and tools allow cross-platform app support (i.e. for both Android and iOS). Third party tools, development environments, and language support have also continued to evolve and expand since the initial SDK was released in 2008. The official Android app distribution mechanism to end users is Google Play; it also allows staged gradual app release, as well as distribution of pre-release app versions to testers.', 'appdev.jpg', '2022-12-25 17:19:37'),
(14, 1, 8, 'This is my lifestyle', 'Lifestyle refers to the way a person lives, including their habits, behaviors, routines, and choices. It can encompass a wide range of factors, including diet, exercise, work, leisure activities, relationships, and personal habits. A healthy lifestyle involves making choices that support physical, mental, and emotional well-being. This may involve exercising regularly, eating a balanced and nutritious diet, getting enough sleep, maintaining positive relationships, and engaging in activities that bring enjoyment and fulfillment. Making healthy lifestyle choices can help to prevent or manage a variety of health conditions, such as obesity, heart disease, and diabetes, and can also contribute to overall well-being and happiness.', '1_8_Lifestyle-Images-Genre.jpg', '2022-12-30 08:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `name`, `description`) VALUES
(3, 'JAVA', 'It is one of the most Secure programming language'),
(4, 'HTML', 'Mark up language'),
(5, 'Web Desinging', 'Web design refers to the design of websites that are displayed on the internet.'),
(6, 'Web Development ', ''),
(7, 'Java Script\r\n', 'JS'),
(8, 'Life Style', 'It is about my life'),
(9, 'PHP', 'PHP is a general-purpose scripting language geared toward web development.'),
(10, 'App Developement', '');

-- --------------------------------------------------------

--
-- Table structure for table `reaction`
--

CREATE TABLE `reaction` (
  `react_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `react_state` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reaction`
--

INSERT INTO `reaction` (`react_id`, `blog_id`, `author_id`, `react_state`) VALUES
(2, 9, 5, 1),
(3, 10, 5, 1),
(8, 4, 1, 1),
(39, 3, 1, 0),
(52, 7, 1, 1),
(53, 4, 9, 1),
(54, 11, 9, 0),
(55, 10, 9, 1),
(56, 9, 9, 0),
(57, 7, 9, 1),
(58, 3, 9, 1),
(74, 9, 1, 1),
(80, 14, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `about` varchar(500) NOT NULL,
  `password` varchar(300) NOT NULL,
  `img` varchar(300) NOT NULL DEFAULT 'assets/img/def user.png',
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `name`, `email`, `gender`, `about`, `password`, `img`, `reg_date`) VALUES
(1, 'Shubrato Debnath', 'shubratodn44985@gmail.com', 'Male', 'I\'m the OWNER of this website!!', '1111', '1_IMG_20210730_161013_528_2.jpg', '2022-12-30 08:04:17'),
(4, 'Akash Debnath', 'akash@gmail.com', 'Male', 'bal \r\n', '1111', '4_FB_IMG_14938364097717559.jpg', '2022-12-20 16:30:22'),
(5, 'Sourav Debnath', 'sourav@gmail.com', 'Male', 'I\'m Sourav', '1111', '5_FB_IMG_14920561428605473.jpg', '2022-12-20 18:10:36'),
(6, 'Anika Islam', 'anika@gmail.com', 'female', 'i\'m ANilka parvin', '1111', 'assets/img/def user.png', '2022-12-18 11:54:01'),
(7, 'Suborna Ananna Badhon', 'suborna@gmail.com', 'Female', 'I\'m suborna', '1111', '7_FB_IMG_14927963754030666.jpg', '2022-12-20 17:33:07'),
(8, 'Anisul Islam ', 'anisul@gmail.com', 'Male', 'Hello viewers, ami Anisul Islam', '1111', '8_unnamed.jpg', '2022-12-25 17:16:32'),
(9, 'My Computer', 'mycomputer44985@gmail.com', 'Male', 'This is My Computer', '1111', '9_My-Computer.png', '2022-12-27 19:41:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `author` (`author`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `reaction`
--
ALTER TABLE `reaction`
  ADD PRIMARY KEY (`react_id`),
  ADD KEY `fk_reaction_blogid` (`blog_id`),
  ADD KEY `fk_reaction_authorid` (`author_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reaction`
--
ALTER TABLE `reaction`
  MODIFY `react_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`author`) REFERENCES `user_info` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `blog_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON UPDATE CASCADE;

--
-- Constraints for table `reaction`
--
ALTER TABLE `reaction`
  ADD CONSTRAINT `fk_reaction_authorid` FOREIGN KEY (`author_id`) REFERENCES `user_info` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reaction_blogid` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`blog_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
