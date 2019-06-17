CREATE DATABASE IF NOT EXISTS `sms_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `sms_test`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: sms_test
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
SET NAMES utf8;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `course`
(
    `id`            int(11)     NOT NULL AUTO_INCREMENT,
    `course_name`   varchar(45) NOT NULL COMMENT '课程名',
    `credit`        int(11)     NOT NULL COMMENT '学分',
    `type`          varchar(45)          DEFAULT NULL COMMENT '课程类型',
    `period`        int(11)     NOT NULL COMMENT '学时',
    `average`       double               DEFAULT NULL COMMENT '平均分',
    `student_count` int(11)     NOT NULL DEFAULT '0' COMMENT '选课人数',
    `teacher_id`    int(11)     NOT NULL COMMENT '任课老师',
    `year`          varchar(45)          DEFAULT NULL COMMENT '学年',
    `term`          varchar(45)          DEFAULT NULL COMMENT '学期（一或二）',
    `testForm`      varchar(45)          DEFAULT NULL COMMENT '考试方式',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 14
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course`
    DISABLE KEYS */;
INSERT INTO `course`
VALUES (1, '管理信息系统', 2, '专必', 20, 60, 1, 1, '2018', '2', NULL),
       (2, '网络开发工具与技术', 2, '专选', 18, 61, 1, 2, '2018', '2', NULL),
       (3, '信息分析与决策', 3, '专必', 20, 57, 1, 3, '2018', '2', NULL);
/*!40000 ALTER TABLE `course`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `department`
(
    `id`              int(11)     NOT NULL AUTO_INCREMENT,
    `department_name` varchar(45) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='学院表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department`
    DISABLE KEYS */;
INSERT INTO `department`
VALUES (1, '资讯管理学院');
/*!40000 ALTER TABLE `department`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educational_manager`
--

DROP TABLE IF EXISTS `educational_manager`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `educational_manager`
(
    `id`      int(11)     NOT NULL AUTO_INCREMENT,
    `enumber` varchar(45) NOT NULL COMMENT '工号',
    `ename`   varchar(45) NOT NULL COMMENT '姓名',
    `dept_id` int(11)     NOT NULL COMMENT '院系',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='教务管理人员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educational_manager`
--

LOCK TABLES `educational_manager` WRITE;
/*!40000 ALTER TABLE `educational_manager`
    DISABLE KEYS */;
INSERT INTO `educational_manager`
VALUES (1, '123', 'zrquan', 1),
       (2, '4444', '测试用户', 1),
       (3, '33333', '测试用户2', 1),
       (4, '', '', 1),
       (5, '55555', '测试用户4', 1);
/*!40000 ALTER TABLE `educational_manager`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `major`
(
    `id`            int(11)     NOT NULL AUTO_INCREMENT,
    `major_name`    varchar(45) NOT NULL,
    `department_id` int(11)     NOT NULL COMMENT '所属院系',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='专业表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major`
    DISABLE KEYS */;
INSERT INTO `major`
VALUES (1, '信息管理与信息系统', 1);
/*!40000 ALTER TABLE `major`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `major_course`
--

DROP TABLE IF EXISTS `major_course`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `major_course`
(
    `id`        int(11) NOT NULL AUTO_INCREMENT,
    `major_id`  int(11) NOT NULL,
    `course_id` int(11) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='专业课程关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major_course`
--

LOCK TABLES `major_course` WRITE;
/*!40000 ALTER TABLE `major_course`
    DISABLE KEYS */;
INSERT INTO `major_course`
VALUES (1, 1, 1),
       (2, 1, 2),
       (3, 1, 3);
/*!40000 ALTER TABLE `major_course`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `score`
(
    `id`         int(11)    NOT NULL AUTO_INCREMENT,
    `course_id`  int(11)    NOT NULL,
    `student_id` int(11)    NOT NULL,
    `value`      double DEFAULT NULL COMMENT '分数（NULL表示未出成绩）',
    `identity`   tinyint(4) NOT NULL COMMENT '重考标识',
    `gpa`        double DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='成绩表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score`
    DISABLE KEYS */;
INSERT INTO `score`
VALUES (1, 1, 1, 60, 0, NULL),
       (2, 2, 1, 61, 0, NULL),
       (3, 3, 1, 57, 1, NULL);
