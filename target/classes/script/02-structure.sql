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
  is '数据接收索引，适用于源表和目的表结构一致的数据同步';
comment on column EDI_RECEIVE_INDEX.id
  is '主键';
comment on column EDI_RECEIVE_INDEX.table_name
  is '表名';
comment on column EDI_RECEIVE_INDEX.condition
  is '查询条件，查询源表数据的where条件';
comment on column EDI_RECEIVE_INDEX.message_source
  is '来源机构';
comment on column EDI_RECEIVE_INDEX.message_dest
  is '目的机构';
comment on column EDI_RECEIVE_INDEX.receive_date
  is '接收时间';
comment on column EDI_RECEIVE_INDEX.status
  is '状态：0未入库，1已入库，2已反馈';
comment on column EDI_RECEIVE_INDEX.action_type
  is '动作类型：I插入，U更新，D删除，IU插入或更新，DI先删除再插入';
comment on column EDI_RECEIVE_INDEX.update_condition
  is '更新条件，更新目标表数据的where条件，为空时取查询条件';
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
  is '数据发送索引，适用于源表和目的表结构一致的表数据同步';
comment on column EDI_SEND_INDEX.id
  is '主键';
comment on column EDI_SEND_INDEX.table_name
  is '表名';
comment on column EDI_SEND_INDEX.condition
  is '查询条件，查询源表数据的where条件';
comment on column EDI_SEND_INDEX.message_source
  is '来源机构';
comment on column EDI_SEND_INDEX.message_dest
  is '目的机构';
comment on column EDI_SEND_INDEX.senddate
  is '发送时间';
comment on column EDI_SEND_INDEX.status
  is '状态：0未发送，1已发送，2已接收';
comment on column EDI_SEND_INDEX.action_type
  is '动作类型：I插入，U更新，D删除，IU插入或更新，DI先删除再插入';
comment on column EDI_SEND_INDEX.update_condition
  is '更新条件，更新目标表数据的where条件，为空时取查询条件';
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
  is '基础数据-专家注册表';
comment on column HJK_BASE_DOCTOR.id
  is '主键';
comment on column HJK_BASE_DOCTOR.doctor
  is '姓名';
comment on column HJK_BASE_DOCTOR.titles
  is '职称';
comment on column HJK_BASE_DOCTOR.hospital
  is '所在医院';
comment on column HJK_BASE_DOCTOR.dept
  is '所在科室';
comment on column HJK_BASE_DOCTOR.hlevel
  is '级别：省级，市级，县级，乡级。';
comment on column HJK_BASE_DOCTOR.clinicplan
  is '出诊安排：星期一,上午;星期一,下午;星期二,上午;星期二,下午;星期三,上午;星期三,下午;星期四,上午;星期四,下午;星期五,上午;星期五,下午;星期六,上午;星期六,下午;星期日,上午;星期日,下午;';
comment on column HJK_BASE_DOCTOR.introduce
  is '介绍';
comment on column HJK_BASE_DOCTOR.consultfee
  is '咨询费';
comment on column HJK_BASE_DOCTOR.expertno
  is '专家号';
comment on column HJK_BASE_DOCTOR.online_status
  is '专家在线状态：1-在线 2-离线';
comment on column HJK_BASE_DOCTOR.create_user
  is '创建人员';
comment on column HJK_BASE_DOCTOR.create_time
  is '创建时间';
comment on column HJK_BASE_DOCTOR.update_user
  is '更新人员';
comment on column HJK_BASE_DOCTOR.update_time
  is '更新时间';
comment on column HJK_BASE_DOCTOR.user_id
  is '关联的用户ID';
comment on column HJK_BASE_DOCTOR.remark
  is '备注';
comment on column HJK_BASE_DOCTOR.oldid
  is '旧主键';
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
  is '基础数据-专家机构对照表';
comment on column HJK_BASE_DOCTOR_GOV.org_id
  is '机构ID';
comment on column HJK_BASE_DOCTOR_GOV.user_id
  is '专家ID';
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
  is '基础数据-数据质控分析参数表';
comment on column HJK_BASE_QC_ANALYZE.id
  is '主键';
comment on column HJK_BASE_QC_ANALYZE.item_id
  is '检测项目ID';
comment on column HJK_BASE_QC_ANALYZE.maxvalue
  is '参数最大值';
comment on column HJK_BASE_QC_ANALYZE.minvalue
  is '参数最小值';
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
  is '本机构范围内的全局参数设置';
comment on column HJK_SYS_CONFIGURATION.id
  is '主键';
comment on column HJK_SYS_CONFIGURATION.organization_id
  is '参数所属机构id';
comment on column HJK_SYS_CONFIGURATION.configuration_group
  is '分组标记';
comment on column HJK_SYS_CONFIGURATION.configuration_name
  is '参数名';
comment on column HJK_SYS_CONFIGURATION.configuration_value
  is '参数值';
comment on column HJK_SYS_CONFIGURATION.callback
  is '回调接口';
comment on column HJK_SYS_CONFIGURATION.flag
  is '状态';
