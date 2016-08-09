/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : jobapply

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2016-08-09 20:10:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '北京');
INSERT INTO `city` VALUES ('2', '成都');
INSERT INTO `city` VALUES ('3', '广州');
INSERT INTO `city` VALUES ('4', '上海');

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `companyType_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9BDFD45D5D9837AA` (`companyType_id`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`companyType_id`) REFERENCES `companytype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '中国银行', '1');
INSERT INTO `company` VALUES ('2', 'Alibaba', '4');
INSERT INTO `company` VALUES ('3', 'Oracle', '4');

-- ----------------------------
-- Table structure for `companytype`
-- ----------------------------
DROP TABLE IF EXISTS `companytype`;
CREATE TABLE `companytype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of companytype
-- ----------------------------
INSERT INTO `companytype` VALUES ('1', '国企');
INSERT INTO `companytype` VALUES ('2', '外企');
INSERT INTO `companytype` VALUES ('3', '合资');
INSERT INTO `companytype` VALUES ('4', '民营');

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------

-- ----------------------------
-- Table structure for `jobapply`
-- ----------------------------
DROP TABLE IF EXISTS `jobapply`;
CREATE TABLE `jobapply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `company_id` bigint(20) DEFAULT NULL,
  `trade_id` bigint(20) DEFAULT NULL,
  `salaryLevel_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA1EE29D1232F642D` (`company_id`),
  KEY `FKA1EE29D1A3A4AF8D` (`trade_id`),
  KEY `FKA1EE29D1F7D03727` (`city_id`),
  KEY `FKA1EE29D149BE656D` (`salaryLevel_id`),
  CONSTRAINT `FKA1EE29D1232F642D` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FKA1EE29D149BE656D` FOREIGN KEY (`salaryLevel_id`) REFERENCES `salarylevel` (`id`),
  CONSTRAINT `FKA1EE29D1A3A4AF8D` FOREIGN KEY (`trade_id`) REFERENCES `trade` (`id`),
  CONSTRAINT `FKA1EE29D1F7D03727` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobapply
