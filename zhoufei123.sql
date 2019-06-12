--������ת����������������
insert into ncp_rtn_cd_trans (ID, RTN_CD, RTN_DESC, CUPS_RTN_CD, CUPS_RTN_DESC, IF_USED, TRX_TYPE)
values ('333', '51', '�����ʽ���', 'PB521012', '���շ��˻�Ϊ���ÿ��˻�ʱ���ö�Ȳ���', '1', null);

insert into ncp_rtn_cd_trans (ID, RTN_CD, RTN_DESC, CUPS_RTN_CD, CUPS_RTN_DESC, IF_USED, TRX_TYPE)
values ('222', '14', '�������޴˿�', 'PB014000', '��Ч����', '1', null);

insert into ncp_rtn_cd_trans (ID, RTN_CD, RTN_DESC, CUPS_RTN_CD, CUPS_RTN_DESC, IF_USED, TRX_TYPE)
values ('1111', '11111111', 'esb�쳣', 'ES000033', '���շ�����ϵͳ��Ӧʱ��δ��ƽ̨����Ӧ���ִ', '1', null);

--����ǰ����ˮ��BTH_GC_TXN_TDB�����ֶ�
--ʪ����
alter table BTH_GC_TXN_TDB modify(OPEN_INST varchar2(562));


--���ݱ�
create table NCP_TRAN_LOGS_20190426 as (select * from NCP_TRAN_LOGS);
create Ncp_Sign_Rel_20190426 as (select * from Ncp_Sign_Rel);


--����ǩԼ��Ϣ�� �˻������ֶγ���
alter table Ncp_Sign_Rel modify(acct_NM varchar2(60));
--������ˮ�� uuid�ֶγ���
alter table NCP_TRAN_LOGS modify(UUID varchar2(64));
--�����ˮ���ֶ�
alter table NCP_TRAN_LOGS add (SETTLMT_INF varchar2(20),SDER_ACCT_ISSR_NM varchar2(20),SYS_TRC_NO varchar2(6),BSN_REFR_NO varchar2(12),PYE_ORG_NO varchar2(10),MRCH_NO varchar2(15),MRCH_TP varchar2(4),TXN_TML_NO varchar2(8));

--�޸�����tbl_txn�����ļ��ű�

-- ������bin���ǵ��޸ı�ռ䣩
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
  is '��bin��';
-- Add comments to the columns 
comment on column NCP_CARD_INFO.card_bin
  is '��bin';
comment on column NCP_CARD_INFO.card_bin_sta
  is '��bin״̬��YΪ������NʧЧ��';
comment on column NCP_CARD_INFO.card_nm
  is '��bin��������';
comment on column NCP_CARD_INFO.card_bin_len
  is '��bin����';
comment on column NCP_CARD_INFO.card_type
  is '�����ͣ�1�����н�ǣ�2�����д��ǣ�3�����н�ǣ�4�����д��ǣ�';
  
insert into ncp_card_info (CARD_BIN, CARD_BIN_STA, CARD_NM, CARD_BIN_LEN, CARD_TYPE, RESERVE1, RESERVE2)
values ('621636', 'Y', '��������', '6', '1', null, null);

insert into ncp_card_info (CARD_BIN, CARD_BIN_STA, CARD_NM, CARD_BIN_LEN, CARD_TYPE, RESERVE1, RESERVE2)
values ('623182', 'Y', '��������', '6', '1', null, null);

insert into ncp_card_info (CARD_BIN, CARD_BIN_STA, CARD_NM, CARD_BIN_LEN, CARD_TYPE, RESERVE1, RESERVE2)
values ('623265', 'Y', '��������', '6', '1', null, null);

insert into ncp_card_info (CARD_BIN, CARD_BIN_STA, CARD_NM, CARD_BIN_LEN, CARD_TYPE, RESERVE1, RESERVE2)
values ('625201', 'Y', '��������', '6', '2', null, null);

insert into ncp_card_info (CARD_BIN, CARD_BIN_STA, CARD_NM, CARD_BIN_LEN, CARD_TYPE, RESERVE1, RESERVE2)
values ('628356', 'Y', '��������', '6', '2', null, null);


--������������ǵ��޸ı�ռ䣩
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
  is '������';
comment on column NCP_TRANS_TYPE_CODE.transnm
  is '��������';
comment on column NCP_TRANS_TYPE_CODE.descr
  is '��������';
  
  
  
  
  --����������ԭʼ����
  
insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0001', 'Э��֧��ǩԼ��������', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0002', '���ת��ǩԼ��������', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0003', 'ֱ��֧����������', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0101', '�˻���Ϣ��֤', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0201', 'Э��֧��ǩԼ', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0202', '���ת��ǩԼ', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0301', 'Э��֧����Լ', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0302', '���ת�˽�Լ', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0303', 'Э��֧����Լ֪ͨ', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('0401', '����ѯ', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('1001', 'Э��֧��', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('1002', 'ֱ��֧��', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('1003', '���ת��', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('1101', '�˿�', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('2001', '���Ǹ���', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('3001', '����֪ͨ', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('3002', '������̬֪ͨ', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('3101', '����״̬����Ϣ��ѯ', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('4001', 'ǩ��', null, null, null, null);

insert into ncp_trans_type_code (TRANSCODE, TRANSNM, DESCR, REMARK1, REMARK2, REMARK3)
values ('4002', 'ǩ��', null, null, null, null);