comment on column HJK_SYS_CONFIGURATION.remark
  is '参数说明';
comment on column HJK_SYS_CONFIGURATION.create_user
  is '创建人员';
comment on column HJK_SYS_CONFIGURATION.create_time
  is '创建时间';
comment on column HJK_SYS_CONFIGURATION.update_user
  is '更新人员';
comment on column HJK_SYS_CONFIGURATION.update_time
  is '更新时间';
comment on column HJK_SYS_CONFIGURATION.createuser_type
  is '创建人员类型';
comment on column HJK_SYS_CONFIGURATION.updateuser_type
  is '更新人员类型';
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
  is '存储程序中使用到的标准化数据。';
comment on column HJK_SYS_DATA_DICTIONARY.id
  is '主键';
comment on column HJK_SYS_DATA_DICTIONARY.name
  is '名称';
comment on column HJK_SYS_DATA_DICTIONARY.content
  is 'JSON格式字符串';
comment on column HJK_SYS_DATA_DICTIONARY.create_user
  is '创建人员';
comment on column HJK_SYS_DATA_DICTIONARY.create_time
  is '创建时间';
comment on column HJK_SYS_DATA_DICTIONARY.update_user
  is '更新人员';
comment on column HJK_SYS_DATA_DICTIONARY.update_time
  is '更新时间';
comment on column HJK_SYS_DATA_DICTIONARY.remark
  is '备注';
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
  is '系统-错误日志表，记录存储过程、触发器或数据库job的出错日志';
comment on column HJK_SYS_DB_ERROR.errdate
  is '产生错误时间';
comment on column HJK_SYS_DB_ERROR.errproc
  is '错误过程名称';
comment on column HJK_SYS_DB_ERROR.errmsg
  is '错误信息';
comment on column HJK_SYS_DB_ERROR.remark
  is '说明';
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
  is '权限表';
comment on column HJK_SYS_JURISDICTION.id
  is '主键';
comment on column HJK_SYS_JURISDICTION.authentication_rule
  is '权限访问路径';
comment on column HJK_SYS_JURISDICTION.authentication_type
  is '权限类型';
comment on column HJK_SYS_JURISDICTION.jurisdiction_name
  is '权限名称';
comment on column HJK_SYS_JURISDICTION.jurisdiction_code
  is '权限编码';
comment on column HJK_SYS_JURISDICTION.create_user
  is '创建人员';
comment on column HJK_SYS_JURISDICTION.create_time
  is '创建时间';
comment on column HJK_SYS_JURISDICTION.update_user
  is '更新人员';
comment on column HJK_SYS_JURISDICTION.update_time
  is '更新时间';
comment on column HJK_SYS_JURISDICTION.remark
  is '备注';
comment on column HJK_SYS_JURISDICTION.createuser_type
  is '创建人员类型';
comment on column HJK_SYS_JURISDICTION.updateuser_type
  is '更新人员类型';
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
  is '其它需要本系统提供身份验证功能的WEB应用';
comment on column HJK_SYS_OAUTH_CLIENTINFO.id
  is '客户端key';
comment on column HJK_SYS_OAUTH_CLIENTINFO.name
  is '客户端简称';
comment on column HJK_SYS_OAUTH_CLIENTINFO.clientsecret
  is '安全参数';
comment on column HJK_SYS_OAUTH_CLIENTINFO.redirecturi
  is '授权完成后的回调地址';
comment on column HJK_SYS_OAUTH_CLIENTINFO.clienturi
  is '主页地址';
comment on column HJK_SYS_OAUTH_CLIENTINFO.description
  is '说明';
comment on column HJK_SYS_OAUTH_CLIENTINFO.iconuri
  is '图标地址';
comment on column HJK_SYS_OAUTH_CLIENTINFO.issuedat
  is '发表时长';
comment on column HJK_SYS_OAUTH_CLIENTINFO.expiresin
  is '访问令牌过期时长，单位为秒，默认12小时';
comment on column HJK_SYS_OAUTH_CLIENTINFO.passthrough
  is '已登录验证服务器的用户访问第三方系统时，是否不经过同意页面授权：0否，1是。';
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
  is '上级机构ID';
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
  is '资源表';
comment on column HJK_SYS_RESOURCE.id
  is '主键';
comment on column HJK_SYS_RESOURCE.resource_name
  is '资源名称';
comment on column HJK_SYS_RESOURCE.resource_type
  is '资源类型';
comment on column HJK_SYS_RESOURCE.parent_no
  is '父节点';
comment on column HJK_SYS_RESOURCE.order_id
  is '排序';
comment on column HJK_SYS_RESOURCE.create_user
  is '创建人员';
comment on column HJK_SYS_RESOURCE.create_time
  is '创建时间';
comment on column HJK_SYS_RESOURCE.update_user
  is '更新人员';
comment on column HJK_SYS_RESOURCE.update_time
  is '更新时间';
comment on column HJK_SYS_RESOURCE.remark
  is '备注';
comment on column HJK_SYS_RESOURCE.jurisdiction_code
  is '权限编码';