-- ----------------------------
INSERT INTO `jobapply` VALUES ('1', 'Java初级程序员', '应用Spring+Hibernate+Struts2等技术，完成项目组分配的指定的功能模块。\r\n1、 技术人员职位，在上级的领导和监督下定期完成量化的工作要求，并能独立处理和解决所负责的任务；\r\n2、 根据开发进度和任务分配，完成相应模块软件的设计、开发、编程任务；\r\n3、 进行程序单元、功能的测试，查出软件存在的缺陷并保证其质量；\r\n4、 进行编制项目文档和质量记录的工作；\r\n5、 维护软件使之保持可用性和稳定性。', '3', '1', '2', '1');
INSERT INTO `jobapply` VALUES ('2', '高级软件工程师 ', '负责基金(易方达)及金融行业的信息系统研发设计；\r\n负责对软件进行单元测试、集成测试；\r\n负责解决开发过程中的技术问题；\r\n负责对系统测试和验收测试报告的问题进行回复；\r\n负责软件更改说明、功能特性说明等开发文档编写工作', '2', '1', '4', '3');
INSERT INTO `jobapply` VALUES ('3', '软件工程师  ', '与后端工程师紧密工作在一起，利用HTML、CSS、JavaScript、DOM等各种Web技术实现前端UI和交互方面的开发需求\r\n产品易用性改进和Web界面技术优化\r\n制作标准化、模块化、高性能、高可维护性的代码，并持续优化和重构\r\nWeb前沿技术研究和新技术调研\r\n对界面应用的人性化、交互操作流程提出设计方案，并实施和持续更新，着重实现优质的用户体验', '3', '1', '2', '3');
INSERT INTO `jobapply` VALUES ('5', '网页和杂志美术设计', '1、大专以上学历，要求具备相应美术基础。 \r\n2、精通div+css，Photoshop，CorelDRAW，Dreamweaver，Flash等软件。 \r\n3、了解ASP.net、PHP、JSP，了解MS-SQL或my-sql数据库。 \r\n4、工作细致、认真负责，能承受较大的工作量和工作压力。 \r\n5、有敬业精神和良好的团队精神。 \r\n6、须具备建设网站的工作经验和成功案例。会英文、日语、西语多种语言者优先，该职位可以兼职。 ', '1', '2', '3', '4');
INSERT INTO `jobapply` VALUES ('6', 'Android软件工程师', '任职要求： \r\n1、精通Android系统架构及相关技术，1年以上Android平台开发经验； \r\n2、熟悉Android SDK开发，具有独立设计、开发Android应用软件的能力； \r\n3、熟悉网络编程、安卓UI框架及相关开发工具； \r\n4、具有较强的团队协作精神及高度的责任心，良好的编码规范；', '3', '1', '3', '4');
INSERT INTO `jobapply` VALUES ('7', '产品经理', '1、移动互联网产业发展的热点和趋势分析，前期产品市场需求调研，产品创意和可行性分析，同类产品市场资料的收集；\r\n2、充分了解用户需求，收集用户反馈，分析用户行为及需求，对产品进行持续的优化和改进；\r\n3、负责设计符合公司战略的产品，归纳产品界面的交互需求，撰写详细的产品设计文档、原型设计文档和产品方案；\r\n4、引导完成产品的界面、功能、流程设计，协调开发人员进行开发工作，推动及协调产品的开发进度，把控项目质量；\r\n\r\n任职资格：\r\n1、2年以上移动互联网手机客户端相关产品的设计工作经验，对产品有深刻理解，有成功案例；\r\n2、精通移动互联网的产品交互设计的相关流程，包括功能分析、用户角色分析、原型设计、界面开发、易用性测试等；\r\n3、出色的表达能力，文档写作能力和产品原型表现能力；能够熟练使用产品原型搭建工具；\r\n4、具备良好的数据与竞争对手分析能力，较好的逻辑思维与分析能力，能够对自有产品提出整改计划；\r\n5、对于用户体验有深刻的理解，能够很好的规划和设计产品功能、使用流程与交互体验；\r\n6、至少拥有iOS和Android平台的产品设计开发经验。\r\n7、有运营商合作经验者优先；优秀应届生可放宽工作经验要求。', '1', '2', '3', '3');
INSERT INTO `jobapply` VALUES ('8', 'IOS工程师', '1、负责 iPhone，iPad ，android客户端产品的开发；\r\n2、各iOS 应用和Android框架开发和维护，SDK开发\r\n岗位要求：\r\n1、两年以上客户端开发经验，精通Android或iOS手机平台开发。\r\n2、熟悉掌握至少一种主流手机平台编程语言（object-c或Java等），有无线开发经验不少于2年\r\n3、精通Android下的高性能编程及性能调优，精通一个系列以上的高市场占有率的手机适配。或者\r\n4、 开发基础良好，理解设计模式，在项目或产品中有很好的设计实践\r\n5、 有强烈的责任心和团队精神，善于沟通和合作；能独立完成设计和编码\r\n6、 对Android和iOS的UI控件有优化经验者优先；有前端开发经验者优先\r\n7、有无线App、Html5或开放平台相关经验者优先\r\n岗位职责：\r\n负责Android/iOS应用程序的设计、开发；\r\n负责手机应用程序的维护和升级。', '3', '1', '3', '3');
INSERT INTO `jobapply` VALUES ('9', 'web开发工程师', '1、负责服装行业应用开发，有一年以上项目实际经验；\r\n2、精通html,css,javascript,Ajax；\r\n3、具有html5和css3开发经验；\r\n4、熟练应用jQuery Mobile移动端web开发框架，具有1年以上Mobile Web开发经验者优先；\r\n5、精通IOS或Android开发平台及框架原理，能独立完成IOS/Android系统应用开发；\r\n6、有良好的数据库理论基础，精通SQL，有SQL Server、Oracle等一种或多种数据库开发经验；\r\n7、具有良好编码风格，有较强的独立工作能力和团队合作精神；\r\n8、思路清晰，思维敏捷，快速的学习能力；具备良好的沟通能力和团队合作精神；\r\n9、具有服装或鞋行业背景者优先；', '3', '1', '1', '1');
INSERT INTO `jobapply` VALUES ('10', '置业顾问', '链家地产是一家以房地产经纪业务为核心的全国化发展的房地产综合服务体。已在全国范围内创造出规模第二、业绩第一的记录，公司始创于2001年11月，截止目前已经在北京、成都、上海、杭州、天津、大连、青岛、南京、开设直营分公司，全国共拥有直营1000余家，经纪人3万余人，未来十年，链家地产的分支机构将达到5000家，经纪人超过10万人，年佣金100亿。立足于环渤海，以华北平原的品牌优势为基础，构建一个覆盖环渤海、长三角、珠三角、中原地区、西南地区的中国最优秀的房地产经纪综合服务平台。 \r\n\r\n成都链家地产于2011年10月正式进驻成都，以成都市二手房买卖、租赁及金融按揭服务为主，截止目前成都链家门店已有40余家，目前主要服务西南、西、南板块，立争在未来三年内门店覆盖全成都，着力打造中国西南区域地产经 纪的航空母舰！ \r\n\r\n成都链家秉承链家集团卓越的经营理念与完善的客户服务体系，我们承诺透明交易、签三方约、不吃差价，立志为成都的消费者提供最好的房屋消费体验和最安全，省心，放心的二手房经纪服务！ \r\n薪资福利： \r\n无责任高底薪（1600-2500）元+高额提成（10%-30%）+现金奖+带薪培训+保险（社保+商保）+免费旅游 =平均4000/月上不封顶 \r\n直观案例：以单月业绩额计算，业绩额为4.2万元，底薪+提成可达1万元；业绩额为8-9万，底薪+提成可达2万元 ', '1', '2', '4', '2');
INSERT INTO `jobapply` VALUES ('11', 'Java软件工程师', '岗位职责：\r\n1、协助完成小型项目的系统分析、设计，并协助完成详细设计和编码的任务，确保项目的进度和质量；\r\n2、能够在团队中完成Code Review的任务，确保相关代码的有效性和正确性，并能够通过Code Review提供相关性能以及安全的建议；\r\n3、能够完成部分较小规模系统的系统分析文档和详细设计文档的撰写；\r\n4、维护和升级现有软件产品和系统，快速定位并修复现有软件缺陷。\r\n\r\n任职要求：\r\n1、计算机相关专业，本科及以上学历；\r\n2、一年以上java及WEB应用软件开发经验；\r\n3、熟悉JAVA 语言，熟悉J2EE下的主流技术；\r\n4、熟悉UML、OOP、设计模式 和 软件架构 ,对各种开源框架如Struts、Spring、Hibernate等有深入的了解；\r\n5、 熟悉Tomcat/JBoss等应用服务器的配置及优化，熟悉Oracle/SQL Server/MySQL等常见数据库编程及配置；\r\n6、良好的表达和理解能力、良好的学习能力、良好的沟通能力、良好的解决问题的能力。\r\n7、热爱技术、喜欢钻研；\r\n8、成就感来自用户的认可、来自亲手实习的产品，来自亲手解决的疑难杂症。', '1', '2', '3', '2');
INSERT INTO `jobapply` VALUES ('12', 'UI设计师', '岗位职责：\r\n1.负责网页或者相关系统的效果图设计和制作；\r\n2.理解分析用户任务，定义产品可用性需求和使用场景；\r\n3.根据产品需求与技术配合，高质量完成产品的视觉设计工作；\r\n4.设计用户软件交互界面，并通过原型的形式与产品、技术团队进行评估；\r\n5.优化结合用户体验及完善设计流程；\r\n6.与需求、开发人员保持良好沟通，并配合开发工作。\r\n职位要求：\r\n1.美术设计/交互设计/工业设计/工业心理学等相关专业专科（含）以上学历；\r\n2.从事软件UI相关工作1年以上，对web2.0技术有深刻的理解，能有自己独特的设计见解；\r\n3.能使用Photoshop、Flash、Illustrator、CorelDraw等流行设计软件；\r\n4.熟练掌握html、javascript、css等web前端技术，有良好的书写规范；\r\n5.主动沟通，积极聆听，良好的团队合作精神和认真负责的工作态度；\r\n6.善于总结，将工作上的内容提取归纳成知识点和方法,与他人形成知识共享。\r\n注：请将成熟作品随简历一同提供，满足要求后安排面试,请详细填写曾经参加过那些项目的开发工作，具体角色内容。', '2', '1', '2', '2');
INSERT INTO `jobapply` VALUES ('13', '美工', '职位描述:\r\n岗位职责：\r\n1、负责网站、产品的视觉设计；\r\n2、根据客户需求，指导及配合开发人员实现Web应用程序的界面；\r\n3、结合用户体验，对用户界面进行创新、优化及完善，使用户操作更趋于人性化；\r\n4、规范交互设计文档，与产品经理紧密配合，把控项目进度；\r\n5、进行用户体验研究和分析，整理和积累交互创新想法。\r\n任职资格：\r\n1、良好的审美观；\r\n2、2年以上应用软件设计、B/S结构门户网站UI设计及交互设计的工作经验；\r\n3、理解Web标准，能将设计用HTML+CSS输出页面代码，页面具有浏览器兼容性；\r\n4、能熟练使用Dreamweaver、Photoshop、Illustrator、CorelDraw等设计软件；\r\n5、熟悉Html4、Html5、CSS3、Javascript， 能够配合程序员完成相关工作，熟悉Jquery者优先。', '3', '3', '1', '1');
INSERT INTO `jobapply` VALUES ('17', 'iOS开发工程师', '岗位职责\r\n负责公司产品在iOS平台的软件设计及开发\r\n参与项目需求分析、产品模块的概要和详细设计\r\n按计划完成产品模块的代码编写，产品模块测试\r\n产品升级与维护\r\n任职资格\r\n计算机相关专业，具备一定英文水平\r\n能够独立完成开发，解决验证和修正测试中发现的问题\r\n熟悉软件开发流程, 对iPhone/iPad/Mac应用开发流程比较熟悉\r\n有良好的面向对象分析、设计能力、规范的编程风格和良好文档习惯\r\n对工作充满激情，学习能力强，有强烈的责任感与进取心\r\n具备良好的沟通能力和优秀的团队协作能力', '2', '1', '2', '2');
INSERT INTO `jobapply` VALUES ('18', '游戏客户端开发工程师', '岗位职责\r\n根据策划功能需求，开发游戏客户端\r\n参与项目需求分析、产品模块的概要和详细设计\r\n按计划完成产品模块的代码编写，产品模块测试\r\n产品升级与维护\r\n任职资格\r\n熟练运用C或C++语言，良好的数据结构及算法基础\r\n良好的3D图形学基础\r\n计算机及相关专业专科或以上学历\r\n具备较强的学习能力与工作责任心', '2', '1', '2', '2');
INSERT INTO `jobapply` VALUES ('19', 'Android开发工程师', '岗位职责\r\n负责Android应用开发\r\n进行产品的功能定义,程序设计\r\n根据设计文档或需求说明完成代码编写，调试，测试和维护\r\n分析并解决软件开发过程中的问题\r\n任职资格\r\n计算机或相关专业学历\r\n熟悉Java编程、熟悉Android SDK\r\n熟悉面向对象思想，编程，调试,性能优化和相关技术\r\n熟悉Android网络通信机制\r\n能承受一定的工作压力，具有强烈的自主学习能力和意愿，对Android技术专研和应用具有激情.\r\n具备需求分析和系统设计能力，以及较强的逻辑分析和独立解决问题能力.\r\n基本掌握阅读英文技术文档能力\r\n富有团队精神,责任感和沟通能力', '2', '1', '2', '2');
INSERT INTO `jobapply` VALUES ('20', 'Java程序员', '岗位职责\r\n负责公司新产品的研发和设计\r\n负责对软件进行单元测试、集成测试\r\n负责解决开发过程中的技术问题\r\n负责对系统测试和验收测试报告的问题进行回复\r\n负责软件更改说明、功能特性说明等开发文档编写工作\r\n任职资格\r\n计算机及相关专业毕业，专科以上学历\r\n熟练掌握SSH主流框架技术\r\n熟悉eclipse开发环境，精通Java语言编程，熟悉Mysql，ORACLE等关系数据库\r\n积极上进，善于学习，具备良好的分析、解决问题的能力\r\n基本的英语读、写能力\r\n良好的沟通能力和团队协作精神', '2', '1', '1', '2');
INSERT INTO `jobapply` VALUES ('22', 'Java资深专家', '职位职能:  ERP实施顾问  系统架构设计师\r\n职位描述:\r\n研究院年薪40万面向社会招聘Java资深专家\r\n\r\n任职要求：\r\n1.计算机、通信及相关专业本科以上学历\r\n2.5年以上javaEE系统架构设计经验，3年以上javaEE大型项目经验\r\n3.成功主持过大型项目的产品研究和开发工作，具有专业的开发与系统架构能力\r\n4.熟悉集群技术、在JavaEE技术、并发处理、性能优化方面有丰富经验\r\n5.具有良好的敬业精神和团队协作能力，较强问题分析能力以及较好的沟通表达能力\r\n6.精通数据库设计理论，熟悉SQLServer/Oracle/MySql等关系型数据库，并精通一至两种工具的使用\r\n7.精通企业级架构设计，精通设计模式、企业架构模型、反模式等优先，熟悉领域驱动设计(DDD)、SOA架构、云计算、物联网等技术。\r\n8.良好的软件工程思想，熟悉CMM/CMMI体系等内容；深刻理解软件研发过程和生命周期，具备良好的软件研发过程管理和控制的技能，包括进度安排和控制、\r\n风险控制、质量管理、配置管理和软件发布等。\r\n9.关注新知识、新技术的发展动态，具有持续研究学习的能力，可承受高难项目的挑战(本职位对该条要求非常重视)。', '3', '1', '1', '1');
INSERT INTO `jobapply` VALUES ('24', 'SEO主管', '技能要求:\r\n1. 系统的SEO知识,对SEO各概念和操作深刻掌握;2. 熟悉baidu、google排名因素,完美运用站内、站外优化技巧;提高目标关键词的排名。3. 结合公司产品和业务,挖掘更多搜索引擎营销可能性;最大化地获取搜索流量,能够有针对性地分析和挖掘更多的搜索流量,增加网站的曝光度,带来更多潜在用户。4. 具有外链资源挖掘执行力和外链建设丰富经验;5. 熟悉搜索引擎的竟价方式;对流量分析和互联网各种网站模式有自己独特的见解并能写成执行方案;6. 能够通过分析网站日志、流量分析工具等,对网站进行持续分析和改进。7、有SEM/PPC竞价专业知识和操作经验的优先(百度)\r\n岗位职责:\r\n负责公司SEO统筹及管理。1、SEO目标的制定,以及SEO整体策略规划,包括内容及链接策略。2、协调沟通,包括与其他部门的沟通协作和本部门内部任务计划的制定和执行。3、竞争对手和我司关键词挖掘与分析。4、网站构架设计。5、标准与规范化。标准包括网站上传的内容,规范包括页面代码规范与优化规范。6、记录、统计搜索流量,分析存在问题,发现流量来源,提供正确的SEO解决方案。', '2', '1', '3', '3');
INSERT INTO `jobapply` VALUES ('25', 'JavaEE软件工程师', '岗位职责：\r\n\r\n负责基金(易方达)及金融行业的信息系统研发设计；\r\n负责对软件进行单元测试、集成测试；\r\n负责解决开发过程中的技术问题；\r\n负责对系统测试和验收测试报告的问题进行回复；\r\n负责软件更改说明、功能特性说明等开发文档编写工作\r\n\r\n任职资格\r\n\r\n计算机及相关专业毕业，专科以上学历；\r\n两年以上JavaEE开发项目经验；\r\n熟练掌握SSH等主流JavaEE框架技术应用;\r\n精通eclipse开发工具使用;\r\n精通JavaScript,精通Ajax原理，熟悉使用JQuery、ExtJS等常用Ajax框架;\r\n熟悉Mysql，ORACLE等关系数据库编程;\r\n积极上进，善于学习，具备良好的分析、解决问题的能力;\r\n良好的沟通能力和团队协作精神。\r\n\r\n其它说明\r\n本职位主要从事基金公司内部的项目开发及维护，属于金融行业的荐；\r\n公司福利待遇比如好，五险一金，有餐补，有活动费，休假时间与股市开盘时间一致，每年会比国家法定休假多5-8天。\r\n公司技术团队由开源高手构成，期待热爱软件开发，有理想抱负成员加入', '2', '1', '4', '3');
INSERT INTO `jobapply` VALUES ('26', '软件UI工程师', '岗位职责\r\n根据UI设计的理念进行软件界面图片的制作/修改\r\n负责软件或网页界面UI的视觉设计与制作\r\n配合开发部门设计软件产品的界面原型、评估及界面测试\r\n根据需求设计程序用户界面，对用户界面质量负责\r\n任职资格\r\n具有事业心和上进心\r\n计算机或美术相关专业大专以上学历\r\n能熟练运用常用设计软件Photoshop、CorelDRAW、Illustrator、Flash等工具\r\n熟悉3DMAX、MAYA或具有手绘原画创作能力者优先\r\n对通用类软件或互联网应用系统的人机交互方面有自己的理解和认识，具有较强的设计能力和美术功底\r\n良好的沟通能力和团队协作能力，乐于接受客户及同事的意见，同时具有自己的观点', '2', '1', '2', '3');

-- ----------------------------
-- Table structure for `salarylevel`
-- ----------------------------
DROP TABLE IF EXISTS `salarylevel`;
CREATE TABLE `salarylevel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salarylevel
-- ----------------------------
INSERT INTO `salarylevel` VALUES ('1', '3000-4000');
INSERT INTO `salarylevel` VALUES ('2', '4000-5000');
INSERT INTO `salarylevel` VALUES ('3', '5000-6000');
INSERT INTO `salarylevel` VALUES ('4', '6000-8000');
INSERT INTO `salarylevel` VALUES ('5', '8000-12000');

-- ----------------------------
-- Table structure for `trade`
-- ----------------------------
DROP TABLE IF EXISTS `trade`;
CREATE TABLE `trade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trade
-- ----------------------------
INSERT INTO `trade` VALUES ('1', '计算机');
INSERT INTO `trade` VALUES ('2', '金融');
INSERT INTO `trade` VALUES ('3', '教育');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `dept_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK27E3CB25A8D0E7` (`dept_id`),
  CONSTRAINT `FK27E3CB25A8D0E7` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
