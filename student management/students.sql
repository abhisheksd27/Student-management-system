

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";




CREATE TABLE `attendence` (
  `aid` int(11) NOT NULL,
  `rollno` varchar(20) NOT NULL,
  `attendance` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `attendence` (`aid`, `rollno`, `attendance`) VALUES
(6, '1ve17cs012', 98);



CREATE TABLE `department` (
  `cid` int(11) NOT NULL,
  `branch` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `department` (`cid`, `branch`) VALUES
(2, 'Information Science'),
(3, 'Electronic and Communication'),
(4, 'Electrical & Electronic'),
(5, 'Civil '),
(7, 'computer science'),
(8, 'IOT');



CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `rollno` varchar(20) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `sem` int(20) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DELIMITER $$
CREATE TRIGGER `DELETE` BEFORE DELETE ON `student` FOR EACH ROW INSERT INTO trig VALUES(null,OLD.rollno,'STUDENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Insert` AFTER INSERT ON `student` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rollno,'STUDENT INSERTED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UPDATE` AFTER UPDATE ON `student` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rollno,'STUDENT UPDATED',NOW())
$$
DELIMITER ;



CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(52) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `test` (`id`, `name`, `email`) VALUES
(1, 'aaa', 'aaa@gmail.com');



CREATE TABLE `trig` (
  `tid` int(11) NOT NULL,
  `rollno` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `trig` (`tid`, `rollno`, `action`, `timestamp`) VALUES
(7, '1ve17cs012', 'STUDENT INSERTED', '2021-01-10 19:19:56'),
(8, '1ve17cs012', 'STUDENT UPDATED', '2021-01-10 19:20:31'),
(9, '1ve17cs012', 'STUDENT DELETED', '2021-01-10 19:21:23');



CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(4, 'anees', 'anees@gmail.com', 'pbkdf2:sha256:150000$1CSLss89$ef995dfc48121768b2070bfbe7a568871cd56fac85ac7c95a1e645c8806146e9');


ALTER TABLE `attendence`
  ADD PRIMARY KEY (`aid`);


ALTER TABLE `department`
  ADD PRIMARY KEY (`cid`);


ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `trig`
  ADD PRIMARY KEY (`tid`);


ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `attendence`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `department`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `trig`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

