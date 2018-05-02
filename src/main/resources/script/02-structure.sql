----------------------------------------------------
-- Export file for user HIMUSR@192.168.1.203/ORCL --
-- Created by ren7wei on 2017/06/11, 16:03:55 ------
----------------------------------------------------

set define off
spool structure.log

prompt
prompt Creating table EDI_RECEIVE_INDEX
prompt ================================
prompt
create table EDI_RECEIVE_INDEX
(
  id               VARCHAR2(32) not null,
  table_name       VARCHAR2(100) not null,
  condition        VARCHAR2(500) not null,
  message_source   VARCHAR2(32) not null,
  message_dest     VARCHAR2(32) not null,
  receive_date     TIMESTAMP(6) not null,
  status           VARCHAR2(1) default '0' not null,
  action_type      VARCHAR2(2) default 'IU' not null,
  update_condition VARCHAR2(500)
);
comment on table EDI_RECEIVE_INDEX
  is '���ݽ���������������Դ���Ŀ�ı�ṹһ�µ�����ͬ��';
comment on column EDI_RECEIVE_INDEX.id
  is '����';
comment on column EDI_RECEIVE_INDEX.table_name
  is '����';
comment on column EDI_RECEIVE_INDEX.condition
  is '��ѯ��������ѯԴ�����ݵ�where����';
comment on column EDI_RECEIVE_INDEX.message_source
  is '��Դ����';
comment on column EDI_RECEIVE_INDEX.message_dest
  is 'Ŀ�Ļ���';
comment on column EDI_RECEIVE_INDEX.receive_date
  is '����ʱ��';
comment on column EDI_RECEIVE_INDEX.status
  is '״̬��0δ��⣬1����⣬2�ѷ���';
comment on column EDI_RECEIVE_INDEX.action_type
  is '�������ͣ�I���룬U���£�Dɾ����IU�������£�DI��ɾ���ٲ���';
comment on column EDI_RECEIVE_INDEX.update_condition
  is '��������������Ŀ������ݵ�where������Ϊ��ʱȡ��ѯ����';
create index IDX_EDI_RECEIVE_INDEX on EDI_RECEIVE_INDEX (STATUS);
alter table EDI_RECEIVE_INDEX
  add constraint PK_EDI_RECEIVE_INDEX primary key (ID);

prompt
prompt Creating table EDI_SEND_INDEX
prompt =============================
prompt
create table EDI_SEND_INDEX
(
  id               VARCHAR2(32) not null,
  table_name       VARCHAR2(100) not null,
  condition        VARCHAR2(500) not null,
  message_source   VARCHAR2(32) not null,
  message_dest     VARCHAR2(32) not null,
  senddate         TIMESTAMP(6) not null,
  status           VARCHAR2(1) default '0' not null,
  action_type      VARCHAR2(2) default 'IU' not null,
  update_condition VARCHAR2(500)
);
comment on table EDI_SEND_INDEX
  is '���ݷ���������������Դ���Ŀ�ı�ṹһ�µı�����ͬ��';
comment on column EDI_SEND_INDEX.id
  is '����';
comment on column EDI_SEND_INDEX.table_name
  is '����';
comment on column EDI_SEND_INDEX.condition
  is '��ѯ��������ѯԴ�����ݵ�where����';
comment on column EDI_SEND_INDEX.message_source
  is '��Դ����';
comment on column EDI_SEND_INDEX.message_dest
  is 'Ŀ�Ļ���';
comment on column EDI_SEND_INDEX.senddate
  is '����ʱ��';
comment on column EDI_SEND_INDEX.status
  is '״̬��0δ���ͣ�1�ѷ��ͣ�2�ѽ���';
comment on column EDI_SEND_INDEX.action_type
  is '�������ͣ�I���룬U���£�Dɾ����IU�������£�DI��ɾ���ٲ���';
comment on column EDI_SEND_INDEX.update_condition
  is '��������������Ŀ������ݵ�where������Ϊ��ʱȡ��ѯ����';
create index IDX_EDI_SEND_INDEX on EDI_SEND_INDEX (STATUS);
alter table EDI_SEND_INDEX
  add constraint PK_EDI_SEND_INDEX primary key (ID);

prompt
prompt Creating table HJK_BASE_DOCTOR
prompt ==============================
prompt
create table HJK_BASE_DOCTOR
(
  id            VARCHAR2(32) not null,
  doctor        VARCHAR2(20),
  titles        VARCHAR2(50),
  hospital      VARCHAR2(50),
  dept          VARCHAR2(20),
  hlevel        VARCHAR2(10),
  clinicplan    VARCHAR2(400),
  introduce     VARCHAR2(200),
  consultfee    NUMBER(8,2),
  expertno      VARCHAR2(32),
  online_status VARCHAR2(1),
  create_user   VARCHAR2(32),
  create_time   TIMESTAMP(6),
  update_user   VARCHAR2(32),
  update_time   TIMESTAMP(6),
  user_id       VARCHAR2(32),
  remark        VARCHAR2(200),
  oldid         VARCHAR2(50)
);
comment on table HJK_BASE_DOCTOR
  is '��������-ר��ע���';
comment on column HJK_BASE_DOCTOR.id
  is '����';
comment on column HJK_BASE_DOCTOR.doctor
  is '����';
comment on column HJK_BASE_DOCTOR.titles
  is 'ְ��';
comment on column HJK_BASE_DOCTOR.hospital
  is '����ҽԺ';
comment on column HJK_BASE_DOCTOR.dept
  is '���ڿ���';
comment on column HJK_BASE_DOCTOR.hlevel
  is '����ʡ�����м����ؼ����缶��';
comment on column HJK_BASE_DOCTOR.clinicplan
  is '���ﰲ�ţ�����һ,����;����һ,����;���ڶ�,����;���ڶ�,����;������,����;������,����;������,����;������,����;������,����;������,����;������,����;������,����;������,����;������,����;';
comment on column HJK_BASE_DOCTOR.introduce
  is '����';
comment on column HJK_BASE_DOCTOR.consultfee
  is '��ѯ��';
comment on column HJK_BASE_DOCTOR.expertno
  is 'ר�Һ�';
comment on column HJK_BASE_DOCTOR.online_status
  is 'ר������״̬��1-���� 2-����';
comment on column HJK_BASE_DOCTOR.create_user
  is '������Ա';
comment on column HJK_BASE_DOCTOR.create_time
  is '����ʱ��';
comment on column HJK_BASE_DOCTOR.update_user
  is '������Ա';
comment on column HJK_BASE_DOCTOR.update_time
  is '����ʱ��';
comment on column HJK_BASE_DOCTOR.user_id
  is '�������û�ID';
comment on column HJK_BASE_DOCTOR.remark
  is '��ע';
comment on column HJK_BASE_DOCTOR.oldid
  is '������';
alter table HJK_BASE_DOCTOR
  add constraint PK_HJK_BASE_DOCTOR primary key (ID);

prompt
prompt Creating table HJK_BASE_DOCTOR_GOV
prompt ==================================
prompt
create table HJK_BASE_DOCTOR_GOV
(
  org_id  VARCHAR2(32) not null,
  user_id VARCHAR2(32) not null
);
comment on table HJK_BASE_DOCTOR_GOV
  is '��������-ר�һ������ձ�';
comment on column HJK_BASE_DOCTOR_GOV.org_id
  is '����ID';
comment on column HJK_BASE_DOCTOR_GOV.user_id
  is 'ר��ID';
create unique index IDX_PK_HJK_BASE_DOCTOR_GOV on HJK_BASE_DOCTOR_GOV (ORG_ID, USER_ID);
alter table HJK_BASE_DOCTOR_GOV
  add constraint PK_HJK_BASE_DOCTOR_GOV primary key (ORG_ID, USER_ID);

prompt
prompt Creating table HJK_BASE_QC_ANALYZE
prompt ==================================
prompt
create table HJK_BASE_QC_ANALYZE
(
  id          VARCHAR2(32) not null,
  item_id     VARCHAR2(32) not null,
  maxvalue    VARCHAR2(30) not null,
  minvalue    VARCHAR2(30) not null,
  create_user VARCHAR2(32),
  create_time TIMESTAMP(6),
  update_user VARCHAR2(32),
  update_time TIMESTAMP(6),
  remark      VARCHAR2(100),
  oldid       VARCHAR2(50)
);
comment on table HJK_BASE_QC_ANALYZE
  is '��������-�����ʿط���������';
comment on column HJK_BASE_QC_ANALYZE.id
  is '����';
comment on column HJK_BASE_QC_ANALYZE.item_id
  is '�����ĿID';
comment on column HJK_BASE_QC_ANALYZE.maxvalue
  is '�������ֵ';
comment on column HJK_BASE_QC_ANALYZE.minvalue
  is '������Сֵ';
create unique index IDX_HJK_BASE_QC_ANALYZE on HJK_BASE_QC_ANALYZE (ITEM_ID);
alter table HJK_BASE_QC_ANALYZE
  add constraint PARAMETERID primary key (ID);

prompt
prompt Creating table HJK_SYS_CONFIGURATION
prompt ====================================
prompt
create table HJK_SYS_CONFIGURATION
(
  id                  VARCHAR2(32) not null,
  organization_id     VARCHAR2(32),
  configuration_group VARCHAR2(50),
  configuration_name  VARCHAR2(50) not null,
  configuration_value VARCHAR2(2000),
  callback            VARCHAR2(200),
  flag                VARCHAR2(1) not null,
  remark              VARCHAR2(500),
  create_user         VARCHAR2(32),
  create_time         TIMESTAMP(6) default SYSDATE,
  update_user         VARCHAR2(32),
  update_time         TIMESTAMP(6) default SYSDATE,
  createuser_type     VARCHAR2(2),
  updateuser_type     VARCHAR2(2)
);
comment on table HJK_SYS_CONFIGURATION
  is '��������Χ�ڵ�ȫ�ֲ�������';
comment on column HJK_SYS_CONFIGURATION.id
  is '����';
