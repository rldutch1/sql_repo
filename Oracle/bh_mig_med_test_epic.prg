; ----------------------------------------------------------------------------
; Script Author: Robert Holland
; Script Name: bh_mig_med_test_epic
; Creation Date: Wed Apr 26 2017 14:59:35 GMT-0700 (US Mountain Standard Time)
; Last Modified:
; Copyright (c)2017
; Purpose: Import pipe delimited Epic medication data into custom.cust_mig_meds table from .csv files.
; Original file source: bh_mig_med_test_centpipe.prg
; ----------------------------------------------------------------------------


drop program bh_mig_med_test_epic go
create program bh_mig_med_test_epic

prompt
	"Output to File/Printer/MINE" = "MINE"   ;* Enter or select the printer or file name to send this report to.
	, "Import File Name" = ""
	, "Import Source" = ""
	, "batch" = ""

with OUTDEV, impfile, imprt_source, batch
;Example
;bh_mig_med_test_epic "mine","BPMC_i_950001_1000000_count_407_60.csv","EPIC","60" go

FREE SET TO_DO_CNT
SET  TO_DO_CNT  =  0
FREE SET INPUT_FILE_NAME
;DECLARE  INPUT_FILE_NAME  = vc with noconstant("mig_med_test3a.csv")
;DECLARE  INPUT_FILE_NAME  = vc with noconstant("nextgen_meds_1000001_10500003a42973.csv")
;DECLARE  INPUT_FILE_NAME  = vc with noconstant("nextgen_meds_1050001_1100000i166066.csv")
DECLARE  INPUT_FILE_NAME  = vc with noconstant(trim($impfile))
SET logical READ_FILE value(INPUT_FILE_NAME)

call echo(build("INPUT_FILE_NAME=",INPUT_FILE_NAME))
call echo(build("Current Node: "," ",curnode))

declare v_status = vc
declare v_status_indi = i4
; tct added 7-12-16
set counter_main = 0

if(FINDSTRING("_i_",$impfile)>0) ;Sets the status of the records that will be put in from the file.
set v_status = "INACTIVE"
else
set v_status = "ACTIVE"
endif

declare inprt_source_name = vc
set inprt_source_name = trim($imprt_source)


set start_record_count = 0
set end_record_count = 0

select into ("nl:")
	count = count(*)
from
	custom.cust_mig_meds c
where
	c.CONTRIBUTOR_SOURCE = "EPICBUMCT"
detail
	start_record_count = count
with
	maxrec = 100, time = 180

set start_date_time = sysdate

free record mig_meds
record mig_meds (
1 line_cnt = i4
1 csv_line[*]
	2   import_src_person_nbr = vc; MRN
;	2   ng_person_nbr = vc
	2   eid = vc
	2   RegionalPatientNUM = vc
	2   practice_NUM = vc
	2   last_name = vc
	2   first_name = vc
	2   MI=vc
	2   date_of_bith = vc
	2   sex = vc
	2   Financial_Number =vc
	2   Filler_order_number = vc
	2   Status = vc
	2   Original_Date_Time = vc
	2   Medication_Code= vc
	2   medication_name= vc
	2   Alternative_Code= vc
	2   Alternative_Code_Methold= vc
	2   Requested_Give_Amount_Minimum= vc
	2   Requested_Give_Amount_Maximum= vc
	2   Requested_Give_Units = vc
	2   Requested_Give_Dosage_Form = vc
	2   Provider_Pharmacy_Instruction = vc
	2   DAW = vc
	2   Request_Dispense_Amount = vc
	2   Request_Dispense_Units = vc
	2   Provider_NUM = vc
	2   Prov_Last = vc
	2   Prov_First = vc
	2   Prov_Middle = vc
	2   route_inter = vc
	2   Administration_Method = vc
	2   Source_of_Comments = vc
	2   Comments = vc
	2   Quantity_Timing = vc
	2   rx_refills = vc
	2   start_date = vc
	2   date_stopped = vc

	2 date_last_refilled = vc
	2 refills_left =vc
	2 Diagnosis = vc
	2 Sig = vc

	2 last_viewed_dt_tm = vc
	2 last_viewed_id = vc


)


