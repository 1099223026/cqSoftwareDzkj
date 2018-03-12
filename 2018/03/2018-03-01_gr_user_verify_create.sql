/*Table structure for table `gr_user_verify` */

DROP TABLE IF EXISTS `gr_user_verify`;

CREATE TABLE `gr_user_verify` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '推送ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` varchar(50) unsigned NOT NULL DEFAULT '' COMMENT '验证类型：1 手机验证, 2 邮箱验证, 3 google验证',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='用户验证推送';