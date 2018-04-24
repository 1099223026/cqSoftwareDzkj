-- 4-10之前的sql都已经在服务器上完成


ALTER TABLE `gr_app_v2`.`gr_otc_ad` CHANGE `pay_type` `pay_type` VARCHAR(20) CHARSET utf8 COLLATE utf8_general_ci DEFAULT '' NOT NULL COMMENT '支付方式，1 支付宝，2 微信，3 银行卡'; 

ALTER TABLE `gr_app_v2`.`gr_currency` CHANGE `otc_status` `otc_status` TINYINT(3) DEFAULT 0 NOT NULL COMMENT '法币交易， 0 不参与，1 参与' AFTER `withdraw_confirmation`; 
ALTER TABLE `gr_app_v2`.`gr_otc_ad` CHANGE `trans_condition` `trans_condition` VARCHAR(200) CHARSET utf8 COLLATE utf8_general_ci DEFAULT '' NOT NULL COMMENT '交易条件'; 
ALTER TABLE `gr_app_v2`.`gr_otc_ad` ADD COLUMN `order_amount` DECIMAL(18,8) DEFAULT 0.00000000 NOT NULL COMMENT '总订单数量' AFTER `trans_amount`; 
ALTER TABLE `gr_app_v2`.`gr_otc_order` CHANGE `pay_time` `pay_time` INT(11) DEFAULT 0 NOT NULL COMMENT '付款时间', CHANGE `transfer_time` `transfer_time` INT(11) DEFAULT 0 NOT NULL COMMENT '转币时间';
ALTER TABLE `gr_app_v2`.`gr_otc_order_allege` CHANGE `type` `type` TINYINT(3) DEFAULT 0 NOT NULL COMMENT '申述类型，1 未划币，2 未转账'; 
ALTER TABLE `gr_app_v2`.`gr_user_currency_detail` CHANGE `type` `type` TINYINT(3) DEFAULT 0 NOT NULL COMMENT '类型，1 充值提现，2 交易买卖，3 手续费，4 手续费分润，5 法币交易'; 
ALTER TABLE `gr_app_v2`.`gr_user_currency_frozen` CHANGE `type` `type` TINYINT(3) DEFAULT 0 NOT NULL COMMENT '类型，1 充值提现，2 交易买卖，3 法币商家保证金，4 法币交易，5 法币广告'; 



