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
    `id`            int(11)                                                      NOT NULL AUTO_INCREMENT,
    `course_name`   varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名',
    `credit`        int(11)                                                      NOT NULL COMMENT '学分',
    `type`          varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT NULL COMMENT '课程类型',
    `period`        int(11)                                                      NOT NULL COMMENT '学时',
    `average`       double                                                                DEFAULT NULL COMMENT '平均分',
    `student_count` int(11)                                                      NOT NULL DEFAULT '0' COMMENT '选课人数',
    `teacher_id`    int(11)                                                      NOT NULL COMMENT '任课老师',
    `year`          varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT '2018' COMMENT '学年',
    `term`          varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT '2' COMMENT '学期（一或二）',
    `test_form`     varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci          DEFAULT '笔试' COMMENT '考试方式',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 30
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course`
    DISABLE KEYS */;
INSERT INTO `course`
VALUES (1, '管理信息系统', 2, '专必', 20, 60, 5, 1, '2018', '2', NULL),
       (2, '网络开发工具与技术', 2, '专选', 18, 61, 5, 2, '2018', '2', NULL),
       (3, '信息分析与决策', 3, '专必', 20, 57, 5, 3, '2018', '2', NULL),
       (4, '地球资源学', 2, '公选', 18, 60, 5, 1, '2018', '1', NULL),
       (25, '测试课程', 2, '公必', 23, NULL, 0, 11, NULL, NULL, NULL),
       (26, '测试课程2', 2, '公必', 17, NULL, 0, 4, NULL, NULL, NULL),
       (27, '课程5', 2, '公必', 24, NULL, 0, 15, '2018', '2', '笔试'),
       (28, '马克思', 3, '公必', 22, NULL, 0, 17, '2018', '2', '笔试'),
       (29, '哲学', 3, '专必', 22, NULL, 0, 17, '2018', '2', '笔试');
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
    `id`              int(11)                                                      NOT NULL AUTO_INCREMENT,
    `department_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='学院表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department`
    DISABLE KEYS */;
INSERT INTO `department`
VALUES (1, '资讯管理学院'),
       (2, '数学学院'),
       (3, '环境科学与地理学院'),
       (4, '马克思学院');
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
    `id`      int(11)                                                      NOT NULL AUTO_INCREMENT,
    `enumber` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工号',
    `ename`   varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
    `dept_id` int(11)                                                      NOT NULL COMMENT '院系',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='教务管理人员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educational_manager`
--

LOCK TABLES `educational_manager` WRITE;
/*!40000 ALTER TABLE `educational_manager`
    DISABLE KEYS */;
INSERT INTO `educational_manager`
VALUES (1, '123', 'zrquan', 1),
       (6, '123456', '测试管理员', 2);
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
    `id`                int(11)     NOT NULL AUTO_INCREMENT,
    `major_name`        varchar(45) NOT NULL,
    `department_id`     int(11)     NOT NULL COMMENT '所属院系',
    `pro_need_credit`   int(11) DEFAULT NULL COMMENT '专必学分要求',
    `com_need_credit`   int(11) DEFAULT NULL COMMENT '公必学分要求',
    `pro_select_credit` int(11) DEFAULT NULL COMMENT '专选学分要求',
    `com_select_credit` int(11) DEFAULT NULL COMMENT '公选学分要求',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
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
VALUES (1, '信息管理与信息系统', 1, 64, 33, 32, 16),
       (2, '哲学', 4, 64, 44, 32, 16);
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
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='专业课程关系表';
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
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 84
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='成绩表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score`
    DISABLE KEYS */;
