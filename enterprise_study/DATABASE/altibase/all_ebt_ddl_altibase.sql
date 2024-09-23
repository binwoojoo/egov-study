DROP TABLE IDS CASCADE CONSTRAINTS;
CREATE TABLE IDS  (
  TABLE_NAME varchar2(20) NOT NULL,
  NEXT_ID number(30,0)DEFAULT 0 NOT NULL ,
  CONSTRAINT IDS_PK PRIMARY KEY (TABLE_NAME)
);
DROP TABLE LETTCCMMNCLCODE CASCADE CONSTRAINTS;
CREATE TABLE LETTCCMMNCLCODE (
  CL_CODE char(3) NOT NULL,
  CL_CODE_NM varchar2(60) ,
  CL_CODE_DC varchar2(200) ,
  USE_AT char(1) ,
  FRST_REGIST_PNTTM DATE ,
  FRST_REGISTER_ID varchar2(20) ,
  LAST_UPDT_PNTTM DATE ,
  LAST_UPDUSR_ID varchar2(20) ,
  CONSTRAINT LETTCCMMNCLCODE_PK PRIMARY KEY (CL_CODE)
) ;
DROP TABLE LETTCCMMNCODE CASCADE CONSTRAINTS;
CREATE TABLE LETTCCMMNCODE (
  CODE_ID varchar2(6) NOT NULL,
  CODE_ID_NM varchar2(60) ,
  CODE_ID_DC varchar2(200) ,
  USE_AT char(1) ,
  CL_CODE char(3) ,
  FRST_REGIST_PNTTM DATE ,
  FRST_REGISTER_ID varchar2(20) ,
  LAST_UPDT_PNTTM DATE ,
  LAST_UPDUSR_ID varchar2(20) ,
  CONSTRAINT LETTCCMMNCODE_PK PRIMARY KEY (CODE_ID),
  CONSTRAINT LETTCCMMNCODE_ibfk_1 FOREIGN KEY (CL_CODE) REFERENCES LETTCCMMNCLCODE (CL_CODE)
) ;
DROP TABLE LETTCCMMNDETAILCODE CASCADE CONSTRAINTS;
CREATE TABLE LETTCCMMNDETAILCODE (
  CODE_ID varchar2(6) NOT NULL,
  CODE varchar2(15) NOT NULL,
  CODE_NM varchar2(60) ,
  CODE_DC varchar2(200) ,
  USE_AT char(1) ,
  FRST_REGIST_PNTTM DATE ,
  FRST_REGISTER_ID varchar2(20) ,
  LAST_UPDT_PNTTM DATE ,
  LAST_UPDUSR_ID varchar2(20) ,
  CONSTRAINT LETTCCMMNDETAILCODE_PK PRIMARY KEY (CODE_ID,CODE),
  CONSTRAINT LETTCCMMNDETAILCODE_ibfk_1 FOREIGN KEY (CODE_ID) REFERENCES LETTCCMMNCODE (CODE_ID)
) ;
DROP TABLE LETTNORGNZTINFO CASCADE CONSTRAINTS;
CREATE TABLE LETTNORGNZTINFO (
  ORGNZT_ID char(20) DEFAULT '' NOT NULL,
  ORGNZT_NM varchar2(20) NOT NULL,
  ORGNZT_DC varchar2(100) ,
  CONSTRAINT LETTNORGNZTINFO_PK PRIMARY KEY (ORGNZT_ID)
) ;
DROP TABLE LETTNAUTHORGROUPINFO CASCADE CONSTRAINTS;
CREATE TABLE LETTNAUTHORGROUPINFO (
  GROUP_ID char(20) DEFAULT '' NOT NULL,
  GROUP_NM varchar2(60) NOT NULL,
  GROUP_CREAT_DE char(20) NOT NULL,
  GROUP_DC varchar2(100) ,
  CONSTRAINT LETTNAUTHORGROUPINFO_PK PRIMARY KEY (GROUP_ID)
) ;
DROP TABLE LETTNAUTHORINFO CASCADE CONSTRAINTS;
CREATE TABLE LETTNAUTHORINFO (
  AUTHOR_CODE varchar2(30) DEFAULT '' NOT NULL,
  AUTHOR_NM varchar2(60) NOT NULL,
  AUTHOR_DC varchar2(200) ,
  AUTHOR_CREAT_DE char(20) NOT NULL,
  CONSTRAINT LETTNAUTHORINFO_PK PRIMARY KEY (AUTHOR_CODE)
) ;
DROP TABLE LETTNROLES_HIERARCHY CASCADE CONSTRAINTS;
CREATE TABLE LETTNROLES_HIERARCHY (
  PARNTS_ROLE varchar2(30) NOT NULL,
  CHLDRN_ROLE varchar2(30) NOT NULL,
  CONSTRAINT LETTNROLES_HIERARCHY_PK PRIMARY KEY (PARNTS_ROLE,CHLDRN_ROLE),
  CONSTRAINT LETTNROLES_HIERARCHY_ibfk_2 FOREIGN KEY (CHLDRN_ROLE) REFERENCES LETTNAUTHORINFO (AUTHOR_CODE) ON DELETE CASCADE,
  CONSTRAINT LETTNROLES_HIERARCHY_ibfk_1 FOREIGN KEY (PARNTS_ROLE) REFERENCES LETTNAUTHORINFO (AUTHOR_CODE) ON DELETE CASCADE
) ;
DROP TABLE LETTNROLEINFO CASCADE CONSTRAINTS;
CREATE TABLE LETTNROLEINFO (
  ROLE_CODE varchar2(50) DEFAULT '' NOT NULL,
  ROLE_NM varchar2(60) NOT NULL,
  ROLE_PTTRN varchar2(300) ,
  ROLE_DC varchar2(200) ,
  ROLE_TY varchar2(80) ,
  ROLE_SORT varchar2(10) ,
  ROLE_CREAT_DE char(20) NOT NULL,
  CONSTRAINT LETTNROLEINFO_PK PRIMARY KEY (ROLE_CODE)
) ;
DROP TABLE LETTNAUTHORROLERELATE CASCADE CONSTRAINTS;
CREATE TABLE LETTNAUTHORROLERELATE (
  AUTHOR_CODE varchar2(30) NOT NULL,
  ROLE_CODE varchar2(50) NOT NULL,
  CREAT_DT DATE ,
  CONSTRAINT LETTNAUTHORROLERELATE_PK PRIMARY KEY (AUTHOR_CODE,ROLE_CODE),
  CONSTRAINT LETTNAUTHORROLERELATE_ibfk_2 FOREIGN KEY (ROLE_CODE) REFERENCES LETTNROLEINFO (ROLE_CODE) ON DELETE CASCADE,
  CONSTRAINT LETTNAUTHORROLERELATE_ibfk_1 FOREIGN KEY (AUTHOR_CODE) REFERENCES LETTNAUTHORINFO (AUTHOR_CODE) ON DELETE CASCADE
) ;
DROP TABLE LETTNEMPLYRINFO CASCADE CONSTRAINTS;
CREATE TABLE LETTNEMPLYRINFO (
  EMPLYR_ID varchar2(20) NOT NULL,
  ORGNZT_ID char(20) ,
  USER_NM varchar2(60) NOT NULL,
  PASSWORD varchar2(200) NOT NULL,
  EMPL_NO varchar2(20) ,
  IHIDNUM varchar2(200) ,
  SEXDSTN_CODE char(1) ,
  BRTHDY char(20) ,
  FXNUM varchar2(20) ,
  HOUSE_ADRES varchar2(100) ,
  PASSWORD_HINT varchar2(100) NOT NULL,
  PASSWORD_CNSR varchar2(100) NOT NULL,
  HOUSE_END_TELNO varchar2(4) ,
  AREA_NO varchar2(4) ,
  DETAIL_ADRES varchar2(100) ,
  ZIP varchar2(6) ,
  OFFM_TELNO varchar2(20) ,
  MBTLNUM varchar2(20) ,
  EMAIL_ADRES varchar2(50) ,
  OFCPS_NM varchar2(60) ,
  HOUSE_MIDDLE_TELNO varchar2(4) ,
  GROUP_ID char(20) ,
  PSTINST_CODE char(8) ,
  EMPLYR_STTUS_CODE varchar2(15) NOT NULL,
  ESNTL_ID char(20) NOT NULL,
  CRTFC_DN_VALUE varchar2(20) ,
  SBSCRB_DE DATE ,
  CONSTRAINT LETTNEMPLYRINFO_PK PRIMARY KEY (EMPLYR_ID),
  CONSTRAINT LETTNEMPLYRINFO_ibfk_2 FOREIGN KEY (GROUP_ID) REFERENCES LETTNAUTHORGROUPINFO (GROUP_ID) ON DELETE CASCADE,
  CONSTRAINT LETTNEMPLYRINFO_ibfk_1 FOREIGN KEY (ORGNZT_ID) REFERENCES LETTNORGNZTINFO (ORGNZT_ID) ON DELETE CASCADE
) ;
DROP TABLE LETTNEMPLYRSCRTYESTBS CASCADE CONSTRAINTS;
CREATE TABLE LETTNEMPLYRSCRTYESTBS (
  SCRTY_DTRMN_TRGET_ID varchar2(20) NOT NULL,
  MBER_TY_CODE varchar2(15) ,
  AUTHOR_CODE varchar2(30) NOT NULL,
  CONSTRAINT LETTNEMPLYRSCRTYESTBS_PK PRIMARY KEY (SCRTY_DTRMN_TRGET_ID),
  CONSTRAINT LETTNEMPLYRSCRTYESTBS_ibfk_4 FOREIGN KEY (AUTHOR_CODE) REFERENCES LETTNAUTHORINFO (AUTHOR_CODE)
) ;
DROP TABLE LETTNTMPLATINFO CASCADE CONSTRAINTS;
CREATE TABLE LETTNTMPLATINFO (
  TMPLAT_ID char(20) DEFAULT '' NOT NULL,
  TMPLAT_NM varchar2(255) ,
  TMPLAT_COURS varchar2(2000) ,
  USE_AT char(1) ,
  TMPLAT_SE_CODE char(6) ,
  FRST_REGISTER_ID varchar2(20) ,
  FRST_REGIST_PNTTM DATE ,
  LAST_UPDUSR_ID varchar2(20) ,
  LAST_UPDT_PNTTM DATE ,
  CONSTRAINT LETTNTMPLATINFO_PK PRIMARY KEY (TMPLAT_ID)
) ;
DROP TABLE LETTNBBSMASTER CASCADE CONSTRAINTS;
CREATE TABLE LETTNBBSMASTER (
  BBS_ID char(20) NOT NULL,
  BBS_NM varchar2(255) NOT NULL,
  BBS_INTRCN varchar2(2400) ,
  BBS_TY_CODE char(6) NOT NULL,
  BBS_ATTRB_CODE char(6) NOT NULL,
  REPLY_POSBL_AT char(1) ,
  FILE_ATCH_POSBL_AT char(1) NOT NULL,
  ATCH_POSBL_FILE_NUMBER number(2,0) NOT NULL,
  ATCH_POSBL_FILE_SIZE number(8,0) ,
  USE_AT char(1) NOT NULL,
  TMPLAT_ID char(20) ,
  FRST_REGISTER_ID varchar2(20) NOT NULL,
  FRST_REGIST_PNTTM DATE NOT NULL,
  LAST_UPDUSR_ID varchar2(20) ,
  LAST_UPDT_PNTTM DATE ,
  CONSTRAINT LETTNBBSMASTER_PK PRIMARY KEY (BBS_ID)
) ;
DROP TABLE LETTNBBSUSE CASCADE CONSTRAINTS;
CREATE TABLE LETTNBBSUSE (
  BBS_ID char(20) NOT NULL,
  TRGET_ID char(20) DEFAULT '' NOT NULL,
  USE_AT char(1) NOT NULL,
  REGIST_SE_CODE char(6) ,
  FRST_REGIST_PNTTM DATE ,
  FRST_REGISTER_ID varchar2(20) NOT NULL,
  LAST_UPDT_PNTTM DATE ,
  LAST_UPDUSR_ID varchar2(20) ,
  CONSTRAINT LETTNBBSUSE_PK PRIMARY KEY (BBS_ID,TRGET_ID),
  CONSTRAINT LETTNBBSUSE_ibfk_1 FOREIGN KEY (BBS_ID) REFERENCES LETTNBBSMASTER (BBS_ID)
) ;
DROP TABLE LETTNBBS CASCADE CONSTRAINTS;
CREATE TABLE LETTNBBS (
  NTT_ID number(20,0) NOT NULL,
  BBS_ID char(20) NOT NULL,
  NTT_NO number(20,0) ,
  NTT_SJ varchar2(2000) ,
  NTT_CN CLOB,
  ANSWER_AT char(1) ,
  PARNTSCTT_NO number(10,0) ,
  ANSWER_LC number(11) ,
  SORT_ORDR number(8,0) ,
  RDCNT number(10,0) ,
  USE_AT char(1) NOT NULL,
  NTCE_BGNDE char(20) ,
  NTCE_ENDDE char(20) ,
  NTCR_ID varchar2(20) ,
  NTCR_NM varchar2(20) ,
  PASSWORD varchar2(200) ,
  ATCH_FILE_ID char(20) ,
  FRST_REGIST_PNTTM DATE NOT NULL,
  FRST_REGISTER_ID varchar2(20) NOT NULL,
  LAST_UPDT_PNTTM DATE ,
  LAST_UPDUSR_ID varchar2(20) ,
  CONSTRAINT LETTNBBS_PK PRIMARY KEY (NTT_ID,BBS_ID),
  CONSTRAINT LETTNBBS_ibfk_1 FOREIGN KEY (BBS_ID) REFERENCES LETTNBBSMASTER (BBS_ID)
) ;
DROP TABLE LETTCZIP CASCADE CONSTRAINTS;
CREATE TABLE LETTCZIP (
  ZIP varchar2(6) NOT NULL,
  SN number(10,0) DEFAULT '0' NOT NULL,
  CTPRVN_NM varchar2(20) ,
  SIGNGU_NM varchar2(20) ,
  EMD_NM varchar2(60) ,
  LI_BULD_NM varchar2(60) ,
  LNBR_DONG_HO varchar2(20) ,
  FRST_REGIST_PNTTM DATE ,
  FRST_REGISTER_ID varchar2(20) ,
  LAST_UPDT_PNTTM DATE ,
  LAST_UPDUSR_ID varchar2(20) ,
  CONSTRAINT LETTCZIP_PK PRIMARY KEY (ZIP,SN)
) ;
DROP TABLE LETTHEMPLYRINFOCHANGEDTLS CASCADE CONSTRAINTS;
CREATE TABLE LETTHEMPLYRINFOCHANGEDTLS (
  EMPLYR_ID varchar2(20) NOT NULL,
  CHANGE_DE char(20) DEFAULT '' NOT NULL,
  ORGNZT_ID char(20) ,
  GROUP_ID char(20) ,
  EMPL_NO varchar2(20) ,
  SEXDSTN_CODE char(1) ,
  BRTHDY char(20) ,
  FXNUM varchar2(20) ,
  HOUSE_ADRES varchar2(100) ,
  HOUSE_END_TELNO varchar2(4),
  AREA_NO varchar2(4) ,
  DETAIL_ADRES varchar2(100),
  ZIP varchar2(6),
  OFFM_TELNO varchar2(20) ,
  MBTLNUM varchar2(20) ,
  EMAIL_ADRES varchar2(50) ,
  HOUSE_MIDDLE_TELNO varchar2(4) ,
  PSTINST_CODE char(8) ,
  EMPLYR_STTUS_CODE varchar2(15),
  ESNTL_ID char(20) ,
  CONSTRAINT LETTHEMPLYRINFOCHANGEDTLS_PK PRIMARY KEY (EMPLYR_ID,CHANGE_DE)
) ;
DROP TABLE LETTNBBSMASTEROPTN CASCADE CONSTRAINTS;
CREATE TABLE LETTNBBSMASTEROPTN (
  BBS_ID char(20) DEFAULT '' NOT NULL,
  ANSWER_AT char(1) DEFAULT '' NOT NULL,
  STSFDG_AT char(1) DEFAULT '' NOT NULL,
  FRST_REGIST_PNTTM DATE DEFAULT SYSDATE NOT NULL,
  LAST_UPDT_PNTTM DATE ,
  FRST_REGISTER_ID varchar2(20) DEFAULT '' NOT NULL,
  LAST_UPDUSR_ID varchar2(20) ,
  CONSTRAINT LETTNBBSMASTEROPTN_PK PRIMARY KEY (BBS_ID)
) ;
DROP TABLE LETTNENTRPRSMBER CASCADE CONSTRAINTS;
CREATE TABLE LETTNENTRPRSMBER (
  ENTRPRS_MBER_ID varchar2(20) DEFAULT '' NOT NULL,
  ENTRPRS_SE_CODE char(15) ,
  BIZRNO varchar2(10) ,
  JURIRNO varchar2(13) ,
  CMPNY_NM varchar2(60) NOT NULL,
  CXFC varchar2(50) ,
  ZIP varchar2(6) ,
  ADRES varchar2(100) ,
  ENTRPRS_MIDDLE_TELNO varchar2(4) ,
  FXNUM varchar2(20) ,
  INDUTY_CODE char(15) ,
  APPLCNT_NM varchar2(50) ,
  APPLCNT_IHIDNUM varchar2(200) ,
  SBSCRB_DE DATE ,
  ENTRPRS_MBER_STTUS varchar2(15) ,
  ENTRPRS_MBER_PASSWORD varchar2(200) NOT NULL,
  ENTRPRS_MBER_PASSWORD_HINT varchar2(100) NOT NULL,
  ENTRPRS_MBER_PASSWORD_CNSR varchar2(100) NOT NULL,
  GROUP_ID char(20) ,
  DETAIL_ADRES varchar2(100) ,
  ENTRPRS_END_TELNO varchar2(4) ,
  AREA_NO varchar2(4) ,
  APPLCNT_EMAIL_ADRES varchar2(50) ,
  ESNTL_ID char(20) NOT NULL,
  CONSTRAINT LETTNENTRPRSMBER_PK PRIMARY KEY (ENTRPRS_MBER_ID),
  CONSTRAINT LETTNENTRPRSMBER_ibfk_1 FOREIGN KEY (GROUP_ID) REFERENCES LETTNAUTHORGROUPINFO (GROUP_ID) ON DELETE CASCADE
) ;
DROP TABLE LETTNFILE CASCADE CONSTRAINTS;
CREATE TABLE LETTNFILE (
  ATCH_FILE_ID char(20) NOT NULL,
  CREAT_DT DATE NOT NULL,
  USE_AT char(1) ,
  CONSTRAINT LETTNFILE_PK PRIMARY KEY (ATCH_FILE_ID)
) ;
DROP TABLE LETTNFILEDETAIL CASCADE CONSTRAINTS;
CREATE TABLE LETTNFILEDETAIL (
  ATCH_FILE_ID char(20) NOT NULL,
  FILE_SN number(10,0) NOT NULL,
  FILE_STRE_COURS varchar2(2000) NOT NULL,
  STRE_FILE_NM varchar2(255) NOT NULL,
  ORIGNL_FILE_NM varchar2(255) ,
  FILE_EXTSN varchar2(20) NOT NULL,
  FILE_CN CLOB,
  FILE_SIZE number(8,0) ,
  CONSTRAINT LETTNFILEDETAIL_PK PRIMARY KEY (ATCH_FILE_ID,FILE_SN),
  CONSTRAINT LETTNFILEDETAIL_ibfk_1 FOREIGN KEY (ATCH_FILE_ID) REFERENCES LETTNFILE (ATCH_FILE_ID)
) ;
DROP TABLE LETTNGNRLMBER CASCADE CONSTRAINTS;
CREATE TABLE LETTNGNRLMBER (
  MBER_ID varchar2(20) DEFAULT '' NOT NULL,
  PASSWORD varchar2(200) NOT NULL,
  PASSWORD_HINT varchar2(100) ,
  PASSWORD_CNSR varchar2(100) ,
  IHIDNUM varchar2(200) ,
  MBER_NM varchar2(50) NOT NULL,
  ZIP varchar2(6) ,
  ADRES varchar2(100) ,
  AREA_NO varchar2(4) ,
  MBER_STTUS varchar2(15) ,
  DETAIL_ADRES varchar2(100) ,
  END_TELNO varchar2(4) ,
  MBTLNUM varchar2(20) ,
  GROUP_ID char(20) ,
  MBER_FXNUM varchar2(20) ,
  MBER_EMAIL_ADRES varchar2(50) ,
  MIDDLE_TELNO varchar2(4) ,
  SBSCRB_DE DATE ,
  SEXDSTN_CODE char(1) ,
  ESNTL_ID char(20) NOT NULL,
  CONSTRAINT LETTNGNRLMBER_PK PRIMARY KEY (MBER_ID),
  CONSTRAINT LETTNGNRLMBER_ibfk_1 FOREIGN KEY (GROUP_ID) REFERENCES LETTNAUTHORGROUPINFO (GROUP_ID) ON DELETE CASCADE
) ;
DROP TABLE LETTNLOGINLOG CASCADE CONSTRAINTS;
CREATE TABLE LETTNLOGINLOG (
  LOG_ID char(20) NOT NULL,
  CONECT_ID varchar2(20) ,
  CONECT_IP varchar2(23) ,
  CONECT_MTHD char(4) ,
  ERROR_OCCRRNC_AT char(1) ,
  ERROR_CODE char(3) ,
  CREAT_DT DATE ,
  CONSTRAINT LETTNLOGINLOG_PK PRIMARY KEY (LOG_ID)
) ;
DROP TABLE LETTNLOGINPOLICY CASCADE CONSTRAINTS;
CREATE TABLE LETTNLOGINPOLICY (
  EMPLYR_ID varchar2(20) DEFAULT '' NOT NULL,
  IP_INFO varchar2(23) NOT NULL,
  DPLCT_PERM_AT char(1) NOT NULL,
  LMTT_AT char(1) NOT NULL,
  FRST_REGISTER_ID varchar2(20) ,
  FRST_REGIST_PNTTM DATE ,
  LAST_UPDUSR_ID varchar2(20) ,
  LAST_UPDT_PNTTM DATE ,
  CONSTRAINT LETTNLOGINPOLICY_PK PRIMARY KEY (EMPLYR_ID)
) ;
DROP TABLE LETTNPROGRMLIST CASCADE CONSTRAINTS;
CREATE TABLE LETTNPROGRMLIST (
  PROGRM_FILE_NM varchar2(60) DEFAULT '' NOT NULL,
  PROGRM_STRE_PATH varchar2(100) NOT NULL,
  PROGRM_KOREAN_NM varchar2(60) ,
  PROGRM_DC varchar2(200) ,
  URL varchar2(100) NOT NULL,
  CONSTRAINT LETTNPROGRMLIST_PK PRIMARY KEY (PROGRM_FILE_NM)
) ;
DROP TABLE LETTNMENUINFO CASCADE CONSTRAINTS;
CREATE TABLE LETTNMENUINFO (
  MENU_NM varchar2(60) NOT NULL,
  PROGRM_FILE_NM varchar2(60) NOT NULL,
  MENU_NO number(20,0) NOT NULL,
  UPPER_MENU_NO number(20,0) ,
  MENU_ORDR number(5,0) NOT NULL,
  MENU_DC varchar2(250) ,
  RELATE_IMAGE_PATH varchar2(100) ,
  RELATE_IMAGE_NM varchar2(60) ,
  CONSTRAINT LETTNMENUINFO_PK PRIMARY KEY (MENU_NO),
  CONSTRAINT LETTNMENUINFO_ibfk_2 FOREIGN KEY (UPPER_MENU_NO) REFERENCES LETTNMENUINFO (MENU_NO),
  CONSTRAINT LETTNMENUINFO_ibfk_1 FOREIGN KEY (PROGRM_FILE_NM) REFERENCES LETTNPROGRMLIST (PROGRM_FILE_NM) ON DELETE CASCADE
) ;
DROP TABLE LETTNMENUCREATDTLS CASCADE CONSTRAINTS;
CREATE TABLE LETTNMENUCREATDTLS (
  MENU_NO number(20,0) NOT NULL,
  AUTHOR_CODE varchar2(30) NOT NULL,
  MAPNG_CREAT_ID varchar2(30) ,
  CONSTRAINT LETTNMENUCREATDTLS_PK PRIMARY KEY (MENU_NO,AUTHOR_CODE),
  CONSTRAINT LETTNMENUCREATDTLS_ibfk_3 FOREIGN KEY (AUTHOR_CODE) REFERENCES LETTNAUTHORINFO (AUTHOR_CODE),
  CONSTRAINT LETTNMENUCREATDTLS_ibfk_1 FOREIGN KEY (MENU_NO) REFERENCES LETTNMENUINFO (MENU_NO) ON DELETE CASCADE
) ;
DROP TABLE LETTNUSERABSNCE CASCADE CONSTRAINTS;
CREATE TABLE LETTNUSERABSNCE (
  EMPLYR_ID varchar2(20) DEFAULT '' NOT NULL,
  USER_ABSNCE_AT char(1) NOT NULL,
  FRST_REGISTER_ID varchar2(20) ,
  FRST_REGIST_PNTTM DATE ,
  LAST_UPDUSR_ID varchar2(20) ,
  LAST_UPDT_PNTTM DATE ,
  CONSTRAINT LETTNUSERABSNCE_PK PRIMARY KEY (EMPLYR_ID)
) ;
DROP TABLE LETTSSYSLOGSUMMARY CASCADE CONSTRAINTS;
CREATE TABLE LETTSSYSLOGSUMMARY (
  OCCRRNC_DE char(20) NOT NULL,
  SRVC_NM varchar2(255) NOT NULL,
  METHOD_NM varchar2(60) NOT NULL,
  CREAT_CO number(10,0) ,
  UPDT_CO number(10,0) ,
  RDCNT number(10,0) ,
  DELETE_CO number(10,0) ,
  OUTPT_CO number(10,0) ,
  ERROR_CO number(10,0) ,
  CONSTRAINT LETTSSYSLOGSUMMARY_PK PRIMARY KEY (OCCRRNC_DE,SRVC_NM,METHOD_NM)
) ;

CREATE OR REPLACE VIEW COMVNUSERMASTER ( ESNTL_ID,USER_ID,PASSWORD,USER_NM,USER_ZIP,USER_ADRES,USER_EMAIL,GROUP_ID, USER_SE, ORGNZT_ID ) 
AS  
        SELECT ESNTL_ID, MBER_ID,PASSWORD,MBER_NM,ZIP,ADRES,MBER_EMAIL_ADRES,' ','GNR' AS USER_SE, ' ' ORGNZT_ID
        FROM LETTNGNRLMBER
    UNION ALL
        SELECT ESNTL_ID,EMPLYR_ID,PASSWORD,USER_NM,ZIP,HOUSE_ADRES,EMAIL_ADRES,GROUP_ID ,'USR' AS USER_SE, ORGNZT_ID
        FROM LETTNEMPLYRINFO
    UNION ALL
        SELECT ESNTL_ID,ENTRPRS_MBER_ID,ENTRPRS_MBER_PASSWORD,CMPNY_NM,ZIP,ADRES,APPLCNT_EMAIL_ADRES,' ' ,'ENT' AS USER_SE, ' ' ORGNZT_ID
        FROM LETTNENTRPRSMBER 
;