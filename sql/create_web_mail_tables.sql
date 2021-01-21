-- USER --
DROP TABLE IF EXISTS USER ; 

CREATE TABLE USER (
	id VARCHAR(40) primary key ,
	name VARCHAR(200) NOT NULL , 
	passwd VARCHAR(200),
	phone_no VARCHAR(200),
	
	UNIQUE KEY idx_user_name ( name )
);

INSERT INTO USER (id, name, passwd) VALUES 
( UUID(), 'admin', 'admin' ) ;


-- SYSTEM FILES --

-- 1 T_MAIL --
DROP TABLE IF EXISTS T_MAIL ;

CREATE TABLE T_MAIL ( 
MAILID	VARCHAR(40)	PRIMARY KEY NOT NULL COMMENT '메일아이디', 
TITLE	VARCHAR(1000)		NOT NULL COMMENT '제목', 
CONTENTFILEID	VARCHAR(40) COMMENT '본문파일아이디',
UGTYN	CHAR(1) DEFAULT 'N'	COMMENT '긴급여부', 					
SECURITYYN	CHAR(1) DEFAULT 'N'	COMMENT '보안여부',					
MAILSIZE	INTEGER(10) NOT NULL COMMENT '메일사이즈',
EMLHEADERID	VARCHAR(40) COMMENT 'EML헤더아이디',
EMLFILEID	VARCHAR(40) COMMENT 'EML파일아이디',
FILEATTACHYN	CHAR(1) DEFAULT 'N'	COMMENT '파일첨부여부',
IMGATTACHYN	CHAR(1) DEFAULT 'N'	COMMENT '이미지첨부여부',
ENCODING	VARCHAR(20) COMMENT '인코딩방식',
DELYN	CHAR(1) DEFAULT 'N' COMMENT '삭제여부',
MAKEDATE	DATE COMMENT '작성일시',
SENDDATE	DATE COMMENT '발송일시',
RCVDATE	DATE COMMENT '수신일시',
RCVLISTINFO	VARCHAR(300) COMMENT '수신목록정보', 
RCVUSERID	VARCHAR(200) COMMENT '수신자아이디', 
RCVTOTCNT	INTEGER(6) DEFAULT 0	COMMENT '수신자열람건수', 
RCVREADCNT	INTEGER(6) default 0	COMMENT '수신자읽음건수',
ETCPARAM1	VARCHAR(100) COMMENT '기타속성1',
ETCPARAM2	VARCHAR(100) COMMENT '기타속성2',
ETCPARAM3	VARCHAR(100) COMMENT '기타속성3',
ETCPARAM4	VARCHAR(100) COMMENT '기타속성4',
ETCPARAM5	VARCHAR(100) COMMENT '기타속성5',
DEVICE	VARCHAR(20) DEFAULT 'PC'	COMMENT '장치',
REGUSERID	VARCHAR(40) COMMENT '등록자아이디',
REGDATE	DATE COMMENT '등록일시', 
CHGUSERID	VARCHAR(40) COMMENT '변경자아이디',
CHGDATE	DATE COMMENT '변경일시',
LARGEYN	CHAR(1) DEFAULT 'N'	COMMENT '대용량메일여부',
CONVERSIONYN	VARCHAR(10) DEFAULT 'N' COMMENT '컨버젼여부',
SYSTEMMAILYN	CHAR(1) DEFAULT 'N' , 
COMMENTCNT	INTEGER(5) DEFAULT 0	COMMENT '댓글개수'
) ; 

DROP TABLE if EXISTS t_mail_sendinfo; 

create table t_mail_sendinfo (
	sendinfoid varchar(40) not null primary key comment '발송정보아이디',
	mailid varchar(40) comment '메일아이디',
	senduserid varchar(40) comment '발송자아이디',
	sender varchar(300) comment '발송자',
	replyto varchar(200) comment '답장주소',
	outboxsaveyn char(1) default 'Y' comment '보낸편지함저장여부',
	individualsendyn char(1) default 'N' comment '개별전송여부',
	bookyn char(1) default 'N' comment '예약여부',
	bookfileid varchar(40) comment '예약파일아이디',
	timezone varchar(20) comment '타임존',
	timezonedate date comment '타임존일시',
	bookdate date comment '예약일시',
	bookstatus varchar(20) comment '예약상태',
	device varchar(20) default 'PC' comment '장치',
	reguserid varchar(40) comment '등록자아이디',
	regdate date comment '등록일시',
	chguserid varchar(40) comment '변경자아이디',
	chgdate date comment '변경일시'
) ;