FREE DEFINE RTL2
DEFINE  RTL2  "READ_FILE"

SELECT INTO ("nl:")
FROM
                RTL2T   R

HEAD REPORT
x=0

DETAIL
x=x+1

if (size(mig_meds->csv_line,5)<x ) ; Checking the size of the array
      stat= alterlist(mig_meds->csv_line, x+10) ; this is increasing the size if needed, cnt+10
   endif


sourceline= trim(R.LINE)



mig_meds->csv_line[x].import_src_person_nbr = piece(sourceline, '|',1,'Not Found',1); MRN

mig_meds->csv_line[x].eid = piece(sourceline, '|',1,'Not Found',1); Not Null Field. Using MRN.


if(mig_meds->csv_line[x].eid= "")
      ;mig_meds->csv_line[x].eid  = piece(sourceline, '|',2,'Not Found')
      ;else
mig_meds->csv_line[x].eid  = "XXXXX"
endif


;mig_meds->csv_line[x].RegionalPatientNUM = piece(sourceline, '|',3,'Not Found',1)
;mig_meds->csv_line[x].practice_NUM = piece(sourceline, '|',4,'Not Found',1)
mig_meds->csv_line[x].last_name = piece(sourceline, '|',2,'Not Found',1); Last Name
mig_meds->csv_line[x].first_name = piece(sourceline, '|',3,'Not Found',1); First Name
mig_meds->csv_line[x].MI= piece(sourceline, '|',4,'Not Found',1); Middle Initial
mig_meds->csv_line[x].date_of_bith= piece(sourceline, '|',5,'Not Found',1); Birth Date

mig_meds->csv_line[x].sex = piece(sourceline, '|',6,'Not Found',1); Sex


;mig_meds->csv_line[x].Financial_Number = piece(sourceline, '|',10,'Not Found',1)

;if(ISNUMERIC(mig_meds->csv_line[x].Financial_Number)!= 1)
;mig_meds->csv_line[x].Financial_Number = "99999"
;endif

mig_meds->csv_line[x].Filler_order_number = piece(sourceline, '|',7,'Not Found',1); Order Med ID
;mig_meds->csv_line[x].Status = piece(sourceline, '|',12,'Not Found',1)
;mig_meds->csv_line[x].Original_Date_Time = piece(sourceline, '|',13,'Not Found',1)
mig_meds->csv_line[x].Medication_Code= piece(sourceline, '|',8,'Not Found',1); RXNorm
mig_meds->csv_line[x].medication_name= piece(sourceline, '|',9,'Not Found',1); Medication Description
mig_meds->csv_line[x].Sig = piece(sourceline, '|',10,'Not Found',1); SIG
;mig_meds->csv_line[x].Alternative_Code= piece(sourceline, '|',16,'Not Found',1)
;mig_meds->csv_line[x].Alternative_Code_Methold= piece(sourceline, '|',17,'Not Found',1)
;mig_meds->csv_line[x].Requested_Give_Amount_Minimum= piece(sourceline, '|',18,'Not Found',1)
;mig_meds->csv_line[x].Requested_Give_Amount_Maximum= piece(sourceline, '|',19,'Not Found',1)
;mig_meds->csv_line[x].Requested_Give_Units = piece(sourceline, '|',20,'Not Found',1)
;mig_meds->csv_line[x].Requested_Give_Dosage_Form = piece(sourceline, '|',21,'Not Found',1)
;mig_meds->csv_line[x].Provider_Pharmacy_Instruction = piece(sourceline, '|',22,'Not Found',1)
;mig_meds->csv_line[x].DAW = piece(sourceline, '|',23,'Not Found',1)
mig_meds->csv_line[x].Request_Dispense_Amount = piece(sourceline, '|',11,'Not Found',1); Dose
mig_meds->csv_line[x].Request_Dispense_Units = piece(sourceline, '|',12,'Not Found',1); Dose Unit
;mig_meds->csv_line[x].Provider_NUM = piece(sourceline, '|',26,'Not Found',1)
;mig_meds->csv_line[x].Prov_Last = piece(sourceline, '|',27,'Not Found',1)
;mig_meds->csv_line[x].Prov_First = piece(sourceline, '|',28,'Not Found',1)
;mig_meds->csv_line[x].Prov_Middle = piece(sourceline, '|',29,'Not Found',1)
mig_meds->csv_line[x].route_inter = piece(sourceline, '|',13,'Not Found',1); Route
;mig_meds->csv_line[x].Administration_Method = piece(sourceline, '|',31,'Not Found',1)
;;;mig_meds->csv_line[x].Source_of_Comments = piece(sourceline, '|',32,'Not Found',1)
mig_meds->csv_line[x].Source_of_Comments = $batch
;mig_meds->csv_line[x].Comments = piece(sourceline, '|',33,'Not Found',1)
mig_meds->csv_line[x].Comments = piece(sourceline, '|',15,'Not Found',1); PRN Comment
mig_meds->csv_line[x].Quantity_Timing = piece(sourceline, '|',14,'Not Found',1); Frequency
;mig_meds->csv_line[x].rx_refills = piece(sourceline, '|',16,'Not Found',1); Refills
;mig_meds->csv_line[x].start_date = piece(sourceline, '|',17,'Not Found',1); Med Start Date
mig_meds->csv_line[x].start_date = piece(sourceline, '|',16,'Not Found',1); Med Start Date
;mig_meds->csv_line[x].date_stopped = piece(sourceline, '|',18,'Not Found',1); Med End Date
mig_meds->csv_line[x].date_stopped = piece(sourceline, '|',17,'Not Found',1); Med End Date