INSERT INTO `score`
VALUES (1, 1, 1, 67, 0, NULL),
       (2, 2, 1, 61, 0, NULL),
       (3, 3, 1, 78, 1, NULL),
       (15, 1, 4, 58, 0, NULL),
       (16, 2, 4, 77, 0, NULL),
       (17, 3, 4, 98, 1, NULL),
       (29, 1, 3, 78, 0, NULL),
       (30, 2, 3, 88, 0, NULL),
       (31, 3, 3, 76, 1, NULL),
       (43, 1, 5, 76, 0, NULL),
       (44, 2, 5, 76, 0, NULL),
       (45, 3, 5, 56, 1, NULL),
       (57, 1, 6, 88, 0, NULL),
       (58, 2, 6, 68, 0, NULL),
       (59, 3, 6, 89, 1, NULL),
       (71, 4, 1, 76, 0, 2.6),
       (72, 4, 3, 56, 1, 0.6),
       (73, 4, 4, 84, 0, 3.4),
       (74, 4, 5, 69, 0, 1.9),
       (75, 4, 6, 91, 0, 4.1),
       (76, 27, 1, 51, 1, 0.1),
       (77, 27, 3, 68, 0, 1.8),
       (78, 27, 4, 77, 0, 2.7),
       (79, 27, 5, 99, 0, 4.9),
       (80, 27, 6, 84, 0, 3.4),
       (81, 28, 11, 86, 0, 3.6),
       (82, 29, 11, 78, 0, 2.8),
       (83, 29, 12, 87, 0, 3.7);
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
    `value`      double DEFAULT NULL,
    `gpa`        double DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 35
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='待审核成绩表';
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
    `id`       int(11)                                                      NOT NULL AUTO_INCREMENT,
    `snumber`  varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
    `sname`    varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
    `major_id` int(11)                                                      NOT NULL COMMENT '专业',
    `class`    varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '班级',
    `gpa`      double  DEFAULT NULL COMMENT '平均绩点',
    `credit`   int(11) DEFAULT NULL COMMENT '已获学分',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='学生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student`
    DISABLE KEYS */;
INSERT INTO `student`
VALUES (1, '16369003', '曾润铨', 1, 'A', 1, 4),
       (3, '16369005', '测试用户', 1, 'A', 2, 3),
       (4, '16369001', '辛睿哲', 1, 'B', 3, 3),
       (5, '16369002', '张宇阳', 1, 'B', 2, 4),
       (6, '16369004', '挺哥', 1, 'B', 3, 3),
       (7, '16369094', '测试学生', 1, 'C班', NULL, NULL),
       (8, '1672638', '测试学生2', 1, 'B班', NULL, NULL),
       (9, '55555', '学生5', 1, 'B班', NULL, NULL),
       (11, '33333', '测试学生3', 1, 'A班', NULL, NULL),
       (12, '44444', '测试学生4', 2, 'B班', NULL, NULL);
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
    `id`            int(11)                                                       NOT NULL AUTO_INCREMENT,
    `which_account` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci           DEFAULT NULL COMMENT '递交反馈的用户账号（NULL代表匿名）',
    `content`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `time`          timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '反馈递交时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC;
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
    `id`            int(11)                                                      NOT NULL AUTO_INCREMENT,
    `tnumber`       varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工号',
    `tname`         varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
    `department_id` int(11)                                                      NOT NULL COMMENT '院系',
    `title`         varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职称',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `tnumber_UNIQUE` (`tnumber`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='教师表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher`
    DISABLE KEYS */;
INSERT INTO `teacher`
VALUES (1, '63619001', '朱侯', 1, '副教授'),
       (2, '63619002', '徐健', 1, '教授'),
       (3, '63619003', '聂卉', 1, '教授'),
       (4, '63619004', '曹效阳', 1, '讲师'),
       (5, '63619005', '王乐球', 1, '讲师'),
       (6, '63619006', '李岱峰', 1, '副教授'),
       (7, '63619007', '杨利军', 1, '教授'),
       (10, '63619008', '丁伟', 2, '教授'),
       (11, '63619009', '何俊国', 3, '教授'),
       (12, '63619010', '石德金', 4, '教授'),
       (13, '63619011', '詹小美', 4, '教授'),
       (15, '55555', '老师5', 2, '教授'),
       (17, '13333', '测试教师3', 4, '教授');
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
    `id`             int(11)                                                                               NOT NULL AUTO_INCREMENT,
    `account_number` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci                          NOT NULL COMMENT '账号，对应管理员、教师的工号，和学生的学号',
    `user_name`      varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci                          NOT NULL,
    `password`       varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci                          NOT NULL,
    `user_type`      enum ('manager','teacher','student') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户类型，只能是管理员、教师、学生',
    `avatar`         mediumblob COMMENT '用户头像',
    `mail`           varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci                                   DEFAULT NULL,
    `phone`          varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci                                   DEFAULT NULL,
    `created_time`   timestamp                                                                             NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
    `updated_time`   timestamp                                                                             NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户信息修改时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `account_number_UNIQUE` (`account_number`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 29
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = DYNAMIC COMMENT ='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user`
    DISABLE KEYS */;