comment on column HJK_SYS_CONFIGURATION.organization_id
  is '������������id';
comment on column HJK_SYS_CONFIGURATION.configuration_group
  is '������';
comment on column HJK_SYS_CONFIGURATION.configuration_name
  is '������';
comment on column HJK_SYS_CONFIGURATION.configuration_value
  is '����ֵ';
comment on column HJK_SYS_CONFIGURATION.callback
  is '�ص��ӿ�';
comment on column HJK_SYS_CONFIGURATION.flag
  is '״̬';
comment on column HJK_SYS_CONFIGURATION.remark
  is '����˵��';
comment on column HJK_SYS_CONFIGURATION.create_user
  is '������Ա';
comment on column HJK_SYS_CONFIGURATION.create_time
  is '����ʱ��';
comment on column HJK_SYS_CONFIGURATION.update_user
  is '������Ա';
comment on column HJK_SYS_CONFIGURATION.update_time
  is '����ʱ��';
comment on column HJK_SYS_CONFIGURATION.createuser_type
  is '������Ա����';
comment on column HJK_SYS_CONFIGURATION.updateuser_type
  is '������Ա����';
alter table HJK_SYS_CONFIGURATION
  add constraint PK_HJK_SYS_CONFIGURATION primary key (ID);

prompt
prompt Creating table HJK_SYS_DATA_DICTIONARY
prompt ======================================
prompt
create table HJK_SYS_DATA_DICTIONARY
(
  id          VARCHAR2(32) not null,
  name        VARCHAR2(50),
  content     VARCHAR2(2000),
  create_user VARCHAR2(32),
  create_time TIMESTAMP(6),
  update_user VARCHAR2(32),
  update_time TIMESTAMP(6),
  remark      VARCHAR2(100)
);
comment on table HJK_SYS_DATA_DICTIONARY
  is '�洢������ʹ�õ��ı�׼�����ݡ�';
comment on column HJK_SYS_DATA_DICTIONARY.id
  is '����';
comment on column HJK_SYS_DATA_DICTIONARY.name
  is '����';
comment on column HJK_SYS_DATA_DICTIONARY.content
  is 'JSON��ʽ�ַ���';
comment on column HJK_SYS_DATA_DICTIONARY.create_user
  is '������Ա';
comment on column HJK_SYS_DATA_DICTIONARY.create_time
  is '����ʱ��';
comment on column HJK_SYS_DATA_DICTIONARY.update_user
  is '������Ա';
comment on column HJK_SYS_DATA_DICTIONARY.update_time
  is '����ʱ��';
comment on column HJK_SYS_DATA_DICTIONARY.remark
  is '��ע';
alter table HJK_SYS_DATA_DICTIONARY
  add constraint PK_HJK_SYS_DATA_DICTIONARY primary key (ID);

prompt
prompt Creating table HJK_SYS_DB_ERROR
prompt ===============================
prompt
create table HJK_SYS_DB_ERROR
(
  errdate TIMESTAMP(6),
  errproc VARCHAR2(100),
  errmsg  VARCHAR2(4000),
  remark  VARCHAR2(200)
);
comment on table HJK_SYS_DB_ERROR
  is 'ϵͳ-������־����¼�洢���̡������������ݿ�job�ĳ�����־';
comment on column HJK_SYS_DB_ERROR.errdate
  is '��������ʱ��';
comment on column HJK_SYS_DB_ERROR.errproc
  is '�����������';
comment on column HJK_SYS_DB_ERROR.errmsg
  is '������Ϣ';
comment on column HJK_SYS_DB_ERROR.remark
  is '˵��';
create index IDX_HJK_SYS_DB_ERROR on HJK_SYS_DB_ERROR (ERRDATE);

prompt
prompt Creating table HJK_SYS_JURISDICTION
prompt ===================================
prompt
create table HJK_SYS_JURISDICTION
(
  id                  VARCHAR2(32) not null,
  authentication_rule VARCHAR2(100),
  authentication_type VARCHAR2(30),
  jurisdiction_name   VARCHAR2(60),
  jurisdiction_code   VARCHAR2(60),
  create_user         VARCHAR2(32),
  create_time         TIMESTAMP(6) default SYSDATE,
  update_user         VARCHAR2(32),
  update_time         TIMESTAMP(6) default SYSDATE,
  remark              VARCHAR2(100),
  createuser_type     VARCHAR2(2),
  updateuser_type     VARCHAR2(2)
);
comment on table HJK_SYS_JURISDICTION
  is 'Ȩ�ޱ�';
comment on column HJK_SYS_JURISDICTION.id
  is '����';
comment on column HJK_SYS_JURISDICTION.authentication_rule
  is 'Ȩ�޷���·��';
comment on column HJK_SYS_JURISDICTION.authentication_type
  is 'Ȩ������';
comment on column HJK_SYS_JURISDICTION.jurisdiction_name
  is 'Ȩ������';
comment on column HJK_SYS_JURISDICTION.jurisdiction_code
  is 'Ȩ�ޱ���';
comment on column HJK_SYS_JURISDICTION.create_user
  is '������Ա';
comment on column HJK_SYS_JURISDICTION.create_time
  is '����ʱ��';
comment on column HJK_SYS_JURISDICTION.update_user
  is '������Ա';
comment on column HJK_SYS_JURISDICTION.update_time
  is '����ʱ��';
comment on column HJK_SYS_JURISDICTION.remark
  is '��ע';
comment on column HJK_SYS_JURISDICTION.createuser_type
  is '������Ա����';
comment on column HJK_SYS_JURISDICTION.updateuser_type
  is '������Ա����';
alter table HJK_SYS_JURISDICTION
  add constraint PK_HJK_SYS_JURISDICTION primary key (ID);

prompt
prompt Creating table HJK_SYS_OAUTH_CLIENTINFO
prompt =======================================
prompt
create table HJK_SYS_OAUTH_CLIENTINFO
(
  id           VARCHAR2(32) not null,
  name         VARCHAR2(50) not null,
  clientsecret VARCHAR2(1000) not null,
  redirecturi  VARCHAR2(1000),
  clienturi    VARCHAR2(1000),
  description  VARCHAR2(1000),
  iconuri      VARCHAR2(1000),
  issuedat     NUMBER,
  expiresin    NUMBER default 43200,
  passthrough  VARCHAR2(1) default '0'
);
comment on table HJK_SYS_OAUTH_CLIENTINFO
  is '������Ҫ��ϵͳ�ṩ�����֤���ܵ�WEBӦ��';
comment on column HJK_SYS_OAUTH_CLIENTINFO.id
  is '�ͻ���key';
comment on column HJK_SYS_OAUTH_CLIENTINFO.name
  is '�ͻ��˼��';
comment on column HJK_SYS_OAUTH_CLIENTINFO.clientsecret
  is '��ȫ����';
comment on column HJK_SYS_OAUTH_CLIENTINFO.redirecturi
  is '��Ȩ��ɺ�Ļص���ַ';
comment on column HJK_SYS_OAUTH_CLIENTINFO.clienturi
  is '��ҳ��ַ';
comment on column HJK_SYS_OAUTH_CLIENTINFO.description
  is '˵��';
comment on column HJK_SYS_OAUTH_CLIENTINFO.iconuri
  is 'ͼ���ַ';
comment on column HJK_SYS_OAUTH_CLIENTINFO.issuedat
  is '����ʱ��';
comment on column HJK_SYS_OAUTH_CLIENTINFO.expiresin
  is '�������ƹ���ʱ������λΪ�룬Ĭ��12Сʱ';
comment on column HJK_SYS_OAUTH_CLIENTINFO.passthrough
  is '�ѵ�¼��֤���������û����ʵ�����ϵͳʱ���Ƿ񲻾���ͬ��ҳ����Ȩ��0��1�ǡ�';
alter table HJK_SYS_OAUTH_CLIENTINFO
  add constraint PK_HJK_SYS_OAUTH_CLIENTINFO primary key (ID);

prompt
prompt Creating table HJK_SYS_ORGANIZATION
prompt ===================================
prompt
create table HJK_SYS_ORGANIZATION
(
  id                VARCHAR2(32) not null,
  code              VARCHAR2(60) not null,
  name              VARCHAR2(100),
  slevel            VARCHAR2(2),
  area              VARCHAR2(10),
  address           VARCHAR2(100),
  contact_person    VARCHAR2(30),
  phone             VARCHAR2(15),
  jgdzm             VARCHAR2(50),
  hospital_property VARCHAR2(50),
  hospital_level    NUMBER,
  is_structure      NUMBER,
  gxgovcode         VARCHAR2(300),
  is_use            VARCHAR2(2) default '0',
  parent_code       VARCHAR2(60),
  ordernum          NUMBER(4),
  create_user       VARCHAR2(32),
  create_time       TIMESTAMP(6),
  update_user       VARCHAR2(32),
  update_time       TIMESTAMP(6),
  remark            VARCHAR2(100),
  codeindex         VARCHAR2(200),
  parent_id         VARCHAR2(32)
);
comment on column HJK_SYS_ORGANIZATION.parent_id
  is '�ϼ�����ID';
create unique index IDX_HJK_SYS_ORGANIZATION on HJK_SYS_ORGANIZATION (CODE, AREA);
alter table HJK_SYS_ORGANIZATION
  add constraint PK_HJK_SYS_ORGANIZATION2 primary key (ID);

prompt
prompt Creating table HJK_SYS_RESOURCE
prompt ===============================
prompt
create table HJK_SYS_RESOURCE
(
  id                VARCHAR2(32) not null,
  resource_name     VARCHAR2(60),
  resource_type     INTEGER,
  parent_no         VARCHAR2(40),
  order_id          INTEGER,
  create_user       VARCHAR2(32),
  create_time       TIMESTAMP(6) default SYSDATE not null,
  update_user       VARCHAR2(32),
  update_time       TIMESTAMP(6) default SYSDATE not null,
  remark            VARCHAR2(100),
  jurisdiction_code VARCHAR2(40),
  resource_no       VARCHAR2(40),
  icon              VARCHAR2(40),
  properties        VARCHAR2(400),
  createuser_type   VARCHAR2(2),
  updateuser_type   VARCHAR2(2)
);
comment on table HJK_SYS_RESOURCE
  is '��Դ��';
