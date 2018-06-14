/*****************************************************************************

      Source file name:    	1_gic_pref_upload.prg
      Object name:         	1_gic_pref_upload

      Program purpose:      Load preferences from a .csv file onto the cust_hcc_preferences table

      Tables read:          cust_hcc_preferences

      Tables updated:       NONE

      Executing from:       MPage Initialization

      Special Notes:	    NONE
******************************************************************************/
 /***********************************************************************
 *                   MODIFICATION CONTROL LOG                		   *
 ***********************************************************************
 *                                                                     *
 *Mod Date     Engineer             Comment                            *
 *--- -------- -------------------- -----------------------------------*
  000 6/20/17  ABC				Initial creation
  001 3/29/18  ABC				Removed set trace backdoor command
 ***********************************************************************/
/************************************************************************/


free define oraclesystem go
define oraclesystem 'custom/perf0rmance@azb1' go ;@prod2

  drop program 1_gic_pref_upload:dba go
create program 1_gic_pref_upload:dba

prompt
	"Output to File/Printer/MINE" = "MINE"   ;* Enter or select the printer or file name to send this report to.
	,"Read in File Name" = "test_spreadsheet.csv"
with OUTDEV,FILENAME

/************************************************************************
; DECLARED STRUCTURES
************************************************************************/
free set temp
record temp
(
  1 qual[*]
    2 cust_hcc_preferences_id = f8 ; (number): Primary key.
    2 preference_name = vc ; (string): Name of preference.
    2 preference_value = vc ; (string): Value of preference.
    2 organization_id = f8 ; (number): Optional.  Allows flexing for different organizations within a domain.
    2 position_cd = f8 ; (number): Optional.  Allows for flexing for different positions within a domain.
    2 prnsl_id = f8 ; (number): Optional.  Allows for saving user level preferences.
    2 updt_id = f8 ; (number): Id of person who updated the preference row.
    2 updt_dt_tm = dq8 ;(date/time): Id of person who updated the preference row.
)

/**************************************************************
; DECLARED VARIABLES
**************************************************************/
declare dUserID = f8 with protect, noconstant(0.0)

/****************************************************************************
;INCLUDES
****************************************************************************/
;%i ccluserdir:error_common.inc

/*************************************************************************
;INITIALIZE
**************************************************************************/
define rtl2 is $FILENAME
set dUserID = reqinfo->updt_id

/*************************************************************************
;DECLARE SUBROUTINES
**************************************************************************/
declare ReadFromSpreadsheet(null) = null with protect
declare PostToTable(null) = null with protect

/*************************************************************************
;CALL SUBROUTINES
**************************************************************************/
call ReadFromSpreadsheet(null)
call PostToTable(null)

/*************************************************************************
; EXIT SCRIPT - Force the script to EXIT
**************************************************************************/
#EXIT_SCRIPT

/*************************************************************************
; RETURN JSON
**************************************************************************
set JSONout = CNVTRECTOJSON(REPLYOUT)
call echo(JSONout)

if(validate(_MEMORY_REPLY_STRING))
  set _MEMORY_REPLY_STRING = trim(JSONout,3)
endif

/*************************************************************************
;  Name: ReadFromSpreadsheet(null)
**************************************************************************/
subroutine ReadFromSpreadsheet(null)
  call echo("Entering ReadFromSpreadsheet")

  select into "nl:"
    pref_name = piece(r.line,",",1,"",3)
    ,pref_value = piece(r.line,",",2,"",3)
    ,org_id = piece(r.line,",",3,"0.00",3)
    ,position_cd = piece(r.line,",",4,"0.00",3)
    ,prsnl_id = piece(r.line,",",5,"0.00",3)
    ;,person_id = cnvtreal(piece(r.line,",",1,"0.0",3))
    ;,name1 = piece(r.line,",",2,"Not Found",3)
    ;,sex_disp = piece(r.line,",",3,"Not Found",3)
    ;,sex_cd = cnvtreal(piece(r.line,",",4,"0.0",3))
  from rtl2t r
  plan r
  head report
    skip_ind = 0
    ecnt = 0
  detail
    skip_ind = skip_ind + 1
    if(skip_ind > 1)  ;skip header row
      ecnt = ecnt + 1
      stat = alterlist(temp->qual, ecnt)
      temp->qual[ecnt]->preference_name = pref_name
      temp->qual[ecnt]->preference_value = pref_value
      temp->qual[ecnt]->organization_id = cnvtint(org_id)
      temp->qual[ecnt]->position_cd = cnvtint(position_cd)
      temp->qual[ecnt]->prnsl_id = cnvtint(prsnl_id)
    endif
  with nocounter

  call echorecord(temp)
end ;ReadFromSpreadsheet


/*************************************************************************
;  Name: PostDoc(null)
**************************************************************************/
subroutine PostToTable(null)

  call echo("Entering PostToTable")


  delete from custom.cust_hcc_preferences chp where chp.preference_id > 0.00

  declare pref_next_id = f8
  for(pref_cnt = 1 to size(temp->qual,5))
    select into "nl:"
      seq_id = seq(cust_hcc_preferences_seq,nextval)   from dual
    detail
      pref_next_id = seq_id
    with nocounter


    insert into custom.cust_hcc_preferences chp
      set
        chp.preference_id = pref_next_id
        ,chp.preference_name = temp->qual[pref_cnt]->preference_name
        ,chp.preference_value = temp->qual[pref_cnt]->preference_value
        ,chp.organization_id = temp->qual[pref_cnt]->organization_id
        ,chp.position_cd = temp->qual[pref_cnt]->position_cd
        ,chp.prsnl_id = temp->qual[pref_cnt]->prnsl_id
        ,chp.updt_id = dUserID
        ,chp.updt_dt_tm = cnvtdatetime(curdate,curtime3)
    with nocounter
    commit
  endfor

end ;subroutine PostDoc

end
go