INSERT INTO `user`
VALUES (1, '16369003', '曾润铨', '1234', 'student', NULL, '123@163.com', '12345678901', '2019-04-13 07:24:56',
        '2019-06-18 08:54:07'),
       (2, '63619001', '朱侯', '1234', 'teacher', NULL, '123@qq.com', '15531946825', '2019-06-03 01:45:58',
        '2019-06-18 08:54:15'),
       (3, '63619002', '徐健', '1234', 'teacher', NULL, '123@126.com', '17227768592', '2019-06-03 01:45:58',
        '2019-06-18 08:54:22'),
       (4, '63619003', '聂卉', '1234', 'teacher', NULL, '123@gmail.com', '17320020032', '2019-06-04 03:09:19',
        '2019-06-18 08:54:35'),
       (7, '123', 'zrquan', '123', 'manager', NULL, '123@mail2.sysu.edu.cn', '13613295689', '2019-06-13 07:40:15',
        '2019-06-18 08:54:46'),
       (10, '16369001', '辛睿哲', '1234', 'student', NULL, '123@163.com', '13236525548', '2019-06-15 09:47:53',
        '2019-06-18 08:55:04'),
       (12, '16369002', '张宇阳', '1234', 'student', NULL, 'ashen0ne@163.com', '13265321450', '2019-06-15 12:37:49',
        '2019-06-18 08:51:47'),
       (13, '16369004', '挺哥', '1234', 'student', NULL, '321@mail.com', '13295263689', '2019-06-15 13:09:44',
        '2019-06-18 08:55:12'),
       (14, '63619004', '曹效阳', '1234', 'teacher', NULL, '654@163.com', '16589685986', '2019-06-18 09:04:35',
        '2019-06-18 09:05:42'),
       (15, '63619005', '王乐球', '1234', 'teacher', NULL, '223@mai.com', '13669899568', '2019-06-18 09:05:42',
        '2019-06-18 09:05:42'),
       (16, '63619006', '李岱峰', '1234', 'teacher', NULL, '321@qq.com', '15226899536', '2019-06-18 09:07:03',
        '2019-06-18 09:07:03'),
       (17, '63619007', '杨利军', '1234', 'teacher', NULL, '369@qq.com', '13556988756', '2019-06-18 09:07:03',
        '2019-06-18 09:07:03'),
       (18, '16369005', '测试用户', '1234', 'student', NULL, '115@gmail.com', '12335698698', '2019-06-18 09:10:03',
        '2019-06-18 09:10:03'),
       (19, '123456', '测试管理员', '3456', 'manager', NULL, 'chuangxiangia@aliy.com', '13265321450', '2019-06-19 06:48:54',
        '2019-06-19 06:48:54'),
       (23, '55555', '老师5', '5555', 'teacher', NULL, 'tao.sheng@crgecent.com', '13265321450', '2019-06-19 09:32:44',
        '2019-06-19 09:32:44'),
       (25, '33333', '测试学生3', '3333', 'student', NULL, 'chuangxiangia@aliy.com', '13265321450', '2019-06-19 10:29:49',
        '2019-06-19 10:29:49'),
       (27, '13333', '测试教师3', '3333', 'teacher', NULL, 'chuangxiangia@aliy.com', '13265321450', '2019-06-19 10:34:21',
        '2019-06-19 10:34:21'),
       (28, '44444', '测试学生4', '4444', 'student', NULL, 'tao.sheng@crgecent.com', '13265321450', '2019-06-19 14:56:40',
        '2019-06-19 14:56:40');
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

-- Dump completed on 2019-06-20  9:42:36