comment on column HJK_SYS_RESOURCE.id
  is '����';
comment on column HJK_SYS_RESOURCE.resource_name
  is '��Դ����';
comment on column HJK_SYS_RESOURCE.resource_type
  is '��Դ����';
comment on column HJK_SYS_RESOURCE.parent_no
  is '���ڵ�';
comment on column HJK_SYS_RESOURCE.order_id
  is '����';
comment on column HJK_SYS_RESOURCE.create_user
  is '������Ա';
comment on column HJK_SYS_RESOURCE.create_time
  is '����ʱ��';
comment on column HJK_SYS_RESOURCE.update_user
  is '������Ա';
comment on column HJK_SYS_RESOURCE.update_time
  is '����ʱ��';
comment on column HJK_SYS_RESOURCE.remark
  is '��ע';
comment on column HJK_SYS_RESOURCE.jurisdiction_code
  is 'Ȩ�ޱ���';
comment on column HJK_SYS_RESOURCE.resource_no
  is '���';
comment on column HJK_SYS_RESOURCE.icon
  is 'ͼ��';
comment on column HJK_SYS_RESOURCE.properties
  is '��Դ����';
comment on column HJK_SYS_RESOURCE.createuser_type
  is '������Ա����';
comment on column HJK_SYS_RESOURCE.updateuser_type
  is '������Ա����';
alter table HJK_SYS_RESOURCE
  add constraint PK_HJK_SYS_RESOURCE primary key (ID);

prompt
prompt Creating table HJK_SYS_ROLE
prompt ===========================
prompt
create table HJK_SYS_ROLE
(
  id              VARCHAR2(32) not null,
  role_name       VARCHAR2(32),
  description     VARCHAR2(200),
  role_code       VARCHAR2(30),
  create_user     VARCHAR2(32),
  create_time     TIMESTAMP(6) default SYSDATE,
  update_user     VARCHAR2(32),
  update_time     TIMESTAMP(6) default SYSDATE,
  remark          VARCHAR2(100),
  createuser_type VARCHAR2(2),
  updateuser_type VARCHAR2(2)
);
comment on table HJK_SYS_ROLE
  is '��ɫ��';
comment on column HJK_SYS_ROLE.id
  is '����';
comment on column HJK_SYS_ROLE.role_name
  is '��ɫ����';
comment on column HJK_SYS_ROLE.description
  is '��ɫ����';
comment on column HJK_SYS_ROLE.role_code
  is '��ɫ����';
comment on column HJK_SYS_ROLE.create_user
  is '������Ա';
comment on column HJK_SYS_ROLE.create_time
  is '����ʱ��';
comment on column HJK_SYS_ROLE.update_user
  is '������Ա';
comment on column HJK_SYS_ROLE.update_time
  is '����ʱ��';
comment on column HJK_SYS_ROLE.remark
  is '��ע';
comment on column HJK_SYS_ROLE.createuser_type
  is '������Ա����';
comment on column HJK_SYS_ROLE.updateuser_type
  is '������Ա����';
alter table HJK_SYS_ROLE
  add constraint PK_HJK_SYS_ROLE primary key (ID);

prompt
prompt Creating table HJK_SYS_ROLE_JURISDICTION
prompt ========================================
prompt
create table HJK_SYS_ROLE_JURISDICTION
(
  role_id           VARCHAR2(32) not null,
  jurisdiction_code VARCHAR2(32) not null
);
comment on table HJK_SYS_ROLE_JURISDICTION
  is '��ɫȨ�޹�����';
comment on column HJK_SYS_ROLE_JURISDICTION.role_id
  is '��ɫID';
comment on column HJK_SYS_ROLE_JURISDICTION.jurisdiction_code
  is 'Ȩ�ޱ���';
create index IDX_ROLE_JURISDICTION on HJK_SYS_ROLE_JURISDICTION (ROLE_ID);
alter table HJK_SYS_ROLE_JURISDICTION
  add constraint PK_HJK_SYS_ROLE_JURISDICTION primary key (ROLE_ID, JURISDICTION_CODE);

prompt
prompt Creating table HJK_SYS_UPLOADFILE
prompt =================================
prompt
create table HJK_SYS_UPLOADFILE
(
  id              VARCHAR2(32) not null,
  file_name       VARCHAR2(100),
  file_url        VARCHAR2(1200),
  suffix          VARCHAR2(10),
  file_size       NUMBER(10),
  md5             VARCHAR2(100),
  flag            VARCHAR2(2),
  path            VARCHAR2(1000),
  create_user     VARCHAR2(32),
  create_time     TIMESTAMP(6),
  update_user     VARCHAR2(32),
  update_time     TIMESTAMP(6),
  createuser_type VARCHAR2(2),
  updateuser_type VARCHAR2(2),
  remark          VARCHAR2(100)
);
comment on table HJK_SYS_UPLOADFILE
  is '�ϴ��ļ���';
comment on column HJK_SYS_UPLOADFILE.id
  is '����';
comment on column HJK_SYS_UPLOADFILE.file_name
  is '�ļ���';
comment on column HJK_SYS_UPLOADFILE.file_url
  is '�ļ�����URL';
comment on column HJK_SYS_UPLOADFILE.suffix
  is '�ļ���׺��';
comment on column HJK_SYS_UPLOADFILE.file_size
  is '�ļ�����';
comment on column HJK_SYS_UPLOADFILE.md5
  is '�ļ�MD5ֵ';
comment on column HJK_SYS_UPLOADFILE.flag
  is '��־��0������1��������';
comment on column HJK_SYS_UPLOADFILE.path
  is '����·��';
comment on column HJK_SYS_UPLOADFILE.create_user
  is '������Ա';
comment on column HJK_SYS_UPLOADFILE.create_time
  is '����ʱ��';
comment on column HJK_SYS_UPLOADFILE.update_user
  is '������Ա';
comment on column HJK_SYS_UPLOADFILE.update_time
  is '����ʱ��';
comment on column HJK_SYS_UPLOADFILE.createuser_type
  is '������Ա����';
comment on column HJK_SYS_UPLOADFILE.updateuser_type
  is '������Ա����';
comment on column HJK_SYS_UPLOADFILE.remark
  is '��ע';
alter table HJK_SYS_UPLOADFILE
  add constraint PK_HJK_SYS_UPLOADFILE primary key (ID);

prompt
prompt Creating table HJK_SYS_USER
prompt ===========================
prompt
create table HJK_SYS_USER
(
  id                VARCHAR2(32) not null,
  username          VARCHAR2(30) not null,
  password          VARCHAR2(50) not null,
  fullname          VARCHAR2(50) not null,
  doctcode          VARCHAR2(40),
  sex               VARCHAR2(2) not null,
  birthday          DATE,
  tel               VARCHAR2(20),
  fax               VARCHAR2(20),
  mail              VARCHAR2(50),
  flag              NUMBER(1) not null,
  holders           VARCHAR2(100),
  organization_code VARCHAR2(60) not null,
  identifyno        VARCHAR2(18),
  staff_id          VARCHAR2(20),
  app_userid        VARCHAR2(20),
  app_password      VARCHAR2(20),
  qq                VARCHAR2(20),
  create_user       VARCHAR2(32),
  create_time       TIMESTAMP(6) default SYSDATE,
  update_user       VARCHAR2(32),
  update_time       TIMESTAMP(6) default SYSDATE,
  createuser_type   VARCHAR2(2),
  updateuser_type   VARCHAR2(2),
  remark            VARCHAR2(100),
  properties        VARCHAR2(10),
  oldid             VARCHAR2(50),
  org_id            VARCHAR2(32)
);
comment on table HJK_SYS_USER
  is '�û���';
comment on column HJK_SYS_USER.id
  is '����';
comment on column HJK_SYS_USER.username
  is '�û���';
comment on column HJK_SYS_USER.password
  is '����';
comment on column HJK_SYS_USER.fullname
  is '�û�����';
comment on column HJK_SYS_USER.doctcode
  is '�û�����';
comment on column HJK_SYS_USER.sex
  is '�Ա�0δ֪���Ա�1�У�2Ů��9δ˵�����Ա�';
comment on column HJK_SYS_USER.birthday
  is '��������';
comment on column HJK_SYS_USER.tel
  is '��ϵ�绰';
comment on column HJK_SYS_USER.fax
  is '����';
comment on column HJK_SYS_USER.mail
  is '����';
comment on column HJK_SYS_USER.flag
  is '�û�״̬��0δ���ã�1���á�';
comment on column HJK_SYS_USER.holders
  is '֧��ϵͳ��ϵͳʹ��Ȩ��';
comment on column HJK_SYS_USER.organization_code
  is '���ڻ���';
comment on column HJK_SYS_USER.identifyno
  is '���֤��';
comment on column HJK_SYS_USER.staff_id
  is '�û����ţ���ͬϵͳ֮�䣬ʶ���û���Ψһ��ʶ��';
comment on column HJK_SYS_USER.qq
  is 'QQ��';
comment on column HJK_SYS_USER.create_user
  is '������Ա';
comment on column HJK_SYS_USER.create_time
  is '����ʱ��';
comment on column HJK_SYS_USER.update_user
  is '������Ա';
comment on column HJK_SYS_USER.update_time
  is '����ʱ��';
comment on column HJK_SYS_USER.createuser_type
  is '������Ա����';
comment on column HJK_SYS_USER.updateuser_type
  is '������Ա����';
comment on column HJK_SYS_USER.remark
  is '��ע';
comment on column HJK_SYS_USER.properties
  is '�û����ԣ�1-ҽ����2-ר��';
comment on column HJK_SYS_USER.oldid
  is '������';
