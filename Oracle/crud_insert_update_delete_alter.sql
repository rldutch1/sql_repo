
/*ALTER*/
/*Adding assess_posted_ind column.*/
SQL>  alter table custom.cust_hcc_documentation add assess_posted_ind integer;
 
Table altered.
 
SQL> desc custom.cust_hcc_documentation
Name                                      Null?    Type
----------------------------------------- -------- ----------------------------
CUST_HCC_DOCUMENTATION_ID                 NOT NULL NUMBER
PERSON_ID                                          NUMBER
ENCNTR_ID                                          NUMBER
PRSNL_ID                                           NUMBER
CONDITION                                          VARCHAR2(100)
DIAGNOSES                                          VARCHAR2(100)
FORM_SELECTION                                     VARCHAR2(355)
ADDITIONAL_DOC                                     VARCHAR2(355)
UPDT_DT_TM                                         DATE
ASSESS_POSTED_IND                                  NUMBER(38)

SQL> oragen3 'custom.cust_hcc_documentation' go

/*Increasing the field size for CONDITION and DIAGNOSIS from 100 to 355.*/
SQL> desc custom.cust_hcc_documentation                                                            
 Name                                      Null?    Type
----------------------------------------- -------- ----------------------------
CUST_HCC_DOCUMENTATION_ID                 NOT NULL NUMBER
PERSON_ID                                          NUMBER
ENCNTR_ID                                          NUMBER
PRSNL_ID                                           NUMBER
CONDITION                                          VARCHAR2(100)
DIAGNOSES                                          VARCHAR2(100)
FORM_SELECTION                                     VARCHAR2(355)
ADDITIONAL_DOC                                     VARCHAR2(355)
UPDT_DT_TM                                         DATE
ASSESS_POSTED_IND                                  NUMBER
 
SQL> ALTER TABLE custom.cust_hcc_documentation MODIFY (condition VARCHAR2(355), diagnoses VARCHAR2(355));
 
Table altered.
 
SQL> desc custom.cust_hcc_documentation
Name                                      Null?    Type
----------------------------------------- -------- ----------------------------
CUST_HCC_DOCUMENTATION_ID                 NOT NULL NUMBER
PERSON_ID                                          NUMBER
ENCNTR_ID                                          NUMBER
PRSNL_ID                                           NUMBER
CONDITION                                          VARCHAR2(355)
DIAGNOSES                                          VARCHAR2(355)
FORM_SELECTION                                     VARCHAR2(355)
ADDITIONAL_DOC                                     VARCHAR2(355)
UPDT_DT_TM                                         DATE
ASSESS_POSTED_IND                                  NUMBER
 
SQL> oragen3 'custom.cust_hcc_documentation' go

alter table cust_samt.cust_hcc_preferences modify (preferences_value varchar(355)) go;
oragen3 'cust_samt.cust_hcc_preferences' go


/*DROP*/
DROP CCLUSER PKSLY go
commit go
CREATE CCLUSER PKSLY TO DBA go
commit go

/*DELETE*/
delete:
	delete from custom.cust_prsnlauthpos where
	usr_person_id > 0.00
	go
	commit go

;Describe table
desc custom.cust_hcc_documentation

SR: 417886446 Query ran in PROD for Cory Untalan.
delete from name_value_prefs nv
where nv.parent_entity_id = 6832609723.00
and nv.parent_entity_name = "APP_PREFS"
and cnvtupper(nv.pvc_name) in (
"MP_AMBULATORY_ORG_RES_FAVS",
"MP_AMBULATORY_ORG_AMB_ORG_OS",
"MP_AMBULATORY_ORG_AMB_ORG_POP",
"MP_AMBULATORY_ORG_AMB_ORG_PT",
"MP_AMBULATORY_ORG_USERPREFMENU",
"LONG_PREF_MAPPING",
"MP_AMBULATORY_ORG_RES_FAVS2",
"MP_AMBULATORY_ORG",
"MP_AMBULATORY_ORG_CALENDAR_TAB")
GO
commit go

/*INSERT*/
insert:
	insert into custom.cust_prsnlauthpos
	(person_id, position_cd)
	values (555555, 36342858)
	go
	commit go

