/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 05/01/2022 15:31:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` bigint NOT NULL,
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (0, '123456', '馆长');
INSERT INTO `admin` VALUES (1, '123456', 'admin');
INSERT INTO `admin` VALUES (2, '123456', '张老师');

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `article` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES (1, '【试用资源】“新时代中国特色社会主义思想政治课程数据库”开通试用通知', '各位老师：<br />\r\n\r\n &nbsp;&nbsp;     为迎接“建党100周年”，满足广大师生的相关信息需求。图书馆特开通试用了“新时代中国特色社会主义思想政治课程数据库”。<br />\r\n\r\n &nbsp;&nbsp;   “新时代中国特色社会主义思想政治课程数据库”（简称“思政课数据库”）由中共中央党校（国家行政学院）出版集团、国家行政学院音像出版社主办，由中科软股教育科技（北京）股份有限公司承办，是目前国内最权威的思政类视频课程数据库。', '2021-06-17 16:27:48');
INSERT INTO `announcement` VALUES (2, '关于举办首届“方正阿帕比读书知识竞答活动”的通知 ', '各位师生读者：<br />\r\n\r\n&nbsp;&nbsp;为营造多读书、爱读书、读好书的良好风尚，推动图书馆的阅读推广工作更加快速、深入、全面、科学的发展，我院图书馆联合北京方正阿帕比技术有限公司，共同开展首届“方正阿帕比读书知识竞答活动”。<br />\r\n\r\n&nbsp;&nbsp;一、活动时间<br />\r\n\r\n&nbsp;&nbsp;2019年10月24日至2019年月10日。<br />\r\n\r\n&nbsp;&nbsp;二、参与方式<br />\r\n\r\n&nbsp;&nbsp;知识竞赛活动采取网上答题的方式进行。<br />\r\n\r\n&nbsp;&nbsp;方法一：通过打开活动链接进入答题页面参与活动；<br />\r\n\r\n&nbsp;&nbsp;https://ks.youkaoshi.cn/doexam/VM956EPRr0.html', '2021-06-17 16:28:47');
INSERT INTO `announcement` VALUES (4, '开闭馆时间', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 开馆时间 &nbsp;&nbsp;&nbsp;&nbsp;     闭馆时间<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;7：00   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;      23：00', '2021-06-17 17:12:26');
INSERT INTO `announcement` VALUES (6, 's', '1', '2021-06-20 11:21:30');

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info`  (
  `book_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publish` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ISBN` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `language` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `pub_date` date NOT NULL,
  `class_id` int NULL DEFAULT NULL,
  `number` int NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of book_info
-- ----------------------------
INSERT INTO `book_info` VALUES (1, '多情自古伤离别:柳永词', '罗立刚', '人民文学出版社', '9787020121670', '在宋代词人中，柳永创作的通俗歌词流传甚广，“流俗人尤喜道之”，以致“凡有井水饮处，即能歌柳词”。他对宋词的发展作出了重大贡献，是开创宋词艺术特色的大词人。本书所选词作，主要依据中华书局出版的薛瑞先生校注本《乐章集》。在注释方面，本书博采诸家注本之长，力求详尽浅易。辑评一栏所收录历代词评家之点评，能帮助读者更好地体会词作意境。同时，部分词作还配有明清版画。', '中文', 24.30, '2016-10-31', 8, 0);
INSERT INTO `book_info` VALUES (2, '中国近代史', '蒋廷黻', ' 北京时代华文书局', '9787569918120', '《中国近代史》被誉为中国近代史研究的开山之作，一个时代的经典。全书从鸦片战争讲起，一直叙述到其时正在进行的抗日战争，用明白通畅的字句将近百年的史事浓缩在短短五万余字的篇幅里，主题鲜明，史论兼具，是一本人人都能读、也人人都该读的近代史。\r\n　　本次再版，校订文字的同时，也收录了包括甘博、汤姆逊等在内的诸多同时期来华外籍人士所记录的珍贵影像、图片六十多幅，多为华语世界首次呈现，在丰富和完善内容的同时，也帮助读者更好理解历史情境。', '中文', 23.90, '2017-10-01', 11, 1);
INSERT INTO `book_info` VALUES (3, '创造圣经的城市', '[美国]罗伯特.R.嘉吉 著', '海南出版社', '9787544371728', '1、 记载上帝话语的《圣经》并非从天而降，而是从土地、城市中孕育出来的，其成书过程，也是人类文明演进的故事和历程。\r\n2、 《圣经》这部伟大的经典，诞生于毁灭、杀戮、痉挛、牺牲和绝望之后的重获新生。\r\n3、 阅读本书不仅可以使我们了解《圣经》的故事，还可以了解波澜壮阔的人类文明的演进故事。\r\n4、 从腓尼基到古罗马，穿越14个古城的壮丽之旅，在旧城遗迹与古卷尘埃中探寻人类文明的足迹\r\n5、 阅读本书，可以一窥腓尼基王朝、亚述帝国、波斯帝国、巴比伦王朝、古希腊、罗马帝国、犹太王国……这些人类历史上声名显赫的帝国和王朝的背影\r\n6、 读完本书之后，知道哪些事件改变了圣经故事，以及《圣经》正典由哪些人拍板定案。*重要的是，你或许会了解隐藏于圣经‌“背后‌”的故事。一旦你从幕后看到《圣经》如何成形，将会对这本圣典永远改观。', '英文', 35.40, '2017-06-01', 11, 4);
INSERT INTO `book_info` VALUES (4, '与神对话', '[美]尼尔唐纳德沃尔什,李继宏', '江西人民出版社', '9787210074366', '尼尔·唐纳德·沃尔什曾是电台导播，报纸主编，公共信息官员，并创办公关公司。大火毁去全部财产，婚姻四次失败，车祸几乎殒命。年过四十，风餐露宿，捡易拉罐维生。\r\n\r\n“我的人生为什么如此失败？”他在黄色便笺本上愤怒地写道。这封质疑信得到了神圣的回答，而他的提问也持续了三年。\r\n\r\n1995年，《与神对话》出版，雄踞《纽约时报》畅销书排行榜137周，成为新时代运动(New Age Movement)三大核心著作之一。\r\n\r\n《与神对话》共分三卷，分别和人生、世界、宇宙息息相关。它是我们时代的灵魂圣经，它已经改造许多心灵，也必将改善你的生活。', '中文', 247.00, '2015-09-01', 2, 3);
INSERT INTO `book_info` VALUES (5, '梦之海', '刘慈欣', '四川科技出版社', '9787536481152', '刘慈欣的作品宏伟大气、想象绚丽，既注重**空灵与厚重现实的结合，也讲求科学的内涵和美感，具有浓郁的中国特色和鲜明的个人风格，为中国科幻确立了新高度。\r\n刘慈欣的短篇小说构思巧妙，想象力纵横恣肆，将坚实的科学基础和厚重的人文情怀隐藏在灵动精致的故事结构中，代表了新时期以来中国科幻的**成就。\r\n　　《刘慈欣科幻短篇小说集》以时间为线，收录了刘慈欣发表处女作以来创作的优秀短篇科幻小说，是迄今为止*全面也*权威的版本。', '中文', 35.20, '2015-07-01', 22, 5);
INSERT INTO `book_info` VALUES (6, '明朝那些事儿（1-9）', '当年明月 ', '中国海关出版社', '9787801656087', '《明朝那些事儿》讲述从1344年到1644年，明朝三百年间的历史。作品以史料为基础，以年代和具体人物为主线，运用小说的笔法，对明朝十七帝和其他王公权贵和小人物的命运进行全景展示，尤其对官场政治、战争、帝王心术着墨最多。作品也是一部明朝政治经济制度、人伦道德的演义。', '中文', 358.20, '2009-04-06', 11, 2);
INSERT INTO `book_info` VALUES (7, '经济学原理（上下）', '[美] 曼昆 ', '机械工业出版社', '9787111126768', '此《经济学原理》的第3版把较多篇幅用于应用与政策，较少篇幅用于正规的经济理论。书中主要从供给与需求、企业行为与消费者选择理论、长期经济增长与短期经济波动以及宏观经济政策等角度深入浅出地剖析了经济学家们的世界观。', '英文', 88.00, '2003-08-05', 6, 0);
INSERT INTO `book_info` VALUES (10, '造彩虹的人', '东野圭吾 ', '北京十月文艺出版社', '9787530216859', '其实每个人身上都会发光，但只有纯粹渴求光芒的人才能看到。 从那一刻起，人生会发生奇妙的转折。功一高中退学后无所事事，加入暴走族消极度日；政史备战高考却无法集中精神，几近崩溃；辉美因家庭不和对生活失去勇气，决定自杀。面对糟糕的人生，他们无所适从，直到一天夜里，一道如同彩虹的光闯进视野。 凝视着那道光，原本几乎要耗尽的气力，源源不断地涌了出来。一切又开始充满希望。打起精神来，不能输。到这儿来呀，快来呀——那道光低声呼唤着。 他们追逐着呼唤，到达一座楼顶，看到一个人正用七彩绚烂的光束演奏出奇妙的旋律。 他们没想到，这一晚看到的彩虹，会让自己的人生彻底转...', '中文', 39.50, '2017-06-01', 9, 1);
INSERT INTO `book_info` VALUES (11, '控方证人', '阿加莎·克里斯蒂 ', '新星出版社', '9787513325745', '经典同名话剧六十年常演不衰； 比利•怀尔德执导同名电影，获奥斯卡金像奖六项提名！ 阿加莎对神秘事物的向往大约来自于一种女性祖先的遗传，在足不出户的生活里，生出对世界又好奇又恐惧的幻想。 ——王安忆 伦纳德•沃尔被控谋杀富婆艾米丽以图染指其巨额遗产，他却一再表明自己的无辜。伦纳德的妻子是唯一能够证明他无罪的证人，却以控方证人的身份出庭指证其确实犯有谋杀罪。伦纳德几乎陷入绝境，直到一个神秘女人的出现…… 墙上的犬形图案；召唤死亡的收音机；蓝色瓷罐的秘密；一只疯狂的灰猫……十一篇神秘的怪谈，最可怕的不是“幽灵”，而是你心中的魔鬼。', '中文', 35.00, '2017-05-01', 9, 1);
INSERT INTO `book_info` VALUES (12, '少有人走的路', 'M·斯科特·派克 ', '吉林文史出版社', '9787807023777', '这本书处处透露出沟通与理解的意味，它跨越时代限制，帮助我们探索爱的本质，引导我们过上崭新，宁静而丰富的生活；它帮助我们学习爱，也学习独立；它教诲我们成为更称职的、更有理解心的父母。归根到底，它告诉我们怎样找到真正的自我。 正如开篇所言：人生苦难重重。M·斯科特·派克让我们更加清楚：人生是一场艰辛之旅，心智成熟的旅程相当漫长。但是，他没有让我们感到恐惧，相反，他带领我们去经历一系列艰难乃至痛苦的转变，最终达到自我认知的更高境界。', '中文', 26.00, '2007-01-01', 9, 1);
INSERT INTO `book_info` VALUES (13, '追寻生命的意义', '[奥] 维克多·弗兰克 ', '新华出版社', '9787501162734', '《追寻生命的意义》是一个人面对巨大的苦难时，用来拯救自己的内在世界，同时也是一个关于每个人存在的价值和能者多劳们生存的社会所应担负职责的思考。本书对于每一个想要了解我们这个时代的人来说，都是一部必不可少的读物。这是一部令人鼓舞的杰作……他是一个不可思议的人，任何人都可以从他无比痛苦的经历中，获得拯救自己的经验……高度推荐。', '中文', 12.00, '2003-01-01', 9, 0);
INSERT INTO `book_info` VALUES (14, '三体', '刘慈欣', '重庆出版社', '9787893356365', '《三体》是刘慈欣创作的系列长篇科幻小说，由《三体》、《三体Ⅱ·黑暗森林》、《三体Ⅲ·死神永生》组成，第一部于2006年5月起在《科幻世界》杂志上连载，第二部于2008年5月首次出版，第三部则于2010年11月出版。\r\n作品讲述了地球人类文明和三体文明的信息交流、生死搏杀及两个文明在宇宙中的兴衰历程。其第一部经过刘宇昆翻译后获得了第73届雨果奖最佳长篇小说奖', '中文', 45.00, '2006-05-11', 22, 4);

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info`  (
  `class_id` int NOT NULL,
  `class_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES (1, '马克思主义');
INSERT INTO `class_info` VALUES (2, '哲学');
INSERT INTO `class_info` VALUES (3, '社会科学总论');
INSERT INTO `class_info` VALUES (4, '政治法律');
INSERT INTO `class_info` VALUES (5, '军事');
INSERT INTO `class_info` VALUES (6, '经济');
INSERT INTO `class_info` VALUES (7, '文化');
INSERT INTO `class_info` VALUES (8, '语言');
INSERT INTO `class_info` VALUES (9, '文学');
INSERT INTO `class_info` VALUES (10, '艺术');
INSERT INTO `class_info` VALUES (11, '历史地理');
INSERT INTO `class_info` VALUES (12, '自然科学总论');
INSERT INTO `class_info` VALUES (13, ' 数理科学和化学');
INSERT INTO `class_info` VALUES (14, '天文学、地球科学');
INSERT INTO `class_info` VALUES (15, '生物科学');
INSERT INTO `class_info` VALUES (16, '医药、卫生');
INSERT INTO `class_info` VALUES (17, '农业科学');
INSERT INTO `class_info` VALUES (18, '工业技术');
INSERT INTO `class_info` VALUES (19, '交通运输');
INSERT INTO `class_info` VALUES (20, '航空、航天');
INSERT INTO `class_info` VALUES (21, '环境科学');
INSERT INTO `class_info` VALUES (22, '科幻');
INSERT INTO `class_info` VALUES (23, '综合');

-- ----------------------------
-- Table structure for lend_list
-- ----------------------------
DROP TABLE IF EXISTS `lend_list`;
CREATE TABLE `lend_list`  (
  `ser_num` bigint NOT NULL AUTO_INCREMENT,
  `book_id` bigint NOT NULL,
  `reader_id` bigint NOT NULL,
  `lend_date` date NULL DEFAULT NULL,
  `back_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`ser_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lend_list
-- ----------------------------
INSERT INTO `lend_list` VALUES (15, 11, 2029211394, '2021-06-15', '2021-06-15');
INSERT INTO `lend_list` VALUES (17, 1, 2019211390, '2021-06-16', NULL);
INSERT INTO `lend_list` VALUES (18, 7, 2019211390, '2021-06-16', NULL);
INSERT INTO `lend_list` VALUES (19, 1, 2029211390, '2021-06-16', '2021-06-20');
INSERT INTO `lend_list` VALUES (20, 2, 2029211390, '2021-06-16', '2021-06-16');
INSERT INTO `lend_list` VALUES (21, 2, 2029211390, '2021-06-16', '2021-06-16');
INSERT INTO `lend_list` VALUES (22, 2, 2019211390, '2021-06-17', NULL);
INSERT INTO `lend_list` VALUES (23, 1, 2029211390, '2021-06-20', '2021-06-20');
INSERT INTO `lend_list` VALUES (24, 1, 2029211390, '2021-06-20', '2021-06-20');
INSERT INTO `lend_list` VALUES (25, 2, 2029211390, '2021-06-20', '2021-06-23');
INSERT INTO `lend_list` VALUES (26, 1, 2029211390, '2021-06-23', NULL);

-- ----------------------------
-- Table structure for moment
-- ----------------------------
DROP TABLE IF EXISTS `moment`;
CREATE TABLE `moment`  (
  `moment_id` int NOT NULL AUTO_INCREMENT,
  `start_moment` time NOT NULL,
  `end_moment` time NOT NULL,
  PRIMARY KEY (`moment_id`) USING BTREE,
  UNIQUE INDEX `moment_moment_id_uindex`(`moment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of moment
-- ----------------------------
INSERT INTO `moment` VALUES (1, '07:00:00', '08:00:00');
INSERT INTO `moment` VALUES (2, '08:00:00', '09:00:00');
INSERT INTO `moment` VALUES (3, '09:00:00', '10:00:00');
INSERT INTO `moment` VALUES (4, '10:00:00', '11:00:00');
INSERT INTO `moment` VALUES (5, '11:00:00', '12:00:00');
INSERT INTO `moment` VALUES (6, '12:00:00', '13:00:00');
INSERT INTO `moment` VALUES (7, '13:00:00', '14:00:00');
INSERT INTO `moment` VALUES (8, '14:00:00', '15:00:00');
INSERT INTO `moment` VALUES (9, '15:00:00', '16:00:00');
INSERT INTO `moment` VALUES (10, '16:00:00', '17:00:00');
INSERT INTO `moment` VALUES (11, '17:00:00', '18:00:00');
INSERT INTO `moment` VALUES (12, '18:00:00', '19:00:00');
INSERT INTO `moment` VALUES (13, '19:00:00', '20:00:00');
INSERT INTO `moment` VALUES (14, '20:00:00', '21:00:00');
INSERT INTO `moment` VALUES (15, '21:00:00', '22:00:00');
INSERT INTO `moment` VALUES (16, '22:00:00', '23:00:00');

-- ----------------------------
-- Table structure for reader_card
-- ----------------------------
DROP TABLE IF EXISTS `reader_card`;
CREATE TABLE `reader_card`  (
  `reader_id` bigint NOT NULL,
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`reader_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reader_card
-- ----------------------------
INSERT INTO `reader_card` VALUES (2019211390, '王明明', '123456');
INSERT INTO `reader_card` VALUES (2029211390, '王小明', '123456');
INSERT INTO `reader_card` VALUES (2029211391, '王莞尔', '123456');
INSERT INTO `reader_card` VALUES (2029211392, '王小伟', '123456');
INSERT INTO `reader_card` VALUES (2029211393, '张华', '123456');
INSERT INTO `reader_card` VALUES (2029211394, '张小小', '123456');
INSERT INTO `reader_card` VALUES (20192113933, '唐欣', '123456');

-- ----------------------------
-- Table structure for reader_info
-- ----------------------------
DROP TABLE IF EXISTS `reader_info`;
CREATE TABLE `reader_info`  (
  `reader_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birth` date NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` int NULL DEFAULT 3,
  PRIMARY KEY (`reader_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2029211394 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reader_info
-- ----------------------------
INSERT INTO `reader_info` VALUES (2019211390, '王明明', '男', '2021-06-17', '重庆市', '13372686868', 100);
INSERT INTO `reader_info` VALUES (2029211390, '王小明', '男', '2000-01-28', '陕西省西安市', '12345678907', 22);
INSERT INTO `reader_info` VALUES (2029211391, '王小花', '女', '1995-04-15', '浙江省杭州市', '12345678908', 79);
INSERT INTO `reader_info` VALUES (2029211392, '孙淼', '男', '1996-02-01', '北京市', '12345678909', 11);
INSERT INTO `reader_info` VALUES (2029211393, '张华', '男', '2021-06-16', '重庆市江北区', '12345678900', 2);
INSERT INTO `reader_info` VALUES (2029211394, '张小小', '男', '2021-06-16', '重庆市南岸区', '13366686866', 1);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `record_id` bigint NOT NULL AUTO_INCREMENT,
  `seat_id` bigint NOT NULL,
  `reader_id` bigint NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `sign_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (1, 4, 2029211390, '2021-06-08 00:00:00', '2021-06-22 00:00:00', '2021-06-16 22:05:18');
INSERT INTO `record` VALUES (8, 26, 2029211393, '2021-06-17 08:00:00', '2021-06-17 12:00:00', NULL);
INSERT INTO `record` VALUES (9, 14, 2029211392, '2021-06-17 08:00:00', '2021-06-17 12:00:00', NULL);
INSERT INTO `record` VALUES (10, 66, 2029211391, '2021-06-17 08:00:00', '2021-06-17 12:00:00', '2021-06-17 10:24:41');
INSERT INTO `record` VALUES (11, 66, 2029211390, '2021-06-17 08:00:00', '2021-06-17 12:00:00', '2021-06-17 09:45:15');
INSERT INTO `record` VALUES (12, 1, 2029211390, '2021-06-17 11:00:00', '2021-06-17 12:00:00', '2021-06-17 11:07:49');
INSERT INTO `record` VALUES (16, 2, 2029211390, '2021-06-18 11:00:00', '2021-06-18 12:00:00', '2021-06-18 11:04:15');
INSERT INTO `record` VALUES (38, 1, 2029211390, '2021-06-20 11:00:00', '2021-06-20 12:00:00', '2021-06-20 11:19:52');
INSERT INTO `record` VALUES (39, 1, 2029211393, '2021-06-20 12:00:00', '2021-06-20 13:00:00', NULL);
INSERT INTO `record` VALUES (40, 1, 2019211390, '2021-06-20 12:00:00', '2021-06-20 13:00:00', NULL);
INSERT INTO `record` VALUES (41, 1, 2019211390, '2021-06-20 13:00:00', '2021-06-20 14:00:00', NULL);
INSERT INTO `record` VALUES (42, 1, 2029211393, '2021-06-20 13:00:00', '2021-06-20 14:00:00', NULL);
INSERT INTO `record` VALUES (43, 1, 2019211390, '2021-06-20 14:00:00', '2021-06-20 15:00:00', NULL);
INSERT INTO `record` VALUES (44, 1, 2029211393, '2021-06-20 14:00:00', '2021-06-20 15:00:00', NULL);
INSERT INTO `record` VALUES (45, 1, 2019211390, '2021-06-20 15:00:00', '2021-06-20 16:00:00', NULL);
INSERT INTO `record` VALUES (46, 1, 2029211393, '2021-06-20 14:00:00', '2021-06-20 15:00:00', NULL);
INSERT INTO `record` VALUES (47, 1, 2029211390, '2021-06-23 14:00:00', '2021-06-23 15:00:00', '2021-06-23 14:05:53');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `room_id` bigint NOT NULL,
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seat_sum` bigint NOT NULL,
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, '一楼知路斋', 20);
INSERT INTO `room` VALUES (2, '一楼点石斋', 24);
INSERT INTO `room` VALUES (3, '一楼书香苑', 32);
INSERT INTO `room` VALUES (4, '二楼致远图书角', 20);
INSERT INTO `room` VALUES (5, '二楼方圆之外', 18);
INSERT INTO `room` VALUES (6, '二楼翰墨书香', 12);
INSERT INTO `room` VALUES (7, '三楼书海拾贝', 15);
INSERT INTO `room` VALUES (8, '三楼聚言堂', 15);

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat`  (
  `seat_id` bigint NOT NULL,
  `room_id` bigint NOT NULL,
  PRIMARY KEY (`seat_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES (1, 1);
INSERT INTO `seat` VALUES (2, 1);
INSERT INTO `seat` VALUES (3, 1);
INSERT INTO `seat` VALUES (4, 1);
INSERT INTO `seat` VALUES (5, 1);
INSERT INTO `seat` VALUES (6, 1);
INSERT INTO `seat` VALUES (7, 1);
INSERT INTO `seat` VALUES (8, 1);
INSERT INTO `seat` VALUES (9, 1);
INSERT INTO `seat` VALUES (10, 1);
INSERT INTO `seat` VALUES (11, 1);
INSERT INTO `seat` VALUES (12, 1);
INSERT INTO `seat` VALUES (13, 1);
INSERT INTO `seat` VALUES (14, 1);
INSERT INTO `seat` VALUES (15, 1);
INSERT INTO `seat` VALUES (16, 1);
INSERT INTO `seat` VALUES (17, 1);
INSERT INTO `seat` VALUES (18, 1);
INSERT INTO `seat` VALUES (19, 1);
INSERT INTO `seat` VALUES (20, 1);
INSERT INTO `seat` VALUES (21, 2);
INSERT INTO `seat` VALUES (22, 2);
INSERT INTO `seat` VALUES (23, 2);
INSERT INTO `seat` VALUES (24, 2);
INSERT INTO `seat` VALUES (25, 2);
INSERT INTO `seat` VALUES (26, 2);
INSERT INTO `seat` VALUES (27, 2);
INSERT INTO `seat` VALUES (28, 2);
INSERT INTO `seat` VALUES (29, 2);
INSERT INTO `seat` VALUES (30, 2);
INSERT INTO `seat` VALUES (31, 2);
INSERT INTO `seat` VALUES (32, 2);
INSERT INTO `seat` VALUES (33, 2);
INSERT INTO `seat` VALUES (34, 2);
INSERT INTO `seat` VALUES (35, 2);
INSERT INTO `seat` VALUES (36, 2);
INSERT INTO `seat` VALUES (37, 2);
INSERT INTO `seat` VALUES (38, 2);
INSERT INTO `seat` VALUES (39, 2);
INSERT INTO `seat` VALUES (40, 2);
INSERT INTO `seat` VALUES (41, 2);
INSERT INTO `seat` VALUES (42, 2);
INSERT INTO `seat` VALUES (43, 2);
INSERT INTO `seat` VALUES (44, 2);
INSERT INTO `seat` VALUES (45, 3);
INSERT INTO `seat` VALUES (46, 3);
INSERT INTO `seat` VALUES (47, 3);
INSERT INTO `seat` VALUES (48, 3);
INSERT INTO `seat` VALUES (49, 3);
INSERT INTO `seat` VALUES (50, 3);
INSERT INTO `seat` VALUES (51, 3);
INSERT INTO `seat` VALUES (52, 3);
INSERT INTO `seat` VALUES (53, 3);
INSERT INTO `seat` VALUES (54, 3);
INSERT INTO `seat` VALUES (55, 3);
INSERT INTO `seat` VALUES (56, 3);
INSERT INTO `seat` VALUES (57, 3);
INSERT INTO `seat` VALUES (58, 3);
INSERT INTO `seat` VALUES (59, 3);
INSERT INTO `seat` VALUES (60, 3);
INSERT INTO `seat` VALUES (61, 3);
INSERT INTO `seat` VALUES (62, 3);
INSERT INTO `seat` VALUES (63, 3);
INSERT INTO `seat` VALUES (64, 3);
INSERT INTO `seat` VALUES (65, 3);
INSERT INTO `seat` VALUES (66, 3);
INSERT INTO `seat` VALUES (67, 3);
INSERT INTO `seat` VALUES (68, 3);
INSERT INTO `seat` VALUES (69, 3);
INSERT INTO `seat` VALUES (70, 3);
INSERT INTO `seat` VALUES (71, 3);
INSERT INTO `seat` VALUES (72, 3);
INSERT INTO `seat` VALUES (73, 3);
INSERT INTO `seat` VALUES (74, 3);
INSERT INTO `seat` VALUES (75, 3);
INSERT INTO `seat` VALUES (76, 3);
INSERT INTO `seat` VALUES (77, 4);
INSERT INTO `seat` VALUES (78, 4);
INSERT INTO `seat` VALUES (79, 4);
INSERT INTO `seat` VALUES (80, 4);
INSERT INTO `seat` VALUES (81, 4);
INSERT INTO `seat` VALUES (82, 4);
INSERT INTO `seat` VALUES (83, 4);
INSERT INTO `seat` VALUES (84, 4);
INSERT INTO `seat` VALUES (85, 4);
INSERT INTO `seat` VALUES (86, 4);
INSERT INTO `seat` VALUES (87, 4);
INSERT INTO `seat` VALUES (88, 4);
INSERT INTO `seat` VALUES (89, 4);
INSERT INTO `seat` VALUES (90, 4);
INSERT INTO `seat` VALUES (91, 4);
INSERT INTO `seat` VALUES (92, 4);
INSERT INTO `seat` VALUES (93, 4);
INSERT INTO `seat` VALUES (94, 4);
INSERT INTO `seat` VALUES (95, 4);
INSERT INTO `seat` VALUES (96, 4);
INSERT INTO `seat` VALUES (97, 5);
INSERT INTO `seat` VALUES (98, 5);
INSERT INTO `seat` VALUES (99, 5);
INSERT INTO `seat` VALUES (100, 5);
INSERT INTO `seat` VALUES (101, 5);
INSERT INTO `seat` VALUES (102, 5);
INSERT INTO `seat` VALUES (103, 5);
INSERT INTO `seat` VALUES (104, 5);
INSERT INTO `seat` VALUES (105, 5);
INSERT INTO `seat` VALUES (106, 5);
INSERT INTO `seat` VALUES (107, 5);
INSERT INTO `seat` VALUES (108, 5);
INSERT INTO `seat` VALUES (109, 5);
INSERT INTO `seat` VALUES (110, 5);
INSERT INTO `seat` VALUES (111, 5);
INSERT INTO `seat` VALUES (112, 5);
INSERT INTO `seat` VALUES (113, 5);
INSERT INTO `seat` VALUES (114, 5);
INSERT INTO `seat` VALUES (115, 6);
INSERT INTO `seat` VALUES (116, 6);
INSERT INTO `seat` VALUES (117, 6);
INSERT INTO `seat` VALUES (118, 6);
INSERT INTO `seat` VALUES (119, 6);
INSERT INTO `seat` VALUES (120, 6);
INSERT INTO `seat` VALUES (121, 6);
INSERT INTO `seat` VALUES (122, 6);
INSERT INTO `seat` VALUES (123, 6);
INSERT INTO `seat` VALUES (124, 6);
INSERT INTO `seat` VALUES (125, 6);
INSERT INTO `seat` VALUES (126, 6);
INSERT INTO `seat` VALUES (127, 7);
INSERT INTO `seat` VALUES (128, 7);
INSERT INTO `seat` VALUES (129, 7);
INSERT INTO `seat` VALUES (130, 7);
INSERT INTO `seat` VALUES (131, 7);
INSERT INTO `seat` VALUES (132, 7);
INSERT INTO `seat` VALUES (133, 7);
INSERT INTO `seat` VALUES (134, 7);
INSERT INTO `seat` VALUES (135, 7);
INSERT INTO `seat` VALUES (136, 7);
INSERT INTO `seat` VALUES (137, 7);
INSERT INTO `seat` VALUES (138, 7);
INSERT INTO `seat` VALUES (139, 7);
INSERT INTO `seat` VALUES (140, 7);
INSERT INTO `seat` VALUES (141, 7);
INSERT INTO `seat` VALUES (142, 8);
INSERT INTO `seat` VALUES (143, 8);
INSERT INTO `seat` VALUES (144, 8);
INSERT INTO `seat` VALUES (145, 8);
INSERT INTO `seat` VALUES (146, 8);
INSERT INTO `seat` VALUES (147, 8);
INSERT INTO `seat` VALUES (148, 8);
INSERT INTO `seat` VALUES (149, 8);
INSERT INTO `seat` VALUES (150, 8);
INSERT INTO `seat` VALUES (151, 8);
INSERT INTO `seat` VALUES (152, 8);
INSERT INTO `seat` VALUES (153, 8);
INSERT INTO `seat` VALUES (154, 8);
INSERT INTO `seat` VALUES (155, 8);
INSERT INTO `seat` VALUES (156, 8);

SET FOREIGN_KEY_CHECKS = 1;
