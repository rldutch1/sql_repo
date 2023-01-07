SubjectsLESAdmin links to the CaseNumber column in all of the tables below.

SubjectsLESArchive Links to SubjectsLESAdmin

SubLESEmail
SubLESPhone
SubLESJensiya
SubLESNatlID
SubLESPassport
SubLESFoodVoucher
SubLESMilID
SubLESResCard
SubjectsLESVetting
SIV-IOM


select 
	casenumber
	, casetype
	, reqagency
	, acquiresection
	, sponsor
	, position
	, tier
	, datereceived
	, piers
	, casemanager
	, interviewlocation 
	
from 
	subjectslesarchive 

where 
	casenumber = '2004-0013';


select 
	nationality
	, count(nationality) "Non_Iraqi Count By Group" 

from 
	casenumbersnationality 
	
where 
	nationality != 'iraqi' 

group by nationality;

select 
	nationality
	, count(nationality) "Non_Iraqi Count By Group" 

from 
	casenumbersnationality 

group by nationality;