comment on column HJK_SYS_USER.org_id
  is '���ڻ���ID';
alter table HJK_SYS_USER
  add constraint HJK_SYS_USER_PK primary key (ID);

prompt
prompt Creating table HJK_SYS_USER_ROLE
prompt ================================
prompt
create table HJK_SYS_USER_ROLE
(
  user_id         VARCHAR2(32) not null,
  role_id         VARCHAR2(32) not null,
  create_user     VARCHAR2(32),
  create_time     TIMESTAMP(6) default SYSDATE,
  update_user     VARCHAR2(32),
  update_time     TIMESTAMP(6) default SYSDATE,
  remark          VARCHAR2(100),
  createuser_type VARCHAR2(2),
  updateuser_type VARCHAR2(2)
);
comment on table HJK_SYS_USER_ROLE
  is '�û���ɫ������';
comment on column HJK_SYS_USER_ROLE.user_id
  is '�û�ID';
comment on column HJK_SYS_USER_ROLE.role_id
  is '��ɫID';
comment on column HJK_SYS_USER_ROLE.create_user
  is '������Ա';
comment on column HJK_SYS_USER_ROLE.create_time
  is '����ʱ��';
comment on column HJK_SYS_USER_ROLE.update_user
  is '������Ա';
comment on column HJK_SYS_USER_ROLE.update_time
  is '����ʱ��';
comment on column HJK_SYS_USER_ROLE.remark
  is '��ע';
comment on column HJK_SYS_USER_ROLE.createuser_type
  is '������Ա����';
comment on column HJK_SYS_USER_ROLE.updateuser_type
  is '������Ա����';
alter table HJK_SYS_USER_ROLE
  add constraint PK_HJK_SYS_USER_ROLE primary key (USER_ID, ROLE_ID);

prompt
prompt Creating table HJK_WF_ACTION
prompt ============================
prompt
create table HJK_WF_ACTION
(
  id            VARCHAR2(32) not null,
  name          VARCHAR2(100) not null,
  code          VARCHAR2(20) not null,
  own_bpn_code  VARCHAR2(20) not null,
  next_bpn_code VARCHAR2(20),
  own_bpd_code  VARCHAR2(20) not null,
  auth_expr     VARCHAR2(500),
  action_type   VARCHAR2(20)
);
comment on table HJK_WF_ACTION
  is '��¼�ڵ�Ķ���������Ϣ';
comment on column HJK_WF_ACTION.id
  is 'UUID';
comment on column HJK_WF_ACTION.name
  is '��������';
comment on column HJK_WF_ACTION.code
  is '��������';
comment on column HJK_WF_ACTION.own_bpn_code
  is '�����ڵ�';
comment on column HJK_WF_ACTION.next_bpn_code
  is '��һ�ڵ�';
comment on column HJK_WF_ACTION.own_bpd_code
  is '�������̴���';
comment on column HJK_WF_ACTION.auth_expr
  is '����Ȩ��';
comment on column HJK_WF_ACTION.action_type
  is '��������';
alter table HJK_WF_ACTION
  add constraint PK_HJK_WF_ACTION primary key (ID);

prompt
prompt Creating table HJK_WF_ACTIVITY
prompt ==============================
prompt
create table HJK_WF_ACTIVITY
(
  id            VARCHAR2(32) not null,
  bpd_code      VARCHAR2(20),
  bpn_code      VARCHAR2(20),
  prev_bpn_code VARCHAR2(20),
  action_code   VARCHAR2(20),
  executor      VARCHAR2(100),
  executor_name VARCHAR2(100),
  executor_type VARCHAR2(20),
  execute_time  TIMESTAMP(6),
  process_id    VARCHAR2(32),
  message       VARCHAR2(500)
);
comment on table HJK_WF_ACTIVITY
  is '��¼����ִ�е����̵�ִ�й�����Ϣ��ִ�����ɾ����¼��';
comment on column HJK_WF_ACTIVITY.prev_bpn_code
  is 'ǰһ�ڵ�';
alter table HJK_WF_ACTIVITY
  add constraint PK_HJK_WF_ACTIVITY primary key (ID);

prompt
prompt Creating table HJK_WF_BPD
prompt =========================
prompt
create table HJK_WF_BPD
(
  id             VARCHAR2(32) not null,
  name           VARCHAR2(100) not null,
  code           VARCHAR2(20) not null,
  start_bpn_code VARCHAR2(40),
  end_bpn_code   VARCHAR2(40)
);
comment on table HJK_WF_BPD
  is 'Business process definition.';
comment on column HJK_WF_BPD.id
  is 'UUID';
comment on column HJK_WF_BPD.name
  is '��������';
comment on column HJK_WF_BPD.code
  is '���̴���';
comment on column HJK_WF_BPD.start_bpn_code
  is '��ʼ�ڵ�';
comment on column HJK_WF_BPD.end_bpn_code
  is '�����ڵ�';
alter table HJK_WF_BPD
  add constraint PK_HJK_WF_BPD primary key (ID);

prompt
prompt Creating table HJK_WF_BPN
prompt =========================
prompt
create table HJK_WF_BPN
(
  id              VARCHAR2(32) not null,
  name            VARCHAR2(100) not null,
  code            VARCHAR2(20) not null,
  bpd_code        VARCHAR2(20),
  def_action_code VARCHAR2(20)
);
comment on table HJK_WF_BPN
  is 'Business process node.';
comment on column HJK_WF_BPN.id
  is 'UUID';
comment on column HJK_WF_BPN.name
  is '�ڵ�����';
comment on column HJK_WF_BPN.code
  is '�ڵ����';
comment on column HJK_WF_BPN.bpd_code
  is '�������̴���';
comment on column HJK_WF_BPN.def_action_code
  is 'Ĭ�϶���';
alter table HJK_WF_BPN
  add constraint PK_HJK_WF_BPN primary key (ID);

prompt
prompt Creating table HJK_WF_HISTORY
prompt =============================
prompt
create table HJK_WF_HISTORY
(
  id            VARCHAR2(32) not null,
  bpd_code      VARCHAR2(20),
  bpn_code      VARCHAR2(20),
  prev_bpn_code VARCHAR2(20),
  action_code   VARCHAR2(20),
  executor_name VARCHAR2(100),
  executor      VARCHAR2(100),
  executor_type VARCHAR2(20),
  execute_time  TIMESTAMP(6),
  process_id    VARCHAR2(32),
  message       VARCHAR2(500)
);
comment on table HJK_WF_HISTORY
  is '�洢����ִ�е���ʷ����';
comment on column HJK_WF_HISTORY.prev_bpn_code
  is 'ǰһ�ڵ�';
alter table HJK_WF_HISTORY
  add constraint PK_HJK_WF_HISTORY primary key (ID);

prompt
prompt Creating table HJK_WF_PROCESS
prompt =============================
prompt
create table HJK_WF_PROCESS
(
  id             VARCHAR2(32) not null,
  bpd_code       VARCHAR2(20),
  bpn_code       VARCHAR2(20),
  action_code    VARCHAR2(20),
  executor_name2 VARCHAR2(100),
  executor       VARCHAR2(100),
  executor_type  VARCHAR2(20),
  execute_time   TIMESTAMP(6),
  message        VARCHAR2(500),
  executor_name  VARCHAR2(100)
);
comment on table HJK_WF_PROCESS
  is '��¼���̵�ǰ(���)״̬����Ϣ';

prompt
prompt Creating table YTJ_ARCH_CHECKINFO
prompt =================================
prompt
create table YTJ_ARCH_CHECKINFO
(
  id           VARCHAR2(32) not null,
  name         VARCHAR2(40),
  idcard       VARCHAR2(40),
  age          VARCHAR2(3),
  sex          VARCHAR2(10),
  birthday     TIMESTAMP(6),
  numberofcase VARCHAR2(40) not null,
  archiveid    VARCHAR2(50),
  healthycard  VARCHAR2(50),
  pym          VARCHAR2(20),
  phone        VARCHAR2(20),
  address      VARCHAR2(100),
  nation       VARCHAR2(30),
  language     VARCHAR2(10),
  icpcode      VARCHAR2(60) not null,
  deviceno     VARCHAR2(50),
  producer     VARCHAR2(10) not null,
  reqcontent   VARCHAR2(10),
  description  VARCHAR2(40),
  sareacode    VARCHAR2(10),
  devicetype   VARCHAR2(20),
  memo1        VARCHAR2(20),
  memo2        VARCHAR2(20),
  memo3        VARCHAR2(20),
  memo4        VARCHAR2(20),
  memo5        VARCHAR2(20),
  memo6        VARCHAR2(20),
  create_user  VARCHAR2(32),
  create_time  TIMESTAMP(6),
  update_user  VARCHAR2(32),
  update_time  TIMESTAMP(6),
  reqno        VARCHAR2(100),
  checktime    TIMESTAMP(6),
  remark       VARCHAR2(200),
  oldid        VARCHAR2(50),
  checkinfo    VARCHAR2(500),
  integrity    VARCHAR2(1),
  patientid    VARCHAR2(32),
  org_id       VARCHAR2(32)
);
comment on table YTJ_ARCH_CHECKINFO
  is 'һ�����鵥��';
comment on column YTJ_ARCH_CHECKINFO.id
  is '����';
comment on column YTJ_ARCH_CHECKINFO.name
  is '����';
comment on column YTJ_ARCH_CHECKINFO.idcard
  is '���֤��';
comment on column YTJ_ARCH_CHECKINFO.age
  is '����';
comment on column YTJ_ARCH_CHECKINFO.sex
  is '�Ա�0-δ֪���Ա�1-�У�2-Ů��9-δ˵�����Ա�
';
comment on column YTJ_ARCH_CHECKINFO.birthday
  is '��������';
comment on column YTJ_ARCH_CHECKINFO.numberofcase
  is '��鵥�ţ���IDΪ�ַ��ͣ���ɹ���Ϊ��������ĸ��ţ�2λ��+36λ��ˮ�ţ�36λ��ˮ�ű���Ψһ��
������ĸ��ʶ����Ϊ��
����DR
����MR
��̩��BT
����GT
��ҽ����HY
ǿ����QH';
comment on column YTJ_ARCH_CHECKINFO.archiveid
  is '������';
comment on column YTJ_ARCH_CHECKINFO.healthycard
  is '����˽�������';
comment on column YTJ_ARCH_CHECKINFO.pym
  is '�����ƴ����';
comment on column YTJ_ARCH_CHECKINFO.phone
  is '��ϵ�绰mobile';
comment on column YTJ_ARCH_CHECKINFO.address
  is 'סַ';
comment on column YTJ_ARCH_CHECKINFO.nation
  is '���壨����ȫ�ƣ�';
comment on column YTJ_ARCH_CHECKINFO.language
  is '����';
comment on column YTJ_ARCH_CHECKINFO.icpcode
  is 'ҽ�ƻ�������';
comment on column YTJ_ARCH_CHECKINFO.deviceno
  is '����豸��ţ���cm300';
comment on column YTJ_ARCH_CHECKINFO.producer
  is '�豸���̱�ţ�
01����ҽ��
02���п�ǿ��
03������������
04�����ݸ���
05����������
06�����ڱ�̩
��ֻ��д���룩
';
comment on column YTJ_ARCH_CHECKINFO.reqcontent
  is '����������˳������|Ѫѹ|Ѫ��|����|Ѫ��|���|�ĵ�(1�� |0����)
0������飬1����顣����:ֻ������죺0000010
';
comment on column YTJ_ARCH_CHECKINFO.description
  is '����';
comment on column YTJ_ARCH_CHECKINFO.sareacode
  is '������������';
comment on column YTJ_ARCH_CHECKINFO.devicetype
  is '����豸���ͣ�
0001-һ�����
';
comment on column YTJ_ARCH_CHECKINFO.create_user
  is '������Ա�����ҽ����ţ�';
comment on column YTJ_ARCH_CHECKINFO.create_time
  is '����ʱ��';
comment on column YTJ_ARCH_CHECKINFO.update_user
  is '������Ա';
comment on column YTJ_ARCH_CHECKINFO.update_time
  is '����ʱ��';
comment on column YTJ_ARCH_CHECKINFO.reqno
  is '�����';
comment on column YTJ_ARCH_CHECKINFO.checktime
  is '���ʱ��';
comment on column YTJ_ARCH_CHECKINFO.oldid
  is '������';
comment on column YTJ_ARCH_CHECKINFO.checkinfo
  is '�����б���ʾ�ĳ�������Ŀ����Ϣ��JSON��ʽ����:{itemid:value}';
comment on column YTJ_ARCH_CHECKINFO.integrity
  is '��鵥����Ա��Ϣ�Ƿ���ȫ��0�ǣ�1��';
comment on column YTJ_ARCH_CHECKINFO.patientid
  is '����ID';
alter table YTJ_ARCH_CHECKINFO
  add constraint PK_YTJ_ARCH_CHECKINFO primary key (ID);

prompt
prompt Creating table YTJ_ARCH_CHECKRESULT
prompt ===================================
prompt
create table YTJ_ARCH_CHECKRESULT
(
  id        VARCHAR2(32) not null,
  check_id  VARCHAR2(32) not null,
  item_id   VARCHAR2(32) not null,
  itemvalue VARCHAR2(2000),
  state     VARCHAR2(1)
);
comment on table YTJ_ARCH_CHECKRESULT
  is 'һ���-����������Ŀ��';
comment on column YTJ_ARCH_CHECKRESULT.id
  is '����';
comment on column YTJ_ARCH_CHECKRESULT.check_id
  is '��鵥ID';
comment on column YTJ_ARCH_CHECKRESULT.item_id
  is '�����Ŀ����ID';
comment on column YTJ_ARCH_CHECKRESULT.itemvalue
  is '������ֵ';
comment on column YTJ_ARCH_CHECKRESULT.state
  is '0������ֵ��1���쳣ֵ';
create bitmap index BT_YTJ_ARCH_CHECK_ID on YTJ_ARCH_CHECKRESULT (CHECK_ID);
create unique index IDX_YTJ_ARCH_CHECKOFLK_ITEM on YTJ_ARCH_CHECKRESULT (CHECK_ID, ITEM_ID);
alter table YTJ_ARCH_CHECKRESULT
  add constraint PK_YTJ_ARCH_CHECKRESULT primary key (ID);

prompt
prompt Creating table YTJ_ARCH_DIAGNOSE
prompt ================================
prompt
create table YTJ_ARCH_DIAGNOSE
(
  id               VARCHAR2(32) not null,
  numberofcase     VARCHAR2(50),
  result           VARCHAR2(2000),
  comments         VARCHAR2(200),
  ecgdisease       VARCHAR2(50),
  request_id       VARCHAR2(32) not null,
  reqno            VARCHAR2(50),
  checkedhospital  VARCHAR2(60),
  state            VARCHAR2(1),
  resultstate      VARCHAR2(2),
  create_user      VARCHAR2(32),
  create_time      TIMESTAMP(6),
  update_user      VARCHAR2(32),
  update_time      TIMESTAMP(6),
  remark           VARCHAR2(500),
  sponsor          VARCHAR2(32),
  handler          VARCHAR2(32),
  sponsor_org      VARCHAR2(32),
  sponsor_name     VARCHAR2(40),
  sponsor_org_name VARCHAR2(60),
  handler_org      VARCHAR2(32),
  handler_name     VARCHAR2(40),
  handler_org_name VARCHAR2(60),
  icpcode          VARCHAR2(60),
  expertno         VARCHAR2(50),
  file_xml         VARCHAR2(100),
  file_png         VARCHAR2(100),
  file_pdf         VARCHAR2(100),
  patientid        VARCHAR2(32),
  diagnosetime     TIMESTAMP(6),
  org_id           VARCHAR2(32)
);
comment on table YTJ_ARCH_DIAGNOSE
  is 'һ���-�ĵ���Ͻ����';
comment on column YTJ_ARCH_DIAGNOSE.id
  is '����';
comment on column YTJ_ARCH_DIAGNOSE.numberofcase
  is '������ţ�����������';
comment on column YTJ_ARCH_DIAGNOSE.result
  is '��Ͻ���������ĵ�ͼ��������';
comment on column YTJ_ARCH_DIAGNOSE.comments
  is '�ĵ�ͼ����';
comment on column YTJ_ARCH_DIAGNOSE.ecgdisease
  is '��׼�ĵ缲������';
comment on column YTJ_ARCH_DIAGNOSE.request_id
  is '���뵥id';
comment on column YTJ_ARCH_DIAGNOSE.reqno
  is '�����';
comment on column YTJ_ARCH_DIAGNOSE.checkedhospital
  is '������';
comment on column YTJ_ARCH_DIAGNOSE.state
  is '0 ���� 1 ����';
comment on column YTJ_ARCH_DIAGNOSE.resultstate
  is '�ĵ�ͼ���״̬��1-���� 2-�쳣 3-�޷��ж� 4-�������';
comment on column YTJ_ARCH_DIAGNOSE.create_user
  is '������Ա';
comment on column YTJ_ARCH_DIAGNOSE.create_time
  is '����ʱ��';
comment on column YTJ_ARCH_DIAGNOSE.update_user
  is '������Ա';
comment on column YTJ_ARCH_DIAGNOSE.update_time
  is '����ʱ��';
comment on column YTJ_ARCH_DIAGNOSE.remark
  is '��ע';
comment on column YTJ_ARCH_DIAGNOSE.file_xml
  is '��������ļ�';
comment on column YTJ_ARCH_DIAGNOSE.file_png
  is '���ͼ���ļ�';
comment on column YTJ_ARCH_DIAGNOSE.file_pdf
  is '��Ͻ���ļ�';
comment on column YTJ_ARCH_DIAGNOSE.patientid
  is '����ID';
comment on column YTJ_ARCH_DIAGNOSE.diagnosetime
  is '���ʱ��';
alter table YTJ_ARCH_DIAGNOSE
  add constraint PK_YTJ_ARCH_DIAGNOSE primary key (ID);

prompt
prompt Creating table YTJ_ARCH_ORGCASE
prompt ===============================
prompt
create table YTJ_ARCH_ORGCASE
(
  id            VARCHAR2(32) not null,
  source_org_id VARCHAR2(32) not null,
  target_org_id VARCHAR2(32) not null,
  is_default    VARCHAR2(1) default '0' not null
);
comment on table YTJ_ARCH_ORGCASE
  is 'Эͬ����������';
comment on column YTJ_ARCH_ORGCASE.source_org_id
  is '�������';
comment on column YTJ_ARCH_ORGCASE.target_org_id
  is 'Ŀ�����';
comment on column YTJ_ARCH_ORGCASE.is_default
  is 'Ĭ�ϻ�����ö��ֵ 0�����ǣ�1����';
alter table YTJ_ARCH_ORGCASE
  add constraint PK_YTJ_ARCH_ORGCASE primary key (ID);

prompt
prompt Creating table YTJ_ARCH_PERSONNEL
prompt =================================
prompt
create table YTJ_ARCH_PERSONNEL
(
  id          VARCHAR2(32) not null,
  name        VARCHAR2(40),
  personid    VARCHAR2(40),
  age         NUMBER,
  sex         VARCHAR2(10),
  birthday    TIMESTAMP(6),
  archiveid   VARCHAR2(50),
  healthycard VARCHAR2(50),
  pym         VARCHAR2(20),
  phone       VARCHAR2(20),
  address     VARCHAR2(100),
  nation      VARCHAR2(10),
  language    VARCHAR2(10),
  create_user VARCHAR2(32),
  create_time TIMESTAMP(6),
  update_user VARCHAR2(32),
  update_time TIMESTAMP(6),
  height      VARCHAR2(6),
  weight      VARCHAR2(6),
  oldid       VARCHAR2(50),
  remark      VARCHAR2(100),
  bloodtype   VARCHAR2(10)
);
comment on table YTJ_ARCH_PERSONNEL
  is 'һ���-��������Ա��,��¼����������Ա��Ϣ';