-- 오종택 --
-- T_MAIL_RCVLIST_SEARCH
drop table if exists T_MAIL_RCVLIST_SEARCH ;

CREATE TABLE T_MAIL_RCVLIST_SEARCH(
	MAILID VARCHAR(40) PRIMARY KEY COMMENT '메일아이디',
	SEARCHCONTENT LONGTEXT COMMENT '받는사람 검색정보',
	DEVICE VARCHAR(20) DEFAULT 'PC' COMMENT '장치',
	REGUSERID VARCHAR(40) COMMENT '등록자아이디',
	REGDATE DATE COMMENT '등록일시',
	CHGUSERID VARCHAR(40) COMMENT '변경자아이디',
	CHGDATE DATE COMMENT '변경일시'
) ;

-- t_mail_simplecontent , 정문종

DROP TABLE if EXISTS t_mail_simplecontent ; 

create table t_mail_simplecontent (
	mailid varchar(40) primary key not null comment '메일아이디',
	simplecontent varchar(400) comment '간단내용',
	searchcontent longtext comment '검색내용',
	device varchar(20) default 'PC' comment '장치',
	reguserid varchar(40) comment '등록자아이디',
	regdate date comment '등록일시',
	chguserid varchar(40) comment '변경자아이디',
	chgdate date comment '변경일시'	
);

-- t_mail_pop3uid 김윤민

DROP TABLE if EXISTS t_mail_pop3uid ; 

create table t_mail_pop3uid(
 mailid varchar(40) primary key not null comment'메일아이디',
 userid varchar(40) comment'사용자아이디',
 email varchar(200) comment'이메일' ,
 emailuid varchar(100) not null comment'이메일UID',
 delyn char(1) default 'N' comment'삭제여부',
 device varchar(20) default 'PC' comment'장치',
 reguserid varchar(40) comment'등록자아이디',
 regdate date comment'등록일시',
 chguserid varchar(40) comment'변경자아이디',
 chgdate date comment'변경일시'
);

-- T_MAIL_BOXLINK 김경현

DROP TABLE if EXISTS T_MAIL_BOXLINK ; 

CREATE TABLE T_MAIL_BOXLINK (
	userid VARCHAR(40) NOT NULL COMMENT'사용자아이디',
	MAILBOXID VARCHAR(40) NOT NULL COMMENT'메일함아이디',
	MAILID VARCHAR(40) NOT NULL COMMENT'메일아이디',
	INOUTTYPE VARCHAR(20) COMMENT'수발신타입',
	EMLHEADERID VARCHAR(40) COMMENT'수발신타입',
	BOXLINKID VARCHAR(80) COMMENT'아이디',
	RCVSHARELINKYN char(1) default 'N'  COMMENT'공유되었는지 여부',
	ORGMAILBOXID VARCHAR(40) COMMENT'휴지통이동 등 시에 이전 함정보를 가지고 있음',
	OVERCAPYN char(1)  default 'N' COMMENT'용량초과로 보이지 않음여부디',
	DEVICE VARCHAR(20) default 'PC'  COMMENT'장치',
	REGUSERID VARCHAR(40) COMMENT'등록자아이디',
	REGDATE DATE COMMENT'등록일시',
	CHGUSERID VARCHAR(40) COMMENT'변경자아이디',
	CHGDATE DATE COMMENT'변경일시',
	RCVDATE DATE COMMENT'수신일',
	PRIMARY KEY (userid, MAILBOXID, MAILID)
);

-- T_MAIL_STATUS 한상덕

DROP TABLE IF EXISTS T_MAIL_STATUS ;

CREATE TABLE T_MAIL_STATUS (
  MAILID            VARCHAR(40)     NOT NULL comment'메일아이디',
  USERID            VARCHAR(40)     NOT NULL comment'사용자아이디',
  READYN            CHAR(1)         DEFAULT 'N'              NULL comment'열람여부',
  IMPTYN            CHAR(1)         DEFAULT 'N'              NULL comment'중요메일여부',
  REPLYYN           CHAR(1)         DEFAULT 'N'              NULL comment'답변여부',
  DELIVERYYN        CHAR(1)         DEFAULT 'N'              NULL comment'전달여부',
  SHAREYN           CHAR(1)         DEFAULT 'N'              NULL comment'공유여부',
  DEVICE            VARCHAR(20)    DEFAULT 'PC'         NULL comment'장치',
  SHAREBOXLINKID    VARCHAR(80)         NULL comment'공유함링크정보',
  REGUSERID         VARCHAR(40)         NULL comment'등록자아이디',
  REGDATE           DATE                      NULL comment'등록일시',
  CHGUSERID         VARCHAR(40)         NULL comment'변경자아이디',
  CHGDATE           DATE                      NULL comment'변경일시'
  , PRIMARY KEY( mailid , userid )
) ; 