/*!40000 ALTER TABLE `score`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_check`
--

DROP TABLE IF EXISTS `score_check`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `score_check`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT,
    `course_id`  int(11) NOT NULL,
    `student_id` int(11) NOT NULL,
    `value`      double  NOT NULL,
    `gpa`        double DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='待审核成绩表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_check`
--

LOCK TABLES `score_check` WRITE;
/*!40000 ALTER TABLE `score_check`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `score_check`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `student`
(
    `id`       int(11)     NOT NULL AUTO_INCREMENT,
    `snumber`  varchar(45) NOT NULL COMMENT '学号',
    `sname`    varchar(45) NOT NULL COMMENT '姓名',
    `major_id` int(11)     NOT NULL COMMENT '专业',
    `class`    varchar(45) NOT NULL COMMENT '班级',
    `gpa`      double  DEFAULT NULL COMMENT '平均绩点',
    `credit`   int(11) DEFAULT NULL COMMENT '已获学分',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='学生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student`
    DISABLE KEYS */;
INSERT INTO `student`
VALUES (1, '16369003', '曾润铨', 1, 'A', 1, 4),
       (3, '4444', '测试用户', 1, 'A班', NULL, NULL);
/*!40000 ALTER TABLE `student`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_feedback`
--

DROP TABLE IF EXISTS `system_feedback`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `system_feedback`
(
    `id`            int(11)      NOT NULL AUTO_INCREMENT,
    `which_account` varchar(45)           DEFAULT NULL COMMENT '递交反馈的用户账号（NULL代表匿名）',
    `content`       varchar(255) NOT NULL,
    `time`          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '反馈递交时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_feedback`
--

LOCK TABLES `system_feedback` WRITE;
/*!40000 ALTER TABLE `system_feedback`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `system_feedback`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `teacher`
(
    `id`            int(11)     NOT NULL AUTO_INCREMENT,
    `tnumber`       varchar(45) NOT NULL COMMENT '工号',
    `tname`         varchar(45) NOT NULL COMMENT '姓名',
    `department_id` int(11)     NOT NULL COMMENT '院系',
    `title`         varchar(45) NOT NULL COMMENT '职称',
    PRIMARY KEY (`id`),
    UNIQUE KEY `tnumber_UNIQUE` (`tnumber`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='教师表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher`
    DISABLE KEYS */;
INSERT INTO `teacher`
VALUES (1, '63619001', '朱侯', 1, '教授'),
       (2, '63619002', '徐健', 1, '教授'),
       (3, '63619003', '聂卉', 1, '教授'),
       (9, '123456', '测试教师', 1, '教授');
/*!40000 ALTER TABLE `teacher`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
SET character_set_client = utf8mb4;
CREATE TABLE `user`
(
    `id`             int(11)                              NOT NULL AUTO_INCREMENT,
    `account_number` varchar(45)                          NOT NULL COMMENT '账号，对应管理员、教师的工号，和学生的学号',
    `user_name`      varchar(45)                          NOT NULL,
    `password`       varchar(45)                          NOT NULL,
    `user_type`      enum ('manager','teacher','student') NOT NULL COMMENT '用户类型，只能是管理员、教师、学生',
    `avatar`         mediumblob COMMENT '用户头像',
    `mail`           varchar(45)                                   DEFAULT NULL,
    `phone`          varchar(45)                                   DEFAULT NULL,
    `created_time`   timestamp                            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
    `updated_time`   timestamp                            NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户信息修改时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `account_number_UNIQUE` (`account_number`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 14
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user`
    DISABLE KEYS */;
INSERT INTO `user`
VALUES (1, '16369003', '曾润铨', '1234', 'student', NULL, NULL, NULL, '2019-04-13 07:24:56', '2019-05-29 08:18:28'),
       (2, '63619001', '朱侯', '1234', 'teacher', NULL, NULL, NULL, '2019-06-03 01:45:58', '2019-06-03 01:47:11'),
       (3, '63619002', '徐健', '1234', 'teacher', NULL, NULL, NULL, '2019-06-03 01:45:58', '2019-06-03 01:47:11'),
       (4, '63619003', '聂卉', '1234', 'teacher', NULL, NULL, NULL, '2019-06-04 03:09:19', '2019-06-04 03:09:27'),
       (7, '123', 'zrquan', '123', 'manager', NULL, NULL, NULL, '2019-06-13 07:40:15', '2019-06-15 02:25:07'),
       (10, '4444', '测试用户', '4444', 'student', NULL, NULL, NULL, '2019-06-15 09:47:53', '2019-06-15 09:47:53'),
       (12, '55555', '测试用户4', '5555', 'manager', NULL, 'ashen0ne@163.com', '13265321450', '2019-06-15 12:37:49',
        '2019-06-15 12:37:49'),
       (13, '123456', '测试教师', '3456', 'teacher', NULL, NULL, NULL, '2019-06-15 13:09:44', '2019-06-15 13:09:44');
/*!40000 ALTER TABLE `user`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sms_test'
--

--
-- Dumping routines for database 'sms_test'
--
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2019-06-16 10:27:15