comment on column YTJ_ARCH_PERSONNEL.id
  is '����';
comment on column YTJ_ARCH_PERSONNEL.name
  is '����';
comment on column YTJ_ARCH_PERSONNEL.personid
  is '���֤��';
comment on column YTJ_ARCH_PERSONNEL.age
  is '����';
comment on column YTJ_ARCH_PERSONNEL.sex
  is '�Ա�0-δ֪���Ա�1-�У�2-Ů��9-δ˵�����Ա�
';
comment on column YTJ_ARCH_PERSONNEL.birthday
  is '��������';
comment on column YTJ_ARCH_PERSONNEL.archiveid
  is '������';
comment on column YTJ_ARCH_PERSONNEL.healthycard
  is '����˽�������';
comment on column YTJ_ARCH_PERSONNEL.pym
  is '�����ƴ����';
comment on column YTJ_ARCH_PERSONNEL.phone
  is '��ϵ�绰mobile';
comment on column YTJ_ARCH_PERSONNEL.address
  is 'סַ';
comment on column YTJ_ARCH_PERSONNEL.nation
  is '���壨����ȫ�ƣ�';
comment on column YTJ_ARCH_PERSONNEL.language
  is '����';
comment on column YTJ_ARCH_PERSONNEL.create_user
  is '������Ա';
comment on column YTJ_ARCH_PERSONNEL.create_time
  is '����ʱ��';
comment on column YTJ_ARCH_PERSONNEL.update_user
  is '������Ա';
comment on column YTJ_ARCH_PERSONNEL.update_time
  is '����ʱ��';
comment on column YTJ_ARCH_PERSONNEL.height
  is '���';
comment on column YTJ_ARCH_PERSONNEL.weight
  is '����';
comment on column YTJ_ARCH_PERSONNEL.oldid
  is '������';
alter table YTJ_ARCH_PERSONNEL
  add constraint PK_YTJ_ARCH_PERSONNEL primary key (ID);

prompt
prompt Creating table YTJ_ARCH_REQCHECK
prompt ================================
prompt
create table YTJ_ARCH_REQCHECK
(
  id          VARCHAR2(32) not null,
  name        VARCHAR2(40) not null,
  idcard      VARCHAR2(40),
  sex         VARCHAR2(10) not null,
  birthday    TIMESTAMP(6) not null,
  reqno       VARCHAR2(100),
  archiveid   VARCHAR2(50),
  pym         VARCHAR2(20),
  phone       VARCHAR2(20),
  address     VARCHAR2(100),
  nation      VARCHAR2(10),
  language    VARCHAR2(10),
  icpcode     VARCHAR2(60) not null,
  reqcontent  VARCHAR2(10),
  description VARCHAR2(40),
  devicetype  VARCHAR2(20) not null,
  create_user VARCHAR2(32),
  create_time TIMESTAMP(6),
  update_user VARCHAR2(32),
  update_time TIMESTAMP(6),
  healthycard VARCHAR2(40),
  reqtime     TIMESTAMP(6),
  state       VARCHAR2(1),
  remark      VARCHAR2(500),
  patientid   VARCHAR2(32),
  org_id      VARCHAR2(32)
);
comment on table YTJ_ARCH_REQCHECK
  is 'һ�����鵥��������ڴ洢��鵥������Ϣ��
�ڼ��ǰ��������д�벡�˻�����Ϣ�������Ŀ�ȣ����ʱ���������������룬�������ɼ�鵥��Ϣ��Ŀǰ���ں��ϡ�';
comment on column YTJ_ARCH_REQCHECK.id
  is '����';
comment on column YTJ_ARCH_REQCHECK.name
  is '����';
comment on column YTJ_ARCH_REQCHECK.idcard
  is '���֤��';
comment on column YTJ_ARCH_REQCHECK.sex
  is '�Ա�0-δ֪���Ա�1-�У�2-Ů��9-δ˵�����Ա�
';
comment on column YTJ_ARCH_REQCHECK.birthday
  is '��������';
comment on column YTJ_ARCH_REQCHECK.reqno
  is '�����';
comment on column YTJ_ARCH_REQCHECK.archiveid
  is '������';
comment on column YTJ_ARCH_REQCHECK.pym
  is '�����ƴ����';
comment on column YTJ_ARCH_REQCHECK.phone
  is '��ϵ�绰mobile';
comment on column YTJ_ARCH_REQCHECK.address
  is 'סַ';
comment on column YTJ_ARCH_REQCHECK.nation
  is '���壨����ȫ�ƣ�';
comment on column YTJ_ARCH_REQCHECK.language
  is '����';
comment on column YTJ_ARCH_REQCHECK.icpcode
  is 'ҽ�ƻ�������';
comment on column YTJ_ARCH_REQCHECK.reqcontent
  is '����������˳������|Ѫѹ|Ѫ��|����|Ѫ��|���|�ĵ�
0������飬1����顣����:ֻ������죺0000010
';
comment on column YTJ_ARCH_REQCHECK.description
  is '����';
comment on column YTJ_ARCH_REQCHECK.devicetype
  is '����豸���ͣ�
0001-һ�����
';
comment on column YTJ_ARCH_REQCHECK.create_user
  is '������Ա�����ҽ����ţ�';
comment on column YTJ_ARCH_REQCHECK.create_time
  is '����ʱ��';
comment on column YTJ_ARCH_REQCHECK.update_user
  is '������Ա';
comment on column YTJ_ARCH_REQCHECK.update_time
  is '����ʱ��';
comment on column YTJ_ARCH_REQCHECK.healthycard
  is '���񽡿����Ŀ��š�';
comment on column YTJ_ARCH_REQCHECK.reqtime
  is '����ʱ��';
comment on column YTJ_ARCH_REQCHECK.state
  is '״̬ 0:��ʼ״̬;1:�Ѿ�����;2:�����;3:�ѷ���;';
comment on column YTJ_ARCH_REQCHECK.remark
  is '��ע';
comment on column YTJ_ARCH_REQCHECK.patientid
  is '����ID';
alter table YTJ_ARCH_REQCHECK
  add constraint PK_YTJ_ARCH_REQCHECK primary key (ID);

prompt
prompt Creating table YTJ_ARCH_REQUEST
prompt ===============================
prompt
create table YTJ_ARCH_REQUEST
(
  id               VARCHAR2(32) not null,
  numberofcase     VARCHAR2(50),
  source           VARCHAR2(1),
  checkedmethod    VARCHAR2(50),
  checkeddate      TIMESTAMP(6),
  codepartment     VARCHAR2(20),
  requestdate      TIMESTAMP(6),
  create_user      VARCHAR2(32),
  create_time      TIMESTAMP(6),
  icpcode          VARCHAR2(60),
  medicalrecord    VARCHAR2(200),
  consultfee       NUMBER(8,2),
  expertno         VARCHAR2(20),
  reqno            VARCHAR2(50),
  requestsource    VARCHAR2(1),
  oldcase          VARCHAR2(50),
  process_id       VARCHAR2(32),
  bpn_code         VARCHAR2(20),
  bpa_code         VARCHAR2(20),
  fileids          VARCHAR2(1000),
  update_user      VARCHAR2(32),
  update_time      TIMESTAMP(6),
  check_id         VARCHAR2(32),
  sponsor          VARCHAR2(32),
  handler          VARCHAR2(32),
  sponsor_org      VARCHAR2(32),
  sponsor_name     VARCHAR2(40),
  sponsor_org_name VARCHAR2(60),
  handler_org      VARCHAR2(32),
  handler_name     VARCHAR2(40),
  handler_org_name VARCHAR2(60),
  birthday         TIMESTAMP(6),
  patientname      VARCHAR2(40),
  sex              VARCHAR2(10),
  remark           VARCHAR2(500),
  prev_id          VARCHAR2(32),
  checkeddoctor    VARCHAR2(32),
  patientid        VARCHAR2(32),
  org_id           VARCHAR2(32)
);
comment on table YTJ_ARCH_REQUEST
  is 'һ���-�ĵ����Эͬ�����(�������������ʱЧ���ʣ�������������Ʊ���������������)';
comment on column YTJ_ARCH_REQUEST.id
  is '����';
comment on column YTJ_ARCH_REQUEST.numberofcase
  is '������';
comment on column YTJ_ARCH_REQUEST.source
  is '������Դ';
comment on column YTJ_ARCH_REQUEST.checkedmethod
  is '��鷽��';
comment on column YTJ_ARCH_REQUEST.checkeddate
  is '�������';
comment on column YTJ_ARCH_REQUEST.codepartment
  is 'Эͬ����';
comment on column YTJ_ARCH_REQUEST.requestdate
  is '��������';
comment on column YTJ_ARCH_REQUEST.create_user
  is '������Ա';
comment on column YTJ_ARCH_REQUEST.create_time
  is '����ʱ��';
comment on column YTJ_ARCH_REQUEST.icpcode
  is '��������';
comment on column YTJ_ARCH_REQUEST.medicalrecord
  is '����ժҪ';
comment on column YTJ_ARCH_REQUEST.consultfee
  is 'ר����ѯ��';
comment on column YTJ_ARCH_REQUEST.expertno
  is 'ר�Һ�';
comment on column YTJ_ARCH_REQUEST.reqno
  is '����ţ�ͨ������ȡ�ã����Ȳ���10λ�ģ�ǰ�油0��ǰ���ټ���RNO���磺RNO0000000024';
comment on column YTJ_ARCH_REQUEST.requestsource
  is '������Դ(1 his 2 ��������  9 ����)';
comment on column YTJ_ARCH_REQUEST.process_id
  is '��ԴHJK_WF_PROCESS';
comment on column YTJ_ARCH_REQUEST.bpn_code
  is '�ڵ����';