;mig_meds->csv_line[x].date_last_refilled = piece(sourceline, '|',38,'',1)



;mig_meds->csv_line[x].refills_left =piece(sourceline, '|',39,'Not Found',1)
;if(ISNUMERIC(mig_meds->csv_line[x].refills_left)!= 1)
;mig_meds->csv_line[x].refills_left = "0"
;endif

;mig_meds->csv_line[x].Diagnosis = piece(sourceline, '|',40,'Not Found',1)
mig_meds->csv_line[x].status = v_status; Parsed from filename
;mig_meds->csv_line[x].status =  piece(sourceline, '|',38,'Not Found')
;mig_meds->csv_line[x].date_last_refilled = piece(sourceline, '|',39,'Not Found')
;mig_meds->csv_line[x].refills_left = piece(sourceline, '|',40,'Not Found')



foot report

    y=1
    stat = alterlist(mig_meds->csv_line,x)
    mig_meds->line_cnt = x


WITH NOCOUNTER, FORMAT=PCFORMAT, TIME=300

;call echorecord(mig_meds)


FOR (NUM = 2 TO mig_meds->line_cnt)

declare bhmp_next_id = f8
select into "nl:"
bhmp_next_id2 = seq(cust_mig_meds_seq ,nextval)
from dual
detail
bhmp_next_id = bhmp_next_id2
with nocounter
call echo(bhmp_next_id)


declare test_org_time = vc
declare test_org_date = vc
set test_org_date = substring(0,8,mig_meds->csv_line[NUM].Original_Date_Time )
set test_org_time = substring(10,8,mig_meds->csv_line[NUM].Original_Date_Time )

insert into custom.CUST_MIG_MEDS   C
set


C.BH_MIG_MED_ID = bhmp_next_id
;, C.ADMINISTRATION_METHOD =  trim(substring(0,20,mig_meds->csv_line[NUM].Administration_Method))
;, C.ALTERNATIVE_CODE =  trim(substring(0,13,mig_meds->csv_line[NUM].Alternative_Code))
;, C.ALTERNATIVE_CODE_METHOLD =  trim(substring(0,6,mig_meds->csv_line[NUM].Alternative_Code_Methold))
, C.COMMENTS =  trim(substring(0,999,mig_meds->csv_line[NUM].comments)); PRN Comment

