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


-- Setting表新增字段group(time 2018-03-01 10:06)
	+ ALTER TABLE `gr_app_v2`.`gr_setting` ADD COLUMN `group` TINYINT(2) UNSIGNED DEFAULT 0 NOT NULL COMMENT '分组' AFTER `value`;

-- Setting更新group字段数据（time 2018-03-01 10:13）
	+ UPDATE `gr_app_v2`.`gr_setting` SET `group` = '1' WHERE `id` = '1';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `group` = '1' WHERE `id` = '2';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `group` = '1' WHERE `id` = '3';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `group` = '1' WHERE `id` = '4';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `group` = '1' WHERE `id` = '5';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `group` = '2' WHERE `id` = '6';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `group` = '3' WHERE `id` = '7';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `group` = '3' WHERE `id` = '8';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `group` = '4' WHERE `id` = '9';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `group` = '4' WHERE `id` = '10';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `group` = '4' WHERE `id` = '11';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `group` = '5' WHERE `id` = '12';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `group` = '6' WHERE `id` = '13';	


-- Setting表新增字段type(time 2018-03-01 10:21)
	+ ALTER TABLE `gr_app_v2`.`gr_setting` ADD COLUMN `type` TINYINT(2) UNSIGNED DEFAULT 0 NOT NULL COMMENT '类型（0 input输入框，1 时间控件，2 select多选框）' AFTER `value`; 

-- Setting更新type字段数据（time 2018-03-01 10:50）
	+ UPDATE `gr_app_v2`.`gr_setting` SET `type` = '0' WHERE `id` = '1';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `type` = '0' WHERE `id` = '2';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `type` = '0' WHERE `id` = '3';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `type` = '0' WHERE `id` = '4';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `type` = '0' WHERE `id` = '5';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `type` = '0' WHERE `id` = '6';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `type` = '1' WHERE `id` = '7';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `type` = '1' WHERE `id` = '8';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `type` = '2' WHERE `id` = '9';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `type` = '0' WHERE `id` = '10';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `type` = '0' WHERE `id` = '11';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `type` = '2' WHERE `id` = '12';
	+ UPDATE `gr_app_v2`.`gr_setting` SET `type` = '0' WHERE `id` = '13';


-- 短信、邮箱模板修新增记录

-- email-template数据插入
	+ INSERT INTO `gr_app_v2`.`gr_email_template` (`name`, `type`, `content`, `outer_template_id`) VALUES ('开关安全验证', '7', '验证码${code}，您正在尝试变更重要信息，请妥善保管账户信息。', 'SMS_108390022');
	+ INSERT INTO `gr_app_v2`.`gr_email_template` (`name`, `type`, `content`, `outer_template_id`) VALUES ('绑定邮箱', '8', '验证码${code}，您正在尝试变更重要信息，请妥善保管账户信息。', 'SMS_108390022'); 
	+ INSERT INTO `gr_app_v2`.`gr_email_template` (`name`, `type`, `content`, `outer_template_id`) VALUES ('绑定手机', '9', '验证码${code}，您正在尝试变更重要信息，请妥善保管账户信息。', 'SMS_108390022'); 

-- sms-template数据插入	
	+ INSERT INTO `gr_app_v2`.`gr_sms_template` (`name`, `type`, `content`, `outer_template_id`) VALUES ('开关安全验证', '7', '验证码${code}，您正在尝试变更重要信息，请妥善保管账户信息。', 'SMS_108390022');
	+ INSERT INTO `gr_app_v2`.`gr_sms_template` (`name`, `type`, `content`, `outer_template_id`) VALUES ('绑定邮箱', '8', '验证码${code}，您正在尝试变更重要信息，请妥善保管账户信息。', 'SMS_108390022'); 
	+ INSERT INTO `gr_app_v2`.`gr_sms_template` (`name`, `type`, `content`, `outer_template_id`) VALUES ('绑定手机', '9', '验证码${code}，您正在尝试变更重要信息，请妥善保管账户信息。', 'SMS_108390022'); 




ALTER TABLE `gr_app_v2`.`gr_user_log` CHANGE `type` `type` TINYINT(3) DEFAULT 1 NOT NULL COMMENT '类型，1 登录、2 修改登录密码、3 修改交易密码、4 修改手机号码'; 	