comment on column YTJ_ARCH_REQUEST.bpa_code
  is '��������';
comment on column YTJ_ARCH_REQUEST.fileids
  is '�ļ�ID����Դ��HJK_SYS_UPLOADFILE������ļ�֮���Զ��ż��';
comment on column YTJ_ARCH_REQUEST.update_user
  is '�޸���Ա';
comment on column YTJ_ARCH_REQUEST.update_time
  is '�޸�ʱ��';
comment on column YTJ_ARCH_REQUEST.check_id
  is '��鵥ID';
comment on column YTJ_ARCH_REQUEST.sponsor
  is '��������,����������û�ID(���ҽ��)';
comment on column YTJ_ARCH_REQUEST.handler
  is '���������û�ID(Эͬҽ��)';
comment on column YTJ_ARCH_REQUEST.sponsor_org
  is '����������������ID����������';
comment on column YTJ_ARCH_REQUEST.sponsor_name
  is '����������ʾ����';
comment on column YTJ_ARCH_REQUEST.sponsor_org_name
  is '������������������ʾ����';
comment on column YTJ_ARCH_REQUEST.handler_org
  is '���������û���������ID��Эͬ������';
comment on column YTJ_ARCH_REQUEST.handler_name
  is '����������ʾ����';
comment on column YTJ_ARCH_REQUEST.handler_org_name
  is '������������������ʾ����';
comment on column YTJ_ARCH_REQUEST.birthday
  is '��������';
comment on column YTJ_ARCH_REQUEST.patientname
  is '��������';
comment on column YTJ_ARCH_REQUEST.sex
  is '�Ա�0-δ֪���Ա�1-�У�2-Ů��9-δ˵�����Ա�
';
comment on column YTJ_ARCH_REQUEST.remark
  is '��ע';
comment on column YTJ_ARCH_REQUEST.prev_id
  is 'ǰ���뵥ID';
comment on column YTJ_ARCH_REQUEST.checkeddoctor
  is '���ҽ��';
comment on column YTJ_ARCH_REQUEST.patientid
  is '����ID';
alter table YTJ_ARCH_REQUEST
  add constraint PK_YTJ_ARCH_REQUEST primary key (ID);

prompt
prompt Creating table YTJ_BASE_CHECKDEF
prompt ================================
prompt
create table YTJ_BASE_CHECKDEF
(
  id          VARCHAR2(32) not null,
  code        VARCHAR2(6) not null,
  name        VARCHAR2(100) not null,
  checktype   VARCHAR2(6) not null,
  datatype    VARCHAR2(1) not null,
  abbreviate  VARCHAR2(20),
  unitname    VARCHAR2(50),
  ordernum    NUMBER(4) default 0 not null,
  format      VARCHAR2(100),
  nulldisplay VARCHAR2(1),
  groupid     NUMBER(4),
  ref         VARCHAR2(100)
);
comment on table YTJ_BASE_CHECKDEF
  is '����һ�������ϵͳ�еļ����Ŀ���ԡ�';
comment on column YTJ_BASE_CHECKDEF.id
  is '����';
comment on column YTJ_BASE_CHECKDEF.code
  is '�����Ŀ����';
comment on column YTJ_BASE_CHECKDEF.name
  is '�����Ŀ����';
comment on column YTJ_BASE_CHECKDEF.checktype
  is '�����Ŀ�������ͣ�1.һ���һ���飬2��һ����򳣹棬3��һ����ĵ���';
comment on column YTJ_BASE_CHECKDEF.datatype
  is '�����Ŀֵ�����ͣ�1.��׼���ͣ�2���ĵ����ݣ�3��ͼƬ�ļ�';
comment on column YTJ_BASE_CHECKDEF.abbreviate
  is '��д';
comment on column YTJ_BASE_CHECKDEF.unitname
  is '���ݵ�λ';
comment on column YTJ_BASE_CHECKDEF.ordernum
  is '��ʾ˳�򣬴�0��ʼ����С��0��ʾ��ʹ�ã��ų���';
comment on column YTJ_BASE_CHECKDEF.format
  is '����չʾ��ʽ';
comment on column YTJ_BASE_CHECKDEF.nulldisplay
  is '����Ŀδ���ʱ�Ƿ�չʾ����Ŀ;1-��ʾ��2-����ʾ';
comment on column YTJ_BASE_CHECKDEF.groupid
  is '����';
comment on column YTJ_BASE_CHECKDEF.ref
  is '�ο�ֵ';
alter table YTJ_BASE_CHECKDEF
  add constraint PK_YTJ_BASE_CHECKDEF primary key (ID);

prompt
prompt Creating table YTJ_BASE_DEVICEINFO
prompt ==================================
prompt
create table YTJ_BASE_DEVICEINFO
(
  id             VARCHAR2(32) not null,
  devicetype     VARCHAR2(4) not null,
  device         VARCHAR2(50) not null,
  owner          VARCHAR2(60) not null,
  icpcode        VARCHAR2(60),
  nowuser        VARCHAR2(20),
  cversion       VARCHAR2(50),
  cversion2      VARCHAR2(50),
  nowusername    VARCHAR2(50),
  distributetime DATE,
  producer       VARCHAR2(10),
  usercode       VARCHAR2(30),
  memo           VARCHAR2(50),
  create_user    VARCHAR2(32),
  create_time    TIMESTAMP(6),
  update_user    VARCHAR2(32),
  update_time    TIMESTAMP(6),
  oldid          VARCHAR2(50),
  remark         VARCHAR2(500),
  state          VARCHAR2(1) default 0,
  org_id         VARCHAR2(32)
);
comment on table YTJ_BASE_DEVICEINFO
  is '��������-�豸ע����Ϣ��';
comment on column YTJ_BASE_DEVICEINFO.id
  is 'ΨһID�������壬���������д�������Ψһ�ԣ�';
comment on column YTJ_BASE_DEVICEINFO.devicetype
  is '�豸���ͣ�����ϵͳ�����ֵ��DEVICE.TYPE��0001һ�����0002����С�ݣ�0003��μ໤�ǡ�';
comment on column YTJ_BASE_DEVICEINFO.device
  is '�豸��ţ����̼����Լ���ʶ��֤Ψһ��';
comment on column YTJ_BASE_DEVICEINFO.owner
  is '�豸��������';
comment on column YTJ_BASE_DEVICEINFO.icpcode
  is '�޸���������';
comment on column YTJ_BASE_DEVICEINFO.nowuser
  is '�豸������Ա���֤����';
comment on column YTJ_BASE_DEVICEINFO.cversion
  is 'һ�������汾��';
comment on column YTJ_BASE_DEVICEINFO.cversion2
  is 'һ���Ӳ���汾��';
comment on column YTJ_BASE_DEVICEINFO.nowusername
  is '�豸����������';
comment on column YTJ_BASE_DEVICEINFO.distributetime
  is '�豸����ʱ��';
comment on column YTJ_BASE_DEVICEINFO.producer
  is '�豸���̱�ţ�����ϵͳ�����ֵ��DEVICE.PRODUCER��01����ҽ����02���п�ǿ����03������������04�����ݸ���05����������07�����տ��С�

';
comment on column YTJ_BASE_DEVICEINFO.usercode
  is '�û�����';
comment on column YTJ_BASE_DEVICEINFO.memo
  is '��ע';
comment on column YTJ_BASE_DEVICEINFO.create_user
  is '������Ա';
comment on column YTJ_BASE_DEVICEINFO.create_time
  is '����ʱ��';
comment on column YTJ_BASE_DEVICEINFO.update_user
  is '������Ա';
comment on column YTJ_BASE_DEVICEINFO.update_time
  is '����ʱ��';
comment on column YTJ_BASE_DEVICEINFO.oldid
  is '������';
comment on column YTJ_BASE_DEVICEINFO.remark
  is '˵��';
comment on column YTJ_BASE_DEVICEINFO.state
  is '�豸״̬��0������1ͣ�á�';
alter table YTJ_BASE_DEVICEINFO
  add constraint PK_YTJ_BASE_DEVICEINFO primary key (ID);

prompt
prompt Creating table YTJ_BASE_DEVICE_EXTEND
prompt =====================================
prompt
create table YTJ_BASE_DEVICE_EXTEND
(
  device_id VARCHAR2(32) not null,
  extend_id VARCHAR2(32) not null
);
comment on table YTJ_BASE_DEVICE_EXTEND
  is '��������-�豸��������';
comment on column YTJ_BASE_DEVICE_EXTEND.device_id
  is '�豸ע��ID';
comment on column YTJ_BASE_DEVICE_EXTEND.extend_id
  is '��չ���ID';
create unique index IDX_HJK_BASE_DEVICE_PARAM on YTJ_BASE_DEVICE_EXTEND (DEVICE_ID, EXTEND_ID);
alter table YTJ_BASE_DEVICE_EXTEND
  add constraint PK_YTJ_BASE_DEVICE_EXTEND primary key (DEVICE_ID, EXTEND_ID);

prompt
prompt Creating table YTJ_BASE_DEVICE_TAKE
prompt ===================================
prompt
create table YTJ_BASE_DEVICE_TAKE
(
  id          VARCHAR2(32) not null,
  jgbm        VARCHAR2(60) not null,
  hmsownernum NUMBER(9) default 1 not null,
  remark      VARCHAR2(500),
  create_user VARCHAR2(32),
  create_time TIMESTAMP(6),
  update_user VARCHAR2(32),
  update_time TIMESTAMP(6)
);
comment on table YTJ_BASE_DEVICE_TAKE
  is '��������-�豸���õǼ�';
comment on column YTJ_BASE_DEVICE_TAKE.id
  is '����';
comment on column YTJ_BASE_DEVICE_TAKE.jgbm
  is '��������';
comment on column YTJ_BASE_DEVICE_TAKE.hmsownernum
  is '��������';
comment on column YTJ_BASE_DEVICE_TAKE.remark
  is '��ע';
comment on column YTJ_BASE_DEVICE_TAKE.create_user
  is '������Ա';