Example of CCL that inserts data into table from DVDev.
	1_gic_pref_upload.prg

Insert using execute from DVDev:
free define oraclesystem go ;
define oraclesystem 'custom/password@domainname' go ; ;
execute 1_gic_post_hcc_doc ^MINE^,^Documented in Encounter^,^Psychiatric Condition^,^^,^123456789^,^button^,^12345678^ go

/*INSERT FROM PIPE DELIMITED CSV FILE (BPME_a_count_500_1000.dat is the csv file)*/
bh_mig_med_test_epic "mine","BPME_a_count_500_1000.dat","EPICBUMCT","1000" go

/*Example BPME_a_count_500_1000.dat CSV file content:
MRN|Last Name|First Name|Middle Initial|Birth Date|Sex|ORDER MED ID|RXNORM CODE|Medication Description|SIG|DOSE|DOSE UNIT|ROUTE|FREQUENCY|PRN COMMENT|MED START DATE|MED END DATE
991976|Lastname1|Firstname1|W|19451227000000|Female|1234567|861004|METFORMIN 1,000 MG TABLET|Take 1,000 mg by mouth 2 (two) times daily with meals.|1000|mg|Oral|BID with meals|||
991976|Lastname2|Firstname2|X|19451227000000|Female|2345678|966220|LEVOTHYROXINE 25 MCG TABLET|Take 25 mcg by mouth daily.|25|mcg|Oral|Daily|||
991976|Lastname3|Firstname3|Y|19451227000000|Female|3456789|197805|IBUPROFEN 400 MG TABLET|Take 1 tablet (400 mg total) by mouth every 6 (six) hours as needed for pain (take with food).|1.000|tablet|Oral|Q6H PRN|take with food|20131219000000|
991976|Lastname4|Firstname4|Z|19451227000000|Female|4567890|309683|TOBRAMYCIN 0.3 %-DEXAMETHASONE 0.1 % EYE DROPS,SUSPENSION|Place 1 drop in ear(s) every 4 (four) hours while awake. |1|drop|Otic|Q4H While awake|||
*/

/*UPDATE*/
update:
	update into custom.cust_prsnlauthpos
	set position_cd = YYY where person_id = 555555 AND position_cd = XXX
	go
	commit go

Update statement I ran for Dewayne McDaniels and Nick Ernzen
update into clinical_event
	set result_val = "39W 4D",
	event_tag = "39W 4D",
	updt_id = reqinfo->updt_id,
	updt_cnt = updt_cnt +1,
	updt_task = 0,
	updt_applctx = 0.00,
	updt_dt_tm = cnvtdatetime(curdate,curtime3)
	where event_id = 23794802910.00 go
commit go

update into ce_string_result
	set string_result_text = "39W 4D",
	updt_id = reqinfo->updt_id,
	updt_cnt = updt_cnt +1,
	updt_task = 0,
	updt_applctx = 0.00,
	updt_dt_tm = cnvtdatetime(curdate,curtime3)
	where event_id = 23794802910.00 go
commit go

update statement I ran in AZB, CERT1, and PROD for Donna Barger on 20 Feb 2017 (AZB), 7 Mar 2017 (CERT1 and PROD).
	update into nomenclature   n
	set n.end_effective_dt_tm = sysdate-1
	, n.updt_dt_tm = sysdate
	, n.updt_id = reqinfo->updt_id

	where n.active_ind = 1
	and n.contributor_system_cd in (
		1080918807.00, ;dg1
		3046248351.00, ;dg1_pac
		3046248183.00  ;dg1_wr
	)
	and n.source_vocabulary_cd in (
	  1232054365.00, ;icd-10-pcs
		1232054373.00 ;icd-10-cm
	)
	and n.end_effective_dt_tm > sysdate
	go
	commit go

Ran this on 27 Feb 2017 at 02:00 to update the definition to "ALL" for Kasie Sly who was on vacation.
update into code_value
set definition = "ALL"
where code_set = 101242
and description in (
"2858827256",
"2858821305",
"2991965663",
"2947347075",
"2868214257",
"2868208537",
"4079279583",
"2947345145",
"2946783803",
"3888731033",
"3888743679",
"2947352249")
go
commit go