comment on column HJK_SYS_RESOURCE.resource_no
  is '编号';
comment on column HJK_SYS_RESOURCE.icon
  is '图标';
comment on column HJK_SYS_RESOURCE.properties
  is '资源属性';
comment on column HJK_SYS_RESOURCE.createuser_type
  is '创建人员类型';
comment on column HJK_SYS_RESOURCE.updateuser_type
  is '更新人员类型';
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
  is '角色表';
comment on column HJK_SYS_ROLE.id
  is '主键';
comment on column HJK_SYS_ROLE.role_name
  is '角色名称';
comment on column HJK_SYS_ROLE.description
  is '角色描述';
comment on column HJK_SYS_ROLE.role_code
  is '角色编码';
comment on column HJK_SYS_ROLE.create_user
  is '创建人员';
comment on column HJK_SYS_ROLE.create_time
  is '创建时间';
comment on column HJK_SYS_ROLE.update_user
  is '更新人员';
comment on column HJK_SYS_ROLE.update_time
  is '更新时间';
comment on column HJK_SYS_ROLE.remark
  is '备注';
comment on column HJK_SYS_ROLE.createuser_type
  is '创建人员类型';
comment on column HJK_SYS_ROLE.updateuser_type
  is '更新人员类型';
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
  is '角色权限关联表';
comment on column HJK_SYS_ROLE_JURISDICTION.role_id
  is '角色ID';
comment on column HJK_SYS_ROLE_JURISDICTION.jurisdiction_code
  is '权限编码';
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
  is '上传文件表';
comment on column HJK_SYS_UPLOADFILE.id
  is '主键';
comment on column HJK_SYS_UPLOADFILE.file_name
  is '文件名';
comment on column HJK_SYS_UPLOADFILE.file_url
  is '文件访问URL';
comment on column HJK_SYS_UPLOADFILE.suffix
  is '文件后缀名';
comment on column HJK_SYS_UPLOADFILE.file_size
  is '文件长度';
comment on column HJK_SYS_UPLOADFILE.md5
  is '文件MD5值';
comment on column HJK_SYS_UPLOADFILE.flag
  is '标志：0正常，1不完整。';
comment on column HJK_SYS_UPLOADFILE.path
  is '保存路径';
comment on column HJK_SYS_UPLOADFILE.create_user
  is '创建人员';
comment on column HJK_SYS_UPLOADFILE.create_time
  is '创建时间';
comment on column HJK_SYS_UPLOADFILE.update_user
  is '更新人员';
comment on column HJK_SYS_UPLOADFILE.update_time
  is '更新时间';
comment on column HJK_SYS_UPLOADFILE.createuser_type
  is '创建人员类型';
comment on column HJK_SYS_UPLOADFILE.updateuser_type
  is '更新人员类型';
comment on column HJK_SYS_UPLOADFILE.remark
  is '备注';
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
  is '用户表';
comment on column HJK_SYS_USER.id
  is '主键';
comment on column HJK_SYS_USER.username
  is '用户名';
comment on column HJK_SYS_USER.password
  is '密码';
comment on column HJK_SYS_USER.fullname
  is '用户姓名';
comment on column HJK_SYS_USER.doctcode
  is '用户编码';
comment on column HJK_SYS_USER.sex
  is '性别：0未知的性别，1男，2女，9未说明的性别。';
comment on column HJK_SYS_USER.birthday
  is '出生日期';
comment on column HJK_SYS_USER.tel
  is '联系电话';
comment on column HJK_SYS_USER.fax
  is '传真';
comment on column HJK_SYS_USER.mail
  is '邮箱';
comment on column HJK_SYS_USER.flag
  is '用户状态：0未启用；1启用。';
comment on column HJK_SYS_USER.holders
  is '支持系统，系统使用权限';
comment on column HJK_SYS_USER.organization_code
  is '所在机构';
comment on column HJK_SYS_USER.identifyno
  is '身份证号';
comment on column HJK_SYS_USER.staff_id
  is '用户工号（不同系统之间，识别用户的唯一标识）';
comment on column HJK_SYS_USER.qq
  is 'QQ号';
comment on column HJK_SYS_USER.create_user
  is '创建人员';
comment on column HJK_SYS_USER.create_time
  is '创建时间';
comment on column HJK_SYS_USER.update_user
  is '更新人员';
comment on column HJK_SYS_USER.update_time
  is '更新时间';
comment on column HJK_SYS_USER.createuser_type
  is '创建人员类型';
comment on column HJK_SYS_USER.updateuser_type
  is '更新人员类型';
comment on column HJK_SYS_USER.remark
  is '备注';
comment on column HJK_SYS_USER.properties
  is '用户属性：1-医生，2-专家';
comment on column HJK_SYS_USER.oldid
  is '旧主键';
comment on column HJK_SYS_USER.org_id
  is '所在机构ID';
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
  is '用户角色关联表';
comment on column HJK_SYS_USER_ROLE.user_id
  is '用户ID';
comment on column HJK_SYS_USER_ROLE.role_id
  is '角色ID';
