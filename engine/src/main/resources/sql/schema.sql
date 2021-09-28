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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시판';

CREATE TABLE `center` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `name` varchar(100) NOT NULL COMMENT '이름',
  `phone` varchar(100) NOT NULL COMMENT '연락처',
  `publicPhone` varchar(100) NOT NULL COMMENT '담당자연락처',
  `email` varchar(300) NOT NULL COMMENT '이메일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='센터등록';

CREATE TABLE `event_day` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `title` varchar(100) NOT NULL COMMENT '제목',
  `img_url` varchar(3000) NOT NULL COMMENT '이미지URL'
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='오늘의이벤트';

CREATE TABLE `hospital` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `name` varchar(100) NOT NULL COMMENT '이름',
  `phone` varchar(100) NOT NULL COMMENT '연락처',
  `publicPhone` varchar(100) NOT NULL COMMENT '담당자연락처',
  `email` varchar(300) NOT NULL COMMENT '이메일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='병원등록';

CREATE TABLE `member` (
  `id` int NOT NULL,
  `auth_type` varchar(255) DEFAULT NULL,
  `member_id` varchar(255) DEFAULT NULL,
  `member_pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `monthlypick` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `title` varchar(100) NOT NULL COMMENT '제목',
  `img_url` varchar(3000) NOT NULL COMMENT '이미지URL',
  `contents` varchar(3000) NOT NULL COMMENT '내용',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='이달의PICK';

CREATE TABLE `recommend_activity` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `title` varchar(100) NOT NULL COMMENT '제목',
  `img_url` varchar(3000) NOT NULL COMMENT '이미지URL',
  `contents` varchar(3000) NOT NULL COMMENT '내용',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='추천활동';

CREATE TABLE `hotspot` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `title` varchar(100) NOT NULL COMMENT '제목',
  `img_url` varchar(3000) NOT NULL COMMENT '이미지URL',
  `contents` varchar(3000) NOT NULL COMMENT '내용',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='추천장소';

CREATE TABLE `todaysheadline` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `title` varchar(100) NOT NULL COMMENT '제목',
  `img_url` varchar(3000) NOT NULL COMMENT '이미지URL'
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='오늘의헤드라인';

CREATE TABLE `User` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `name` varchar(100) NOT NULL COMMENT '이름',
  `phone` varchar(100) NOT NULL COMMENT '연락처',
  `email` varchar(300) NOT NULL COMMENT '이메일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='지인등록';

insert into user values (null, name, phone, email, now(), null);