, C.DATE_STOPPED = CNVTDATETIME(CNVTDATE2( mig_meds->csv_line[NUM].date_stopped,"YYYYMMDD"),0); MED End Date


;, C.DAW =  trim(substring(0,4,mig_meds->csv_line[NUM].DAW))
, C.EID =  trim(substring(0,80,mig_meds->csv_line[NUM].eid)); MRN
, C.FILLER_ORDER_NUMBER =  trim(substring(0,36,mig_meds->csv_line[NUM].Filler_order_number)); Order Med ID


;, C.FINANCIAL_NUMBER_ID =  cnvtreal(mig_meds->csv_line[NUM].Financial_Number )


, C.FIRST_NAME =  trim(substring(0,60,mig_meds->csv_line[NUM].first_name))
, C.LAST_NAME =  trim(substring(0,60,mig_meds->csv_line[NUM].last_name))
, C.MEDICATION_CODE =  trim(substring(0,50,mig_meds->csv_line[NUM].Medication_Code)); RXNORM
, C.MEDICATION_NAME =  trim(substring(1,70,mig_meds->csv_line[NUM].medication_name)); Medication Description
, C.MI =  trim(substring(0,10,mig_meds->csv_line[NUM].MI))
, C.import_src_person_nbr =  trim(substring(0,12,mig_meds->csv_line[NUM].import_src_person_nbr )); MRN



;, C.ORIGINAL_DATE_TIME = CNVTDATETIME(CNVTDATE2(test_org_date,"YYYYMMDD"),CNVTTIME2(test_org_time,"HH:MM:SS"))

;, C.PRACTICE_NUM =  trim(substring(0,4,mig_meds->csv_line[NUM].practice_NUM))
;, C.PROVIDER_NUM =  trim(substring(0,10,mig_meds->csv_line[NUM].Provider_NUM))
;, C.PROVIDER_PHARMACY_INSTRUCTIONS =  trim(substring(0,999,mig_meds->csv_line[NUM].Provider_Pharmacy_Instruction))
;, C.PROV_FIRST =  trim(substring(0,25,mig_meds->csv_line[NUM].Prov_First))
;, C.PROV_LAST =  trim(substring(0,25,mig_meds->csv_line[NUM].Prov_Last))
;, C.PROV_MIDDLE =  trim(substring(0,25,mig_meds->csv_line[NUM].Prov_Middle))
, C.QUANTITY_TIMING =  trim(substring(0,4,mig_meds->csv_line[NUM].Quantity_Timing)); Frequency
;, C.REGIONALPATIENTNUM =  trim(substring(0,12,mig_meds->csv_line[NUM].RegionalPatientNUM))
;, C.REQUESTED_GIVE_AMOUNT_MAXIMUM =  trim(substring(0,4,mig_meds->csv_line[NUM].Requested_Give_Amount_Maximum))
;, C.REQUESTED_GIVE_AMOUNT_MINIMUM =  trim(substring(0,4,mig_meds->csv_line[NUM].Requested_Give_Amount_Minimum))
;, C.REQUESTED_GIVE_DOSAGE_FORM =  trim(substring(0,60,mig_meds->csv_line[NUM].Requested_Give_Dosage_Form))
;, C.REQUESTED_GIVE_UNITS =  trim(substring(0,60,mig_meds->csv_line[NUM].Requested_Give_Units))
, C.REQUEST_DISPENSE_AMOUNT =  trim(substring(0,10,mig_meds->csv_line[NUM].Request_Dispense_Amount)); Dose
, C.REQUEST_DISPENSE_UNITS =  trim(substring(0,32,mig_meds->csv_line[NUM].Request_Dispense_Units)); Dose Unit
, C.ROUTE_INTER =  trim(substring(0,60,mig_meds->csv_line[NUM].route_inter)); Route
, C.RX_REFILLS =  trim(substring(0,4,mig_meds->csv_line[NUM].rx_refills)); Refills
, C.SEX =  trim(substring(0,4,mig_meds->csv_line[NUM].sex)); Sex
;, C.SOURCE_OF_COMMENTS =  trim(substring(0,4,mig_meds->csv_line[NUM].Source_of_Comments))