comment on column HJK_SYS_USER_ROLE.create_user
  is '创建人员';
comment on column HJK_SYS_USER_ROLE.create_time
  is '创建时间';
comment on column HJK_SYS_USER_ROLE.update_user
  is '更新人员';
comment on column HJK_SYS_USER_ROLE.update_time
  is '更新时间';
comment on column HJK_SYS_USER_ROLE.remark
  is '备注';
comment on column HJK_SYS_USER_ROLE.createuser_type
  is '创建人员类型';
comment on column HJK_SYS_USER_ROLE.updateuser_type
  is '更新人员类型';
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
  is '记录节点的动作定义信息';
comment on column HJK_WF_ACTION.id
  is 'UUID';
comment on column HJK_WF_ACTION.name
  is '动作名称';
comment on column HJK_WF_ACTION.code
  is '动作代码';
comment on column HJK_WF_ACTION.own_bpn_code
  is '所属节点';
comment on column HJK_WF_ACTION.next_bpn_code
  is '下一节点';
comment on column HJK_WF_ACTION.own_bpd_code
  is '所属流程代码';
comment on column HJK_WF_ACTION.auth_expr
  is '动作权限';
comment on column HJK_WF_ACTION.action_type
  is '动作类型';
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
  is '记录正在执行的流程的执行过程信息，执行完后删除记录。';
comment on column HJK_WF_ACTIVITY.prev_bpn_code
  is '前一节点';
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
  is '流程名称';
comment on column HJK_WF_BPD.code
  is '流程代码';
comment on column HJK_WF_BPD.start_bpn_code
  is '开始节点';
comment on column HJK_WF_BPD.end_bpn_code
  is '结束节点';
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
  is '节点名称';
comment on column HJK_WF_BPN.code
  is '节点代码';
comment on column HJK_WF_BPN.bpd_code
  is '所属流程代码';
comment on column HJK_WF_BPN.def_action_code
  is '默认动作';
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
  is '存储流程执行的历史数据';
comment on column HJK_WF_HISTORY.prev_bpn_code
  is '前一节点';
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
  is '记录流程当前(最后)状态的信息';

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
  is '一体机检查单表';
comment on column YTJ_ARCH_CHECKINFO.id
  is '主键';
comment on column YTJ_ARCH_CHECKINFO.name
  is '姓名';
comment on column YTJ_ARCH_CHECKINFO.idcard
  is '身份证号';
comment on column YTJ_ARCH_CHECKINFO.age
  is '年龄';
comment on column YTJ_ARCH_CHECKINFO.sex
  is '性别：0-未知的性别，1-男，2-女，9-未说明的性别。
';
comment on column YTJ_ARCH_CHECKINFO.birthday
  is '出生日期';
comment on column YTJ_ARCH_CHECKINFO.numberofcase
  is '检查单号：该ID为字符型，组成规则为：厂商字母编号（2位）+36位流水号，36位流水号必须唯一。
厂商字母标识定义为：
东软：DR
迈瑞：MR
倍泰：BT
盖瑞：GT
好医生：HY
强华：QH';
comment on column YTJ_ARCH_CHECKINFO.archiveid
  is '档案号';
comment on column YTJ_ARCH_CHECKINFO.healthycard
  is '检查人健康卡号';
comment on column YTJ_ARCH_CHECKINFO.pym
  is '检查人拼音码';
comment on column YTJ_ARCH_CHECKINFO.phone
  is '联系电话mobile';
comment on column YTJ_ARCH_CHECKINFO.address
  is '住址';
comment on column YTJ_ARCH_CHECKINFO.nation
  is '民族（汉字全称）';
comment on column YTJ_ARCH_CHECKINFO.language
  is '语言';
comment on column YTJ_ARCH_CHECKINFO.icpcode
  is '医疗机构编码';
comment on column YTJ_ARCH_CHECKINFO.deviceno
  is '检查设备编号，如cm300';
comment on column YTJ_ARCH_CHECKINFO.producer
  is '设备厂商编号：
01：好医生
02：中科强华
03：东软熙康；
04：苏州盖瑞
05：深圳迈瑞
06：深圳倍泰
（只填写编码）
';
comment on column YTJ_ARCH_CHECKINFO.reqcontent
  is '申请检查内容顺序：体温|血压|血氧|心率|血糖|尿检|心电(1测 |0不测)
0：不检查，1：检查。例如:只申请尿检：0000010
';
comment on column YTJ_ARCH_CHECKINFO.description
  is '描述';
comment on column YTJ_ARCH_CHECKINFO.sareacode
  is '县区机构编码';
comment on column YTJ_ARCH_CHECKINFO.devicetype
  is '检查设备类型：
0001-一体机；
';
comment on column YTJ_ARCH_CHECKINFO.create_user
  is '创建人员（检查医生编号）';
comment on column YTJ_ARCH_CHECKINFO.create_time
  is '创建时间';
comment on column YTJ_ARCH_CHECKINFO.update_user
  is '更新人员';