From: Jones,Nate [mailto:Nate.Jones@Cerner.com]
Sent: Wednesday, July 26, 2017 4:00 PM
To: Sly, Kasie <Kasie.Sly@bannerhealth.com>
Subject: RE: Banner non-prod NarxCheck
 
** STOP. THINK. External Email **
Appriss is asking that we update the EULA URL and use the Prep one.  Can you run this script:

update into dm_info di
set di.info_domain = "CERN_NARXCHECK",
di.info_name = "EULA_ACCEPTANCE_REQUEST_URL",
di.info_char = "https://gateway-prep.pmp.appriss.com/eula/request",
di.updt_dt_tm = cnvtdatetime(curdate,curtime3),
di.info_domain_id  = <DOMAIN_ID>,
di.updt_cnt = di.updt_cnt + 1,
di.updt_id = ReqInfo->updt_id
where di.info_domain="CERN_NARXCHECK" and di.info_name="EULA_ACCEPTANCE_REQUEST_URL"
and di.info_domain_id = <DOMAIN_ID>
with nocounter go
Commit go

update into diagnosis
set clinical_service_cd = 0
where diagnosis_id = 4972453805.00
go
commit go

;Generate update statements for the Problem List spinning icon issue:
select
UPDATE_STATEMENTS = concat("update into diagnosis set clinical_service_cd = 0, updt_id = 32913554.00 where diagnosis_id = ", cnvtstring(diagnosis_id), "go commit go")
from diagnosis
where clinical_service_cd > 2147483647;

CERT1 (ICD-10 diagnosis search not working)
select version_number, package_nbr
from cmt_content_version
where package_nbr = 99667 go

update into cmt_content_version
set version_number = 20171001
where package_nbr = 99667
go
commit go

For HCC
update into code_value cv
set cv.cki = "CKI.SMARTTEMP!HCCDocumentation", cv.updt_dt_tm = cnvtdatetime(curdate,curtime3)
where cv.code_value = 5235408517.00
and cv.code_set = 16529
go
commit
go

update into cust_samt.cust_hcc_preferences
set preference_value = "\\\\samtaznas\\samtaz\\P1805\\winintel\\static_content\\custom_mpage_content\\custom-components\\js\\ABC\\"
where preference_id = 66.00 go;

/*SELECT INTO FILENAME*/
select into value("ccluserdir:test.txt")
from nomenclature
where nomenclature_id = 1
detail
"Test" go

select into value("ccluserdir:prhollandtest.txt")
from person p
where p.person_id = 32913554.00
detail
"Test" go

select into value("ccluserdir:dbargerappendate.txt")
from nomenclature
where source_string = "*<?>"
with separator="~" go ;Tilde separated columns

Tilde Separated:
select into value("ccluserdir:dbargerappendate.txt")
nomenclature_id,
principle_type_cd,
source_string,
source_identifier,
source_vocabulary_cd,
vocab_axis_cd,
source_string_keycap,
primary_cterm_ind,
concept_cki,
source_identifier_keycap,
last_utc_ts
from nomenclature
where source_string = "*<?>"
with separator="~" go

select into value("ccluserdir:rh_01.dat")
	trim(eid,3), ;MRN
	trim(last_name,3), ;Last Name
	trim(first_name,3), ;First Name
	trim(mi,3), ;Middle Initial
	date_of_birth, ;Birth Date
	trim(sex,3), ;Sex
	trim(filler_order_number,3), ;Order Med ID
	trim(medication_code,3), ;RXNORM Code
	trim(medication_name,3), ;Medication Description
	trim(sig,3), ;SIG
	trim(request_dispense_amount,3), ;Dose
	trim(request_dispense_units,3), ;Dose Unit
	trim(route_inter,3), ;Route
	trim(quantity_timing,3), ;Frequency
	trim(comments,3), ;PRN Comment
	start_date, ;Med Start Date
	date_stopped ;Med End Date
from
	custom.cust_mig_meds
where bh_mig_med_id < 155156
with format, separator="|" go