comment on column YTJ_BASE_DEVICE_TAKE.create_time
  is '����ʱ��';
comment on column YTJ_BASE_DEVICE_TAKE.update_user
  is '������Ա';
comment on column YTJ_BASE_DEVICE_TAKE.update_time
  is '����ʱ��';
alter table YTJ_BASE_DEVICE_TAKE
  add constraint PK_YTJ_BASE_DEVICE_TAKE primary key (ID);

prompt
prompt Creating table YTJ_BASE_EXTENDDEF
prompt =================================
prompt
create table YTJ_BASE_EXTENDDEF
(
  id          VARCHAR2(32) not null,
  extend_id   VARCHAR2(4) not null,
  checkdef_id VARCHAR2(200) not null,
  ref_range   VARCHAR2(200),
  ref_check   VARCHAR2(200)
);
comment on table YTJ_BASE_EXTENDDEF
  is '��չ�豸����Ŀ�����';
comment on column YTJ_BASE_EXTENDDEF.id
  is 'ΨһID';
comment on column YTJ_BASE_EXTENDDEF.extend_id
  is '��չ�����Ϣ��ID';
comment on column YTJ_BASE_EXTENDDEF.checkdef_id
  is '�����Ŀ������ID';
comment on column YTJ_BASE_EXTENDDEF.ref_range
  is '�ο���Χֵ';
comment on column YTJ_BASE_EXTENDDEF.ref_check
  is '�ο���ΧУ����ʽ';
alter table YTJ_BASE_EXTENDDEF
  add constraint PK_YTJ_BASE_EXTENDDEF primary key (ID);

prompt
prompt Creating table YTJ_BASE_EXTENDINFO
prompt ==================================
prompt
create table YTJ_BASE_EXTENDINFO
(
  id         VARCHAR2(32) not null,
  devicetype VARCHAR2(4) not null,
  name       VARCHAR2(200) not null
);
comment on table YTJ_BASE_EXTENDINFO
  is '��չ�豸��Ϣ��һ���������ȣ�';
comment on column YTJ_BASE_EXTENDINFO.id
  is 'ΨһID';
comment on column YTJ_BASE_EXTENDINFO.devicetype
  is '�豸���ͣ�����ϵͳ�����ֵ��DEVICE.TYPE��0001һ�����0002����С�ݣ�0003��μ໤�ǡ�';
comment on column YTJ_BASE_EXTENDINFO.name
  is '���������';
alter table YTJ_BASE_EXTENDINFO
  add constraint PK_YTJ_BASE_EXTENDINFO primary key (ID);

prompt
prompt Creating table YTJ_HMSQC_GLU
prompt ============================
prompt
create table YTJ_HMSQC_GLU
(
  id        VARCHAR2(32) not null,
  devicesn  VARCHAR2(50) not null,
  checkdate TIMESTAMP(6) not null,
  glu_model VARCHAR2(50),
  qltcontrl VARCHAR2(50),
  qc_result VARCHAR2(30),
  glu_fqc   VARCHAR2(30) not null,
  checkuser VARCHAR2(30),
  icpcode   VARCHAR2(60),
  crtime    TIMESTAMP(6) not null,
  oldid     VARCHAR2(50)
);
comment on table YTJ_HMSQC_GLU
  is '��������-Ѫ����';
comment on column YTJ_HMSQC_GLU.id
  is '����';
comment on column YTJ_HMSQC_GLU.devicesn
  is '�豸����';
comment on column YTJ_HMSQC_GLU.checkdate
  is '���ʱ��';
comment on column YTJ_HMSQC_GLU.glu_model
  is 'Ѫ�����ͺţ�GLU001';
comment on column YTJ_HMSQC_GLU.qltcontrl
  is '�ʿ�Һ�ͺţ�BG_QLT001';
comment on column YTJ_HMSQC_GLU.qc_result
  is '�豸�����';
comment on column YTJ_HMSQC_GLU.glu_fqc
  is '���տ��ƽ����1����;0�쳣��';
comment on column YTJ_HMSQC_GLU.checkuser
  is '�����';
comment on column YTJ_HMSQC_GLU.icpcode
  is '������';
comment on column YTJ_HMSQC_GLU.crtime
  is '����/�޸�ʱ��';
comment on column YTJ_HMSQC_GLU.oldid
  is '������';
alter table YTJ_HMSQC_GLU
  add constraint PK_YTJ_HMSQC_GLU primary key (ID);

prompt
prompt Creating table YTJ_HMSQC_URINE
prompt ==============================
prompt
create table YTJ_HMSQC_URINE
(
  id          VARCHAR2(32) not null,
  devicesn    VARCHAR2(50) not null,
  checkdate   TIMESTAMP(6) not null,
  urine_model VARCHAR2(50),
  strips      VARCHAR2(50),
  qltcontrl   VARCHAR2(50),
  urine_fqc   VARCHAR2(30) not null,
  checkuser   VARCHAR2(30),
  icpcode     VARCHAR2(60),
  crtime      TIMESTAMP(6) not null,
  oldid       VARCHAR2(50)
);
comment on table YTJ_HMSQC_URINE
  is '��������-��Һ����';
comment on column YTJ_HMSQC_URINE.id
  is '����';
comment on column YTJ_HMSQC_URINE.devicesn
  is '�豸����';
comment on column YTJ_HMSQC_URINE.checkdate
  is '���ʱ��';
comment on column YTJ_HMSQC_URINE.urine_model
  is '��Һ���ͺţ�BC401';
comment on column YTJ_HMSQC_URINE.strips
  is '��ֽ���ͺţ�BQ-11H (����)��DR-H11 (����)';
comment on column YTJ_HMSQC_URINE.qltcontrl
  is '�ʿ�Һ�ͺţ�BC_QLTYH (����)��BC_QLTDR (����)';
comment on column YTJ_HMSQC_URINE.urine_fqc
  is '���տ��ƽ����1������0�쳣��';
comment on column YTJ_HMSQC_URINE.checkuser
  is '�����';
comment on column YTJ_HMSQC_URINE.icpcode
  is '������';
comment on column YTJ_HMSQC_URINE.crtime
  is '����/�޸�ʱ��';
comment on column YTJ_HMSQC_URINE.oldid
  is '������';
alter table YTJ_HMSQC_URINE
  add constraint PK_YTJ_HMSQC_URINE primary key (ID);

prompt
prompt Creating table YTJ_HMSQC_URINE_ITEM
prompt ===================================
prompt
create table YTJ_HMSQC_URINE_ITEM
(
  id        VARCHAR2(32) not null,
  urine_id  VARCHAR2(32) not null,
  item_id   VARCHAR2(32) not null,
  itemvalue VARCHAR2(2000)
);
comment on table YTJ_HMSQC_URINE_ITEM
  is '��������-��Һ������Ŀ��';
comment on column YTJ_HMSQC_URINE_ITEM.id
  is '����';
comment on column YTJ_HMSQC_URINE_ITEM.urine_id
  is '��鵥ID';
comment on column YTJ_HMSQC_URINE_ITEM.item_id
  is '�����Ŀ����ID';
comment on column YTJ_HMSQC_URINE_ITEM.itemvalue
  is '������ֵ';
create unique index IDX_YTJ_HMSQC_URINE_ITEM on YTJ_HMSQC_URINE_ITEM (URINE_ID, ITEM_ID);
alter table YTJ_HMSQC_URINE_ITEM
  add constraint PK_YTJ_HMSQC_URINE_ITEM primary key (ID);



prompt
prompt Creating java source MD5Utils
prompt =============================
prompt
create or replace and compile java source named "MD5Utils" as
package com.ghit;

import java.security.MessageDigest;
import java.sql.Timestamp;

public class MD5Utils {
    public static String md5(String name,Timestamp time){
        String str=name+time.getTime();
        MessageDigest messageDigest = null;
        try {
            messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.reset();
            messageDigest.update(str.getBytes("UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        byte[] byteArray = messageDigest.digest();
        StringBuffer md5StrBuff = new StringBuffer();
        for (int i = 0; i < byteArray.length; i++) {
            if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
                md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));
            else
                md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
        }
        return md5StrBuff.toString();
    }

}
/

prompt
prompt Creating function PWDMD5
prompt ========================
prompt
CREATE OR REPLACE FUNCTION pwdMd5(str varchar2,time TIMESTAMP) RETURN varchar2 AS
 LANGUAGE JAVA NAME 'com.ghit.MD5Utils.md5(java.lang.String,java.sql.Timestamp) return java.lang.String';
/
prompt
prompt Creating view V_ORG_REGION
prompt ==========================
prompt
CREATE OR REPLACE FORCE VIEW V_ORG_REGION AS
select t4.id p_id,t4.name p_name,t4.slevel p_slevel ,t4.code p_code,t4.PARENT_CODE p_PARENT_CODE,t3."ID",t3."CODE",t3."NAME",t3."SLEVEL",t3."AREA",t3."ADDRESS",t3."CONTACT_PERSON",t3."PHONE",t3."JGDZM",t3."HOSPITAL_PROPERTY",t3."HOSPITAL_LEVEL",t3."IS_STRUCTURE",t3."GXGOVCODE",t3."IS_USE",t3."PARENT_CODE",t3."ORDERNUM",t3."CREATE_USER",t3."CREATE_TIME",t3."UPDATE_USER",t3."UPDATE_TIME",t3."REMARK",t3."CODEINDEX" from HJK_SYS_ORGANIZATION t3 ,
(SELECT T1.name,t1.code,t1.PARENT_CODE,t1.id,t1.SLEVEL,t1.codeindex||'%' codeindex FROM HJK_SYS_ORGANIZATION T1 WHERE EXISTS(SELECT 1 FROM HJK_SYS_ORGANIZATION T2 WHERE  T1.PARENT_CODE=T2.CODE AND T1.SLEVEL<>T2.SLEVEL )  OR T1.PARENT_CODE IS NULL) t4 where t3.codeindex like t4.codeindex;

spool off