comment on column YTJ_ARCH_CHECKINFO.update_time
  is '更新时间';
comment on column YTJ_ARCH_CHECKINFO.reqno
  is '申请号';
comment on column YTJ_ARCH_CHECKINFO.checktime
  is '检查时间';
comment on column YTJ_ARCH_CHECKINFO.oldid
  is '旧主键';
comment on column YTJ_ARCH_CHECKINFO.checkinfo
  is '用于列表显示的常规检查项目的信息，JSON格式保存:{itemid:value}';
comment on column YTJ_ARCH_CHECKINFO.integrity
  is '检查单和人员信息是否齐全：0是；1否；';
comment on column YTJ_ARCH_CHECKINFO.patientid
  is '患者ID';
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
  is '一体机-检查检验结果项目表';
comment on column YTJ_ARCH_CHECKRESULT.id
  is '主键';
comment on column YTJ_ARCH_CHECKRESULT.check_id
  is '检查单ID';
comment on column YTJ_ARCH_CHECKRESULT.item_id
  is '检查项目参数ID';
comment on column YTJ_ARCH_CHECKRESULT.itemvalue
  is '检查参数值';
comment on column YTJ_ARCH_CHECKRESULT.state
  is '0：正常值，1：异常值';
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
  is '一体机-心电诊断结果表';
comment on column YTJ_ARCH_DIAGNOSE.id
  is '主键';
comment on column YTJ_ARCH_DIAGNOSE.numberofcase
  is '病例编号（交换产生）';
comment on column YTJ_ARCH_DIAGNOSE.result
  is '诊断结果（正常心电图或不正常）';
comment on column YTJ_ARCH_DIAGNOSE.comments
  is '心电图特征';
comment on column YTJ_ARCH_DIAGNOSE.ecgdisease
  is '标准心电疾病名称';
comment on column YTJ_ARCH_DIAGNOSE.request_id
  is '申请单id';
comment on column YTJ_ARCH_DIAGNOSE.reqno
  is '申请号';
comment on column YTJ_ARCH_DIAGNOSE.checkedhospital
  is '检查机构';
comment on column YTJ_ARCH_DIAGNOSE.state
  is '0 可用 1 废弃';
comment on column YTJ_ARCH_DIAGNOSE.resultstate
  is '心电图结果状态：1-正常 2-异常 3-无法判断 4-错误操作';
comment on column YTJ_ARCH_DIAGNOSE.create_user
  is '创建人员';
comment on column YTJ_ARCH_DIAGNOSE.create_time
  is '创建时间';
comment on column YTJ_ARCH_DIAGNOSE.update_user
  is '更新人员';
comment on column YTJ_ARCH_DIAGNOSE.update_time
  is '更新时间';
comment on column YTJ_ARCH_DIAGNOSE.remark
  is '备注';
comment on column YTJ_ARCH_DIAGNOSE.file_xml
  is '诊断数据文件';
comment on column YTJ_ARCH_DIAGNOSE.file_png
  is '诊断图表文件';
comment on column YTJ_ARCH_DIAGNOSE.file_pdf
  is '诊断结果文件';
comment on column YTJ_ARCH_DIAGNOSE.patientid
  is '患者ID';
comment on column YTJ_ARCH_DIAGNOSE.diagnosetime
  is '诊断时间';
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
  is '协同机构关联表';
comment on column YTJ_ARCH_ORGCASE.source_org_id
  is '发起机构';
comment on column YTJ_ARCH_ORGCASE.target_org_id
  is '目标机构';
comment on column YTJ_ARCH_ORGCASE.is_default
  is '默认机构，枚举值 0：不是，1：是';
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
  is '一体机-检查检验人员表,记录参与体检的人员信息';
comment on column YTJ_ARCH_PERSONNEL.id
  is '主键';
comment on column YTJ_ARCH_PERSONNEL.name
  is '姓名';
comment on column YTJ_ARCH_PERSONNEL.personid
  is '身份证号';
comment on column YTJ_ARCH_PERSONNEL.age
  is '年龄';
comment on column YTJ_ARCH_PERSONNEL.sex
  is '性别：0-未知的性别，1-男，2-女，9-未说明的性别。
';
comment on column YTJ_ARCH_PERSONNEL.birthday
  is '出生日期';
comment on column YTJ_ARCH_PERSONNEL.archiveid
  is '档案号';
comment on column YTJ_ARCH_PERSONNEL.healthycard
  is '检查人健康卡号';
comment on column YTJ_ARCH_PERSONNEL.pym
  is '检查人拼音码';
comment on column YTJ_ARCH_PERSONNEL.phone
  is '联系电话mobile';
comment on column YTJ_ARCH_PERSONNEL.address
  is '住址';
comment on column YTJ_ARCH_PERSONNEL.nation
  is '民族（汉字全称）';
comment on column YTJ_ARCH_PERSONNEL.language
  is '语言';
comment on column YTJ_ARCH_PERSONNEL.create_user
  is '创建人员';
comment on column YTJ_ARCH_PERSONNEL.create_time
  is '创建时间';
