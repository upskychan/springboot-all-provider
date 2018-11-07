/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.24-log : Database - springbootall
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`springbootall` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `springbootall`;

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick` varchar(50) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `note` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`nick`,`phone`,`address`,`email`,`note`) values (1,'戒尘','18611641138','北京市海淀区西二旗铭科苑','76623838@qq.com','对工作认真负责，积极主动，有良好的沟通协调能力和逻辑思维能力。'),(2,'张三','18611641138','北京市丰台区宋家庄','76623838@qq.com','对工作认真负责，积极主动，有良好的沟通协调能力和逻辑思维能力。对工作认真负责，积极主力和逻辑思维能力。'),(3,'李四','13155874458','北京市海淀区五道口','76623838@qq.com','对工作认真负责，积极主动，有良好的沟通协调能力和逻辑思维能力。'),(4,'李有钱','15877796547','北京市西城区八里庄','76623838@qq.com','对工作认真负责，积极主动。'),(5,'吴三桂','15877796547','北京市东城区东四十条','76623838@qq.com','对工作认真负责，积极主动。'),(6,'韦小宝','13155874458','北京市西城区八里庄','76623838@qq.com','对工作认真负责，积极主动，有良好的沟通协调能力和逻辑思维能力。对工作认真负责能力和逻辑思维能力。好好干'),(7,'乔峰','13155874458','北京市丰台区宋家庄','85574558@qq.com','对工作认真负责，积极主动，有良好的沟通协调能力和逻辑思维能力。'),(8,'朱开山','18611641138','北京市海淀区西二旗铭科苑','23dsafad@gmail.com','的发送到发啥撒旦法是打发。'),(9,'朱传文','18611641138','北京市海淀区西二旗铭科苑','23dsafad@gmail.com','的发送到发啥撒旦法是打发。'),(10,'朱传武','13155874458','北京市东城区东四十条','345345234@163.com','回家好好市分公司'),(11,'朱小三','15877796547','北京市海淀区五道口','76623838@qq.com','对工作认真负责，积极主动，有良好的沟通协调能力和逻辑思维能力。'),(12,'刘若英','13155874458','上海市虹桥机场','345345234@163.com','对工作认真负责，积极主动，有良好的沟通协调能力和逻辑思维能力。'),(13,'大兄弟','18547896325','北京市海淀区嘻嘻哒','3203902@qq.com','的发送到发啥撒旦法是打发的书法大师打发士大夫。开户及开个会。'),(14,'董反射','13153345234','个对光反射','342432@fasdfda.com','范德萨发放'),(15,'王发大','18897654356','发大水发士大夫','fass@dsfads.com','贷款利率个防滑垫发沙发沙发。'),(16,'张顺丰','15898767876','法发顺丰','dasfas@xn--husy0mroe9swn9z','分地方胜多负少发'),(18,'张山','14567890987','上海市闸北区','fasf@dsfsa.com','时光静好，与君语；细水流年，与君同。'),(20,'李水发','13333532323','是发生东方大厦','afasd@fasdfa.com','Welcome to the Amaze UI wiki!');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