-- 김현준T_MAIL_POP3SMTP
DROP TABLE if EXISTS T_MAIL_POP3SMTP ;

create table T_MAIL_POP3SMTP (
USERID varchar(40) not null comment '사용자아이디',
EMAIL varchar(200) not null comment '이메일',
SENDERNAME varchar(100) not null comment '보내는사람이름',
POP3IMAPTYPE varchar(10) not null comment 'POP3 or IMAP',
POP3ID varchar(60) not null comment 'POP3아이디',
POP3PASSWD varchar(100) not null comment 'POP3패스워드',
POP3SERVER varchar(60) not null comment 'POP3서버',
POP3PORT integer(4) not null default 0 comment 'POP3포트',
POP3SSLYN char(1) not null default 'N' comment 'POP3SSL여부',
POP3SAMEUSEYN char(18) not null default 'Y' comment 'POP3동일사용여부',
SMTPID varchar(2) comment 'SMTP아이디',
SMTPPASSWD varchar(100) comment 'SMTP패스워드',
SMTPSERVER varchar(60) comment 'SMTP서버',
SMTPSCRTYYN char(1) not null default 'Y' comment 'SMTP보안인증여부',
SMTPPORT integer(4) default 0 comment 'SMTP포트',
SMTPCNNCTTYPE varchar(20) default 'SSL' comment 'SMTP연결유형',
MAILBOXID varchar(40) not null comment '메일박스아이디',
ORGMAILSAVEYN char(1) not null default 'N' comment '원본보관여부',
DELSYNCYN char(1) not null default 'N' comment '디폴트메일여부',
COMPANYMAILYN char(1) not null default 'N' comment '회사메일여부',
LASTACCESSTIME date comment '마지막접속일시',
LASTFAILTIME date comment '마지막실패일시',
RCVCNT integer(10) not null default 0 comment '수신건수',
DELCNT integer(10) not null default 0 comment '삭제건수',
FAILCNT integer(10) not null default 0 comment '실패건수',
ACCESSCNT integer(10) not null default 0 comment '접속건수',
TODAYRCVCNT integer(10) not null default 0 comment '오늘수신건수',
TODAYDELCNT integer(10) not null default 0 comment '오늘삭제건수',
TODAYFAILCNT integer(10) not null default 0 comment '오늘실패건수',
TODAYACCESSCNT integer(10) not null default 0 comment '오늘접속건수',
COMPANYID varchar(40) comment '회사아이디',
DEVICE varchar(20) default 'PC' comment '장치',
REGUSERID varchar(40) comment '등록자아이디',
REGDATE date comment '등록일시',
CHGUSERID varchar(40) comment '변경자아이디',
CHGDATE date comment '변경일시',
primary key (USERID, EMAIL)
);

-- 박승균 t_mail_rcvinfo
DROP TABLE IF EXISTS t_mail_rcvinfo;

create table t_mail_rcvinfo (
	rcvinfoid varchar(40) primary key not null comment '수신목록아이디',
	mailid varchar(40) COMMENT '메일아이디',
	rcvtype varchar(20) COMMENT '수신자타입',
	rcvidtype varchar(20) COMMENT '수신자아이디타입',
	rcvid varchar(200) comment '수신자아이디',
	rcvname varchar(200) COMMENT '수신자명',
	device varchar(20) DEFAULT 'PC' COMMENT '장치',
	reguserid varchar(40) COMMENT '등록자아이디',
	regdate date COMMENT '등록일시',
	chguserid varchar(40) COMMENT '변경자아이디',
	chgdate date COMMENT '변경일시'
);

-- 김연진 t_mail_mailbox
DROP TABLE IF EXISTS t_mail_mailbox ;