comment on column YTJ_ARCH_PERSONNEL.update_user
  is '更新人员';
comment on column YTJ_ARCH_PERSONNEL.update_time
  is '更新时间';
comment on column YTJ_ARCH_PERSONNEL.height
  is '身高';
comment on column YTJ_ARCH_PERSONNEL.weight
  is '体重';
comment on column YTJ_ARCH_PERSONNEL.oldid
  is '旧主键';
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
  is '一体机检查单申请表，用于存储检查单申请信息。
在检查前发起申请写入病人基本信息和体检项目等，体检时可以批量下载申请，用于生成检查单信息。目前用于湖南。';
comment on column YTJ_ARCH_REQCHECK.id
  is '主键';
comment on column YTJ_ARCH_REQCHECK.name
  is '姓名';
comment on column YTJ_ARCH_REQCHECK.idcard
  is '身份证号';
comment on column YTJ_ARCH_REQCHECK.sex
  is '性别：0-未知的性别，1-男，2-女，9-未说明的性别。
';
comment on column YTJ_ARCH_REQCHECK.birthday
  is '出生日期';
comment on column YTJ_ARCH_REQCHECK.reqno
  is '申请号';
comment on column YTJ_ARCH_REQCHECK.archiveid
  is '档案号';
comment on column YTJ_ARCH_REQCHECK.pym
  is '检查人拼音码';
comment on column YTJ_ARCH_REQCHECK.phone
  is '联系电话mobile';
comment on column YTJ_ARCH_REQCHECK.address
  is '住址';
comment on column YTJ_ARCH_REQCHECK.nation
  is '民族（汉字全称）';
comment on column YTJ_ARCH_REQCHECK.language
  is '语言';
comment on column YTJ_ARCH_REQCHECK.icpcode
  is '医疗机构编码';
comment on column YTJ_ARCH_REQCHECK.reqcontent
  is '申请检查内容顺序：体温|血压|血氧|心率|血糖|尿检|心电
0：不检查，1：检查。例如:只申请尿检：0000010
';
comment on column YTJ_ARCH_REQCHECK.description
  is '描述';
comment on column YTJ_ARCH_REQCHECK.devicetype
  is '检查设备类型：
0001-一体机；
';
comment on column YTJ_ARCH_REQCHECK.create_user
  is '创建人员（检查医生编号）';
comment on column YTJ_ARCH_REQCHECK.create_time
  is '创建时间';
comment on column YTJ_ARCH_REQCHECK.update_user
  is '更新人员';
comment on column YTJ_ARCH_REQCHECK.update_time
  is '更新时间';
comment on column YTJ_ARCH_REQCHECK.healthycard
  is '居民健康卡的卡号。';
comment on column YTJ_ARCH_REQCHECK.reqtime
  is '申请时间';
comment on column YTJ_ARCH_REQCHECK.state
  is '状态 0:初始状态;1:已经下载;2:已体检;3:已废弃;';
comment on column YTJ_ARCH_REQCHECK.remark
  is '备注';
comment on column YTJ_ARCH_REQCHECK.patientid
  is '患者ID';
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
  is '一体机-心电诊断协同申请表(本表由于申请的时效性质，所以做冗余设计避免联表性能问题)';
comment on column YTJ_ARCH_REQUEST.id
  is '主键';
comment on column YTJ_ARCH_REQUEST.numberofcase
  is '病例号';
comment on column YTJ_ARCH_REQUEST.source
  is '病人来源';
comment on column YTJ_ARCH_REQUEST.checkedmethod
  is '检查方法';
comment on column YTJ_ARCH_REQUEST.checkeddate
  is '检查日期';
comment on column YTJ_ARCH_REQUEST.codepartment
  is '协同科室';
comment on column YTJ_ARCH_REQUEST.requestdate
  is '申请日期';
comment on column YTJ_ARCH_REQUEST.create_user
  is '创建人员';
comment on column YTJ_ARCH_REQUEST.create_time
  is '创建时间';
comment on column YTJ_ARCH_REQUEST.icpcode
  is '创建机构';
comment on column YTJ_ARCH_REQUEST.medicalrecord
  is '病历摘要';
comment on column YTJ_ARCH_REQUEST.consultfee
  is '专家咨询费';
comment on column YTJ_ARCH_REQUEST.expertno
  is '专家号';
comment on column YTJ_ARCH_REQUEST.reqno
  is '申请号：通过序列取得，长度不足10位的，前面补0后，前面再加上RNO，如：RNO0000000024';
comment on column YTJ_ARCH_REQUEST.requestsource
  is '申请来源(1 his 2 健康档案  9 其他)';
comment on column YTJ_ARCH_REQUEST.process_id
  is '来源HJK_WF_PROCESS';
comment on column YTJ_ARCH_REQUEST.bpn_code
  is '节点代码';
comment on column YTJ_ARCH_REQUEST.bpa_code
  is '操作代码';
comment on column YTJ_ARCH_REQUEST.fileids
  is '文件ID，来源于HJK_SYS_UPLOADFILE，多个文件之间以逗号间隔';
