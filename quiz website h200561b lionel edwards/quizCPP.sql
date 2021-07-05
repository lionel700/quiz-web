-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 06, 2016 at 06:36 
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizCPP`
--

-- --------------------------------------------------------

--
-- Table structure for table `Answer`
--

CREATE TABLE `Answer` (
  `id` int(11) NOT NULL,
  `id_Q` int(11) NOT NULL,
  `variant` text NOT NULL,
  `ans` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Answer`
--

INSERT INTO `Answer` (`id`, `id_Q`, `variant`, `ans`) VALUES
(2, 1, '-1', 0),
(3, 1, '0', 1),
(4, 1, '1', 0),
(5, 2, '. [punct]', 0),
(7, 2, ';', 1),
(8, 2, 'no correct option', 0),
(9, 3, '10', 1),
(10, 3, '9', 0),
(11, 3, '1', 0),
(12, 4, 'syntactic error', 0),
(13, 4, 'nu', 0),
(14, 4, 'da', 1),
(15, 5, 'delete [] a;', 1),
(16, 5, 'delete a;', 0),
(17, 5, 'delete a[];', 0),
(18, 6, 'delete', 1),
(19, 6, 'remove', 0),
(21, 6, 'free', 0),
(22, 7, 'no', 1),
(23, 7, 'gives', 0),
(24, 8, 'there is no correct answer', 0),
(25, 8, 'all calls to the built-in functions are replaced with the given function code', 1),
(26, 8, 'Announces the compiler to use the function only within a single source code file', 0),
(27, 9, '<pre>\r\nint funct(int x)  \r\n{ \r\nreturn x = x + 1; \r\n}\r\n</pre>', 1),
(28, 9, '<pre>\r\nvoid funct( int )\r\n{\r\ncout << "Hello"\r\n}\r\n</pre>', 0),
(29, 9, '<pre>\r\nvoid funct(x)\r\n{\r\ncout << "Hello"\r\n</pre>', 0),
(42, 7, 'depending on the standard', 0);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id_student` int(11) NOT NULL,
  `mark` int(1) NOT NULL,
  `day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id_student`, `mark`, `day`) VALUES
(1, 9, '2016-05-13'),
(2, 7, '2016-05-13'),
(3, 9, '2016-05-13'),
(4, 7, '2016-05-13'),
(5, 7, '2016-05-13'),
(6, 8, '2016-05-13'),
(7, 7, '2016-05-13'),
(8, 7, '2016-05-13'),
(9, 7, '2016-05-13'),
(10, 9, '2016-05-13'),
(12, 5, '2016-05-13'),
(13, 4, '2016-05-13'),
(14, 2, '2016-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `id_student` int(11) NOT NULL,
  `name` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`id_student`, `name`) VALUES
(1, 'MI-131'),
(2, 'MI-131'),
(3, 'MI-131'),
(4, 'MI-131'),
(5, 'MI-131'),
(6, 'MI-131'),
(7, 'MI-131'),
(8, 'MI-131'),
(9, 'MI-131'),
(10, 'MI-131'),
(12, 'C-131'),
(13, 'TI-131'),
(14, 'AI-131');

-- --------------------------------------------------------

--
-- Table structure for table `People`
--

CREATE TABLE `People` (
  `id` int(11) NOT NULL,
  `nume` varchar(20) NOT NULL,
  `prenume` varchar(20) NOT NULL,
  `paswd` text NOT NULL,
  `grad` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `People`
--

INSERT INTO `People` (`id`, `surname`, `firstname`, `paswd`, `grade`) VALUES
(1, 'masoko', 'ryan', 'irina@mi-131', 'student'),
(2, 'bungu', 'rutendo', 'vasile@mi-131', 'student'),
(3, 'munduna', 'byron', 'ion@mi-131', 'student'),
(4, 'chiriga', 'Silvia', 'silvia@mi-131', 'student'),
(5, 'Fosho', 'Patience' 'petru@mi-131', 'student'),
(6, 'Medika', 'Donald', 'doina@mi-131', 'student'),
(7, 'songoro', 'Natalia', 'natalia@mi-131', 'student'),
(8, 'dawa', 'Natasha', 'nicoleta@mi-131', 'student'),
(9, 'potera', 'Maria', 'maria@mi-131', 'student'),
(10, 'Buro', 'Victor', 'vitalii@mi-131', 'student'),
(11, 'Perebe', 'Michelle', 'PMihail@god', 'prof'),
(12, 'Borise', 'Given', 'bg', 'student'),
(13, 'fadawi', 'Panashe', 'gp', 'student'),
(14, 'Hadzi', 'Petra', 'hp', 'student');

-- --------------------------------------------------------

--
-- Table structure for table `practice`
--

CREATE TABLE `practice` (
  `id_student` int(11) NOT NULL,
  `corect` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `practice`
--

INSERT INTO `practice` (`id_student`, `corect`, `total`) VALUES
(1, 24, 30),
(2, 35, 40),
(3, 39, 40),
(4, 12, 20),
(5, 13, 20),
(6, 18, 24),
(7, 15, 20),
(8, 15, 27),
(9, 17, 27),
(10, 37, 40),
(12, 14, 20),
(13, 10, 20),
(14, 20, 50);

-- --------------------------------------------------------

--
-- Table structure for table `Question`
--

CREATE TABLE `Question` (
  `id` int(11) NOT NULL,
  `quiz` text NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Question`
--

INSERT INTO `Question` (`id`, `quiz`, `level`) VALUES
(1, 'What value does the program return in case of successful completion?', 1),
(2, 'What sign does most C ++ sentences end with? ?', 1),
(3, 'What is the value of the variable "a" at the end of this code ?\r\nint a; for(a = 0; a < 10; a++) {}', 1),
(4, 'The phrase <kbd> Hello </kbd> will be displayed on the screen or not?\r\n<br>\r\n<pre>\r\nint main( int argc, char ** argv)\r\n{\r\n   int array[33];\r\n \r\n   if ( &array[4] < &array[23] )\r\n  {\r\n    std::cout << " HELLO " << std::endl;\r\n  }\r\n \r\n   return 0;\r\n}\r\n</pre>', 2),
(5, 'How correctly the memory is released after the fulfillment of the given sequence\r\n<code>char *a; a = new char [20];</code>\r\n', 2),
(6, 'WHAT IS The default keyword reserved by the language for freeing up allocated memory ?', 2),
(7, 'IS The code sequence is valid or not ?\r\n<pre>\r\nint x = 5;\r\n \r\ntemplate < typename T>\r\nclass x\r\n{\r\n    T member;\r\n};\r\n \r\nint main( int argc, char ** argv)\r\n{\r\n     class x< int > y;\r\n \r\n     return 0;\r\n}\r\n</pre>', 3),
(8, 'What does the keyword mean? <kbd>inline</kbd> ?', 3),
(9, 'Which of the following is the complete declaration of a function', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Answer`
--
ALTER TABLE `Answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id_student`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id_student`);

--
-- Indexes for table `People`
--
ALTER TABLE `People`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `practice`
--
ALTER TABLE `practice`
  ADD PRIMARY KEY (`id_student`);

--
-- Indexes for table `Question`
--
ALTER TABLE `Question`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Answer`
--
ALTER TABLE `Answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `People`
--
ALTER TABLE `People`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `Question`
--
ALTER TABLE `Question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