CREATE TABLE t_mail_mailbox (
  USERID       VARCHAR(40) 	 NOT NULL COMMENT '사용자아이디',
  MAILBOXID    VARCHAR(40) 	 NOT NULL COMMENT '메일함아이디',
  MAILBOXNAME 	VARCHAR(200) 	 NOT NULL COMMENT '메일함이름',
  TREEID 		VARCHAR(1000)   NULL COMMENT '트리아이디',
  UPTREEID 		VARCHAR(1000)   NULL COMMENT '상위트리아이디',
  DEPTH        INTEGER(5)      DEFAULT 0 NULL COMMENT '레벨',
  SORTNO       INTEGER(5)      DEFAULT 0 NULL COMMENT '순서',
  READCNT      INTEGER(10)     DEFAULT 0 NOT NULL COMMENT '열람건수',
  TOTCNT       INTEGER(10)     DEFAULT 0 NOT NULL COMMENT '전체건수',
  USECAP       INTEGER(11)     DEFAULT 0 NOT NULL COMMENT '사용용량',
  UPDYN        CHAR(1)         DEFAULT 'Y'     NULL COMMENT '수정가능여부',
  DEVICE       VARCHAR(20)     DEFAULT 'PC'    NULL COMMENT '장치',
  REGUSERID    VARCHAR(40)     NULL COMMENT '등록자아이디',
  REGDATE      DATE            NULL COMMENT '등록일시',
  CHGUSERID    VARCHAR(40)     NULL COMMENT '수정자아이디',
  CHGDATE      DATE            NULL COMMENT '수정일지',
  IMAPBOXID    INTEGER         DEFAULT 0 NULL,
  IMAPBOXNAME  VARCHAR(500)    NULL ,
  NOINFERIORS    CHAR(1)       DEFAULT 'N'     NULL ,
  NOSELECT       CHAR(1)       DEFAULT 'N'     NULL ,
  READONLY       CHAR(1)       DEFAULT 'N'     NULL ,
  NEXTUID        INTEGER       DEFAULT 1       NULL ,
  UIDVALIDITY    INTEGER       NULL ,
  BOOKMARKYN     CHAR(1)       DEFAULT 'Y'     NULL ,
  PRIMARY KEY (USERID, MAILBOXID)
);


-- T_MAIL_RCVLIST 석건원
DROP TABLE IF EXISTS T_MAIL_RCVLIST ;

CREATE TABLE T_MAIL_RCVLIST (
  RCVLISTID VARCHAR(40) PRIMARY KEY   NOT NULL COMMENT '수신목록아이디',
  MAILID VARCHAR(40) NOT NULL COMMENT '메일아이디',
  RCVTYPE VARCHAR(20) NOT NULL COMMENT '수신타입(수신,참조,숨은참조)',
  RCVIDTYPE VARCHAR(20) NOT NULL COMMENT '수신자아이디타입(EMAIL/USERID)',
  RCVUSERID VARCHAR(200) NOT NULL COMMENT '수신자아이디',
  RCVINFO VARCHAR(300) NOT NULL COMMENT '수신자정보부',
  OVERCAPYN CHAR(1) DEFAULT 'N' NOT NULL COMMENT '용량초과여부',
  READDATE DATE COMMENT '열람일시',
  DEVICE VARCHAR(20) DEFAULT 'PC'COMMENT '장치',
  REGUSERID VARCHAR(40) COMMENT '등록자아이디',
  REGDATE DATE COMMENT '등록일시',
  CHGUSERID VARCHAR(40) COMMENT '변경자아이디',
  CHGDATE DATE COMMENT '변경일시',
  SENDFAILYN CHAR(1)
);

-- 성병문 T_MAIL_USESIZE

DROP TABLE if EXISTS T_MAIL_USESIZE;

CREATE TABLE T_MAIL_USESIZE ( 
	USERID	VARCHAR(40)	PRIMARY key	NOT NULL	COMMENT'사용자아이디', 
	TOTCAP	DOUBLE(11,1) DEFAULT 0	COMMENT '총용량', 
	USECAP	DOUBLE(11,1) DEFAULT 0	COMMENT '사용용량', 
	TOTCNT	INTEGER(10) DEFAULT 0	COMMENT '전체건수', 
	READCNT	INTEGER(10) DEFAULT 0	COMMENT '열람건수', 
	OVERCNT	INTEGER(10) DEFAULT 0	COMMENT '용량초과건수', 
	DEVICE	VARCHAR(20) DEFAULT 'PC'	COMMENT '장치', 
	REGUSERID	VARCHAR(40)				COMMENT '등록자아이디',
	REGDATE	DATE				COMMENT '등록일시', 
	CHGUSERID	VARCHAR(40)				COMMENT '변경자아이디',
	CHGDATE	DATE				COMMENT '변경일시',
	IMPORTUNREADCNT INTEGER(10) DEFAULT 0	, 
	IMPORTCNT	INTEGER(10) DEFAULT 0	
) ; 

-- END