comment on column YTJ_ARCH_REQUEST.update_user
  is '修改人员';
comment on column YTJ_ARCH_REQUEST.update_time
  is '修改时间';
comment on column YTJ_ARCH_REQUEST.check_id
  is '检查单ID';
comment on column YTJ_ARCH_REQUEST.sponsor
  is '请求发起人,发起申请的用户ID(检查医生)';
comment on column YTJ_ARCH_REQUEST.handler
  is '请求处理人用户ID(协同医生)';
comment on column YTJ_ARCH_REQUEST.sponsor_org
  is '请求发起人所属机构ID（检查机构）';
comment on column YTJ_ARCH_REQUEST.sponsor_name
  is '请求发起人显示名称';
comment on column YTJ_ARCH_REQUEST.sponsor_org_name
  is '请求发起人所属机构显示名称';
comment on column YTJ_ARCH_REQUEST.handler_org
  is '请求处理人用户所属机构ID（协同机构）';
comment on column YTJ_ARCH_REQUEST.handler_name
  is '请求处理人显示名称';
comment on column YTJ_ARCH_REQUEST.handler_org_name
  is '请求处理人所属机构显示名称';
comment on column YTJ_ARCH_REQUEST.birthday
  is '出生日期';
comment on column YTJ_ARCH_REQUEST.patientname
  is '患者姓名';
comment on column YTJ_ARCH_REQUEST.sex
  is '性别：0-未知的性别，1-男，2-女，9-未说明的性别。
';
comment on column YTJ_ARCH_REQUEST.remark
  is '备注';
comment on column YTJ_ARCH_REQUEST.prev_id
  is '前申请单ID';
comment on column YTJ_ARCH_REQUEST.checkeddoctor
  is '检查医生';
comment on column YTJ_ARCH_REQUEST.patientid
  is '患者ID';
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
  is '定义一体机管理系统中的检查项目属性。';
comment on column YTJ_BASE_CHECKDEF.id
  is '主键';
comment on column YTJ_BASE_CHECKDEF.code
  is '检测项目代码';
comment on column YTJ_BASE_CHECKDEF.name
  is '检测项目名称';
comment on column YTJ_BASE_CHECKDEF.checktype
  is '检测项目所属类型：1.一体机一般检查，2：一体机尿常规，3：一体机心电检查';
comment on column YTJ_BASE_CHECKDEF.datatype
  is '检测项目值的类型：1.标准类型，2：心电数据，3：图片文件';
comment on column YTJ_BASE_CHECKDEF.abbreviate
  is '缩写';
comment on column YTJ_BASE_CHECKDEF.unitname
  is '数据单位';
comment on column YTJ_BASE_CHECKDEF.ordernum
  is '显示顺序，从0开始排序，小于0表示不使用（排除）';
comment on column YTJ_BASE_CHECKDEF.format
  is '数据展示格式';
comment on column YTJ_BASE_CHECKDEF.nulldisplay
  is '该项目未检测时是否展示该项目;1-显示，2-不显示';
comment on column YTJ_BASE_CHECKDEF.groupid
  is '分组';
comment on column YTJ_BASE_CHECKDEF.ref
  is '参考值';
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
  is '基础数据-设备注册信息表';
comment on column YTJ_BASE_DEVICEINFO.id
  is '唯一ID（无意义，各厂商自行处理，保持唯一性）';
comment on column YTJ_BASE_DEVICEINFO.devicetype
  is '设备类型，来自系统数据字典表DEVICE.TYPE：0001一体机；0002健康小屋；0003多参监护仪。';
comment on column YTJ_BASE_DEVICEINFO.device
  is '设备编号，厂商加入自己标识保证唯一性';
comment on column YTJ_BASE_DEVICEINFO.owner
  is '设备归属机构';
comment on column YTJ_BASE_DEVICEINFO.icpcode
  is '修改所属机构';
comment on column YTJ_BASE_DEVICEINFO.nowuser
  is '设备负责人员身份证号码';
comment on column YTJ_BASE_DEVICEINFO.cversion
  is '一体机软件版本号';
comment on column YTJ_BASE_DEVICEINFO.cversion2
  is '一体机硬件版本号';
comment on column YTJ_BASE_DEVICEINFO.nowusername
  is '设备负责人姓名';
comment on column YTJ_BASE_DEVICEINFO.distributetime
  is '设备发放时间';
comment on column YTJ_BASE_DEVICEINFO.producer
  is '设备厂商编号，来自系统数据字典表DEVICE.PRODUCER：01：好医生；02：中科强华；03：东软熙康；04：苏州盖瑞；05：深圳迈瑞；07：江苏康尚。

';
comment on column YTJ_BASE_DEVICEINFO.usercode
  is '用户编码';
comment on column YTJ_BASE_DEVICEINFO.memo
  is '备注';
comment on column YTJ_BASE_DEVICEINFO.create_user
  is '创建人员';
comment on column YTJ_BASE_DEVICEINFO.create_time
  is '创建时间';
