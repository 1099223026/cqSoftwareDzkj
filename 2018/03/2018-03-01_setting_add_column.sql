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