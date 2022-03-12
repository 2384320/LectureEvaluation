# LectureEvaluation

JSP로 구현한 강의평가 사이트

sql은 아래왜 같이 작성
```
create schema db;

use db;

CREATE TABLE `db`.`membertbl` (
  `memberid` VARCHAR(50) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `name` VARCHAR(30) CHARACTER SET 'euckr' NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `studentdp` VARCHAR(200) CHARACTER SET 'euckr' NOT NULL,
  `studentid` INT(30) NOT NULL,
  PRIMARY KEY (`memberid`));

CREATE TABLE `db`.`admintbl` (
  `adminid` VARCHAR(50) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `name` VARCHAR(30) CHARACTER SET 'euckr' NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`adminid`));

INSERT INTO `db`.`admintbl` (`adminid`, `password`, `name`, `email`) VALUES ('dong', '1234', 'park', 'a@gmail.com');
INSERT INTO `db`.`admintbl` (`adminid`, `password`, `name`, `email`) VALUES ('yang', '1234', 'yun', 'b@gmail.com');


CREATE TABLE `db`.`board` (
  `num` INT(100) NOT NULL,
  `name` VARCHAR(100) CHARACTER SET 'euckr' NOT NULL,
  `pass` VARCHAR(100) NOT NULL,
  `title` VARCHAR(100) CHARACTER SET 'euckr' NOT NULL,
  `cont` VARCHAR(200) CHARACTER SET 'euckr' NOT NULL,
  `bdate` VARCHAR(45) NULL,
  `readcnt` INT(100) NULL,
  `gnum` INT(100) NULL,
  `onum` INT(100) NULL DEFAULT NULL,
  `nested` INT(100) NULL DEFAULT NULL,
  PRIMARY KEY (`num`));

CREATE TABLE `db`.`product` (
  `prono` INT(11) NOT NULL AUTO_INCREMENT,
  `proname` VARCHAR(45) CHARACTER SET 'euckr' NOT NULL,
  `writer` VARCHAR(45) CHARACTER SET 'euckr' NULL,
  `price` INT(11) NOT NULL,
  `detail` VARCHAR(45) CHARACTER SET 'euckr' NULL,
  `image` VARCHAR(45) CHARACTER SET 'euckr' NULL,
  PRIMARY KEY (`prono`));


CREATE TABLE `db`.`evaluation` (
  `evaluationID` INT(100) NOT NULL AUTO_INCREMENT,
  `lectureName` VARCHAR(45) CHARACTER SET 'utf8' NULL,
  `professName` VARCHAR(45) CHARACTER SET 'utf8' NULL,
  `lectureYear` INT(100) NULL,
  `semesterDivide` VARCHAR(45) CHARACTER SET 'utf8' NULL,
  `evaluationContent` VARCHAR(2048) CHARACTER SET 'utf8' NULL,
  `totalScore` VARCHAR(45) CHARACTER SET 'utf8' NULL,
  `likeCount` INT(100) NULL,
  `gnum` INT(100) NULL,
  `onum` INT(100) NULL,
  `nested` INT(100) NULL,
  PRIMARY KEY (`evaluaionID`));
```