, C.START_DATE =  CNVTDATETIME(CNVTDATE2( mig_meds->csv_line[NUM].start_date,"YYYYMMDD"),0); Med Start Date
, C.DATE_OF_BIRTH = CNVTDATETIME(CNVTDATE2( mig_meds->csv_line[NUM].date_of_bith,"YYYYMMDD"),0); Birth Date
 ;,c.status = substring(1,4,mig_meds->csv_line[NUM].status)


	, C.UPDT_APPLCTX = reqinfo->UPDT_APPLCTX
	, C.UPDT_CNT = 1
	, C.UPDT_DT_TM = sysdate
	, C.UPDT_ID = reqinfo->UPDT_ID
	, C.UPDT_TASK = reqinfo->UPDT_TASK


;, C.DATE_LAST_REFILLED = CNVTDATETIME(CNVTDATE2(mig_meds->csv_line[NUM].date_last_refilled,"YYYYMMDD"),0)
;, C.REFILLS_LEFT = cnvtint(mig_meds->csv_line[NUM].refills_left)


;, C.DIAGNOSIS = trim(substring(0,999,mig_meds->csv_line[NUM].Diagnosis))
, C.SIG = trim(substring(1,999,mig_meds->csv_line[NUM].Sig)); SIG
; ,c.status = trim(substring(0,15,mig_meds->csv_line[NUM].status))
 ,c.contributor_source  = inprt_source_name; Parsed from filename
with nocounter

set counter_main = counter_main + 1

              ; date_last_refilled varchar2(8),




endfor
commit

select into ("nl:")
	count = count(*)
from
	custom.cust_mig_meds c
where
	c.CONTRIBUTOR_SOURCE = "EPICBUMCT"
detail
	end_record_count = count
with
	maxrec = 100, time = 180

set record_count_added = (end_record_count - start_record_count)
set records_failed = (counter_main - record_count_added)
declare CNT_CCL_SEL_ALL = i4
set CNT_CCL_SEL_ALL = 0
declare act_medcnt = i4
set act_medcnt = 2147765
declare inact_medcnt = i4
set inact_medcnt = 0
/* Commenting this section to speed up the insert process.
SELECT into "NL:"
	counter1=count(*)

FROM
	custom.CUST_MIG_MEDS   C
detail
CNT_CCL_SEL_ALL = counter1
inact_medcnt = counter1 - act_medcnt
WITH NOCOUNTER
*/
set end_date_time = sysdate

set duration = DATETIMEDIFF(end_date_time,start_date_time,5)

call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
call echo("")
;call echo("******CNT_CCL_SEL_ALL*******")
;call echo(CNT_CCL_SEL_ALL)
;call echo("******CNT_CCL_SEL_ALL*******")

;call echo("******inact_medcnt*******")
;call echo(inact_medcnt)
;call echo("******inact_medcnt*******")

;call echo("******counter_loop_begin*******")
call echo(build("",counter_main, " Records"))
;call echo("******counter_loop_end*******")
;call echo(build(""))

;call echo(build("start_date_time = ", format(start_date_time, "@SHORTDATETIME")))
;call echo(build("end_date_time = ", format(end_date_time, "@SHORTDATETIME")))
call echo(build(" DURATION = ", duration, " Seconds"))
call echo(build(""))
call echo(build("*****************************************"))
call echo(build("* RECENT_BATCH ===============> ", $batch))
call echo(build("* START_RECORD_COUNT =========> ", start_record_count))
call echo(build("* END_RECORD_COUNT ===========> ", end_record_count))
call echo(build("* RECORD_COUNT_ADDED =========> ", record_count_added))
call echo(build("* RECORDS_FAILED =============> ", records_failed))
call echo(build("*****************************************"))
call echo(build(""))
end
go


