# LectureEvaluation

[팀 프로젝트] JSP로 구현한 강의평가 사이트  
많은 도움을 받은 사이트: https://ndb796.tistory.com/35?category=986634

## 주 기능
- 로그인 / 회원가입 / 마이페이지(정보열람/회원탈퇴)
- 게시판
  - 공지  
    - 관리자 페이지에서 작성 -> 일반 사용자가 메인 사이트에서 열람 가능  
    - 작성자, 작성일, 조회수 기록됨.  
    - 글 제목과 작성자 키워드로 검색 가능  
    - 총 5개만 한 페이지에 출력되며 이를 넘어갈 시 다음 페이지에 출력됨.  
  - 장터  
    - 사용자가 직접 물품 등록 가능  
    - 상품 정보에 이미지 파일도 직접 넣을 수 있음.  
    - 구매 버튼을 누르면 사용자의 이메일로 메세지가 전송됨.  
  - 리뷰  
    - 사용자가 직접 리뷰 등록 가능  
    - 추천 기능  
- 관리자 페이지  
  - 공지  
    - 관리자만이 게시글 작성 가능  
  - 장터  
    - 사용자가 올린 장터 게시글을 열람, 삭제  
  - 리뷰  
    - 사용자가 올린 리뷰 게시글을 삭제  
  - 회원정보  
    - 회원정보 열람 가능  
  
## 개선점
- 관리자 계정도 DB가 아닌 페이지 내에서 다루게 하기
- 관리자 페이지에서 장터 구매를 누르면 404 에러
- 댓글 기능
- 계정당 추천 수 제한
- 이메일 기능 개선 -> 작성자의 이메일을 직접 보내준다던지

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