comment on column YTJ_BASE_DEVICEINFO.update_user
  is '更新人员';
comment on column YTJ_BASE_DEVICEINFO.update_time
  is '更新时间';
comment on column YTJ_BASE_DEVICEINFO.oldid
  is '旧主键';
comment on column YTJ_BASE_DEVICEINFO.remark
  is '说明';
comment on column YTJ_BASE_DEVICEINFO.state
  is '设备状态：0正常；1停用。';
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
  is '基础数据-设备参数设置';
comment on column YTJ_BASE_DEVICE_EXTEND.device_id
  is '设备注册ID';
comment on column YTJ_BASE_DEVICE_EXTEND.extend_id
  is '扩展配件ID';
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
  is '基础数据-设备领用登记';
comment on column YTJ_BASE_DEVICE_TAKE.id
  is '主键';
comment on column YTJ_BASE_DEVICE_TAKE.jgbm
  is '机构编码';
comment on column YTJ_BASE_DEVICE_TAKE.hmsownernum
  is '领用数量';
comment on column YTJ_BASE_DEVICE_TAKE.remark
  is '备注';
comment on column YTJ_BASE_DEVICE_TAKE.create_user
  is '创建人员';
comment on column YTJ_BASE_DEVICE_TAKE.create_time
  is '创建时间';
comment on column YTJ_BASE_DEVICE_TAKE.update_user
  is '更新人员';
comment on column YTJ_BASE_DEVICE_TAKE.update_time
  is '更新时间';
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
  is '扩展设备的项目定义表';
comment on column YTJ_BASE_EXTENDDEF.id
  is '唯一ID';
comment on column YTJ_BASE_EXTENDDEF.extend_id
  is '扩展配件信息的ID';
comment on column YTJ_BASE_EXTENDDEF.checkdef_id
  is '检查项目定义表的ID';
comment on column YTJ_BASE_EXTENDDEF.ref_range
  is '参考范围值';
comment on column YTJ_BASE_EXTENDDEF.ref_check
  is '参考范围校验表达式';
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
  is '扩展设备信息表（一体机的配件等）';
comment on column YTJ_BASE_EXTENDINFO.id
  is '唯一ID';
comment on column YTJ_BASE_EXTENDINFO.devicetype
  is '设备类型，来自系统数据字典表DEVICE.TYPE：0001一体机；0002健康小屋；0003多参监护仪。';
comment on column YTJ_BASE_EXTENDINFO.name
  is '配件的名称';
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
  is '质量控制-血糖仪';
comment on column YTJ_HMSQC_GLU.id
  is '主键';
comment on column YTJ_HMSQC_GLU.devicesn
  is '设备编码';
comment on column YTJ_HMSQC_GLU.checkdate
  is '检查时间';
comment on column YTJ_HMSQC_GLU.glu_model
  is '血糖仪型号：GLU001';
comment on column YTJ_HMSQC_GLU.qltcontrl
  is '质控液型号：BG_QLT001';
comment on column YTJ_HMSQC_GLU.qc_result
  is '设备检测结果';
comment on column YTJ_HMSQC_GLU.glu_fqc
  is '最终控制结果：1正常;0异常。';
comment on column YTJ_HMSQC_GLU.checkuser
  is '检查人';
comment on column YTJ_HMSQC_GLU.icpcode
  is '检查机构';
comment on column YTJ_HMSQC_GLU.crtime
  is '新增/修改时间';
comment on column YTJ_HMSQC_GLU.oldid
  is '旧主键';
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
  is '质量控制-尿液分析';
comment on column YTJ_HMSQC_URINE.id
  is '主键';
comment on column YTJ_HMSQC_URINE.devicesn
  is '设备编码';
comment on column YTJ_HMSQC_URINE.checkdate
  is '检查时间';
comment on column YTJ_HMSQC_URINE.urine_model
  is '尿液仪型号：BC401';
comment on column YTJ_HMSQC_URINE.strips
  is '试纸条型号：BQ-11H (北乔)，DR-H11 (迪瑞)';
comment on column YTJ_HMSQC_URINE.qltcontrl
  is '质控液型号：BC_QLTYH (伊华)，BC_QLTDR (迪瑞)';
comment on column YTJ_HMSQC_URINE.urine_fqc
  is '最终控制结果：1正常；0异常。';
comment on column YTJ_HMSQC_URINE.checkuser
  is '检查人';
comment on column YTJ_HMSQC_URINE.icpcode
  is '检查机构';
comment on column YTJ_HMSQC_URINE.crtime
  is '新增/修改时间';
comment on column YTJ_HMSQC_URINE.oldid
  is '旧主键';
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
  is '质量控制-尿液分析项目表';
comment on column YTJ_HMSQC_URINE_ITEM.id
  is '主键';
comment on column YTJ_HMSQC_URINE_ITEM.urine_id
  is '检查单ID';
comment on column YTJ_HMSQC_URINE_ITEM.item_id
  is '检查项目参数ID';
comment on column YTJ_HMSQC_URINE_ITEM.itemvalue
  is '检查参数值';
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
