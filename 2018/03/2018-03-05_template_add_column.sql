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


	