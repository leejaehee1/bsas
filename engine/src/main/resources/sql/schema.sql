CREATE DATABASE test DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS Products;

CREATE TABLE Products
(
    prod_id     int        PRIMARY KEY auto_increment,
    prod_name   VARCHAR(255)    NOT NULL,
    prod_price  INT             NOT NULL
);

CREATE TABLE `board` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `title` varchar(100) NOT NULL COMMENT '제목',
  `contents` varchar(3000) NOT NULL COMMENT '내용',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
  `modified_date` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시판';

CREATE TABLE `center` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `pw` varchar(100) NOT NULL COMMENT '비밀번호',
  `name` varchar(100) NOT NULL COMMENT '이름',
  `phone` varchar(100) NOT NULL COMMENT '연락처',
  `publicphone` varchar(100) NOT NULL COMMENT '담당자연락처',
  `email` varchar(300) NOT NULL COMMENT '이메일',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
  `modified_date` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='센터등록';

CREATE TABLE `hospital` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `pw` varchar(100) NOT NULL COMMENT '비밀번호',
  `name` varchar(100) NOT NULL COMMENT '이름',
  `phone` varchar(100) NOT NULL COMMENT '연락처',
  `publicphone` varchar(100) NOT NULL COMMENT '담당자연락처',
  `email` varchar(300) NOT NULL COMMENT '이메일',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
  `modified_date` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='병원등록';

CREATE TABLE `member` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `memberId` varchar(100) NOT NULL COMMENT '닉네임',
  `memberPwd` varchar(3000) NOT NULL COMMENT '비밀번호',
  `authType` varchar(100) NOT NULL COMMENT '권한',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
  `modified_date` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='회원';

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `pw` varchar(100) NOT NULL COMMENT '비밀번호',
  `name` varchar(100) NOT NULL COMMENT '이름',
  `phone` varchar(100) NOT NULL COMMENT '연락처',
  `email` varchar(300) NOT NULL COMMENT '이메일',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
  `modified_date` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='지인등록';