-- ALTER TABLE `gr_app_v2`.`gr_currency` ADD COLUMN `withdraw_max_amount` DECIMAL(18,8) DEFAULT 0.00000000 NOT NULL COMMENT '提现最大数量（基础）' AFTER `withdraw_min_amount`; 
ALTER TABLE `gr_app_v2`.`gr_currency` CHANGE `withdraw_max_amount` `withdraw_max_amount` VARCHAR(200) DEFAULT '' NOT NULL COMMENT '提现最大数量（等级制）'; 

UPDATE `gr_app_v2`.`gr_currency` SET `withdraw_max_amount` = '{\"1\":5000,\"2\":10000}' WHERE `id` = '1'; 
UPDATE `gr_app_v2`.`gr_currency` SET `withdraw_max_amount` = '{\"1\":5000,\"2\":10000}' WHERE `id` = '2'; 

INSERT INTO `gr_app_v2`.`gr_sms_template` (`name`,`type`,`name`, `outer_template_id`, `content`) VALUES ('提币-验证码','13','SMS_108390022','验证码${code}，您正在尝试变更重要信息，请妥善保管账户信息。'); 



INSERT INTO `gr_app_v2`.`gr_email_template` (`name`,`type`,`title`,`content`) VALUES ('提币-验证码','14','提币','<table cellpadding=\"0\" cellspacing=\"0\" style=\"border: 1px solid #cdcdcd; width: 640px; margin:auto;font-size: 12px; color: #1E2731; line-height: 20px;\">\r\n    <tbody>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\" style=\"background-color:#454c6d; height: 55px; padding: 30px 0\"><a href=\"http://sys.vguiren.com\" target=\"_blank\"><img src=\"http://sys.vguiren.com/static/images/logo.png\"></a></td>\r\n        </tr>\r\n        <tr style=\"height: 30px;\"></tr>\r\n        <tr>\r\n            <td width=\"20\"></td>\r\n            <td style=\"line-height: 40px\">\r\n                您好，<br>\r\n                <br>\r\n                【VGUIREN】安全验证: <b></b>${code}<br>\r\n\r\n                出于安全原因，该验证码将于30分钟后失效。请勿将验证码透露给他人。<br>\r\n\r\n                如果您没有进行该操作，请立即修改登录密码。<br>\r\n            </td>\r\n            <td width=\"20\"></td>\r\n        </tr>\r\n        <tr style=\"height: 20px;\"></tr>\r\n        <tr>\r\n            <td width=\"20\"></td>\r\n            <td>\r\n                <br>\r\n                贵人团队<br>\r\n                <a href=\"http://sys.vguiren.com\" target=\"_blank\">http://sys.vguiren.com</a><br>\r\n            </td>\r\n            <td width=\"20\"></td>\r\n        </tr>\r\n        <tr style=\"height: 50px;\"></tr>\r\n    </tbody>\r\n</table>'); 



INSERT INTO `gr_app_v2`.`gr_email_template` (`name`, `type`, `title`, `content`) VALUES ('绑定ga-验证码', '15', '绑定ga','<table cellpadding=\"0\" cellspacing=\"0\" style=\"border: 1px solid #cdcdcd; width: 640px; margin:auto;font-size: 12px; color: #1E2731; line-height: 20px;\">\r\n    <tbody>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\" style=\"background-color:#454c6d; height: 55px; padding: 30px 0\"><a href=\"http://sys.vguiren.com\" target=\"_blank\"><img src=\"http://sys.vguiren.com/static/images/logo.png\"></a></td>\r\n        </tr>\r\n        <tr style=\"height: 30px;\"></tr>\r\n        <tr>\r\n            <td width=\"20\"></td>\r\n            <td style=\"line-height: 40px\">\r\n                您好，<br>\r\n                <br>\r\n                【VGUIREN】安全验证: <b></b>${code}<br>\r\n\r\n                出于安全原因，该验证码将于30分钟后失效。请勿将验证码透露给他人。<br>\r\n\r\n                如果您没有进行该操作，请立即修改登录密码。<br>\r\n            </td>\r\n            <td width=\"20\"></td>\r\n        </tr>\r\n        <tr style=\"height: 20px;\"></tr>\r\n        <tr>\r\n            <td width=\"20\"></td>\r\n            <td>\r\n                <br>\r\n                贵人团队<br>\r\n                <a href=\"http://sys.vguiren.com\" target=\"_blank\">http://sys.vguiren.com</a><br>\r\n            </td>\r\n            <td width=\"20\"></td>\r\n        </tr>\r\n        <tr style=\"height: 50px;\"></tr>\r\n    </tbody>\r\n</table>'); 


