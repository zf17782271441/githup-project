--返回码转换表新增三条数据
insert into ncp_rtn_cd_trans (ID, RTN_CD, RTN_DESC, CUPS_RTN_CD, CUPS_RTN_DESC, IF_USED, TRX_TYPE)
values ('333', '51', '可用资金不足', 'PB521012', '接收方账户为信用卡账户时可用额度不足', '1', null);

insert into ncp_rtn_cd_trans (ID, RTN_CD, RTN_DESC, CUPS_RTN_CD, CUPS_RTN_DESC, IF_USED, TRX_TYPE)
values ('222', '14', '发卡方无此卡', 'PB014000', '无效卡号', '1', null);

insert into ncp_rtn_cd_trans (ID, RTN_CD, RTN_DESC, CUPS_RTN_CD, CUPS_RTN_DESC, IF_USED, TRX_TYPE)
values ('1111', '11111111', 'esb异常', 'ES000033', '接收方超过系统响应时限未向平台返回应答回执', '1', null);

--银联前置流水表BTH_GC_TXN_TDB扩充字段
--湿哒哒
alter table BTH_GC_TXN_TDB modify(OPEN_INST varchar2(562));


--备份表
create table NCP_TRAN_LOGS_20190426 as (select * from NCP_TRAN_LOGS);
create Ncp_Sign_Rel_20190426 as (select * from Ncp_Sign_Rel);


--扩充签约信息表 账户名称字段长度
alter table Ncp_Sign_Rel modify(acct_NM varchar2(60));
--扩充流水表 uuid字段长度
alter table NCP_TRAN_LOGS modify(UUID varchar2(64));
--添加流水表字段
alter table NCP_TRAN_LOGS add (SETTLMT_INF varchar2(20),SDER_ACCT_ISSR_NM varchar2(20),SYS_TRC_NO varchar2(6),BSN_REFR_NO varchar2(12),PYE_ORG_NO varchar2(10),MRCH_NO varchar2(15),MRCH_TP varchar2(4),TXN_TML_NO varchar2(8));

--修改生产tbl_txn数据文件脚本

-- 创建卡bin表（记得修改表空间）
create table NCP_CARD_INFO
(
  card_bin     VARCHAR2(8),
  card_bin_sta VARCHAR2(1),
  card_nm      VARCHAR2(50),
  card_bin_len VARCHAR2(2),
  card_type    VARCHAR2(1),
  reserve1     VARCHAR2(30),
  reserve2     VARCHAR2(30)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 8
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table NCP_CARD_INFO
  is '卡bin表';
-- Add comments to the columns 
comment on column NCP_CARD_INFO.card_bin
  is '卡bin';
comment on column NCP_CARD_INFO.card_bin_sta
  is '卡bin状态（Y为正常，N失效）';
comment on column NCP_CARD_INFO.card_nm
  is '卡bin所属银行';
comment on column NCP_CARD_INFO.card_bin_len
  is '卡bin长度';
comment on column NCP_CARD_INFO.card_type
  is '卡类型（1：本行借记，2：本行贷记，3：他行借记，4：他行贷记）';
  
insert into ncp_card_info (CARD_BIN, CARD_BIN_STA, CARD_NM, CARD_BIN_LEN, CARD_TYPE, RESERVE1, RESERVE2)
values ('621636', 'Y', '甘肃银行', '6', '1', null, null);

insert into ncp_card_info (CARD_BIN, CARD_BIN_STA, CARD_NM, CARD_BIN_LEN, CARD_TYPE, RESERVE1, RESERVE2)
values ('623182', 'Y', '甘肃银行', '6', '1', null, null);

insert into ncp_card_info (CARD_BIN, CARD_BIN_STA, CARD_NM, CARD_BIN_LEN, CARD_TYPE, RESERVE1, RESERVE2)
values ('623265', 'Y', '甘肃银行', '6', '1', null, null);

insert into ncp_card_info (CARD_BIN, CARD_BIN_STA, CARD_NM, CARD_BIN_LEN, CARD_TYPE, RESERVE1, RESERVE2)
values ('625201', 'Y', '甘肃银行', '6', '2', null, null);

insert into ncp_card_info (CARD_BIN, CARD_BIN_STA, CARD_NM, CARD_BIN_LEN, CARD_TYPE, RESERVE1, RESERVE2)
values ('628356', 'Y', '甘肃银行', '6', '2', null, null);


--新增交易码表（记得修改表空间）
-- Create table
create table NCP_TRANS_TYPE_CODE
(
  transcode VARCHAR2(4),
  transnm   VARCHAR2(50) not null,
  descr     VARCHAR2(200),
  remark1   VARCHAR2(200),
  remark2   VARCHAR2(200),
  remark3   VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64
    next 1
    minextents 1
    maxextents unlimited
  );
-- Add comments to the columns 
comment on column NCP_TRANS_TYPE_CODE.transcode
  is '交易码';
comment on column NCP_TRANS_TYPE_CODE.transnm
  is '交易名称';
comment on column NCP_TRANS_TYPE_CODE.descr
  is '交易描述';
  
  
  
  
  --新增交易码原始数据
  
insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0001', '协议支付签约触发短信', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0002', '借记转账签约触发短信', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0003', '直接支付触发短信', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0101', '账户信息验证', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0201', '协议支付签约', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0202', '借记转账签约', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0301', '协议支付解约', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0302', '借记转账解约', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0303', '协议支付解约通知', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0401', '余额查询', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('1001', '协议支付', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('1002', '直接支付', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('1003', '借记转账', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('1101', '退款', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('2001', '贷记付款', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('3001', '入账通知', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('3002', '交易终态通知', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('3101', '交易状态及信息查询', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('4001', '签退', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('4002', '签到', null, null, null, null);