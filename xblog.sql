-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (arm64)
--
-- Host: localhost    Database: xblog
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add 分类',1,'add_category'),(2,'Can change 分类',1,'change_category'),(3,'Can delete 分类',1,'delete_category'),(4,'Can view 分类',1,'view_category'),(5,'Can add 标签',2,'add_tag'),(6,'Can change 标签',2,'change_tag'),(7,'Can delete 标签',2,'delete_tag'),(8,'Can view 标签',2,'view_tag'),(9,'Can add 文章',3,'add_post'),(10,'Can change 文章',3,'change_post'),(11,'Can delete 文章',3,'delete_post'),(12,'Can view 文章',3,'view_post'),(13,'Can add 评论',4,'add_comment'),(14,'Can change 评论',4,'change_comment'),(15,'Can delete 评论',4,'delete_comment'),(16,'Can view 评论',4,'view_comment'),(17,'Can add 侧边栏',5,'add_sidebar'),(18,'Can change 侧边栏',5,'change_sidebar'),(19,'Can delete 侧边栏',5,'delete_sidebar'),(20,'Can view 侧边栏',5,'view_sidebar'),(21,'Can add 友链',6,'add_link'),(22,'Can change 友链',6,'change_link'),(23,'Can delete 友链',6,'delete_link'),(24,'Can view 友链',6,'view_link'),(25,'Can add log entry',7,'add_logentry'),(26,'Can change log entry',7,'change_logentry'),(27,'Can delete log entry',7,'delete_logentry'),(28,'Can view log entry',7,'view_logentry'),(29,'Can add permission',8,'add_permission'),(30,'Can change permission',8,'change_permission'),(31,'Can delete permission',8,'delete_permission'),(32,'Can view permission',8,'view_permission'),(33,'Can add group',9,'add_group'),(34,'Can change group',9,'change_group'),(35,'Can delete group',9,'delete_group'),(36,'Can view group',9,'view_group'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add content type',11,'add_contenttype'),(42,'Can change content type',11,'change_contenttype'),(43,'Can delete content type',11,'delete_contenttype'),(44,'Can view content type',11,'view_contenttype'),(45,'Can add session',12,'add_session'),(46,'Can change session',12,'change_session'),(47,'Can delete session',12,'delete_session'),(48,'Can view session',12,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$tC6zj8g7MFEhA9VLqPy7eH$XCuzbv4nzcW5ejO0Vdk1KHKWdHatD+BesA7lctW2oPY=','2023-02-02 02:47:07.553160',1,'luo','','','',1,1,'2023-02-02 02:46:43.572778');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` int unsigned NOT NULL,
  `is_nav` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_category_owner_id_96951406_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `blog_category_owner_id_96951406_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_category_chk_1` CHECK ((`status` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (3,'第一类',1,1,'2023-02-02 03:46:08.555757',1),(4,'第二类',1,1,'2023-02-02 03:46:21.650739',1),(5,'第三类',1,0,'2023-02-02 03:46:30.849525',1);
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `desc` varchar(1024) NOT NULL,
  `content` longtext NOT NULL,
  `status` int unsigned NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `pv` int unsigned NOT NULL,
  `uv` int unsigned NOT NULL,
  `content_html` longtext NOT NULL,
  `category_id` bigint NOT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_category_id_c326dbf8_fk_blog_category_id` (`category_id`),
  KEY `blog_post_owner_id_ff7c9277_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `blog_post_category_id_c326dbf8_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_post_owner_id_ff7c9277_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_post_chk_1` CHECK ((`status` >= 0)),
  CONSTRAINT `blog_post_chk_2` CHECK ((`pv` >= 0)),
  CONSTRAINT `blog_post_chk_3` CHECK ((`uv` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (1,'Django学习笔记--模板层','Django的MTV模式','Django的MTV模式\r\nMTV代表Model-Template-View(模型-模板-视图）模式。\r\n● M 模型层（Model）负责与数据库交互\r\n● T 模板层（Template)负责呈现内容到浏览器（how）\r\n● V 视图层（View）是核心，负责接收请求、获取数据、返回结果（what）\r\n作用：降低模块件的耦合度（解耦）\r\n模型层主要负责跟数据库之间进行通信\r\n\r\n什么是模型\r\n● 模型是一个python类，它是由django.db.models.Model派生出的子类\r\n● 一个模型类代表数据库中的一张数据表\r\n● 模型类中每一个类属性都代表数据库中的一个字段\r\n● 模型是数据交互的接口，是表示和操作数据库的方法和方式\r\nDjango如何配置mysql\r\n● 创建数据库\r\n  ○ 进入mysql数据库：create database 数据库名 default charset utf8，数据库名跟项目名保持一致\r\n● settings.py进行数据库配置\r\nDATABASES = {\r\n    \'default\': {\r\n        \'ENGINE\': \'django.db.backends.mysql\',#数据库引擎修改\r\n        \'NAME\': \'tedu_note\',#数据库名\r\n        \'USER\': \'root\',#数据库用户名\r\n        \'PASSWORD\': \'luo67890\',#数据库密码\r\n        \'HOST\': \'127.0.0.1\',#数据库服务器IP\r\n        \'PORT\': \'3306\'#数据服务器默认端口\r\n    }\r\n}\r\n● 安装mysqlclient\r\n  ○ pip3 install mysqlclient\r\n● 在pycharm的项目环境里导入pymysql包\r\n● 在主目录里的__init__.py中配置，如下：\r\nimport pymysql\r\npymysql.install_as_MySQLdb()\r\n\r\nubuntu系统的配置方法：',1,'2023-02-02 03:48:20.136910',1,1,'<mistune.markdown.Markdown object at 0x106183700>',3,1),(2,'git学习笔记','git学习笔记','1、版本库\r\n版本库又叫仓库repository,就是一个文件夹放项目的。\r\n第一步：创建版本库\r\n	$ mkdir test #test是仓库名\r\n	$ cd test #切换到test\r\n	$ pwd #显示当前目录\r\n第二步：初始化\r\n	$ git init #初始化后就版本库就建好了，可以看到一个.git的目录\r\n第三部：添加文件到版本库\r\n	Git只能跟踪文本文件，如.txt，URL，程序代码等。\r\n	将文件放到版本库目录下，如上建立的test.git目录下，不然Git是找不到该文件的。\r\n	$ git add test.txt #将文件添加到版本库，执行该命令没有任何显示\r\n	$ git commit -m\"message\" #将文件提交到版本库,-m后面的内容为说明\r\n	可以多次使用git add 后，一次性git commit\r\n2、版本操作\r\n	$ git status #显示当前版本库状态，是否修改，是否需要提交到版本库等\r\n	$ git diff #显示当前版本与上一个版本的区别\r\n（1）版本回退\r\n	$ git log #显示所以提交日志，日志显示每一次commit提交，该命令执行后commit后跟着id，用该id 可以任意切换到id对应的版本\r\n	$ git reset --hard HEAD^ #版本回退到上一个版本，HEAD指当前版本，HEAD^指上一个版本，HEAD^^指上上个版本，往上100个可以用HEAD～100\r\n	$ git reset --hard 1234d #当从版本b回退到版本a,再用git log 就看不到版本b了，但上面用过git log有版本b的commit id，这里的123d就是版本b的commit id的前几位，这样也可以回退到版本b\r\n	$ git reflog #该命令可以记录每一次命令，用commit id回退到想回退的版本\r\n3、工作区与版本库\r\n	\r\nGit管理的文件分为：工作区，版本库，版本库又分为暂存区stage和暂存区分支master(仓库)\r\n工作区>>>>暂存区>>>>仓库\r\n在电脑里的目录下，如上面建的test文件夹就是一个工作区。如上图，版本库里有个stage叫暂存区。\r\n将文件添加到Git版本库时做了两步：\r\n第一步git add把文件从工作区>>>>暂存区；\r\n第二部git commit把文件从暂存区>>>>仓库。\r\n若test第一次修改，git add test.txt添加到暂存区，还没提交又进行了第二次修改，那么最终Git管理的是第一次的修改，第二次修改没有添加，所以还得再一次添加、提交才行。每次修改，如果不用git add到暂存区，那就不会加入到commit中。这就是Git跟踪并管理的是修改，并非文件。\r\n3、撤销修改\r\n场景1：当你改乱了工作区某个文件的内容，想直接丢弃工作区的修改时，用命令git checkout -- filename。\r\n场景2：当你不但改乱了工作区某个文件的内容，还添加到了暂存区时，想丢弃修改，分两步，第一步用命令git reset HEAD <file>，就回到了场景1，第二步按场景1操作。\r\n场景3：已经提交了不合适的修改到版本库时，想要撤销本次提交，参考版本回退一节，不过前提是没有推送到远程库。\r\ngit diff查看工作区和暂存区差异，\r\ngit diff --cached查看暂存区和仓库差异，\r\ngit diff HEAD --test.txt      #查看工作区和仓库的差异\r\ngit add的反向命令git checkout，撤销工作区修改，即把暂存区最新版本转移到工作区（原来的git checkout 可以使用 git restore 代替）。\r\ngit commit的反向命令git reset HEAD，就是把仓库最新版本转移到暂存区（原来的git reset HEAD 可以使用 git restore --staged 代替）。\r\n4、删除\r\nrm test.txt    #删除工作区的文件\r\ngit rm test.txt  #删除版本库的文件，相当于是rm test.txt加上git add test.txt，删除也是一种修改，确定删除再git commit\r\ngit checkout -- test.txt #若版本库还有，可把删除的文件恢复到最新版本，\r\n命令git rm用于删除一个文件。如果一个文件已经被提交到版本库，那么你永远不用担心误删，但是要小心，你只能恢复文件到最新版本，你会丢失最近一次提交后你修改的内容。\r\n5、远程仓库Github\r\nssh-key:\r\n生成ssh-key：ssh-keygen -t rsa -C \"your email\"\r\n查看ssh-key：cat ~/.ssh/github_id_rsa.pub\r\n复制ssh-key添加到Github>>settings>>Account>>SSH and GPG keys\r\n添加远程库：\r\n在Github上创建一个空仓库，可以把Git要上传的本地仓库上传，也可克隆一个新的仓库。\r\ngit remote add origin git@server-name:path/repo-name.git（如git remote add origin git@github.com:himan789/test.git)\r\n\r\n将本地库的test上传到远程库github，步骤：\r\ncd test    #需要在test目录\r\ngit remote add origin https://github.com/himan789/test.git   #也可以git remote add origin git@github.com:himan789/test.git\r\ngit push -u origin main\r\n\r\n后面在本地库修改就可以提交git push origin master\r\n删除远程库\r\n如果添加的时候地址写错了，或者就是想删除远程库，可以用git remote rm <name>命令。使用前，建议先用git remote -v查看远程库信息。\r\n此处的“删除”其实是解除了本地和远程的绑定关系，并不是物理上删除了远程库。远程库本身并没有任何改动。要真正删除远程库，需要登录到GitHub，在后台页面找到删除按钮再删除。',1,'2023-02-02 03:49:15.466020',1,1,'<mistune.markdown.Markdown object at 0x1063f5960>',4,1);
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post_tag`
--

DROP TABLE IF EXISTS `blog_post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_post_tag_post_id_tag_id_ba2a5f83_uniq` (`post_id`,`tag_id`),
  KEY `blog_post_tag_tag_id_2bbd31e4_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_post_tag_post_id_a5c00319_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`),
  CONSTRAINT `blog_post_tag_tag_id_2bbd31e4_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_tag`
--

LOCK TABLES `blog_post_tag` WRITE;
/*!40000 ALTER TABLE `blog_post_tag` DISABLE KEYS */;
INSERT INTO `blog_post_tag` VALUES (1,1,1),(2,2,4);
/*!40000 ALTER TABLE `blog_post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `status` int unsigned NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_tag_owner_id_3c8290ca_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `blog_tag_owner_id_3c8290ca_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_tag_chk_1` CHECK ((`status` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'Django',1,'2023-02-02 03:46:39.026659',1),(2,'python',1,'2023-02-02 03:46:47.295969',1),(3,'mysql',1,'2023-02-02 03:46:57.362525',1),(4,'git',1,'2023-02-02 03:47:04.373842',1);
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_comment`
--

DROP TABLE IF EXISTS `comment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `target` varchar(100) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `website` varchar(200) NOT NULL,
  `status` int unsigned NOT NULL,
  `created_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `comment_comment_chk_1` CHECK ((`status` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_comment`
--

LOCK TABLES `comment_comment` WRITE;
/*!40000 ALTER TABLE `comment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_link`
--

DROP TABLE IF EXISTS `config_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_link` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `href` varchar(200) NOT NULL,
  `status` int unsigned NOT NULL,
  `weight` int unsigned NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `config_link_owner_id_5d54ab6d_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `config_link_owner_id_5d54ab6d_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `config_link_chk_1` CHECK ((`status` >= 0)),
  CONSTRAINT `config_link_chk_2` CHECK ((`weight` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_link`
--

LOCK TABLES `config_link` WRITE;
/*!40000 ALTER TABLE `config_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_sidebar`
--

DROP TABLE IF EXISTS `config_sidebar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_sidebar` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `display_type` int unsigned NOT NULL,
  `content` varchar(500) NOT NULL,
  `status` int unsigned NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `config_sidebar_owner_id_29edf5c5_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `config_sidebar_owner_id_29edf5c5_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `config_sidebar_chk_1` CHECK ((`display_type` >= 0)),
  CONSTRAINT `config_sidebar_chk_2` CHECK ((`status` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_sidebar`
--

LOCK TABLES `config_sidebar` WRITE;
/*!40000 ALTER TABLE `config_sidebar` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_sidebar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-02-02 03:46:08.557204','3','第一类',1,'[{\"added\": {}}]',1,1),(2,'2023-02-02 03:46:21.652154','4','第二类',1,'[{\"added\": {}}]',1,1),(3,'2023-02-02 03:46:30.851318','5','第三类',1,'[{\"added\": {}}]',1,1),(4,'2023-02-02 03:46:39.028529','1','Django',1,'[{\"added\": {}}]',2,1),(5,'2023-02-02 03:46:47.297909','2','python',1,'[{\"added\": {}}]',2,1),(6,'2023-02-02 03:46:57.364540','3','mysql',1,'[{\"added\": {}}]',2,1),(7,'2023-02-02 03:47:04.375712','4','git',1,'[{\"added\": {}}]',2,1),(8,'2023-02-02 03:48:20.141871','1','Django学习笔记--模板层',1,'[{\"added\": {}}]',3,1),(9,'2023-02-02 03:49:15.470665','2','git学习笔记',1,'[{\"added\": {}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'admin','logentry'),(9,'auth','group'),(8,'auth','permission'),(10,'auth','user'),(1,'blog','category'),(3,'blog','post'),(2,'blog','tag'),(4,'comment','comment'),(6,'config','link'),(5,'config','sidebar'),(11,'contenttypes','contenttype'),(12,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-02-02 02:44:07.002144'),(2,'auth','0001_initial','2023-02-02 02:44:07.074866'),(3,'admin','0001_initial','2023-02-02 02:44:07.094352'),(4,'admin','0002_logentry_remove_auto_add','2023-02-02 02:44:07.097262'),(5,'admin','0003_logentry_add_action_flag_choices','2023-02-02 02:44:07.099931'),(6,'contenttypes','0002_remove_content_type_name','2023-02-02 02:44:07.113859'),(7,'auth','0002_alter_permission_name_max_length','2023-02-02 02:44:07.122615'),(8,'auth','0003_alter_user_email_max_length','2023-02-02 02:44:07.134122'),(9,'auth','0004_alter_user_username_opts','2023-02-02 02:44:07.136735'),(10,'auth','0005_alter_user_last_login_null','2023-02-02 02:44:07.146299'),(11,'auth','0006_require_contenttypes_0002','2023-02-02 02:44:07.147034'),(12,'auth','0007_alter_validators_add_error_messages','2023-02-02 02:44:07.149566'),(13,'auth','0008_alter_user_username_max_length','2023-02-02 02:44:07.159094'),(14,'auth','0009_alter_user_last_name_max_length','2023-02-02 02:44:07.168355'),(15,'auth','0010_alter_group_name_max_length','2023-02-02 02:44:07.178383'),(16,'auth','0011_update_proxy_permissions','2023-02-02 02:44:07.181164'),(17,'auth','0012_alter_user_first_name_max_length','2023-02-02 02:44:07.190647'),(18,'blog','0001_initial','2023-02-02 02:44:07.244952'),(19,'comment','0001_initial','2023-02-02 02:44:07.248577'),(20,'config','0001_initial','2023-02-02 02:44:07.273172'),(21,'sessions','0001_initial','2023-02-02 02:44:07.278714');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('knbuun91kcjxzdrsh5i3ovyzsn16h3qz','.eJxVjMEOwiAQRP-FsyEFgW49evcbyLK7SNXQpLQn47_bJj3ocea9mbeKuC4lrk3mOLK6KKNOv11CekrdAT-w3idNU13mMeld0Qdt-jaxvK6H-3dQsJVtnQGoA5vF9pS9O1MwiMAdixn65NH5YMOwxWQdJCcMBhBDdp7EUxD1-QLvojhu:1pNPcx:LmKiCjsWxgezBVSMJcRO9s_mUGntnac_h1bTbtHGJDw','2023-02-16 02:47:07.555205');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-03 14:22:03