INSERT INTO `gr_app_v2`.`gr_sms_template` (`name`, `type`,`content`,`outer_template_id`) VALUES ('绑定ga-验证码', '14','验证码${code}，您正在尝试变更重要信息，请妥善保管账户信息。','SMS_108390022'); 

ALTER TABLE `gr_app_v2`.`gr_user_log` CHANGE `type` `type` TINYINT(3) DEFAULT 1 NOT NULL COMMENT '类型，1 登录、2 修改登录密码、3 修改交易密码、4 修改手机号码、5 校验交易密码'; 
 

INSERT INTO `gr_app_v2`.`gr_email_template` (`name`, `type`, `title`, `content`) VALUES ('登陆密码冻结', '16', '登陆密码冻结','<table cellpadding=\"0\" cellspacing=\"0\" style=\"border: 1px solid #cdcdcd; width: 640px; margin:auto;font-size: 12px; color: #1E2731; line-height: 20px;\">\r\n    <tbody>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\" style=\"background-color:#454c6d; height: 55px; padding: 30px 0\"><a href=\"http://sys.vguiren.com\" target=\"_blank\"><img src=\"http://sys.vguiren.com/static/images/logo.png\"></a></td>\r\n        </tr>\r\n        <tr style=\"height: 30px;\"></tr>\r\n        <tr>\r\n            <td width=\"20\"></td>\r\n            <td style=\"line-height: 40px\">\r\n                您好，<br>\r\n                您的账号因登录密码错误次数过多被冻结登录，请${limit_time}后重试。<br>\r\n            </td>\r\n            <td width=\"20\"></td>\r\n        </tr>\r\n        <tr style=\"height: 20px;\"></tr>\r\n        <tr>\r\n            <td width=\"20\"></td>\r\n            <td>\r\n                <br>\r\n                贵人团队<br>\r\n                <a href=\"http://sys.vguiren.com\" target=\"_blank\">http://sys.vguiren.com</a><br>\r\n            </td>\r\n            <td width=\"20\"></td>\r\n        </tr>\r\n        <tr style=\"height: 50px;\"></tr>\r\n    </tbody>\r\n</table>'); 
 
INSERT INTO `gr_app_v2`.`gr_email_template` (`name`, `type`, `title`,`content`) VALUES ('交易密码冻结', '17', '交易密码冻结', '<table cellpadding=\"0\" cellspacing=\"0\" style=\"border: 1px solid #cdcdcd; width: 640px; margin:auto;font-size: 12px; color: #1E2731; line-height: 20px;\">\r\n    <tbody>\r\n        <tr>\r\n            <td colspan=\"3\" align=\"center\" style=\"background-color:#454c6d; height: 55px; padding: 30px 0\"><a href=\"http://sys.vguiren.com\" target=\"_blank\"><img src=\"http://sys.vguiren.com/static/images/logo.png\"></a></td>\r\n        </tr>\r\n        <tr style=\"height: 30px;\"></tr>\r\n        <tr>\r\n            <td width=\"20\"></td>\r\n            <td style=\"line-height: 40px\">\r\n                您好，<br>\r\n                您的账号因登录密码错误次数过多被冻结交易，请${limit_time}后重试。<br>\r\n            </td>\r\n            <td width=\"20\"></td>\r\n        </tr>\r\n        <tr style=\"height: 20px;\"></tr>\r\n        <tr>\r\n            <td width=\"20\"></td>\r\n            <td>\r\n                <br>\r\n                贵人团队<br>\r\n                <a href=\"http://sys.vguiren.com\" target=\"_blank\">http://sys.vguiren.com</a><br>\r\n            </td>\r\n            <td width=\"20\"></td>\r\n        </tr>\r\n        <tr style=\"height: 50px;\"></tr>\r\n    </tbody>\r\n</table>'); 

