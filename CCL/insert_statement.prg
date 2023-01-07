; ----------------------------------------------------------------------------
; Script Author: Robert Holland
; Script Name: insert_statement.prg
; Creation Date: Wed Dec 07 2016 17:16:30 GMT-0700 (US Mountain Standard Time)
; Last Modified:
; Copyright (c)2016
; Purpose: Insert data into table from backend. (ccl @ AIX CLI).
; ----------------------------------------------------------------------------

;Insert data:
/*****************************************************/
/* I didn't need this in AZTRN:                      */
/* free define oraclesystem go                       */
/* define oraclesystem 'custom/xxxxxxxxxxx@aztrn' go */
/*****************************************************/

insert into custom.cust_hcc_documentation chd
set
      chd.cust_hcc_documentation_id = 1,
      chd.person_id = 12345678,
      chd.encntr_id = 87654321,
      chd.prsnl_id = 123409876,
      chd.condition = "Robert Holland",
      chd.diagnoses = "Robert L. Holland",
      chd.form_selection = "Form RH",
      chd.additional_doc = "RH Add doc",
      chd.updt_dt_tm = cnvtdatetime(curdate,curtime3)
go
  commit go

;Verify inserted data:
select * from custom.cust_hcc_documentation go
